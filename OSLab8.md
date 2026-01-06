# Lab8

## 练习1: 完成读文件操作的实现 //by 潘涛

### 题目要求

了解打开文件的处理流程，参考文件读写路径的分析，在 kern/fs/sfs/sfs_inode.c的 sfs_io_nolock()中补全读文件相关代码，并给出实现思路。

### 实现思路与流程分析

#### 1. 文件打开流程

在 ucore 中，打开文件的过程主要涉及 VFS 层和 SFS 文件系统层：

1. **通用文件系统层 (VFS)**:用户态调用 open 系统调用，进入内核态后由 sys_open 处理，最终调用 fs_open。
2. **路径解析与查找**: fs_open 需要根据路径找到对应的 inode。它会调用 fs_lookup，fs_lookup会逐层解析路径，对于 SFS 文件系统，最终调用 sfs_lookup。
3. **SFS 目录查找**: sfs_lookup 调用 sfs_lookup_once 在父目录中查找文件名。
   * sfs_lookup_once 调用 sfs_dirent_search_nolock，遍历目录的数据块（读取目录项 sfs_disk_entry），匹配文件名。
   * 如果找到匹配的目录项，获取其 inode 编号 (ino)。
4. **加载 Inode**: 获得 ino 后，调用 sfs_load_inode。
   * sfs_load_inode会分配内存中的 inode 结构。
   * 调用 sfs_rbuf 读取磁盘上的 sfs_disk_inode 数据。
   * 初始化内存 inode 信息，完成文件打开的准备工作。
5. **打开文件**: 最后调用 op_open (即 sfs_openfile)，在当前实现中该函数主要做检查或直接返回成功。

#### 2. 文件读取流程 

1. **系统调用**: 用户态调用 read，内核态经 sys_read 到达 fs_read。
2. **VFS 分发**: fs_read 检查权限等信息后，调用 inode 对应的 op_read，即 sfs_read。
3. **SFS 读取**: sfs_read 调用 sfs_io。
   * sfs_io 是一个包装函数，负责处理锁 lock_sin，然后调用核心函数 sfs_io_nolock。
4. **核心读写逻辑 (sfs_io_nolock)**:
   * 这是实际执行数据读写的地方。它将文件内的逻辑偏移量 (offset) 转换为磁盘上的物理块号。
   * 通过 sfs_bmap_load_nolock 完成逻辑块到物理块的映射。
   * 通过 sfs_rbuf (读缓冲) 或 sfs_rblock (读整块) 将磁盘数据拷贝到内存缓冲区。

#### 3. 代码实现思路 (sfs_io_nolock)

这段代码是 sfs_io_nolock 函数的核心部分，负责将文件数据在磁盘块和内存缓冲区之间进行传输。由于磁盘读写是以块为单位的，而用户请求的读写范围（offset 和 length）可能是任意的，因此实现思路是将整个读写过程拆分为三个阶段：

1. **处理起始的非对齐部分**
   如果读写的起始位置 offset 不是块的边界（即 blkoff != 0），我们需要先处理这个“残缺”的块。

   *   **计算大小 (size)**：
       *   如果这只是读写过程的第一部分，且后面还有完整块（nblks != 0），那么我们需要读写从 blkoff到该块末尾的数据（SFS_BLKSIZE - blkoff）。
       *   如果所有数据都在这一个块内（nblks == 0），那么只需要读写到结束位置（endpos - offset）。
   *   **操作步骤**：
       1.  调用 sfs_bmap_load_nolock 将逻辑块号 blkno 映射为物理块号 ino。
       2.  调用 sfs_buf_op（即 sfs_rbuf 或 sfs_wbuf）对该块进行部分读写。
       3.  更新指针和计数器：缓冲区指针 buf 前移，已读写字节数 alen 增加，逻辑块号 blkno 加 1，剩余完整块数 nblks 减 1。

2.  **处理中间的完整块**
    处理完起始部分后，中间的数据都是以完整的块为单位的。

    *   **计算大小 (size)**：总字节数为 nblks * SFS_BLKSIZE。
    *   **操作步骤**：
        *   使用循环遍历这 nblks 个块。
        *   在循环中，先通过 sfs_bmap_load_nolock 获取物理块号。
        *   然后调用 sfs_block_op 一次性读写整个块。这比逐字节或逐部分读写效率更高。
        *   每次循环更新缓冲区指针 buf 和当前逻辑块号 curblkno。
        *   循环结束后，统一更新 alen 和 blkno。

3.  **处理末尾的非对齐部分**
    如果读写的结束位置 endpos 不是块的边界（即 endpos % SFS_BLKSIZE != 0），说明最后一个块只需要读写前面的一部分。

    *   **计算大小 (size)**：即 endpos % SFS_BLKSIZE。
    *   **操作步骤**：
        1.  调用 sfs_bmap_load_nolock 获取最后一个块的物理块号。
        2.  调用 sfs_buf_op 从块的起始位置（偏移为 0）读写 size 字节。
        3.  更新已读写字节数 alen。


```cpp
   blkoff = offset % SFS_BLKSIZE; // 计算偏移在当前块内的字节偏移

   // 处理起始的非对齐部分 
   if (blkoff != 0) {
      size = (nblks != 0) ? (SFS_BLKSIZE - blkoff) : (endpos - offset);
      if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
         goto out;
      }
      if ((ret = sfs_buf_op(sfs, buf, size, ino, blkoff)) != 0) {
         goto out;
      }
      alen += size;    
      buf += size;   
      blkno ++;      
      nblks --;
   }

   // 处理所有对齐的完整块
   if (nblks != 0) {
      size = nblks * SFS_BLKSIZE;
      uint32_t curblkno = blkno;
      for (uint32_t i = 0; i < nblks; i++) {
         if ((ret = sfs_bmap_load_nolock(sfs, sin, curblkno, &ino)) != 0) {
               goto out;
         }
         if ((ret = sfs_block_op(sfs, buf, ino, 1)) != 0) {
               goto out;
         }
         buf += SFS_BLKSIZE;    
         curblkno ++;       
      }
      alen += size;      
      blkno += nblks; 
   }

   // 处理末尾的非对齐部分
   if ((size = endpos % SFS_BLKSIZE) != 0) {
      if ((ret = sfs_bmap_load_nolock(sfs, sin, blkno, &ino)) != 0) {
         goto out;
      }
      if ((ret = sfs_buf_op(sfs, buf, size, ino, 0)) != 0) {
         goto out;
      }
      alen += size;    
   }
```

## 练习2: 完成基于文件系统的执行程序机制的实现 //by 叶坤豪

### 任务要求

改写proc.c中的load_icode函数和其他相关函数，实现基于文件系统的执行程序机制。执行：make qemu。如果能看看到sh用户程序的执行界面，则基本成功了。如果在sh用户界面上可以执行exit, hello（更多用户程序放在user目录下）等其他放置在sfs文件系统中的其他执行程序，则可以认为本实验基本成功。

### 代码实现

#### 1.进程控制块初始化

在alloc_proc函数中添加文件结构指针初始化
```c
proc->filesp = NULL;  // 初始化文件结构指针为空
```
**说明：**在进程控制块中增加filesp字段，初始化为NULL，用于管理进程的文件描述符表。

#### 2.进程切换优化

```c
void proc_run(struct proc_struct *proc) {
    if (proc != current) {
        bool intr_flag;
        struct proc_struct *prev = current, *next = proc;
        local_intr_save(intr_flag);
        {
            current = proc;  // 设置当前进程为proc
            
            // LAB8: 刷新TLB并设置新页表
            flush_tlb();      // 先刷新TLB
            lsatp(next->pgdir); // 然后设置新的页表
            
            switch_to(&(prev->context), &(next->context));
        }
        local_intr_restore(intr_flag);
    }
}
```

**说明：**在进程切换时，先刷新TLB，然后再设置新的页表寄存器。这样可以确保新进程的地址转换不会受到旧进程TLB条目的干扰。

#### 3.ELF文件加载（load_icode）

```c
static int load_icode(int fd, int argc, char **kargv) {
    int ret = -E_NO_MEM;
    struct mm_struct *mm;
    struct Page *page = NULL;

    // 1. 创建新的内存管理结构
    if ((mm = mm_create()) == NULL) {
        goto exec_exit;
    }
    
    // 2. 创建页目录表
    if ((ret = setup_pgdir(mm)) != 0) {
        goto bad_mm;
    }
    
    // 3. 读取和验证ELF文件头
    struct elfhdr elf;
    if ((ret = load_icode_read(fd, &elf, sizeof(elf), 0)) != 0) {
        goto bad_pgdir_cleanup_mm;
    }
    if (elf.e_magic != ELF_MAGIC) {
        ret = -E_INVAL_ELF;
        goto bad_pgdir_cleanup_mm;
    }
    
    // 4. 加载程序段（详细代码见完整实现）
    // ...
    
    // 5. 设置用户栈和命令行参数
    // ...
    
    // 6. 设置进程执行环境
    mm_count_inc(mm);
    current->mm = mm;
    current->pgdir = PADDR(mm->pgdir);
    
    // 7. 设置陷阱帧
    struct trapframe *tf = current->tf;
    memset(tf, 0, sizeof(struct trapframe));
    tf->gpr.sp = stack_top;      // 栈指针
    tf->gpr.a0 = argc;           // argc参数
    tf->gpr.a1 = stack_top;      // argv参数地址
    tf->epc = elf.e_entry;       // 程序入口点
    tf->status = (read_csr(sstatus) | SSTATUS_SPIE) & ~(SSTATUS_SPP | SSTATUS_SIE);
    
    // 8. 设置页表和刷新TLB
    lsatp(current->pgdir);
    flush_tlb();
    sysfile_close(fd);
    return 0;
    
    // 错误处理（略）
}
```
**说明：**load_icode函数是本次实验的核心，它完成了从文件系统加载ELF可执行文件到进程地址空间的完整过程。

主要包括：

- ELF文件格式验证

- 程序段（TEXT、DATA、BSS）的加载

- 用户栈的设置和命令行参数的传递

- 进程执行环境的初始化

### 验证
完成代码的编写之后，我们在终端中输入make qemu,可以看到成功显示出了sh用户程序的执行界面，然后我们输入hello,exit等程序，均成功pass，我们还可以输入make grade,显示得分100，说明本次实验成功。

![makeqemu](./images/makeqemu.png "1")

![makegrade](./images/makegrade.png '2' )

## Challenge1：完成基于“UNIX的PIPE机制”的设计方案 //by 翟玉坤

## Challenge1要求：如果要在ucore里加入UNIX的管道（Pipe）机制，至少需要定义哪些数据结构和接口？（接口给出语义即可，不必具体实现。数据结构的设计应当给出一个（或多个）具体的C语言struct定义。在网络上查找相关的Linux资料和实现，给出设计实现”UNIX的PIPE机制“的概要设方案，设计应当体现出对可能出现的同步互斥问题的处理。）

### 回答

在ucore中实现UNIX管道机制，需要设计以下数据结构和接口：

- 核心数据结构

// 管道缓冲区结构 
#define PIPE_BUF_SIZE 4096  // 默认缓冲区大小

struct pipe_buffer {
    char *data;             // 环形缓冲区
    unsigned int head;      // 读指针
    unsigned int tail;      // 写指针
    unsigned int size;      // 缓冲区大小
    unsigned int capacity;  // 缓冲区容量
};

// 管道结构体
struct pipe {
    struct pipe_buffer buffer;  // 数据缓冲区
    struct spinlock lock;       // 保护管道的自旋锁
    struct wait_queue read_wait;  // 读等待队列
    struct wait_queue write_wait; // 写等待队列
    int read_count;             // 读端引用计数
    int write_count;            // 写端引用计数
    unsigned int flags;         // 管道标志位
#define PIPE_FLAG_CLOSED_READ   (1 << 0)  // 读端关闭
#define PIPE_FLAG_CLOSED_WRITE  (1 << 1)  // 写端关闭
#define PIPE_FLAG_NONBLOCK_READ (1 << 2)  // 非阻塞读
#define PIPE_FLAG_NONBLOCK_WRITE (1 << 3) // 非阻塞写
};

- 文件系统相关结构

// 管道文件结构（扩展inode）
struct pipe_inode {
    struct inode inode;     // 继承基础inode
    struct pipe *pipe;      // 关联的管道结构
    int side;               // 表示读端(0)或写端(1)
};

// 进程文件描述符表中的管道项
struct pipe_fd {
    struct file *file;      // 关联的文件结构
    int flags;              // 文件描述符标志
};

- 接口设计
1. 
/* 
 * 此接口用于创建管道
 * @param pipefd: 返回两个文件描述符的数组
 *               pipefd[0]用于读，pipefd[1]用于写
 * @return: 成功返回0，失败返回错误码
 */

int sys_pipe(int pipefd[2]);

2. 
/* 
 * 用于从管道读取数据
 * @param fd: 管道读端的文件描述符
 * @param buf: 用户缓冲区
 * @param count: 请求读取的字节数
 * @return: 实际读取的字节数，错误返回负值
 */
ssize_t pipe_read(int fd, void *buf, size_t count);

/* 
 * 用于向管道写入数据
 * @param fd: 管道写端的文件描述符
 * @param buf: 用户缓冲区
 * @param count: 请求写入的字节数
 * @return: 实际写入的字节数，错误返回负值
 */
ssize_t pipe_write(int fd, const void *buf, size_t count);

3. 
/* 
 * 用于设置管道标志（如非阻塞模式）
 * @param fd: 文件描述符
 * @param cmd: 控制命令
 * @param arg: 参数
 */
int pipe_ioctl(int fd, int cmd, unsigned long arg);

/* 
 * 用于关闭管道端
 * @param inode: 管道inode
 * @param side: 要关闭的端（读/写）
 */
void pipe_close(struct pipe_inode *pinode);

- 同步互斥相关
1. 锁的层次结构

// 读写操作的伪代码示例
ssize_t pipe_read(struct pipe *p, void *buf, size_t count) {
    unsigned long flags;
    ssize_t ret = 0;
    
    // 获取管道锁
    spin_lock_irqsave(&p->lock, flags);
    
    while (ret == 0) {
        if (pipe_buffer_empty(&p->buffer)) {
            if (p->flags & PIPE_FLAG_CLOSED_WRITE) {
                // 写端关闭，返回EOF
                spin_unlock_irqrestore(&p->lock, flags);
                return 0;
            }
            if (p->flags & PIPE_FLAG_NONBLOCK_READ) {
                // 非阻塞模式返回EAGAIN
                spin_unlock_irqrestore(&p->lock, flags);
                return -EAGAIN;
            }
            // 等待数据
            wait_event_interruptible(&p->read_wait, 
                !pipe_buffer_empty(&p->buffer) || 
                (p->flags & PIPE_FLAG_CLOSED_WRITE));
            continue;
        }
        
        // 从缓冲区读取数据
        ret = pipe_buffer_read(&p->buffer, buf, count);
        
        // 唤醒等待的写者
        if (pipe_buffer_space(&p->buffer) > 0) {
            wake_up_interruptible(&p->write_wait);
        }
    }
    
    spin_unlock_irqrestore(&p->lock, flags);
    return ret;
}

2. 等待队列

// 等待队列结构
struct wait_queue {
    struct list_head wait_list;
    struct spinlock lock;
};

// 等待函数
void pipe_wait_event(struct wait_queue *wq, struct pipe *p, 
                     int (*condition)(struct pipe *)) {
    struct wait_queue_entry entry;
    
    init_waitqueue_entry(&entry, current);
    add_wait_queue(wq, &entry);
    
    while (!condition(p)) {
        set_current_state(TASK_INTERRUPTIBLE);
        spin_unlock(&p->lock);
        schedule();
        spin_lock(&p->lock);
    }
    
    remove_wait_queue(wq, &entry);
    __set_current_state(TASK_RUNNING);
}

- 缓冲区管理

// 环形缓冲区操作
static int pipe_buffer_read(struct pipe_buffer *buf, char *data, size_t len) {
    size_t available = buf->size;
    size_t to_read = min(len, available);
    size_t first_chunk, second_chunk;
    
    if (to_read == 0)
        return 0;
    
    // 处理环形缓冲区的分段读取
    first_chunk = min(to_read, buf->capacity - buf->head);
    memcpy(data, buf->data + buf->head, first_chunk);
    
    if (to_read > first_chunk) {
        second_chunk = to_read - first_chunk;
        memcpy(data + first_chunk, buf->data, second_chunk);
        buf->head = second_chunk;
    } else {
        buf->head = (buf->head + first_chunk) % buf->capacity;
    }
    
    buf->size -= to_read;
    return to_read;
}

- 进程间通信

// 管道创建和文件描述符关联
int sys_pipe(int pipefd[2]) {
    struct pipe *p;
    struct file *read_file, *write_file;
    int read_fd, write_fd;
    
    // 1. 创建管道结构
    p = kmalloc(sizeof(struct pipe));
    pipe_buffer_init(&p->buffer, PIPE_BUF_SIZE);
    
    // 2. 初始化同步机制
    spinlock_init(&p->lock);
    init_waitqueue(&p->read_wait);
    init_waitqueue(&p->write_wait);
    
    // 3. 创建两个文件结构（读端和写端）
    read_file = file_alloc();
    write_file = file_alloc();
    
    // 4. 分配文件描述符
    read_fd = fd_alloc();
    write_fd = fd_alloc();
    
    // 5. 关联管道和文件描述符
    current->files->fd[read_fd] = create_pipe_fd(read_file, O_RDONLY);
    current->files->fd[write_fd] = create_pipe_fd(write_file, O_WRONLY);
    
    pipefd[0] = read_fd;
    pipefd[1] = write_fd;
    
    return 0;
}




