
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	00014297          	auipc	t0,0x14
ffffffffc0200004:	00028293          	mv	t0,t0
ffffffffc0200008:	00a2b023          	sd	a0,0(t0) # ffffffffc0214000 <boot_hartid>
ffffffffc020000c:	00014297          	auipc	t0,0x14
ffffffffc0200010:	ffc28293          	addi	t0,t0,-4 # ffffffffc0214008 <boot_dtb>
ffffffffc0200014:	00b2b023          	sd	a1,0(t0)
ffffffffc0200018:	c02132b7          	lui	t0,0xc0213
ffffffffc020001c:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200020:	037a                	slli	t1,t1,0x1e
ffffffffc0200022:	406282b3          	sub	t0,t0,t1
ffffffffc0200026:	00c2d293          	srli	t0,t0,0xc
ffffffffc020002a:	fff0031b          	addiw	t1,zero,-1
ffffffffc020002e:	137e                	slli	t1,t1,0x3f
ffffffffc0200030:	0062e2b3          	or	t0,t0,t1
ffffffffc0200034:	18029073          	csrw	satp,t0
ffffffffc0200038:	12000073          	sfence.vma
ffffffffc020003c:	c0213137          	lui	sp,0xc0213
ffffffffc0200040:	c02002b7          	lui	t0,0xc0200
ffffffffc0200044:	04a28293          	addi	t0,t0,74 # ffffffffc020004a <kern_init>
ffffffffc0200048:	8282                	jr	t0

ffffffffc020004a <kern_init>:
ffffffffc020004a:	00091517          	auipc	a0,0x91
ffffffffc020004e:	01650513          	addi	a0,a0,22 # ffffffffc0291060 <buf>
ffffffffc0200052:	00097617          	auipc	a2,0x97
ffffffffc0200056:	8be60613          	addi	a2,a2,-1858 # ffffffffc0296910 <end>
ffffffffc020005a:	1141                	addi	sp,sp,-16
ffffffffc020005c:	8e09                	sub	a2,a2,a0
ffffffffc020005e:	4581                	li	a1,0
ffffffffc0200060:	e406                	sd	ra,8(sp)
ffffffffc0200062:	2d40b0ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0200066:	52c000ef          	jal	ra,ffffffffc0200592 <cons_init>
ffffffffc020006a:	0000b597          	auipc	a1,0xb
ffffffffc020006e:	33658593          	addi	a1,a1,822 # ffffffffc020b3a0 <etext>
ffffffffc0200072:	0000b517          	auipc	a0,0xb
ffffffffc0200076:	34e50513          	addi	a0,a0,846 # ffffffffc020b3c0 <etext+0x20>
ffffffffc020007a:	12c000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020007e:	1ae000ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc0200082:	62a000ef          	jal	ra,ffffffffc02006ac <dtb_init>
ffffffffc0200086:	24b020ef          	jal	ra,ffffffffc0202ad0 <pmm_init>
ffffffffc020008a:	3ef000ef          	jal	ra,ffffffffc0200c78 <pic_init>
ffffffffc020008e:	515000ef          	jal	ra,ffffffffc0200da2 <idt_init>
ffffffffc0200092:	6e3030ef          	jal	ra,ffffffffc0203f74 <vmm_init>
ffffffffc0200096:	032070ef          	jal	ra,ffffffffc02070c8 <sched_init>
ffffffffc020009a:	439060ef          	jal	ra,ffffffffc0206cd2 <proc_init>
ffffffffc020009e:	1bf000ef          	jal	ra,ffffffffc0200a5c <ide_init>
ffffffffc02000a2:	114050ef          	jal	ra,ffffffffc02051b6 <fs_init>
ffffffffc02000a6:	4a4000ef          	jal	ra,ffffffffc020054a <clock_init>
ffffffffc02000aa:	3c3000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02000ae:	5f1060ef          	jal	ra,ffffffffc0206e9e <cpu_idle>

ffffffffc02000b2 <readline>:
ffffffffc02000b2:	715d                	addi	sp,sp,-80
ffffffffc02000b4:	e486                	sd	ra,72(sp)
ffffffffc02000b6:	e0a6                	sd	s1,64(sp)
ffffffffc02000b8:	fc4a                	sd	s2,56(sp)
ffffffffc02000ba:	f84e                	sd	s3,48(sp)
ffffffffc02000bc:	f452                	sd	s4,40(sp)
ffffffffc02000be:	f056                	sd	s5,32(sp)
ffffffffc02000c0:	ec5a                	sd	s6,24(sp)
ffffffffc02000c2:	e85e                	sd	s7,16(sp)
ffffffffc02000c4:	c901                	beqz	a0,ffffffffc02000d4 <readline+0x22>
ffffffffc02000c6:	85aa                	mv	a1,a0
ffffffffc02000c8:	0000b517          	auipc	a0,0xb
ffffffffc02000cc:	30050513          	addi	a0,a0,768 # ffffffffc020b3c8 <etext+0x28>
ffffffffc02000d0:	0d6000ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02000d4:	4481                	li	s1,0
ffffffffc02000d6:	497d                	li	s2,31
ffffffffc02000d8:	49a1                	li	s3,8
ffffffffc02000da:	4aa9                	li	s5,10
ffffffffc02000dc:	4b35                	li	s6,13
ffffffffc02000de:	00091b97          	auipc	s7,0x91
ffffffffc02000e2:	f82b8b93          	addi	s7,s7,-126 # ffffffffc0291060 <buf>
ffffffffc02000e6:	3fe00a13          	li	s4,1022
ffffffffc02000ea:	0fa000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000ee:	00054a63          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc02000f2:	00a95a63          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc02000f6:	029a5263          	bge	s4,s1,ffffffffc020011a <readline+0x68>
ffffffffc02000fa:	0ea000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc02000fe:	fe055ae3          	bgez	a0,ffffffffc02000f2 <readline+0x40>
ffffffffc0200102:	4501                	li	a0,0
ffffffffc0200104:	a091                	j	ffffffffc0200148 <readline+0x96>
ffffffffc0200106:	03351463          	bne	a0,s3,ffffffffc020012e <readline+0x7c>
ffffffffc020010a:	e8a9                	bnez	s1,ffffffffc020015c <readline+0xaa>
ffffffffc020010c:	0d8000ef          	jal	ra,ffffffffc02001e4 <getchar>
ffffffffc0200110:	fe0549e3          	bltz	a0,ffffffffc0200102 <readline+0x50>
ffffffffc0200114:	fea959e3          	bge	s2,a0,ffffffffc0200106 <readline+0x54>
ffffffffc0200118:	4481                	li	s1,0
ffffffffc020011a:	e42a                	sd	a0,8(sp)
ffffffffc020011c:	0c6000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200120:	6522                	ld	a0,8(sp)
ffffffffc0200122:	009b87b3          	add	a5,s7,s1
ffffffffc0200126:	2485                	addiw	s1,s1,1
ffffffffc0200128:	00a78023          	sb	a0,0(a5)
ffffffffc020012c:	bf7d                	j	ffffffffc02000ea <readline+0x38>
ffffffffc020012e:	01550463          	beq	a0,s5,ffffffffc0200136 <readline+0x84>
ffffffffc0200132:	fb651ce3          	bne	a0,s6,ffffffffc02000ea <readline+0x38>
ffffffffc0200136:	0ac000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc020013a:	00091517          	auipc	a0,0x91
ffffffffc020013e:	f2650513          	addi	a0,a0,-218 # ffffffffc0291060 <buf>
ffffffffc0200142:	94aa                	add	s1,s1,a0
ffffffffc0200144:	00048023          	sb	zero,0(s1)
ffffffffc0200148:	60a6                	ld	ra,72(sp)
ffffffffc020014a:	6486                	ld	s1,64(sp)
ffffffffc020014c:	7962                	ld	s2,56(sp)
ffffffffc020014e:	79c2                	ld	s3,48(sp)
ffffffffc0200150:	7a22                	ld	s4,40(sp)
ffffffffc0200152:	7a82                	ld	s5,32(sp)
ffffffffc0200154:	6b62                	ld	s6,24(sp)
ffffffffc0200156:	6bc2                	ld	s7,16(sp)
ffffffffc0200158:	6161                	addi	sp,sp,80
ffffffffc020015a:	8082                	ret
ffffffffc020015c:	4521                	li	a0,8
ffffffffc020015e:	084000ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0200162:	34fd                	addiw	s1,s1,-1
ffffffffc0200164:	b759                	j	ffffffffc02000ea <readline+0x38>

ffffffffc0200166 <cputch>:
ffffffffc0200166:	1141                	addi	sp,sp,-16
ffffffffc0200168:	e022                	sd	s0,0(sp)
ffffffffc020016a:	e406                	sd	ra,8(sp)
ffffffffc020016c:	842e                	mv	s0,a1
ffffffffc020016e:	432000ef          	jal	ra,ffffffffc02005a0 <cons_putc>
ffffffffc0200172:	401c                	lw	a5,0(s0)
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	2785                	addiw	a5,a5,1
ffffffffc0200178:	c01c                	sw	a5,0(s0)
ffffffffc020017a:	6402                	ld	s0,0(sp)
ffffffffc020017c:	0141                	addi	sp,sp,16
ffffffffc020017e:	8082                	ret

ffffffffc0200180 <vcprintf>:
ffffffffc0200180:	1101                	addi	sp,sp,-32
ffffffffc0200182:	872e                	mv	a4,a1
ffffffffc0200184:	75dd                	lui	a1,0xffff7
ffffffffc0200186:	86aa                	mv	a3,a0
ffffffffc0200188:	0070                	addi	a2,sp,12
ffffffffc020018a:	00000517          	auipc	a0,0x0
ffffffffc020018e:	fdc50513          	addi	a0,a0,-36 # ffffffffc0200166 <cputch>
ffffffffc0200192:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0200196:	ec06                	sd	ra,24(sp)
ffffffffc0200198:	c602                	sw	zero,12(sp)
ffffffffc020019a:	50f0a0ef          	jal	ra,ffffffffc020aea8 <vprintfmt>
ffffffffc020019e:	60e2                	ld	ra,24(sp)
ffffffffc02001a0:	4532                	lw	a0,12(sp)
ffffffffc02001a2:	6105                	addi	sp,sp,32
ffffffffc02001a4:	8082                	ret

ffffffffc02001a6 <cprintf>:
ffffffffc02001a6:	711d                	addi	sp,sp,-96
ffffffffc02001a8:	02810313          	addi	t1,sp,40 # ffffffffc0213028 <boot_page_table_sv39+0x28>
ffffffffc02001ac:	8e2a                	mv	t3,a0
ffffffffc02001ae:	f42e                	sd	a1,40(sp)
ffffffffc02001b0:	75dd                	lui	a1,0xffff7
ffffffffc02001b2:	f832                	sd	a2,48(sp)
ffffffffc02001b4:	fc36                	sd	a3,56(sp)
ffffffffc02001b6:	e0ba                	sd	a4,64(sp)
ffffffffc02001b8:	00000517          	auipc	a0,0x0
ffffffffc02001bc:	fae50513          	addi	a0,a0,-82 # ffffffffc0200166 <cputch>
ffffffffc02001c0:	0050                	addi	a2,sp,4
ffffffffc02001c2:	871a                	mv	a4,t1
ffffffffc02001c4:	86f2                	mv	a3,t3
ffffffffc02001c6:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02001ca:	ec06                	sd	ra,24(sp)
ffffffffc02001cc:	e4be                	sd	a5,72(sp)
ffffffffc02001ce:	e8c2                	sd	a6,80(sp)
ffffffffc02001d0:	ecc6                	sd	a7,88(sp)
ffffffffc02001d2:	e41a                	sd	t1,8(sp)
ffffffffc02001d4:	c202                	sw	zero,4(sp)
ffffffffc02001d6:	4d30a0ef          	jal	ra,ffffffffc020aea8 <vprintfmt>
ffffffffc02001da:	60e2                	ld	ra,24(sp)
ffffffffc02001dc:	4512                	lw	a0,4(sp)
ffffffffc02001de:	6125                	addi	sp,sp,96
ffffffffc02001e0:	8082                	ret

ffffffffc02001e2 <cputchar>:
ffffffffc02001e2:	ae7d                	j	ffffffffc02005a0 <cons_putc>

ffffffffc02001e4 <getchar>:
ffffffffc02001e4:	1141                	addi	sp,sp,-16
ffffffffc02001e6:	e406                	sd	ra,8(sp)
ffffffffc02001e8:	40c000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc02001ec:	dd75                	beqz	a0,ffffffffc02001e8 <getchar+0x4>
ffffffffc02001ee:	60a2                	ld	ra,8(sp)
ffffffffc02001f0:	0141                	addi	sp,sp,16
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <strdup>:
ffffffffc02001f4:	1101                	addi	sp,sp,-32
ffffffffc02001f6:	ec06                	sd	ra,24(sp)
ffffffffc02001f8:	e822                	sd	s0,16(sp)
ffffffffc02001fa:	e426                	sd	s1,8(sp)
ffffffffc02001fc:	e04a                	sd	s2,0(sp)
ffffffffc02001fe:	892a                	mv	s2,a0
ffffffffc0200200:	0940b0ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc0200204:	842a                	mv	s0,a0
ffffffffc0200206:	0505                	addi	a0,a0,1
ffffffffc0200208:	587010ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020020c:	84aa                	mv	s1,a0
ffffffffc020020e:	c901                	beqz	a0,ffffffffc020021e <strdup+0x2a>
ffffffffc0200210:	8622                	mv	a2,s0
ffffffffc0200212:	85ca                	mv	a1,s2
ffffffffc0200214:	9426                	add	s0,s0,s1
ffffffffc0200216:	1720b0ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020021a:	00040023          	sb	zero,0(s0)
ffffffffc020021e:	60e2                	ld	ra,24(sp)
ffffffffc0200220:	6442                	ld	s0,16(sp)
ffffffffc0200222:	6902                	ld	s2,0(sp)
ffffffffc0200224:	8526                	mv	a0,s1
ffffffffc0200226:	64a2                	ld	s1,8(sp)
ffffffffc0200228:	6105                	addi	sp,sp,32
ffffffffc020022a:	8082                	ret

ffffffffc020022c <print_kerninfo>:
ffffffffc020022c:	1141                	addi	sp,sp,-16
ffffffffc020022e:	0000b517          	auipc	a0,0xb
ffffffffc0200232:	1a250513          	addi	a0,a0,418 # ffffffffc020b3d0 <etext+0x30>
ffffffffc0200236:	e406                	sd	ra,8(sp)
ffffffffc0200238:	f6fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020023c:	00000597          	auipc	a1,0x0
ffffffffc0200240:	e0e58593          	addi	a1,a1,-498 # ffffffffc020004a <kern_init>
ffffffffc0200244:	0000b517          	auipc	a0,0xb
ffffffffc0200248:	1ac50513          	addi	a0,a0,428 # ffffffffc020b3f0 <etext+0x50>
ffffffffc020024c:	f5bff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200250:	0000b597          	auipc	a1,0xb
ffffffffc0200254:	15058593          	addi	a1,a1,336 # ffffffffc020b3a0 <etext>
ffffffffc0200258:	0000b517          	auipc	a0,0xb
ffffffffc020025c:	1b850513          	addi	a0,a0,440 # ffffffffc020b410 <etext+0x70>
ffffffffc0200260:	f47ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200264:	00091597          	auipc	a1,0x91
ffffffffc0200268:	dfc58593          	addi	a1,a1,-516 # ffffffffc0291060 <buf>
ffffffffc020026c:	0000b517          	auipc	a0,0xb
ffffffffc0200270:	1c450513          	addi	a0,a0,452 # ffffffffc020b430 <etext+0x90>
ffffffffc0200274:	f33ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200278:	00096597          	auipc	a1,0x96
ffffffffc020027c:	69858593          	addi	a1,a1,1688 # ffffffffc0296910 <end>
ffffffffc0200280:	0000b517          	auipc	a0,0xb
ffffffffc0200284:	1d050513          	addi	a0,a0,464 # ffffffffc020b450 <etext+0xb0>
ffffffffc0200288:	f1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020028c:	00097597          	auipc	a1,0x97
ffffffffc0200290:	a8358593          	addi	a1,a1,-1405 # ffffffffc0296d0f <end+0x3ff>
ffffffffc0200294:	00000797          	auipc	a5,0x0
ffffffffc0200298:	db678793          	addi	a5,a5,-586 # ffffffffc020004a <kern_init>
ffffffffc020029c:	40f587b3          	sub	a5,a1,a5
ffffffffc02002a0:	43f7d593          	srai	a1,a5,0x3f
ffffffffc02002a4:	60a2                	ld	ra,8(sp)
ffffffffc02002a6:	3ff5f593          	andi	a1,a1,1023
ffffffffc02002aa:	95be                	add	a1,a1,a5
ffffffffc02002ac:	85a9                	srai	a1,a1,0xa
ffffffffc02002ae:	0000b517          	auipc	a0,0xb
ffffffffc02002b2:	1c250513          	addi	a0,a0,450 # ffffffffc020b470 <etext+0xd0>
ffffffffc02002b6:	0141                	addi	sp,sp,16
ffffffffc02002b8:	b5fd                	j	ffffffffc02001a6 <cprintf>

ffffffffc02002ba <print_stackframe>:
ffffffffc02002ba:	1141                	addi	sp,sp,-16
ffffffffc02002bc:	0000b617          	auipc	a2,0xb
ffffffffc02002c0:	1e460613          	addi	a2,a2,484 # ffffffffc020b4a0 <etext+0x100>
ffffffffc02002c4:	04e00593          	li	a1,78
ffffffffc02002c8:	0000b517          	auipc	a0,0xb
ffffffffc02002cc:	1f050513          	addi	a0,a0,496 # ffffffffc020b4b8 <etext+0x118>
ffffffffc02002d0:	e406                	sd	ra,8(sp)
ffffffffc02002d2:	1cc000ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02002d6 <mon_help>:
ffffffffc02002d6:	1141                	addi	sp,sp,-16
ffffffffc02002d8:	0000b617          	auipc	a2,0xb
ffffffffc02002dc:	1f860613          	addi	a2,a2,504 # ffffffffc020b4d0 <etext+0x130>
ffffffffc02002e0:	0000b597          	auipc	a1,0xb
ffffffffc02002e4:	21058593          	addi	a1,a1,528 # ffffffffc020b4f0 <etext+0x150>
ffffffffc02002e8:	0000b517          	auipc	a0,0xb
ffffffffc02002ec:	21050513          	addi	a0,a0,528 # ffffffffc020b4f8 <etext+0x158>
ffffffffc02002f0:	e406                	sd	ra,8(sp)
ffffffffc02002f2:	eb5ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02002f6:	0000b617          	auipc	a2,0xb
ffffffffc02002fa:	21260613          	addi	a2,a2,530 # ffffffffc020b508 <etext+0x168>
ffffffffc02002fe:	0000b597          	auipc	a1,0xb
ffffffffc0200302:	23258593          	addi	a1,a1,562 # ffffffffc020b530 <etext+0x190>
ffffffffc0200306:	0000b517          	auipc	a0,0xb
ffffffffc020030a:	1f250513          	addi	a0,a0,498 # ffffffffc020b4f8 <etext+0x158>
ffffffffc020030e:	e99ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200312:	0000b617          	auipc	a2,0xb
ffffffffc0200316:	22e60613          	addi	a2,a2,558 # ffffffffc020b540 <etext+0x1a0>
ffffffffc020031a:	0000b597          	auipc	a1,0xb
ffffffffc020031e:	24658593          	addi	a1,a1,582 # ffffffffc020b560 <etext+0x1c0>
ffffffffc0200322:	0000b517          	auipc	a0,0xb
ffffffffc0200326:	1d650513          	addi	a0,a0,470 # ffffffffc020b4f8 <etext+0x158>
ffffffffc020032a:	e7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020032e:	60a2                	ld	ra,8(sp)
ffffffffc0200330:	4501                	li	a0,0
ffffffffc0200332:	0141                	addi	sp,sp,16
ffffffffc0200334:	8082                	ret

ffffffffc0200336 <mon_kerninfo>:
ffffffffc0200336:	1141                	addi	sp,sp,-16
ffffffffc0200338:	e406                	sd	ra,8(sp)
ffffffffc020033a:	ef3ff0ef          	jal	ra,ffffffffc020022c <print_kerninfo>
ffffffffc020033e:	60a2                	ld	ra,8(sp)
ffffffffc0200340:	4501                	li	a0,0
ffffffffc0200342:	0141                	addi	sp,sp,16
ffffffffc0200344:	8082                	ret

ffffffffc0200346 <mon_backtrace>:
ffffffffc0200346:	1141                	addi	sp,sp,-16
ffffffffc0200348:	e406                	sd	ra,8(sp)
ffffffffc020034a:	f71ff0ef          	jal	ra,ffffffffc02002ba <print_stackframe>
ffffffffc020034e:	60a2                	ld	ra,8(sp)
ffffffffc0200350:	4501                	li	a0,0
ffffffffc0200352:	0141                	addi	sp,sp,16
ffffffffc0200354:	8082                	ret

ffffffffc0200356 <kmonitor>:
ffffffffc0200356:	7115                	addi	sp,sp,-224
ffffffffc0200358:	ed5e                	sd	s7,152(sp)
ffffffffc020035a:	8baa                	mv	s7,a0
ffffffffc020035c:	0000b517          	auipc	a0,0xb
ffffffffc0200360:	21450513          	addi	a0,a0,532 # ffffffffc020b570 <etext+0x1d0>
ffffffffc0200364:	ed86                	sd	ra,216(sp)
ffffffffc0200366:	e9a2                	sd	s0,208(sp)
ffffffffc0200368:	e5a6                	sd	s1,200(sp)
ffffffffc020036a:	e1ca                	sd	s2,192(sp)
ffffffffc020036c:	fd4e                	sd	s3,184(sp)
ffffffffc020036e:	f952                	sd	s4,176(sp)
ffffffffc0200370:	f556                	sd	s5,168(sp)
ffffffffc0200372:	f15a                	sd	s6,160(sp)
ffffffffc0200374:	e962                	sd	s8,144(sp)
ffffffffc0200376:	e566                	sd	s9,136(sp)
ffffffffc0200378:	e16a                	sd	s10,128(sp)
ffffffffc020037a:	e2dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020037e:	0000b517          	auipc	a0,0xb
ffffffffc0200382:	21a50513          	addi	a0,a0,538 # ffffffffc020b598 <etext+0x1f8>
ffffffffc0200386:	e21ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020038a:	000b8563          	beqz	s7,ffffffffc0200394 <kmonitor+0x3e>
ffffffffc020038e:	855e                	mv	a0,s7
ffffffffc0200390:	3fb000ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc0200394:	0000bc17          	auipc	s8,0xb
ffffffffc0200398:	274c0c13          	addi	s8,s8,628 # ffffffffc020b608 <commands>
ffffffffc020039c:	0000b917          	auipc	s2,0xb
ffffffffc02003a0:	22490913          	addi	s2,s2,548 # ffffffffc020b5c0 <etext+0x220>
ffffffffc02003a4:	0000b497          	auipc	s1,0xb
ffffffffc02003a8:	22448493          	addi	s1,s1,548 # ffffffffc020b5c8 <etext+0x228>
ffffffffc02003ac:	49bd                	li	s3,15
ffffffffc02003ae:	0000bb17          	auipc	s6,0xb
ffffffffc02003b2:	222b0b13          	addi	s6,s6,546 # ffffffffc020b5d0 <etext+0x230>
ffffffffc02003b6:	0000ba17          	auipc	s4,0xb
ffffffffc02003ba:	13aa0a13          	addi	s4,s4,314 # ffffffffc020b4f0 <etext+0x150>
ffffffffc02003be:	4a8d                	li	s5,3
ffffffffc02003c0:	854a                	mv	a0,s2
ffffffffc02003c2:	cf1ff0ef          	jal	ra,ffffffffc02000b2 <readline>
ffffffffc02003c6:	842a                	mv	s0,a0
ffffffffc02003c8:	dd65                	beqz	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003ca:	00054583          	lbu	a1,0(a0)
ffffffffc02003ce:	4c81                	li	s9,0
ffffffffc02003d0:	e1bd                	bnez	a1,ffffffffc0200436 <kmonitor+0xe0>
ffffffffc02003d2:	fe0c87e3          	beqz	s9,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc02003d6:	6582                	ld	a1,0(sp)
ffffffffc02003d8:	0000bd17          	auipc	s10,0xb
ffffffffc02003dc:	230d0d13          	addi	s10,s10,560 # ffffffffc020b608 <commands>
ffffffffc02003e0:	8552                	mv	a0,s4
ffffffffc02003e2:	4401                	li	s0,0
ffffffffc02003e4:	0d61                	addi	s10,s10,24
ffffffffc02003e6:	6f70a0ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc02003ea:	c919                	beqz	a0,ffffffffc0200400 <kmonitor+0xaa>
ffffffffc02003ec:	2405                	addiw	s0,s0,1
ffffffffc02003ee:	0b540063          	beq	s0,s5,ffffffffc020048e <kmonitor+0x138>
ffffffffc02003f2:	000d3503          	ld	a0,0(s10)
ffffffffc02003f6:	6582                	ld	a1,0(sp)
ffffffffc02003f8:	0d61                	addi	s10,s10,24
ffffffffc02003fa:	6e30a0ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc02003fe:	f57d                	bnez	a0,ffffffffc02003ec <kmonitor+0x96>
ffffffffc0200400:	00141793          	slli	a5,s0,0x1
ffffffffc0200404:	97a2                	add	a5,a5,s0
ffffffffc0200406:	078e                	slli	a5,a5,0x3
ffffffffc0200408:	97e2                	add	a5,a5,s8
ffffffffc020040a:	6b9c                	ld	a5,16(a5)
ffffffffc020040c:	865e                	mv	a2,s7
ffffffffc020040e:	002c                	addi	a1,sp,8
ffffffffc0200410:	fffc851b          	addiw	a0,s9,-1
ffffffffc0200414:	9782                	jalr	a5
ffffffffc0200416:	fa0555e3          	bgez	a0,ffffffffc02003c0 <kmonitor+0x6a>
ffffffffc020041a:	60ee                	ld	ra,216(sp)
ffffffffc020041c:	644e                	ld	s0,208(sp)
ffffffffc020041e:	64ae                	ld	s1,200(sp)
ffffffffc0200420:	690e                	ld	s2,192(sp)
ffffffffc0200422:	79ea                	ld	s3,184(sp)
ffffffffc0200424:	7a4a                	ld	s4,176(sp)
ffffffffc0200426:	7aaa                	ld	s5,168(sp)
ffffffffc0200428:	7b0a                	ld	s6,160(sp)
ffffffffc020042a:	6bea                	ld	s7,152(sp)
ffffffffc020042c:	6c4a                	ld	s8,144(sp)
ffffffffc020042e:	6caa                	ld	s9,136(sp)
ffffffffc0200430:	6d0a                	ld	s10,128(sp)
ffffffffc0200432:	612d                	addi	sp,sp,224
ffffffffc0200434:	8082                	ret
ffffffffc0200436:	8526                	mv	a0,s1
ffffffffc0200438:	6e90a0ef          	jal	ra,ffffffffc020b320 <strchr>
ffffffffc020043c:	c901                	beqz	a0,ffffffffc020044c <kmonitor+0xf6>
ffffffffc020043e:	00144583          	lbu	a1,1(s0)
ffffffffc0200442:	00040023          	sb	zero,0(s0)
ffffffffc0200446:	0405                	addi	s0,s0,1
ffffffffc0200448:	d5c9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc020044a:	b7f5                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc020044c:	00044783          	lbu	a5,0(s0)
ffffffffc0200450:	d3c9                	beqz	a5,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200452:	033c8963          	beq	s9,s3,ffffffffc0200484 <kmonitor+0x12e>
ffffffffc0200456:	003c9793          	slli	a5,s9,0x3
ffffffffc020045a:	0118                	addi	a4,sp,128
ffffffffc020045c:	97ba                	add	a5,a5,a4
ffffffffc020045e:	f887b023          	sd	s0,-128(a5)
ffffffffc0200462:	00044583          	lbu	a1,0(s0)
ffffffffc0200466:	2c85                	addiw	s9,s9,1
ffffffffc0200468:	e591                	bnez	a1,ffffffffc0200474 <kmonitor+0x11e>
ffffffffc020046a:	b7b5                	j	ffffffffc02003d6 <kmonitor+0x80>
ffffffffc020046c:	00144583          	lbu	a1,1(s0)
ffffffffc0200470:	0405                	addi	s0,s0,1
ffffffffc0200472:	d1a5                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200474:	8526                	mv	a0,s1
ffffffffc0200476:	6ab0a0ef          	jal	ra,ffffffffc020b320 <strchr>
ffffffffc020047a:	d96d                	beqz	a0,ffffffffc020046c <kmonitor+0x116>
ffffffffc020047c:	00044583          	lbu	a1,0(s0)
ffffffffc0200480:	d9a9                	beqz	a1,ffffffffc02003d2 <kmonitor+0x7c>
ffffffffc0200482:	bf55                	j	ffffffffc0200436 <kmonitor+0xe0>
ffffffffc0200484:	45c1                	li	a1,16
ffffffffc0200486:	855a                	mv	a0,s6
ffffffffc0200488:	d1fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020048c:	b7e9                	j	ffffffffc0200456 <kmonitor+0x100>
ffffffffc020048e:	6582                	ld	a1,0(sp)
ffffffffc0200490:	0000b517          	auipc	a0,0xb
ffffffffc0200494:	16050513          	addi	a0,a0,352 # ffffffffc020b5f0 <etext+0x250>
ffffffffc0200498:	d0fff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020049c:	b715                	j	ffffffffc02003c0 <kmonitor+0x6a>

ffffffffc020049e <__panic>:
ffffffffc020049e:	00096317          	auipc	t1,0x96
ffffffffc02004a2:	3ca30313          	addi	t1,t1,970 # ffffffffc0296868 <is_panic>
ffffffffc02004a6:	00033e03          	ld	t3,0(t1)
ffffffffc02004aa:	715d                	addi	sp,sp,-80
ffffffffc02004ac:	ec06                	sd	ra,24(sp)
ffffffffc02004ae:	e822                	sd	s0,16(sp)
ffffffffc02004b0:	f436                	sd	a3,40(sp)
ffffffffc02004b2:	f83a                	sd	a4,48(sp)
ffffffffc02004b4:	fc3e                	sd	a5,56(sp)
ffffffffc02004b6:	e0c2                	sd	a6,64(sp)
ffffffffc02004b8:	e4c6                	sd	a7,72(sp)
ffffffffc02004ba:	020e1a63          	bnez	t3,ffffffffc02004ee <__panic+0x50>
ffffffffc02004be:	4785                	li	a5,1
ffffffffc02004c0:	00f33023          	sd	a5,0(t1)
ffffffffc02004c4:	8432                	mv	s0,a2
ffffffffc02004c6:	103c                	addi	a5,sp,40
ffffffffc02004c8:	862e                	mv	a2,a1
ffffffffc02004ca:	85aa                	mv	a1,a0
ffffffffc02004cc:	0000b517          	auipc	a0,0xb
ffffffffc02004d0:	18450513          	addi	a0,a0,388 # ffffffffc020b650 <commands+0x48>
ffffffffc02004d4:	e43e                	sd	a5,8(sp)
ffffffffc02004d6:	cd1ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004da:	65a2                	ld	a1,8(sp)
ffffffffc02004dc:	8522                	mv	a0,s0
ffffffffc02004de:	ca3ff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc02004e2:	0000c517          	auipc	a0,0xc
ffffffffc02004e6:	42e50513          	addi	a0,a0,1070 # ffffffffc020c910 <default_pmm_manager+0x610>
ffffffffc02004ea:	cbdff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02004ee:	4501                	li	a0,0
ffffffffc02004f0:	4581                	li	a1,0
ffffffffc02004f2:	4601                	li	a2,0
ffffffffc02004f4:	48a1                	li	a7,8
ffffffffc02004f6:	00000073          	ecall
ffffffffc02004fa:	778000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02004fe:	4501                	li	a0,0
ffffffffc0200500:	e57ff0ef          	jal	ra,ffffffffc0200356 <kmonitor>
ffffffffc0200504:	bfed                	j	ffffffffc02004fe <__panic+0x60>

ffffffffc0200506 <__warn>:
ffffffffc0200506:	715d                	addi	sp,sp,-80
ffffffffc0200508:	832e                	mv	t1,a1
ffffffffc020050a:	e822                	sd	s0,16(sp)
ffffffffc020050c:	85aa                	mv	a1,a0
ffffffffc020050e:	8432                	mv	s0,a2
ffffffffc0200510:	fc3e                	sd	a5,56(sp)
ffffffffc0200512:	861a                	mv	a2,t1
ffffffffc0200514:	103c                	addi	a5,sp,40
ffffffffc0200516:	0000b517          	auipc	a0,0xb
ffffffffc020051a:	15a50513          	addi	a0,a0,346 # ffffffffc020b670 <commands+0x68>
ffffffffc020051e:	ec06                	sd	ra,24(sp)
ffffffffc0200520:	f436                	sd	a3,40(sp)
ffffffffc0200522:	f83a                	sd	a4,48(sp)
ffffffffc0200524:	e0c2                	sd	a6,64(sp)
ffffffffc0200526:	e4c6                	sd	a7,72(sp)
ffffffffc0200528:	e43e                	sd	a5,8(sp)
ffffffffc020052a:	c7dff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020052e:	65a2                	ld	a1,8(sp)
ffffffffc0200530:	8522                	mv	a0,s0
ffffffffc0200532:	c4fff0ef          	jal	ra,ffffffffc0200180 <vcprintf>
ffffffffc0200536:	0000c517          	auipc	a0,0xc
ffffffffc020053a:	3da50513          	addi	a0,a0,986 # ffffffffc020c910 <default_pmm_manager+0x610>
ffffffffc020053e:	c69ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200542:	60e2                	ld	ra,24(sp)
ffffffffc0200544:	6442                	ld	s0,16(sp)
ffffffffc0200546:	6161                	addi	sp,sp,80
ffffffffc0200548:	8082                	ret

ffffffffc020054a <clock_init>:
ffffffffc020054a:	02000793          	li	a5,32
ffffffffc020054e:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc0200552:	c0102573          	rdtime	a0
ffffffffc0200556:	67e1                	lui	a5,0x18
ffffffffc0200558:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc020055c:	953e                	add	a0,a0,a5
ffffffffc020055e:	4581                	li	a1,0
ffffffffc0200560:	4601                	li	a2,0
ffffffffc0200562:	4881                	li	a7,0
ffffffffc0200564:	00000073          	ecall
ffffffffc0200568:	0000b517          	auipc	a0,0xb
ffffffffc020056c:	12850513          	addi	a0,a0,296 # ffffffffc020b690 <commands+0x88>
ffffffffc0200570:	00096797          	auipc	a5,0x96
ffffffffc0200574:	3007b023          	sd	zero,768(a5) # ffffffffc0296870 <ticks>
ffffffffc0200578:	b13d                	j	ffffffffc02001a6 <cprintf>

ffffffffc020057a <clock_set_next_event>:
ffffffffc020057a:	c0102573          	rdtime	a0
ffffffffc020057e:	67e1                	lui	a5,0x18
ffffffffc0200580:	6a078793          	addi	a5,a5,1696 # 186a0 <_binary_bin_swap_img_size+0x109a0>
ffffffffc0200584:	953e                	add	a0,a0,a5
ffffffffc0200586:	4581                	li	a1,0
ffffffffc0200588:	4601                	li	a2,0
ffffffffc020058a:	4881                	li	a7,0
ffffffffc020058c:	00000073          	ecall
ffffffffc0200590:	8082                	ret

ffffffffc0200592 <cons_init>:
ffffffffc0200592:	4501                	li	a0,0
ffffffffc0200594:	4581                	li	a1,0
ffffffffc0200596:	4601                	li	a2,0
ffffffffc0200598:	4889                	li	a7,2
ffffffffc020059a:	00000073          	ecall
ffffffffc020059e:	8082                	ret

ffffffffc02005a0 <cons_putc>:
ffffffffc02005a0:	1101                	addi	sp,sp,-32
ffffffffc02005a2:	ec06                	sd	ra,24(sp)
ffffffffc02005a4:	100027f3          	csrr	a5,sstatus
ffffffffc02005a8:	8b89                	andi	a5,a5,2
ffffffffc02005aa:	4701                	li	a4,0
ffffffffc02005ac:	ef95                	bnez	a5,ffffffffc02005e8 <cons_putc+0x48>
ffffffffc02005ae:	47a1                	li	a5,8
ffffffffc02005b0:	00f50b63          	beq	a0,a5,ffffffffc02005c6 <cons_putc+0x26>
ffffffffc02005b4:	4581                	li	a1,0
ffffffffc02005b6:	4601                	li	a2,0
ffffffffc02005b8:	4885                	li	a7,1
ffffffffc02005ba:	00000073          	ecall
ffffffffc02005be:	e315                	bnez	a4,ffffffffc02005e2 <cons_putc+0x42>
ffffffffc02005c0:	60e2                	ld	ra,24(sp)
ffffffffc02005c2:	6105                	addi	sp,sp,32
ffffffffc02005c4:	8082                	ret
ffffffffc02005c6:	4521                	li	a0,8
ffffffffc02005c8:	4581                	li	a1,0
ffffffffc02005ca:	4601                	li	a2,0
ffffffffc02005cc:	4885                	li	a7,1
ffffffffc02005ce:	00000073          	ecall
ffffffffc02005d2:	02000513          	li	a0,32
ffffffffc02005d6:	00000073          	ecall
ffffffffc02005da:	4521                	li	a0,8
ffffffffc02005dc:	00000073          	ecall
ffffffffc02005e0:	d365                	beqz	a4,ffffffffc02005c0 <cons_putc+0x20>
ffffffffc02005e2:	60e2                	ld	ra,24(sp)
ffffffffc02005e4:	6105                	addi	sp,sp,32
ffffffffc02005e6:	a559                	j	ffffffffc0200c6c <intr_enable>
ffffffffc02005e8:	e42a                	sd	a0,8(sp)
ffffffffc02005ea:	688000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02005ee:	6522                	ld	a0,8(sp)
ffffffffc02005f0:	4705                	li	a4,1
ffffffffc02005f2:	bf75                	j	ffffffffc02005ae <cons_putc+0xe>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	1101                	addi	sp,sp,-32
ffffffffc02005f6:	ec06                	sd	ra,24(sp)
ffffffffc02005f8:	100027f3          	csrr	a5,sstatus
ffffffffc02005fc:	8b89                	andi	a5,a5,2
ffffffffc02005fe:	4801                	li	a6,0
ffffffffc0200600:	e3d5                	bnez	a5,ffffffffc02006a4 <cons_getc+0xb0>
ffffffffc0200602:	00091697          	auipc	a3,0x91
ffffffffc0200606:	e5e68693          	addi	a3,a3,-418 # ffffffffc0291460 <cons>
ffffffffc020060a:	07f00713          	li	a4,127
ffffffffc020060e:	20000313          	li	t1,512
ffffffffc0200612:	a021                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200614:	0ff57513          	zext.b	a0,a0
ffffffffc0200618:	ef91                	bnez	a5,ffffffffc0200634 <cons_getc+0x40>
ffffffffc020061a:	4501                	li	a0,0
ffffffffc020061c:	4581                	li	a1,0
ffffffffc020061e:	4601                	li	a2,0
ffffffffc0200620:	4889                	li	a7,2
ffffffffc0200622:	00000073          	ecall
ffffffffc0200626:	0005079b          	sext.w	a5,a0
ffffffffc020062a:	0207c763          	bltz	a5,ffffffffc0200658 <cons_getc+0x64>
ffffffffc020062e:	fee793e3          	bne	a5,a4,ffffffffc0200614 <cons_getc+0x20>
ffffffffc0200632:	4521                	li	a0,8
ffffffffc0200634:	2046a783          	lw	a5,516(a3)
ffffffffc0200638:	02079613          	slli	a2,a5,0x20
ffffffffc020063c:	9201                	srli	a2,a2,0x20
ffffffffc020063e:	2785                	addiw	a5,a5,1
ffffffffc0200640:	9636                	add	a2,a2,a3
ffffffffc0200642:	20f6a223          	sw	a5,516(a3)
ffffffffc0200646:	00a60023          	sb	a0,0(a2)
ffffffffc020064a:	fc6798e3          	bne	a5,t1,ffffffffc020061a <cons_getc+0x26>
ffffffffc020064e:	00091797          	auipc	a5,0x91
ffffffffc0200652:	0007ab23          	sw	zero,22(a5) # ffffffffc0291664 <cons+0x204>
ffffffffc0200656:	b7d1                	j	ffffffffc020061a <cons_getc+0x26>
ffffffffc0200658:	2006a783          	lw	a5,512(a3)
ffffffffc020065c:	2046a703          	lw	a4,516(a3)
ffffffffc0200660:	4501                	li	a0,0
ffffffffc0200662:	00f70f63          	beq	a4,a5,ffffffffc0200680 <cons_getc+0x8c>
ffffffffc0200666:	0017861b          	addiw	a2,a5,1
ffffffffc020066a:	1782                	slli	a5,a5,0x20
ffffffffc020066c:	9381                	srli	a5,a5,0x20
ffffffffc020066e:	97b6                	add	a5,a5,a3
ffffffffc0200670:	20c6a023          	sw	a2,512(a3)
ffffffffc0200674:	20000713          	li	a4,512
ffffffffc0200678:	0007c503          	lbu	a0,0(a5)
ffffffffc020067c:	00e60763          	beq	a2,a4,ffffffffc020068a <cons_getc+0x96>
ffffffffc0200680:	00081b63          	bnez	a6,ffffffffc0200696 <cons_getc+0xa2>
ffffffffc0200684:	60e2                	ld	ra,24(sp)
ffffffffc0200686:	6105                	addi	sp,sp,32
ffffffffc0200688:	8082                	ret
ffffffffc020068a:	00091797          	auipc	a5,0x91
ffffffffc020068e:	fc07ab23          	sw	zero,-42(a5) # ffffffffc0291660 <cons+0x200>
ffffffffc0200692:	fe0809e3          	beqz	a6,ffffffffc0200684 <cons_getc+0x90>
ffffffffc0200696:	e42a                	sd	a0,8(sp)
ffffffffc0200698:	5d4000ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020069c:	60e2                	ld	ra,24(sp)
ffffffffc020069e:	6522                	ld	a0,8(sp)
ffffffffc02006a0:	6105                	addi	sp,sp,32
ffffffffc02006a2:	8082                	ret
ffffffffc02006a4:	5ce000ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02006a8:	4805                	li	a6,1
ffffffffc02006aa:	bfa1                	j	ffffffffc0200602 <cons_getc+0xe>

ffffffffc02006ac <dtb_init>:
ffffffffc02006ac:	7119                	addi	sp,sp,-128
ffffffffc02006ae:	0000b517          	auipc	a0,0xb
ffffffffc02006b2:	00250513          	addi	a0,a0,2 # ffffffffc020b6b0 <commands+0xa8>
ffffffffc02006b6:	fc86                	sd	ra,120(sp)
ffffffffc02006b8:	f8a2                	sd	s0,112(sp)
ffffffffc02006ba:	e8d2                	sd	s4,80(sp)
ffffffffc02006bc:	f4a6                	sd	s1,104(sp)
ffffffffc02006be:	f0ca                	sd	s2,96(sp)
ffffffffc02006c0:	ecce                	sd	s3,88(sp)
ffffffffc02006c2:	e4d6                	sd	s5,72(sp)
ffffffffc02006c4:	e0da                	sd	s6,64(sp)
ffffffffc02006c6:	fc5e                	sd	s7,56(sp)
ffffffffc02006c8:	f862                	sd	s8,48(sp)
ffffffffc02006ca:	f466                	sd	s9,40(sp)
ffffffffc02006cc:	f06a                	sd	s10,32(sp)
ffffffffc02006ce:	ec6e                	sd	s11,24(sp)
ffffffffc02006d0:	ad7ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006d4:	00014597          	auipc	a1,0x14
ffffffffc02006d8:	92c5b583          	ld	a1,-1748(a1) # ffffffffc0214000 <boot_hartid>
ffffffffc02006dc:	0000b517          	auipc	a0,0xb
ffffffffc02006e0:	fe450513          	addi	a0,a0,-28 # ffffffffc020b6c0 <commands+0xb8>
ffffffffc02006e4:	ac3ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006e8:	00014417          	auipc	s0,0x14
ffffffffc02006ec:	92040413          	addi	s0,s0,-1760 # ffffffffc0214008 <boot_dtb>
ffffffffc02006f0:	600c                	ld	a1,0(s0)
ffffffffc02006f2:	0000b517          	auipc	a0,0xb
ffffffffc02006f6:	fde50513          	addi	a0,a0,-34 # ffffffffc020b6d0 <commands+0xc8>
ffffffffc02006fa:	aadff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02006fe:	00043a03          	ld	s4,0(s0)
ffffffffc0200702:	0000b517          	auipc	a0,0xb
ffffffffc0200706:	fe650513          	addi	a0,a0,-26 # ffffffffc020b6e8 <commands+0xe0>
ffffffffc020070a:	120a0463          	beqz	s4,ffffffffc0200832 <dtb_init+0x186>
ffffffffc020070e:	57f5                	li	a5,-3
ffffffffc0200710:	07fa                	slli	a5,a5,0x1e
ffffffffc0200712:	00fa0733          	add	a4,s4,a5
ffffffffc0200716:	431c                	lw	a5,0(a4)
ffffffffc0200718:	00ff0637          	lui	a2,0xff0
ffffffffc020071c:	6b41                	lui	s6,0x10
ffffffffc020071e:	0087d59b          	srliw	a1,a5,0x8
ffffffffc0200722:	0187969b          	slliw	a3,a5,0x18
ffffffffc0200726:	0187d51b          	srliw	a0,a5,0x18
ffffffffc020072a:	0105959b          	slliw	a1,a1,0x10
ffffffffc020072e:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200732:	8df1                	and	a1,a1,a2
ffffffffc0200734:	8ec9                	or	a3,a3,a0
ffffffffc0200736:	0087979b          	slliw	a5,a5,0x8
ffffffffc020073a:	1b7d                	addi	s6,s6,-1
ffffffffc020073c:	0167f7b3          	and	a5,a5,s6
ffffffffc0200740:	8dd5                	or	a1,a1,a3
ffffffffc0200742:	8ddd                	or	a1,a1,a5
ffffffffc0200744:	d00e07b7          	lui	a5,0xd00e0
ffffffffc0200748:	2581                	sext.w	a1,a1
ffffffffc020074a:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <end+0xfe495dd>
ffffffffc020074e:	10f59163          	bne	a1,a5,ffffffffc0200850 <dtb_init+0x1a4>
ffffffffc0200752:	471c                	lw	a5,8(a4)
ffffffffc0200754:	4754                	lw	a3,12(a4)
ffffffffc0200756:	4c81                	li	s9,0
ffffffffc0200758:	0087d59b          	srliw	a1,a5,0x8
ffffffffc020075c:	0086d51b          	srliw	a0,a3,0x8
ffffffffc0200760:	0186941b          	slliw	s0,a3,0x18
ffffffffc0200764:	0186d89b          	srliw	a7,a3,0x18
ffffffffc0200768:	01879a1b          	slliw	s4,a5,0x18
ffffffffc020076c:	0187d81b          	srliw	a6,a5,0x18
ffffffffc0200770:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200774:	0106d69b          	srliw	a3,a3,0x10
ffffffffc0200778:	0105959b          	slliw	a1,a1,0x10
ffffffffc020077c:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200780:	8d71                	and	a0,a0,a2
ffffffffc0200782:	01146433          	or	s0,s0,a7
ffffffffc0200786:	0086969b          	slliw	a3,a3,0x8
ffffffffc020078a:	010a6a33          	or	s4,s4,a6
ffffffffc020078e:	8e6d                	and	a2,a2,a1
ffffffffc0200790:	0087979b          	slliw	a5,a5,0x8
ffffffffc0200794:	8c49                	or	s0,s0,a0
ffffffffc0200796:	0166f6b3          	and	a3,a3,s6
ffffffffc020079a:	00ca6a33          	or	s4,s4,a2
ffffffffc020079e:	0167f7b3          	and	a5,a5,s6
ffffffffc02007a2:	8c55                	or	s0,s0,a3
ffffffffc02007a4:	00fa6a33          	or	s4,s4,a5
ffffffffc02007a8:	1402                	slli	s0,s0,0x20
ffffffffc02007aa:	1a02                	slli	s4,s4,0x20
ffffffffc02007ac:	9001                	srli	s0,s0,0x20
ffffffffc02007ae:	020a5a13          	srli	s4,s4,0x20
ffffffffc02007b2:	943a                	add	s0,s0,a4
ffffffffc02007b4:	9a3a                	add	s4,s4,a4
ffffffffc02007b6:	00ff0c37          	lui	s8,0xff0
ffffffffc02007ba:	4b8d                	li	s7,3
ffffffffc02007bc:	0000b917          	auipc	s2,0xb
ffffffffc02007c0:	f7c90913          	addi	s2,s2,-132 # ffffffffc020b738 <commands+0x130>
ffffffffc02007c4:	49bd                	li	s3,15
ffffffffc02007c6:	4d91                	li	s11,4
ffffffffc02007c8:	4d05                	li	s10,1
ffffffffc02007ca:	0000b497          	auipc	s1,0xb
ffffffffc02007ce:	f6648493          	addi	s1,s1,-154 # ffffffffc020b730 <commands+0x128>
ffffffffc02007d2:	000a2703          	lw	a4,0(s4)
ffffffffc02007d6:	004a0a93          	addi	s5,s4,4
ffffffffc02007da:	0087569b          	srliw	a3,a4,0x8
ffffffffc02007de:	0187179b          	slliw	a5,a4,0x18
ffffffffc02007e2:	0187561b          	srliw	a2,a4,0x18
ffffffffc02007e6:	0106969b          	slliw	a3,a3,0x10
ffffffffc02007ea:	0107571b          	srliw	a4,a4,0x10
ffffffffc02007ee:	8fd1                	or	a5,a5,a2
ffffffffc02007f0:	0186f6b3          	and	a3,a3,s8
ffffffffc02007f4:	0087171b          	slliw	a4,a4,0x8
ffffffffc02007f8:	8fd5                	or	a5,a5,a3
ffffffffc02007fa:	00eb7733          	and	a4,s6,a4
ffffffffc02007fe:	8fd9                	or	a5,a5,a4
ffffffffc0200800:	2781                	sext.w	a5,a5
ffffffffc0200802:	09778c63          	beq	a5,s7,ffffffffc020089a <dtb_init+0x1ee>
ffffffffc0200806:	00fbea63          	bltu	s7,a5,ffffffffc020081a <dtb_init+0x16e>
ffffffffc020080a:	07a78663          	beq	a5,s10,ffffffffc0200876 <dtb_init+0x1ca>
ffffffffc020080e:	4709                	li	a4,2
ffffffffc0200810:	00e79763          	bne	a5,a4,ffffffffc020081e <dtb_init+0x172>
ffffffffc0200814:	4c81                	li	s9,0
ffffffffc0200816:	8a56                	mv	s4,s5
ffffffffc0200818:	bf6d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020081a:	ffb78ee3          	beq	a5,s11,ffffffffc0200816 <dtb_init+0x16a>
ffffffffc020081e:	0000b517          	auipc	a0,0xb
ffffffffc0200822:	f9250513          	addi	a0,a0,-110 # ffffffffc020b7b0 <commands+0x1a8>
ffffffffc0200826:	981ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020082a:	0000b517          	auipc	a0,0xb
ffffffffc020082e:	fbe50513          	addi	a0,a0,-66 # ffffffffc020b7e8 <commands+0x1e0>
ffffffffc0200832:	7446                	ld	s0,112(sp)
ffffffffc0200834:	70e6                	ld	ra,120(sp)
ffffffffc0200836:	74a6                	ld	s1,104(sp)
ffffffffc0200838:	7906                	ld	s2,96(sp)
ffffffffc020083a:	69e6                	ld	s3,88(sp)
ffffffffc020083c:	6a46                	ld	s4,80(sp)
ffffffffc020083e:	6aa6                	ld	s5,72(sp)
ffffffffc0200840:	6b06                	ld	s6,64(sp)
ffffffffc0200842:	7be2                	ld	s7,56(sp)
ffffffffc0200844:	7c42                	ld	s8,48(sp)
ffffffffc0200846:	7ca2                	ld	s9,40(sp)
ffffffffc0200848:	7d02                	ld	s10,32(sp)
ffffffffc020084a:	6de2                	ld	s11,24(sp)
ffffffffc020084c:	6109                	addi	sp,sp,128
ffffffffc020084e:	baa1                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200850:	7446                	ld	s0,112(sp)
ffffffffc0200852:	70e6                	ld	ra,120(sp)
ffffffffc0200854:	74a6                	ld	s1,104(sp)
ffffffffc0200856:	7906                	ld	s2,96(sp)
ffffffffc0200858:	69e6                	ld	s3,88(sp)
ffffffffc020085a:	6a46                	ld	s4,80(sp)
ffffffffc020085c:	6aa6                	ld	s5,72(sp)
ffffffffc020085e:	6b06                	ld	s6,64(sp)
ffffffffc0200860:	7be2                	ld	s7,56(sp)
ffffffffc0200862:	7c42                	ld	s8,48(sp)
ffffffffc0200864:	7ca2                	ld	s9,40(sp)
ffffffffc0200866:	7d02                	ld	s10,32(sp)
ffffffffc0200868:	6de2                	ld	s11,24(sp)
ffffffffc020086a:	0000b517          	auipc	a0,0xb
ffffffffc020086e:	e9e50513          	addi	a0,a0,-354 # ffffffffc020b708 <commands+0x100>
ffffffffc0200872:	6109                	addi	sp,sp,128
ffffffffc0200874:	ba0d                	j	ffffffffc02001a6 <cprintf>
ffffffffc0200876:	8556                	mv	a0,s5
ffffffffc0200878:	21d0a0ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc020087c:	8a2a                	mv	s4,a0
ffffffffc020087e:	4619                	li	a2,6
ffffffffc0200880:	85a6                	mv	a1,s1
ffffffffc0200882:	8556                	mv	a0,s5
ffffffffc0200884:	2a01                	sext.w	s4,s4
ffffffffc0200886:	2750a0ef          	jal	ra,ffffffffc020b2fa <strncmp>
ffffffffc020088a:	e111                	bnez	a0,ffffffffc020088e <dtb_init+0x1e2>
ffffffffc020088c:	4c85                	li	s9,1
ffffffffc020088e:	0a91                	addi	s5,s5,4
ffffffffc0200890:	9ad2                	add	s5,s5,s4
ffffffffc0200892:	ffcafa93          	andi	s5,s5,-4
ffffffffc0200896:	8a56                	mv	s4,s5
ffffffffc0200898:	bf2d                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc020089a:	004a2783          	lw	a5,4(s4)
ffffffffc020089e:	00ca0693          	addi	a3,s4,12
ffffffffc02008a2:	0087d71b          	srliw	a4,a5,0x8
ffffffffc02008a6:	01879a9b          	slliw	s5,a5,0x18
ffffffffc02008aa:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008ae:	0107171b          	slliw	a4,a4,0x10
ffffffffc02008b2:	0107d79b          	srliw	a5,a5,0x10
ffffffffc02008b6:	00caeab3          	or	s5,s5,a2
ffffffffc02008ba:	01877733          	and	a4,a4,s8
ffffffffc02008be:	0087979b          	slliw	a5,a5,0x8
ffffffffc02008c2:	00eaeab3          	or	s5,s5,a4
ffffffffc02008c6:	00fb77b3          	and	a5,s6,a5
ffffffffc02008ca:	00faeab3          	or	s5,s5,a5
ffffffffc02008ce:	2a81                	sext.w	s5,s5
ffffffffc02008d0:	000c9c63          	bnez	s9,ffffffffc02008e8 <dtb_init+0x23c>
ffffffffc02008d4:	1a82                	slli	s5,s5,0x20
ffffffffc02008d6:	00368793          	addi	a5,a3,3
ffffffffc02008da:	020ada93          	srli	s5,s5,0x20
ffffffffc02008de:	9abe                	add	s5,s5,a5
ffffffffc02008e0:	ffcafa93          	andi	s5,s5,-4
ffffffffc02008e4:	8a56                	mv	s4,s5
ffffffffc02008e6:	b5f5                	j	ffffffffc02007d2 <dtb_init+0x126>
ffffffffc02008e8:	008a2783          	lw	a5,8(s4)
ffffffffc02008ec:	85ca                	mv	a1,s2
ffffffffc02008ee:	e436                	sd	a3,8(sp)
ffffffffc02008f0:	0087d51b          	srliw	a0,a5,0x8
ffffffffc02008f4:	0187d61b          	srliw	a2,a5,0x18
ffffffffc02008f8:	0187971b          	slliw	a4,a5,0x18
ffffffffc02008fc:	0105151b          	slliw	a0,a0,0x10
ffffffffc0200900:	0107d79b          	srliw	a5,a5,0x10
ffffffffc0200904:	8f51                	or	a4,a4,a2
ffffffffc0200906:	01857533          	and	a0,a0,s8
ffffffffc020090a:	0087979b          	slliw	a5,a5,0x8
ffffffffc020090e:	8d59                	or	a0,a0,a4
ffffffffc0200910:	00fb77b3          	and	a5,s6,a5
ffffffffc0200914:	8d5d                	or	a0,a0,a5
ffffffffc0200916:	1502                	slli	a0,a0,0x20
ffffffffc0200918:	9101                	srli	a0,a0,0x20
ffffffffc020091a:	9522                	add	a0,a0,s0
ffffffffc020091c:	1c10a0ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc0200920:	66a2                	ld	a3,8(sp)
ffffffffc0200922:	f94d                	bnez	a0,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200924:	fb59f8e3          	bgeu	s3,s5,ffffffffc02008d4 <dtb_init+0x228>
ffffffffc0200928:	00ca3783          	ld	a5,12(s4)
ffffffffc020092c:	014a3703          	ld	a4,20(s4)
ffffffffc0200930:	0000b517          	auipc	a0,0xb
ffffffffc0200934:	e1050513          	addi	a0,a0,-496 # ffffffffc020b740 <commands+0x138>
ffffffffc0200938:	4207d613          	srai	a2,a5,0x20
ffffffffc020093c:	0087d31b          	srliw	t1,a5,0x8
ffffffffc0200940:	42075593          	srai	a1,a4,0x20
ffffffffc0200944:	0187de1b          	srliw	t3,a5,0x18
ffffffffc0200948:	0186581b          	srliw	a6,a2,0x18
ffffffffc020094c:	0187941b          	slliw	s0,a5,0x18
ffffffffc0200950:	0107d89b          	srliw	a7,a5,0x10
ffffffffc0200954:	0187d693          	srli	a3,a5,0x18
ffffffffc0200958:	01861f1b          	slliw	t5,a2,0x18
ffffffffc020095c:	0087579b          	srliw	a5,a4,0x8
ffffffffc0200960:	0103131b          	slliw	t1,t1,0x10
ffffffffc0200964:	0106561b          	srliw	a2,a2,0x10
ffffffffc0200968:	010f6f33          	or	t5,t5,a6
ffffffffc020096c:	0187529b          	srliw	t0,a4,0x18
ffffffffc0200970:	0185df9b          	srliw	t6,a1,0x18
ffffffffc0200974:	01837333          	and	t1,t1,s8
ffffffffc0200978:	01c46433          	or	s0,s0,t3
ffffffffc020097c:	0186f6b3          	and	a3,a3,s8
ffffffffc0200980:	01859e1b          	slliw	t3,a1,0x18
ffffffffc0200984:	01871e9b          	slliw	t4,a4,0x18
ffffffffc0200988:	0107581b          	srliw	a6,a4,0x10
ffffffffc020098c:	0086161b          	slliw	a2,a2,0x8
ffffffffc0200990:	8361                	srli	a4,a4,0x18
ffffffffc0200992:	0107979b          	slliw	a5,a5,0x10
ffffffffc0200996:	0105d59b          	srliw	a1,a1,0x10
ffffffffc020099a:	01e6e6b3          	or	a3,a3,t5
ffffffffc020099e:	00cb7633          	and	a2,s6,a2
ffffffffc02009a2:	0088181b          	slliw	a6,a6,0x8
ffffffffc02009a6:	0085959b          	slliw	a1,a1,0x8
ffffffffc02009aa:	00646433          	or	s0,s0,t1
ffffffffc02009ae:	0187f7b3          	and	a5,a5,s8
ffffffffc02009b2:	01fe6333          	or	t1,t3,t6
ffffffffc02009b6:	01877c33          	and	s8,a4,s8
ffffffffc02009ba:	0088989b          	slliw	a7,a7,0x8
ffffffffc02009be:	011b78b3          	and	a7,s6,a7
ffffffffc02009c2:	005eeeb3          	or	t4,t4,t0
ffffffffc02009c6:	00c6e733          	or	a4,a3,a2
ffffffffc02009ca:	006c6c33          	or	s8,s8,t1
ffffffffc02009ce:	010b76b3          	and	a3,s6,a6
ffffffffc02009d2:	00bb7b33          	and	s6,s6,a1
ffffffffc02009d6:	01d7e7b3          	or	a5,a5,t4
ffffffffc02009da:	016c6b33          	or	s6,s8,s6
ffffffffc02009de:	01146433          	or	s0,s0,a7
ffffffffc02009e2:	8fd5                	or	a5,a5,a3
ffffffffc02009e4:	1702                	slli	a4,a4,0x20
ffffffffc02009e6:	1b02                	slli	s6,s6,0x20
ffffffffc02009e8:	1782                	slli	a5,a5,0x20
ffffffffc02009ea:	9301                	srli	a4,a4,0x20
ffffffffc02009ec:	1402                	slli	s0,s0,0x20
ffffffffc02009ee:	020b5b13          	srli	s6,s6,0x20
ffffffffc02009f2:	0167eb33          	or	s6,a5,s6
ffffffffc02009f6:	8c59                	or	s0,s0,a4
ffffffffc02009f8:	faeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02009fc:	85a2                	mv	a1,s0
ffffffffc02009fe:	0000b517          	auipc	a0,0xb
ffffffffc0200a02:	d6250513          	addi	a0,a0,-670 # ffffffffc020b760 <commands+0x158>
ffffffffc0200a06:	fa0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a0a:	014b5613          	srli	a2,s6,0x14
ffffffffc0200a0e:	85da                	mv	a1,s6
ffffffffc0200a10:	0000b517          	auipc	a0,0xb
ffffffffc0200a14:	d6850513          	addi	a0,a0,-664 # ffffffffc020b778 <commands+0x170>
ffffffffc0200a18:	f8eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a1c:	008b05b3          	add	a1,s6,s0
ffffffffc0200a20:	15fd                	addi	a1,a1,-1
ffffffffc0200a22:	0000b517          	auipc	a0,0xb
ffffffffc0200a26:	d7650513          	addi	a0,a0,-650 # ffffffffc020b798 <commands+0x190>
ffffffffc0200a2a:	f7cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200a2e:	0000b517          	auipc	a0,0xb
ffffffffc0200a32:	dba50513          	addi	a0,a0,-582 # ffffffffc020b7e8 <commands+0x1e0>
ffffffffc0200a36:	00096797          	auipc	a5,0x96
ffffffffc0200a3a:	e487b123          	sd	s0,-446(a5) # ffffffffc0296878 <memory_base>
ffffffffc0200a3e:	00096797          	auipc	a5,0x96
ffffffffc0200a42:	e567b123          	sd	s6,-446(a5) # ffffffffc0296880 <memory_size>
ffffffffc0200a46:	b3f5                	j	ffffffffc0200832 <dtb_init+0x186>

ffffffffc0200a48 <get_memory_base>:
ffffffffc0200a48:	00096517          	auipc	a0,0x96
ffffffffc0200a4c:	e3053503          	ld	a0,-464(a0) # ffffffffc0296878 <memory_base>
ffffffffc0200a50:	8082                	ret

ffffffffc0200a52 <get_memory_size>:
ffffffffc0200a52:	00096517          	auipc	a0,0x96
ffffffffc0200a56:	e2e53503          	ld	a0,-466(a0) # ffffffffc0296880 <memory_size>
ffffffffc0200a5a:	8082                	ret

ffffffffc0200a5c <ide_init>:
ffffffffc0200a5c:	1141                	addi	sp,sp,-16
ffffffffc0200a5e:	00091597          	auipc	a1,0x91
ffffffffc0200a62:	c5a58593          	addi	a1,a1,-934 # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a66:	4505                	li	a0,1
ffffffffc0200a68:	e022                	sd	s0,0(sp)
ffffffffc0200a6a:	00091797          	auipc	a5,0x91
ffffffffc0200a6e:	be07af23          	sw	zero,-1026(a5) # ffffffffc0291668 <ide_devices>
ffffffffc0200a72:	00091797          	auipc	a5,0x91
ffffffffc0200a76:	c407a323          	sw	zero,-954(a5) # ffffffffc02916b8 <ide_devices+0x50>
ffffffffc0200a7a:	00091797          	auipc	a5,0x91
ffffffffc0200a7e:	c807a723          	sw	zero,-882(a5) # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200a82:	00091797          	auipc	a5,0x91
ffffffffc0200a86:	cc07ab23          	sw	zero,-810(a5) # ffffffffc0291758 <ide_devices+0xf0>
ffffffffc0200a8a:	e406                	sd	ra,8(sp)
ffffffffc0200a8c:	00091417          	auipc	s0,0x91
ffffffffc0200a90:	bdc40413          	addi	s0,s0,-1060 # ffffffffc0291668 <ide_devices>
ffffffffc0200a94:	23a000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200a98:	483c                	lw	a5,80(s0)
ffffffffc0200a9a:	cf99                	beqz	a5,ffffffffc0200ab8 <ide_init+0x5c>
ffffffffc0200a9c:	00091597          	auipc	a1,0x91
ffffffffc0200aa0:	c6c58593          	addi	a1,a1,-916 # ffffffffc0291708 <ide_devices+0xa0>
ffffffffc0200aa4:	4509                	li	a0,2
ffffffffc0200aa6:	228000ef          	jal	ra,ffffffffc0200cce <ramdisk_init>
ffffffffc0200aaa:	0a042783          	lw	a5,160(s0)
ffffffffc0200aae:	c785                	beqz	a5,ffffffffc0200ad6 <ide_init+0x7a>
ffffffffc0200ab0:	60a2                	ld	ra,8(sp)
ffffffffc0200ab2:	6402                	ld	s0,0(sp)
ffffffffc0200ab4:	0141                	addi	sp,sp,16
ffffffffc0200ab6:	8082                	ret
ffffffffc0200ab8:	0000b697          	auipc	a3,0xb
ffffffffc0200abc:	d4868693          	addi	a3,a3,-696 # ffffffffc020b800 <commands+0x1f8>
ffffffffc0200ac0:	0000b617          	auipc	a2,0xb
ffffffffc0200ac4:	d5860613          	addi	a2,a2,-680 # ffffffffc020b818 <commands+0x210>
ffffffffc0200ac8:	45c5                	li	a1,17
ffffffffc0200aca:	0000b517          	auipc	a0,0xb
ffffffffc0200ace:	d6650513          	addi	a0,a0,-666 # ffffffffc020b830 <commands+0x228>
ffffffffc0200ad2:	9cdff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200ad6:	0000b697          	auipc	a3,0xb
ffffffffc0200ada:	d7268693          	addi	a3,a3,-654 # ffffffffc020b848 <commands+0x240>
ffffffffc0200ade:	0000b617          	auipc	a2,0xb
ffffffffc0200ae2:	d3a60613          	addi	a2,a2,-710 # ffffffffc020b818 <commands+0x210>
ffffffffc0200ae6:	45d1                	li	a1,20
ffffffffc0200ae8:	0000b517          	auipc	a0,0xb
ffffffffc0200aec:	d4850513          	addi	a0,a0,-696 # ffffffffc020b830 <commands+0x228>
ffffffffc0200af0:	9afff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200af4 <ide_device_valid>:
ffffffffc0200af4:	478d                	li	a5,3
ffffffffc0200af6:	00a7ef63          	bltu	a5,a0,ffffffffc0200b14 <ide_device_valid+0x20>
ffffffffc0200afa:	00251793          	slli	a5,a0,0x2
ffffffffc0200afe:	953e                	add	a0,a0,a5
ffffffffc0200b00:	0512                	slli	a0,a0,0x4
ffffffffc0200b02:	00091797          	auipc	a5,0x91
ffffffffc0200b06:	b6678793          	addi	a5,a5,-1178 # ffffffffc0291668 <ide_devices>
ffffffffc0200b0a:	953e                	add	a0,a0,a5
ffffffffc0200b0c:	4108                	lw	a0,0(a0)
ffffffffc0200b0e:	00a03533          	snez	a0,a0
ffffffffc0200b12:	8082                	ret
ffffffffc0200b14:	4501                	li	a0,0
ffffffffc0200b16:	8082                	ret

ffffffffc0200b18 <ide_device_size>:
ffffffffc0200b18:	478d                	li	a5,3
ffffffffc0200b1a:	02a7e163          	bltu	a5,a0,ffffffffc0200b3c <ide_device_size+0x24>
ffffffffc0200b1e:	00251793          	slli	a5,a0,0x2
ffffffffc0200b22:	953e                	add	a0,a0,a5
ffffffffc0200b24:	0512                	slli	a0,a0,0x4
ffffffffc0200b26:	00091797          	auipc	a5,0x91
ffffffffc0200b2a:	b4278793          	addi	a5,a5,-1214 # ffffffffc0291668 <ide_devices>
ffffffffc0200b2e:	97aa                	add	a5,a5,a0
ffffffffc0200b30:	4398                	lw	a4,0(a5)
ffffffffc0200b32:	4501                	li	a0,0
ffffffffc0200b34:	c709                	beqz	a4,ffffffffc0200b3e <ide_device_size+0x26>
ffffffffc0200b36:	0087e503          	lwu	a0,8(a5)
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	4501                	li	a0,0
ffffffffc0200b3e:	8082                	ret

ffffffffc0200b40 <ide_read_secs>:
ffffffffc0200b40:	1141                	addi	sp,sp,-16
ffffffffc0200b42:	e406                	sd	ra,8(sp)
ffffffffc0200b44:	08000793          	li	a5,128
ffffffffc0200b48:	04d7e763          	bltu	a5,a3,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b4c:	478d                	li	a5,3
ffffffffc0200b4e:	0005081b          	sext.w	a6,a0
ffffffffc0200b52:	04a7e263          	bltu	a5,a0,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b56:	00281793          	slli	a5,a6,0x2
ffffffffc0200b5a:	97c2                	add	a5,a5,a6
ffffffffc0200b5c:	0792                	slli	a5,a5,0x4
ffffffffc0200b5e:	00091817          	auipc	a6,0x91
ffffffffc0200b62:	b0a80813          	addi	a6,a6,-1270 # ffffffffc0291668 <ide_devices>
ffffffffc0200b66:	97c2                	add	a5,a5,a6
ffffffffc0200b68:	0007a883          	lw	a7,0(a5)
ffffffffc0200b6c:	02088563          	beqz	a7,ffffffffc0200b96 <ide_read_secs+0x56>
ffffffffc0200b70:	100008b7          	lui	a7,0x10000
ffffffffc0200b74:	0515f163          	bgeu	a1,a7,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b78:	1582                	slli	a1,a1,0x20
ffffffffc0200b7a:	9181                	srli	a1,a1,0x20
ffffffffc0200b7c:	00d58733          	add	a4,a1,a3
ffffffffc0200b80:	02e8eb63          	bltu	a7,a4,ffffffffc0200bb6 <ide_read_secs+0x76>
ffffffffc0200b84:	00251713          	slli	a4,a0,0x2
ffffffffc0200b88:	60a2                	ld	ra,8(sp)
ffffffffc0200b8a:	63bc                	ld	a5,64(a5)
ffffffffc0200b8c:	953a                	add	a0,a0,a4
ffffffffc0200b8e:	0512                	slli	a0,a0,0x4
ffffffffc0200b90:	9542                	add	a0,a0,a6
ffffffffc0200b92:	0141                	addi	sp,sp,16
ffffffffc0200b94:	8782                	jr	a5
ffffffffc0200b96:	0000b697          	auipc	a3,0xb
ffffffffc0200b9a:	cca68693          	addi	a3,a3,-822 # ffffffffc020b860 <commands+0x258>
ffffffffc0200b9e:	0000b617          	auipc	a2,0xb
ffffffffc0200ba2:	c7a60613          	addi	a2,a2,-902 # ffffffffc020b818 <commands+0x210>
ffffffffc0200ba6:	02200593          	li	a1,34
ffffffffc0200baa:	0000b517          	auipc	a0,0xb
ffffffffc0200bae:	c8650513          	addi	a0,a0,-890 # ffffffffc020b830 <commands+0x228>
ffffffffc0200bb2:	8edff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200bb6:	0000b697          	auipc	a3,0xb
ffffffffc0200bba:	cd268693          	addi	a3,a3,-814 # ffffffffc020b888 <commands+0x280>
ffffffffc0200bbe:	0000b617          	auipc	a2,0xb
ffffffffc0200bc2:	c5a60613          	addi	a2,a2,-934 # ffffffffc020b818 <commands+0x210>
ffffffffc0200bc6:	02300593          	li	a1,35
ffffffffc0200bca:	0000b517          	auipc	a0,0xb
ffffffffc0200bce:	c6650513          	addi	a0,a0,-922 # ffffffffc020b830 <commands+0x228>
ffffffffc0200bd2:	8cdff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200bd6 <ide_write_secs>:
ffffffffc0200bd6:	1141                	addi	sp,sp,-16
ffffffffc0200bd8:	e406                	sd	ra,8(sp)
ffffffffc0200bda:	08000793          	li	a5,128
ffffffffc0200bde:	04d7e763          	bltu	a5,a3,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200be2:	478d                	li	a5,3
ffffffffc0200be4:	0005081b          	sext.w	a6,a0
ffffffffc0200be8:	04a7e263          	bltu	a5,a0,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200bec:	00281793          	slli	a5,a6,0x2
ffffffffc0200bf0:	97c2                	add	a5,a5,a6
ffffffffc0200bf2:	0792                	slli	a5,a5,0x4
ffffffffc0200bf4:	00091817          	auipc	a6,0x91
ffffffffc0200bf8:	a7480813          	addi	a6,a6,-1420 # ffffffffc0291668 <ide_devices>
ffffffffc0200bfc:	97c2                	add	a5,a5,a6
ffffffffc0200bfe:	0007a883          	lw	a7,0(a5)
ffffffffc0200c02:	02088563          	beqz	a7,ffffffffc0200c2c <ide_write_secs+0x56>
ffffffffc0200c06:	100008b7          	lui	a7,0x10000
ffffffffc0200c0a:	0515f163          	bgeu	a1,a7,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c0e:	1582                	slli	a1,a1,0x20
ffffffffc0200c10:	9181                	srli	a1,a1,0x20
ffffffffc0200c12:	00d58733          	add	a4,a1,a3
ffffffffc0200c16:	02e8eb63          	bltu	a7,a4,ffffffffc0200c4c <ide_write_secs+0x76>
ffffffffc0200c1a:	00251713          	slli	a4,a0,0x2
ffffffffc0200c1e:	60a2                	ld	ra,8(sp)
ffffffffc0200c20:	67bc                	ld	a5,72(a5)
ffffffffc0200c22:	953a                	add	a0,a0,a4
ffffffffc0200c24:	0512                	slli	a0,a0,0x4
ffffffffc0200c26:	9542                	add	a0,a0,a6
ffffffffc0200c28:	0141                	addi	sp,sp,16
ffffffffc0200c2a:	8782                	jr	a5
ffffffffc0200c2c:	0000b697          	auipc	a3,0xb
ffffffffc0200c30:	c3468693          	addi	a3,a3,-972 # ffffffffc020b860 <commands+0x258>
ffffffffc0200c34:	0000b617          	auipc	a2,0xb
ffffffffc0200c38:	be460613          	addi	a2,a2,-1052 # ffffffffc020b818 <commands+0x210>
ffffffffc0200c3c:	02900593          	li	a1,41
ffffffffc0200c40:	0000b517          	auipc	a0,0xb
ffffffffc0200c44:	bf050513          	addi	a0,a0,-1040 # ffffffffc020b830 <commands+0x228>
ffffffffc0200c48:	857ff0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0200c4c:	0000b697          	auipc	a3,0xb
ffffffffc0200c50:	c3c68693          	addi	a3,a3,-964 # ffffffffc020b888 <commands+0x280>
ffffffffc0200c54:	0000b617          	auipc	a2,0xb
ffffffffc0200c58:	bc460613          	addi	a2,a2,-1084 # ffffffffc020b818 <commands+0x210>
ffffffffc0200c5c:	02a00593          	li	a1,42
ffffffffc0200c60:	0000b517          	auipc	a0,0xb
ffffffffc0200c64:	bd050513          	addi	a0,a0,-1072 # ffffffffc020b830 <commands+0x228>
ffffffffc0200c68:	837ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200c6c <intr_enable>:
ffffffffc0200c6c:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200c70:	8082                	ret

ffffffffc0200c72 <intr_disable>:
ffffffffc0200c72:	100177f3          	csrrci	a5,sstatus,2
ffffffffc0200c76:	8082                	ret

ffffffffc0200c78 <pic_init>:
ffffffffc0200c78:	8082                	ret

ffffffffc0200c7a <ramdisk_write>:
ffffffffc0200c7a:	00856703          	lwu	a4,8(a0)
ffffffffc0200c7e:	1141                	addi	sp,sp,-16
ffffffffc0200c80:	e406                	sd	ra,8(sp)
ffffffffc0200c82:	8f0d                	sub	a4,a4,a1
ffffffffc0200c84:	87ae                	mv	a5,a1
ffffffffc0200c86:	85b2                	mv	a1,a2
ffffffffc0200c88:	00e6f363          	bgeu	a3,a4,ffffffffc0200c8e <ramdisk_write+0x14>
ffffffffc0200c8c:	8736                	mv	a4,a3
ffffffffc0200c8e:	6908                	ld	a0,16(a0)
ffffffffc0200c90:	07a6                	slli	a5,a5,0x9
ffffffffc0200c92:	00971613          	slli	a2,a4,0x9
ffffffffc0200c96:	953e                	add	a0,a0,a5
ffffffffc0200c98:	6f00a0ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0200c9c:	60a2                	ld	ra,8(sp)
ffffffffc0200c9e:	4501                	li	a0,0
ffffffffc0200ca0:	0141                	addi	sp,sp,16
ffffffffc0200ca2:	8082                	ret

ffffffffc0200ca4 <ramdisk_read>:
ffffffffc0200ca4:	00856783          	lwu	a5,8(a0)
ffffffffc0200ca8:	1141                	addi	sp,sp,-16
ffffffffc0200caa:	e406                	sd	ra,8(sp)
ffffffffc0200cac:	8f8d                	sub	a5,a5,a1
ffffffffc0200cae:	872a                	mv	a4,a0
ffffffffc0200cb0:	8532                	mv	a0,a2
ffffffffc0200cb2:	00f6f363          	bgeu	a3,a5,ffffffffc0200cb8 <ramdisk_read+0x14>
ffffffffc0200cb6:	87b6                	mv	a5,a3
ffffffffc0200cb8:	6b18                	ld	a4,16(a4)
ffffffffc0200cba:	05a6                	slli	a1,a1,0x9
ffffffffc0200cbc:	00979613          	slli	a2,a5,0x9
ffffffffc0200cc0:	95ba                	add	a1,a1,a4
ffffffffc0200cc2:	6c60a0ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0200cc6:	60a2                	ld	ra,8(sp)
ffffffffc0200cc8:	4501                	li	a0,0
ffffffffc0200cca:	0141                	addi	sp,sp,16
ffffffffc0200ccc:	8082                	ret

ffffffffc0200cce <ramdisk_init>:
ffffffffc0200cce:	1101                	addi	sp,sp,-32
ffffffffc0200cd0:	e822                	sd	s0,16(sp)
ffffffffc0200cd2:	842e                	mv	s0,a1
ffffffffc0200cd4:	e426                	sd	s1,8(sp)
ffffffffc0200cd6:	05000613          	li	a2,80
ffffffffc0200cda:	84aa                	mv	s1,a0
ffffffffc0200cdc:	4581                	li	a1,0
ffffffffc0200cde:	8522                	mv	a0,s0
ffffffffc0200ce0:	ec06                	sd	ra,24(sp)
ffffffffc0200ce2:	e04a                	sd	s2,0(sp)
ffffffffc0200ce4:	6520a0ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0200ce8:	4785                	li	a5,1
ffffffffc0200cea:	06f48b63          	beq	s1,a5,ffffffffc0200d60 <ramdisk_init+0x92>
ffffffffc0200cee:	4789                	li	a5,2
ffffffffc0200cf0:	00090617          	auipc	a2,0x90
ffffffffc0200cf4:	32060613          	addi	a2,a2,800 # ffffffffc0291010 <arena>
ffffffffc0200cf8:	0001b917          	auipc	s2,0x1b
ffffffffc0200cfc:	01890913          	addi	s2,s2,24 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d00:	08f49563          	bne	s1,a5,ffffffffc0200d8a <ramdisk_init+0xbc>
ffffffffc0200d04:	06c90863          	beq	s2,a2,ffffffffc0200d74 <ramdisk_init+0xa6>
ffffffffc0200d08:	412604b3          	sub	s1,a2,s2
ffffffffc0200d0c:	86a6                	mv	a3,s1
ffffffffc0200d0e:	85ca                	mv	a1,s2
ffffffffc0200d10:	167d                	addi	a2,a2,-1
ffffffffc0200d12:	0000b517          	auipc	a0,0xb
ffffffffc0200d16:	bce50513          	addi	a0,a0,-1074 # ffffffffc020b8e0 <commands+0x2d8>
ffffffffc0200d1a:	c8cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200d1e:	57fd                	li	a5,-1
ffffffffc0200d20:	1782                	slli	a5,a5,0x20
ffffffffc0200d22:	0785                	addi	a5,a5,1
ffffffffc0200d24:	0094d49b          	srliw	s1,s1,0x9
ffffffffc0200d28:	e01c                	sd	a5,0(s0)
ffffffffc0200d2a:	c404                	sw	s1,8(s0)
ffffffffc0200d2c:	01243823          	sd	s2,16(s0)
ffffffffc0200d30:	02040513          	addi	a0,s0,32
ffffffffc0200d34:	0000b597          	auipc	a1,0xb
ffffffffc0200d38:	c0458593          	addi	a1,a1,-1020 # ffffffffc020b938 <commands+0x330>
ffffffffc0200d3c:	58e0a0ef          	jal	ra,ffffffffc020b2ca <strcpy>
ffffffffc0200d40:	00000797          	auipc	a5,0x0
ffffffffc0200d44:	f6478793          	addi	a5,a5,-156 # ffffffffc0200ca4 <ramdisk_read>
ffffffffc0200d48:	e03c                	sd	a5,64(s0)
ffffffffc0200d4a:	00000797          	auipc	a5,0x0
ffffffffc0200d4e:	f3078793          	addi	a5,a5,-208 # ffffffffc0200c7a <ramdisk_write>
ffffffffc0200d52:	60e2                	ld	ra,24(sp)
ffffffffc0200d54:	e43c                	sd	a5,72(s0)
ffffffffc0200d56:	6442                	ld	s0,16(sp)
ffffffffc0200d58:	64a2                	ld	s1,8(sp)
ffffffffc0200d5a:	6902                	ld	s2,0(sp)
ffffffffc0200d5c:	6105                	addi	sp,sp,32
ffffffffc0200d5e:	8082                	ret
ffffffffc0200d60:	0001b617          	auipc	a2,0x1b
ffffffffc0200d64:	fb060613          	addi	a2,a2,-80 # ffffffffc021bd10 <_binary_bin_sfs_img_start>
ffffffffc0200d68:	00013917          	auipc	s2,0x13
ffffffffc0200d6c:	2a890913          	addi	s2,s2,680 # ffffffffc0214010 <_binary_bin_swap_img_start>
ffffffffc0200d70:	f8c91ce3          	bne	s2,a2,ffffffffc0200d08 <ramdisk_init+0x3a>
ffffffffc0200d74:	6442                	ld	s0,16(sp)
ffffffffc0200d76:	60e2                	ld	ra,24(sp)
ffffffffc0200d78:	64a2                	ld	s1,8(sp)
ffffffffc0200d7a:	6902                	ld	s2,0(sp)
ffffffffc0200d7c:	0000b517          	auipc	a0,0xb
ffffffffc0200d80:	b4c50513          	addi	a0,a0,-1204 # ffffffffc020b8c8 <commands+0x2c0>
ffffffffc0200d84:	6105                	addi	sp,sp,32
ffffffffc0200d86:	c20ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0200d8a:	0000b617          	auipc	a2,0xb
ffffffffc0200d8e:	b7e60613          	addi	a2,a2,-1154 # ffffffffc020b908 <commands+0x300>
ffffffffc0200d92:	03200593          	li	a1,50
ffffffffc0200d96:	0000b517          	auipc	a0,0xb
ffffffffc0200d9a:	b8a50513          	addi	a0,a0,-1142 # ffffffffc020b920 <commands+0x318>
ffffffffc0200d9e:	f00ff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0200da2 <idt_init>:
ffffffffc0200da2:	14005073          	csrwi	sscratch,0
ffffffffc0200da6:	00000797          	auipc	a5,0x0
ffffffffc0200daa:	43a78793          	addi	a5,a5,1082 # ffffffffc02011e0 <__alltraps>
ffffffffc0200dae:	10579073          	csrw	stvec,a5
ffffffffc0200db2:	000407b7          	lui	a5,0x40
ffffffffc0200db6:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200dba:	8082                	ret

ffffffffc0200dbc <print_regs>:
ffffffffc0200dbc:	610c                	ld	a1,0(a0)
ffffffffc0200dbe:	1141                	addi	sp,sp,-16
ffffffffc0200dc0:	e022                	sd	s0,0(sp)
ffffffffc0200dc2:	842a                	mv	s0,a0
ffffffffc0200dc4:	0000b517          	auipc	a0,0xb
ffffffffc0200dc8:	b8450513          	addi	a0,a0,-1148 # ffffffffc020b948 <commands+0x340>
ffffffffc0200dcc:	e406                	sd	ra,8(sp)
ffffffffc0200dce:	bd8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dd2:	640c                	ld	a1,8(s0)
ffffffffc0200dd4:	0000b517          	auipc	a0,0xb
ffffffffc0200dd8:	b8c50513          	addi	a0,a0,-1140 # ffffffffc020b960 <commands+0x358>
ffffffffc0200ddc:	bcaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200de0:	680c                	ld	a1,16(s0)
ffffffffc0200de2:	0000b517          	auipc	a0,0xb
ffffffffc0200de6:	b9650513          	addi	a0,a0,-1130 # ffffffffc020b978 <commands+0x370>
ffffffffc0200dea:	bbcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dee:	6c0c                	ld	a1,24(s0)
ffffffffc0200df0:	0000b517          	auipc	a0,0xb
ffffffffc0200df4:	ba050513          	addi	a0,a0,-1120 # ffffffffc020b990 <commands+0x388>
ffffffffc0200df8:	baeff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200dfc:	700c                	ld	a1,32(s0)
ffffffffc0200dfe:	0000b517          	auipc	a0,0xb
ffffffffc0200e02:	baa50513          	addi	a0,a0,-1110 # ffffffffc020b9a8 <commands+0x3a0>
ffffffffc0200e06:	ba0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e0a:	740c                	ld	a1,40(s0)
ffffffffc0200e0c:	0000b517          	auipc	a0,0xb
ffffffffc0200e10:	bb450513          	addi	a0,a0,-1100 # ffffffffc020b9c0 <commands+0x3b8>
ffffffffc0200e14:	b92ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e18:	780c                	ld	a1,48(s0)
ffffffffc0200e1a:	0000b517          	auipc	a0,0xb
ffffffffc0200e1e:	bbe50513          	addi	a0,a0,-1090 # ffffffffc020b9d8 <commands+0x3d0>
ffffffffc0200e22:	b84ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e26:	7c0c                	ld	a1,56(s0)
ffffffffc0200e28:	0000b517          	auipc	a0,0xb
ffffffffc0200e2c:	bc850513          	addi	a0,a0,-1080 # ffffffffc020b9f0 <commands+0x3e8>
ffffffffc0200e30:	b76ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e34:	602c                	ld	a1,64(s0)
ffffffffc0200e36:	0000b517          	auipc	a0,0xb
ffffffffc0200e3a:	bd250513          	addi	a0,a0,-1070 # ffffffffc020ba08 <commands+0x400>
ffffffffc0200e3e:	b68ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e42:	642c                	ld	a1,72(s0)
ffffffffc0200e44:	0000b517          	auipc	a0,0xb
ffffffffc0200e48:	bdc50513          	addi	a0,a0,-1060 # ffffffffc020ba20 <commands+0x418>
ffffffffc0200e4c:	b5aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e50:	682c                	ld	a1,80(s0)
ffffffffc0200e52:	0000b517          	auipc	a0,0xb
ffffffffc0200e56:	be650513          	addi	a0,a0,-1050 # ffffffffc020ba38 <commands+0x430>
ffffffffc0200e5a:	b4cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e5e:	6c2c                	ld	a1,88(s0)
ffffffffc0200e60:	0000b517          	auipc	a0,0xb
ffffffffc0200e64:	bf050513          	addi	a0,a0,-1040 # ffffffffc020ba50 <commands+0x448>
ffffffffc0200e68:	b3eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e6c:	702c                	ld	a1,96(s0)
ffffffffc0200e6e:	0000b517          	auipc	a0,0xb
ffffffffc0200e72:	bfa50513          	addi	a0,a0,-1030 # ffffffffc020ba68 <commands+0x460>
ffffffffc0200e76:	b30ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e7a:	742c                	ld	a1,104(s0)
ffffffffc0200e7c:	0000b517          	auipc	a0,0xb
ffffffffc0200e80:	c0450513          	addi	a0,a0,-1020 # ffffffffc020ba80 <commands+0x478>
ffffffffc0200e84:	b22ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e88:	782c                	ld	a1,112(s0)
ffffffffc0200e8a:	0000b517          	auipc	a0,0xb
ffffffffc0200e8e:	c0e50513          	addi	a0,a0,-1010 # ffffffffc020ba98 <commands+0x490>
ffffffffc0200e92:	b14ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200e96:	7c2c                	ld	a1,120(s0)
ffffffffc0200e98:	0000b517          	auipc	a0,0xb
ffffffffc0200e9c:	c1850513          	addi	a0,a0,-1000 # ffffffffc020bab0 <commands+0x4a8>
ffffffffc0200ea0:	b06ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ea4:	604c                	ld	a1,128(s0)
ffffffffc0200ea6:	0000b517          	auipc	a0,0xb
ffffffffc0200eaa:	c2250513          	addi	a0,a0,-990 # ffffffffc020bac8 <commands+0x4c0>
ffffffffc0200eae:	af8ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eb2:	644c                	ld	a1,136(s0)
ffffffffc0200eb4:	0000b517          	auipc	a0,0xb
ffffffffc0200eb8:	c2c50513          	addi	a0,a0,-980 # ffffffffc020bae0 <commands+0x4d8>
ffffffffc0200ebc:	aeaff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ec0:	684c                	ld	a1,144(s0)
ffffffffc0200ec2:	0000b517          	auipc	a0,0xb
ffffffffc0200ec6:	c3650513          	addi	a0,a0,-970 # ffffffffc020baf8 <commands+0x4f0>
ffffffffc0200eca:	adcff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ece:	6c4c                	ld	a1,152(s0)
ffffffffc0200ed0:	0000b517          	auipc	a0,0xb
ffffffffc0200ed4:	c4050513          	addi	a0,a0,-960 # ffffffffc020bb10 <commands+0x508>
ffffffffc0200ed8:	aceff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200edc:	704c                	ld	a1,160(s0)
ffffffffc0200ede:	0000b517          	auipc	a0,0xb
ffffffffc0200ee2:	c4a50513          	addi	a0,a0,-950 # ffffffffc020bb28 <commands+0x520>
ffffffffc0200ee6:	ac0ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200eea:	744c                	ld	a1,168(s0)
ffffffffc0200eec:	0000b517          	auipc	a0,0xb
ffffffffc0200ef0:	c5450513          	addi	a0,a0,-940 # ffffffffc020bb40 <commands+0x538>
ffffffffc0200ef4:	ab2ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200ef8:	784c                	ld	a1,176(s0)
ffffffffc0200efa:	0000b517          	auipc	a0,0xb
ffffffffc0200efe:	c5e50513          	addi	a0,a0,-930 # ffffffffc020bb58 <commands+0x550>
ffffffffc0200f02:	aa4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f06:	7c4c                	ld	a1,184(s0)
ffffffffc0200f08:	0000b517          	auipc	a0,0xb
ffffffffc0200f0c:	c6850513          	addi	a0,a0,-920 # ffffffffc020bb70 <commands+0x568>
ffffffffc0200f10:	a96ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f14:	606c                	ld	a1,192(s0)
ffffffffc0200f16:	0000b517          	auipc	a0,0xb
ffffffffc0200f1a:	c7250513          	addi	a0,a0,-910 # ffffffffc020bb88 <commands+0x580>
ffffffffc0200f1e:	a88ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f22:	646c                	ld	a1,200(s0)
ffffffffc0200f24:	0000b517          	auipc	a0,0xb
ffffffffc0200f28:	c7c50513          	addi	a0,a0,-900 # ffffffffc020bba0 <commands+0x598>
ffffffffc0200f2c:	a7aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f30:	686c                	ld	a1,208(s0)
ffffffffc0200f32:	0000b517          	auipc	a0,0xb
ffffffffc0200f36:	c8650513          	addi	a0,a0,-890 # ffffffffc020bbb8 <commands+0x5b0>
ffffffffc0200f3a:	a6cff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f3e:	6c6c                	ld	a1,216(s0)
ffffffffc0200f40:	0000b517          	auipc	a0,0xb
ffffffffc0200f44:	c9050513          	addi	a0,a0,-880 # ffffffffc020bbd0 <commands+0x5c8>
ffffffffc0200f48:	a5eff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f4c:	706c                	ld	a1,224(s0)
ffffffffc0200f4e:	0000b517          	auipc	a0,0xb
ffffffffc0200f52:	c9a50513          	addi	a0,a0,-870 # ffffffffc020bbe8 <commands+0x5e0>
ffffffffc0200f56:	a50ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f5a:	746c                	ld	a1,232(s0)
ffffffffc0200f5c:	0000b517          	auipc	a0,0xb
ffffffffc0200f60:	ca450513          	addi	a0,a0,-860 # ffffffffc020bc00 <commands+0x5f8>
ffffffffc0200f64:	a42ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f68:	786c                	ld	a1,240(s0)
ffffffffc0200f6a:	0000b517          	auipc	a0,0xb
ffffffffc0200f6e:	cae50513          	addi	a0,a0,-850 # ffffffffc020bc18 <commands+0x610>
ffffffffc0200f72:	a34ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200f76:	7c6c                	ld	a1,248(s0)
ffffffffc0200f78:	6402                	ld	s0,0(sp)
ffffffffc0200f7a:	60a2                	ld	ra,8(sp)
ffffffffc0200f7c:	0000b517          	auipc	a0,0xb
ffffffffc0200f80:	cb450513          	addi	a0,a0,-844 # ffffffffc020bc30 <commands+0x628>
ffffffffc0200f84:	0141                	addi	sp,sp,16
ffffffffc0200f86:	a20ff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200f8a <print_trapframe>:
ffffffffc0200f8a:	1141                	addi	sp,sp,-16
ffffffffc0200f8c:	e022                	sd	s0,0(sp)
ffffffffc0200f8e:	85aa                	mv	a1,a0
ffffffffc0200f90:	842a                	mv	s0,a0
ffffffffc0200f92:	0000b517          	auipc	a0,0xb
ffffffffc0200f96:	cb650513          	addi	a0,a0,-842 # ffffffffc020bc48 <commands+0x640>
ffffffffc0200f9a:	e406                	sd	ra,8(sp)
ffffffffc0200f9c:	a0aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fa0:	8522                	mv	a0,s0
ffffffffc0200fa2:	e1bff0ef          	jal	ra,ffffffffc0200dbc <print_regs>
ffffffffc0200fa6:	10043583          	ld	a1,256(s0)
ffffffffc0200faa:	0000b517          	auipc	a0,0xb
ffffffffc0200fae:	cb650513          	addi	a0,a0,-842 # ffffffffc020bc60 <commands+0x658>
ffffffffc0200fb2:	9f4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fb6:	10843583          	ld	a1,264(s0)
ffffffffc0200fba:	0000b517          	auipc	a0,0xb
ffffffffc0200fbe:	cbe50513          	addi	a0,a0,-834 # ffffffffc020bc78 <commands+0x670>
ffffffffc0200fc2:	9e4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fc6:	11043583          	ld	a1,272(s0)
ffffffffc0200fca:	0000b517          	auipc	a0,0xb
ffffffffc0200fce:	cc650513          	addi	a0,a0,-826 # ffffffffc020bc90 <commands+0x688>
ffffffffc0200fd2:	9d4ff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0200fd6:	11843583          	ld	a1,280(s0)
ffffffffc0200fda:	6402                	ld	s0,0(sp)
ffffffffc0200fdc:	60a2                	ld	ra,8(sp)
ffffffffc0200fde:	0000b517          	auipc	a0,0xb
ffffffffc0200fe2:	cc250513          	addi	a0,a0,-830 # ffffffffc020bca0 <commands+0x698>
ffffffffc0200fe6:	0141                	addi	sp,sp,16
ffffffffc0200fe8:	9beff06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0200fec <interrupt_handler>:
ffffffffc0200fec:	11853783          	ld	a5,280(a0)
ffffffffc0200ff0:	472d                	li	a4,11
ffffffffc0200ff2:	0786                	slli	a5,a5,0x1
ffffffffc0200ff4:	8385                	srli	a5,a5,0x1
ffffffffc0200ff6:	06f76c63          	bltu	a4,a5,ffffffffc020106e <interrupt_handler+0x82>
ffffffffc0200ffa:	0000b717          	auipc	a4,0xb
ffffffffc0200ffe:	d5e70713          	addi	a4,a4,-674 # ffffffffc020bd58 <commands+0x750>
ffffffffc0201002:	078a                	slli	a5,a5,0x2
ffffffffc0201004:	97ba                	add	a5,a5,a4
ffffffffc0201006:	439c                	lw	a5,0(a5)
ffffffffc0201008:	97ba                	add	a5,a5,a4
ffffffffc020100a:	8782                	jr	a5
ffffffffc020100c:	0000b517          	auipc	a0,0xb
ffffffffc0201010:	d0c50513          	addi	a0,a0,-756 # ffffffffc020bd18 <commands+0x710>
ffffffffc0201014:	992ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201018:	0000b517          	auipc	a0,0xb
ffffffffc020101c:	ce050513          	addi	a0,a0,-800 # ffffffffc020bcf8 <commands+0x6f0>
ffffffffc0201020:	986ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201024:	0000b517          	auipc	a0,0xb
ffffffffc0201028:	c9450513          	addi	a0,a0,-876 # ffffffffc020bcb8 <commands+0x6b0>
ffffffffc020102c:	97aff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc0201030:	0000b517          	auipc	a0,0xb
ffffffffc0201034:	ca850513          	addi	a0,a0,-856 # ffffffffc020bcd8 <commands+0x6d0>
ffffffffc0201038:	96eff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020103c:	1141                	addi	sp,sp,-16
ffffffffc020103e:	e406                	sd	ra,8(sp)
ffffffffc0201040:	d3aff0ef          	jal	ra,ffffffffc020057a <clock_set_next_event>
ffffffffc0201044:	00096717          	auipc	a4,0x96
ffffffffc0201048:	82c70713          	addi	a4,a4,-2004 # ffffffffc0296870 <ticks>
ffffffffc020104c:	631c                	ld	a5,0(a4)
ffffffffc020104e:	0785                	addi	a5,a5,1
ffffffffc0201050:	e31c                	sd	a5,0(a4)
ffffffffc0201052:	386060ef          	jal	ra,ffffffffc02073d8 <run_timer_list>
ffffffffc0201056:	d9eff0ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020105a:	60a2                	ld	ra,8(sp)
ffffffffc020105c:	0141                	addi	sp,sp,16
ffffffffc020105e:	24b0706f          	j	ffffffffc0208aa8 <dev_stdin_write>
ffffffffc0201062:	0000b517          	auipc	a0,0xb
ffffffffc0201066:	cd650513          	addi	a0,a0,-810 # ffffffffc020bd38 <commands+0x730>
ffffffffc020106a:	93cff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020106e:	bf31                	j	ffffffffc0200f8a <print_trapframe>

ffffffffc0201070 <exception_handler>:
ffffffffc0201070:	11853783          	ld	a5,280(a0)
ffffffffc0201074:	1141                	addi	sp,sp,-16
ffffffffc0201076:	e022                	sd	s0,0(sp)
ffffffffc0201078:	e406                	sd	ra,8(sp)
ffffffffc020107a:	473d                	li	a4,15
ffffffffc020107c:	842a                	mv	s0,a0
ffffffffc020107e:	0af76b63          	bltu	a4,a5,ffffffffc0201134 <exception_handler+0xc4>
ffffffffc0201082:	0000b717          	auipc	a4,0xb
ffffffffc0201086:	e9670713          	addi	a4,a4,-362 # ffffffffc020bf18 <commands+0x910>
ffffffffc020108a:	078a                	slli	a5,a5,0x2
ffffffffc020108c:	97ba                	add	a5,a5,a4
ffffffffc020108e:	439c                	lw	a5,0(a5)
ffffffffc0201090:	97ba                	add	a5,a5,a4
ffffffffc0201092:	8782                	jr	a5
ffffffffc0201094:	0000b517          	auipc	a0,0xb
ffffffffc0201098:	ddc50513          	addi	a0,a0,-548 # ffffffffc020be70 <commands+0x868>
ffffffffc020109c:	90aff0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02010a0:	10843783          	ld	a5,264(s0)
ffffffffc02010a4:	60a2                	ld	ra,8(sp)
ffffffffc02010a6:	0791                	addi	a5,a5,4
ffffffffc02010a8:	10f43423          	sd	a5,264(s0)
ffffffffc02010ac:	6402                	ld	s0,0(sp)
ffffffffc02010ae:	0141                	addi	sp,sp,16
ffffffffc02010b0:	53e0606f          	j	ffffffffc02075ee <syscall>
ffffffffc02010b4:	0000b517          	auipc	a0,0xb
ffffffffc02010b8:	ddc50513          	addi	a0,a0,-548 # ffffffffc020be90 <commands+0x888>
ffffffffc02010bc:	6402                	ld	s0,0(sp)
ffffffffc02010be:	60a2                	ld	ra,8(sp)
ffffffffc02010c0:	0141                	addi	sp,sp,16
ffffffffc02010c2:	8e4ff06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc02010c6:	0000b517          	auipc	a0,0xb
ffffffffc02010ca:	dea50513          	addi	a0,a0,-534 # ffffffffc020beb0 <commands+0x8a8>
ffffffffc02010ce:	b7fd                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010d0:	0000b517          	auipc	a0,0xb
ffffffffc02010d4:	e0050513          	addi	a0,a0,-512 # ffffffffc020bed0 <commands+0x8c8>
ffffffffc02010d8:	b7d5                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010da:	0000b517          	auipc	a0,0xb
ffffffffc02010de:	e0e50513          	addi	a0,a0,-498 # ffffffffc020bee8 <commands+0x8e0>
ffffffffc02010e2:	bfe9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010e4:	0000b517          	auipc	a0,0xb
ffffffffc02010e8:	e1c50513          	addi	a0,a0,-484 # ffffffffc020bf00 <commands+0x8f8>
ffffffffc02010ec:	bfc1                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010ee:	0000b517          	auipc	a0,0xb
ffffffffc02010f2:	c9a50513          	addi	a0,a0,-870 # ffffffffc020bd88 <commands+0x780>
ffffffffc02010f6:	b7d9                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc02010f8:	0000b517          	auipc	a0,0xb
ffffffffc02010fc:	cb050513          	addi	a0,a0,-848 # ffffffffc020bda8 <commands+0x7a0>
ffffffffc0201100:	bf75                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201102:	0000b517          	auipc	a0,0xb
ffffffffc0201106:	cc650513          	addi	a0,a0,-826 # ffffffffc020bdc8 <commands+0x7c0>
ffffffffc020110a:	bf4d                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020110c:	0000b517          	auipc	a0,0xb
ffffffffc0201110:	cd450513          	addi	a0,a0,-812 # ffffffffc020bde0 <commands+0x7d8>
ffffffffc0201114:	b765                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201116:	0000b517          	auipc	a0,0xb
ffffffffc020111a:	cda50513          	addi	a0,a0,-806 # ffffffffc020bdf0 <commands+0x7e8>
ffffffffc020111e:	bf79                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201120:	0000b517          	auipc	a0,0xb
ffffffffc0201124:	cf050513          	addi	a0,a0,-784 # ffffffffc020be10 <commands+0x808>
ffffffffc0201128:	bf51                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc020112a:	0000b517          	auipc	a0,0xb
ffffffffc020112e:	d2e50513          	addi	a0,a0,-722 # ffffffffc020be58 <commands+0x850>
ffffffffc0201132:	b769                	j	ffffffffc02010bc <exception_handler+0x4c>
ffffffffc0201134:	8522                	mv	a0,s0
ffffffffc0201136:	6402                	ld	s0,0(sp)
ffffffffc0201138:	60a2                	ld	ra,8(sp)
ffffffffc020113a:	0141                	addi	sp,sp,16
ffffffffc020113c:	b5b9                	j	ffffffffc0200f8a <print_trapframe>
ffffffffc020113e:	0000b617          	auipc	a2,0xb
ffffffffc0201142:	cea60613          	addi	a2,a2,-790 # ffffffffc020be28 <commands+0x820>
ffffffffc0201146:	0b100593          	li	a1,177
ffffffffc020114a:	0000b517          	auipc	a0,0xb
ffffffffc020114e:	cf650513          	addi	a0,a0,-778 # ffffffffc020be40 <commands+0x838>
ffffffffc0201152:	b4cff0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201156 <trap>:
ffffffffc0201156:	1101                	addi	sp,sp,-32
ffffffffc0201158:	e822                	sd	s0,16(sp)
ffffffffc020115a:	00095417          	auipc	s0,0x95
ffffffffc020115e:	76640413          	addi	s0,s0,1894 # ffffffffc02968c0 <current>
ffffffffc0201162:	6018                	ld	a4,0(s0)
ffffffffc0201164:	ec06                	sd	ra,24(sp)
ffffffffc0201166:	e426                	sd	s1,8(sp)
ffffffffc0201168:	e04a                	sd	s2,0(sp)
ffffffffc020116a:	11853683          	ld	a3,280(a0)
ffffffffc020116e:	cf1d                	beqz	a4,ffffffffc02011ac <trap+0x56>
ffffffffc0201170:	10053483          	ld	s1,256(a0)
ffffffffc0201174:	0a073903          	ld	s2,160(a4)
ffffffffc0201178:	f348                	sd	a0,160(a4)
ffffffffc020117a:	1004f493          	andi	s1,s1,256
ffffffffc020117e:	0206c463          	bltz	a3,ffffffffc02011a6 <trap+0x50>
ffffffffc0201182:	eefff0ef          	jal	ra,ffffffffc0201070 <exception_handler>
ffffffffc0201186:	601c                	ld	a5,0(s0)
ffffffffc0201188:	0b27b023          	sd	s2,160(a5) # 400a0 <_binary_bin_swap_img_size+0x383a0>
ffffffffc020118c:	e499                	bnez	s1,ffffffffc020119a <trap+0x44>
ffffffffc020118e:	0b07a703          	lw	a4,176(a5)
ffffffffc0201192:	8b05                	andi	a4,a4,1
ffffffffc0201194:	e329                	bnez	a4,ffffffffc02011d6 <trap+0x80>
ffffffffc0201196:	6f9c                	ld	a5,24(a5)
ffffffffc0201198:	eb85                	bnez	a5,ffffffffc02011c8 <trap+0x72>
ffffffffc020119a:	60e2                	ld	ra,24(sp)
ffffffffc020119c:	6442                	ld	s0,16(sp)
ffffffffc020119e:	64a2                	ld	s1,8(sp)
ffffffffc02011a0:	6902                	ld	s2,0(sp)
ffffffffc02011a2:	6105                	addi	sp,sp,32
ffffffffc02011a4:	8082                	ret
ffffffffc02011a6:	e47ff0ef          	jal	ra,ffffffffc0200fec <interrupt_handler>
ffffffffc02011aa:	bff1                	j	ffffffffc0201186 <trap+0x30>
ffffffffc02011ac:	0006c863          	bltz	a3,ffffffffc02011bc <trap+0x66>
ffffffffc02011b0:	6442                	ld	s0,16(sp)
ffffffffc02011b2:	60e2                	ld	ra,24(sp)
ffffffffc02011b4:	64a2                	ld	s1,8(sp)
ffffffffc02011b6:	6902                	ld	s2,0(sp)
ffffffffc02011b8:	6105                	addi	sp,sp,32
ffffffffc02011ba:	bd5d                	j	ffffffffc0201070 <exception_handler>
ffffffffc02011bc:	6442                	ld	s0,16(sp)
ffffffffc02011be:	60e2                	ld	ra,24(sp)
ffffffffc02011c0:	64a2                	ld	s1,8(sp)
ffffffffc02011c2:	6902                	ld	s2,0(sp)
ffffffffc02011c4:	6105                	addi	sp,sp,32
ffffffffc02011c6:	b51d                	j	ffffffffc0200fec <interrupt_handler>
ffffffffc02011c8:	6442                	ld	s0,16(sp)
ffffffffc02011ca:	60e2                	ld	ra,24(sp)
ffffffffc02011cc:	64a2                	ld	s1,8(sp)
ffffffffc02011ce:	6902                	ld	s2,0(sp)
ffffffffc02011d0:	6105                	addi	sp,sp,32
ffffffffc02011d2:	7fb0506f          	j	ffffffffc02071cc <schedule>
ffffffffc02011d6:	555d                	li	a0,-9
ffffffffc02011d8:	62b040ef          	jal	ra,ffffffffc0206002 <do_exit>
ffffffffc02011dc:	601c                	ld	a5,0(s0)
ffffffffc02011de:	bf65                	j	ffffffffc0201196 <trap+0x40>

ffffffffc02011e0 <__alltraps>:
ffffffffc02011e0:	14011173          	csrrw	sp,sscratch,sp
ffffffffc02011e4:	00011463          	bnez	sp,ffffffffc02011ec <__alltraps+0xc>
ffffffffc02011e8:	14002173          	csrr	sp,sscratch
ffffffffc02011ec:	712d                	addi	sp,sp,-288
ffffffffc02011ee:	e002                	sd	zero,0(sp)
ffffffffc02011f0:	e406                	sd	ra,8(sp)
ffffffffc02011f2:	ec0e                	sd	gp,24(sp)
ffffffffc02011f4:	f012                	sd	tp,32(sp)
ffffffffc02011f6:	f416                	sd	t0,40(sp)
ffffffffc02011f8:	f81a                	sd	t1,48(sp)
ffffffffc02011fa:	fc1e                	sd	t2,56(sp)
ffffffffc02011fc:	e0a2                	sd	s0,64(sp)
ffffffffc02011fe:	e4a6                	sd	s1,72(sp)
ffffffffc0201200:	e8aa                	sd	a0,80(sp)
ffffffffc0201202:	ecae                	sd	a1,88(sp)
ffffffffc0201204:	f0b2                	sd	a2,96(sp)
ffffffffc0201206:	f4b6                	sd	a3,104(sp)
ffffffffc0201208:	f8ba                	sd	a4,112(sp)
ffffffffc020120a:	fcbe                	sd	a5,120(sp)
ffffffffc020120c:	e142                	sd	a6,128(sp)
ffffffffc020120e:	e546                	sd	a7,136(sp)
ffffffffc0201210:	e94a                	sd	s2,144(sp)
ffffffffc0201212:	ed4e                	sd	s3,152(sp)
ffffffffc0201214:	f152                	sd	s4,160(sp)
ffffffffc0201216:	f556                	sd	s5,168(sp)
ffffffffc0201218:	f95a                	sd	s6,176(sp)
ffffffffc020121a:	fd5e                	sd	s7,184(sp)
ffffffffc020121c:	e1e2                	sd	s8,192(sp)
ffffffffc020121e:	e5e6                	sd	s9,200(sp)
ffffffffc0201220:	e9ea                	sd	s10,208(sp)
ffffffffc0201222:	edee                	sd	s11,216(sp)
ffffffffc0201224:	f1f2                	sd	t3,224(sp)
ffffffffc0201226:	f5f6                	sd	t4,232(sp)
ffffffffc0201228:	f9fa                	sd	t5,240(sp)
ffffffffc020122a:	fdfe                	sd	t6,248(sp)
ffffffffc020122c:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0201230:	100024f3          	csrr	s1,sstatus
ffffffffc0201234:	14102973          	csrr	s2,sepc
ffffffffc0201238:	143029f3          	csrr	s3,stval
ffffffffc020123c:	14202a73          	csrr	s4,scause
ffffffffc0201240:	e822                	sd	s0,16(sp)
ffffffffc0201242:	e226                	sd	s1,256(sp)
ffffffffc0201244:	e64a                	sd	s2,264(sp)
ffffffffc0201246:	ea4e                	sd	s3,272(sp)
ffffffffc0201248:	ee52                	sd	s4,280(sp)
ffffffffc020124a:	850a                	mv	a0,sp
ffffffffc020124c:	f0bff0ef          	jal	ra,ffffffffc0201156 <trap>

ffffffffc0201250 <__trapret>:
ffffffffc0201250:	6492                	ld	s1,256(sp)
ffffffffc0201252:	6932                	ld	s2,264(sp)
ffffffffc0201254:	1004f413          	andi	s0,s1,256
ffffffffc0201258:	e401                	bnez	s0,ffffffffc0201260 <__trapret+0x10>
ffffffffc020125a:	1200                	addi	s0,sp,288
ffffffffc020125c:	14041073          	csrw	sscratch,s0
ffffffffc0201260:	10049073          	csrw	sstatus,s1
ffffffffc0201264:	14191073          	csrw	sepc,s2
ffffffffc0201268:	60a2                	ld	ra,8(sp)
ffffffffc020126a:	61e2                	ld	gp,24(sp)
ffffffffc020126c:	7202                	ld	tp,32(sp)
ffffffffc020126e:	72a2                	ld	t0,40(sp)
ffffffffc0201270:	7342                	ld	t1,48(sp)
ffffffffc0201272:	73e2                	ld	t2,56(sp)
ffffffffc0201274:	6406                	ld	s0,64(sp)
ffffffffc0201276:	64a6                	ld	s1,72(sp)
ffffffffc0201278:	6546                	ld	a0,80(sp)
ffffffffc020127a:	65e6                	ld	a1,88(sp)
ffffffffc020127c:	7606                	ld	a2,96(sp)
ffffffffc020127e:	76a6                	ld	a3,104(sp)
ffffffffc0201280:	7746                	ld	a4,112(sp)
ffffffffc0201282:	77e6                	ld	a5,120(sp)
ffffffffc0201284:	680a                	ld	a6,128(sp)
ffffffffc0201286:	68aa                	ld	a7,136(sp)
ffffffffc0201288:	694a                	ld	s2,144(sp)
ffffffffc020128a:	69ea                	ld	s3,152(sp)
ffffffffc020128c:	7a0a                	ld	s4,160(sp)
ffffffffc020128e:	7aaa                	ld	s5,168(sp)
ffffffffc0201290:	7b4a                	ld	s6,176(sp)
ffffffffc0201292:	7bea                	ld	s7,184(sp)
ffffffffc0201294:	6c0e                	ld	s8,192(sp)
ffffffffc0201296:	6cae                	ld	s9,200(sp)
ffffffffc0201298:	6d4e                	ld	s10,208(sp)
ffffffffc020129a:	6dee                	ld	s11,216(sp)
ffffffffc020129c:	7e0e                	ld	t3,224(sp)
ffffffffc020129e:	7eae                	ld	t4,232(sp)
ffffffffc02012a0:	7f4e                	ld	t5,240(sp)
ffffffffc02012a2:	7fee                	ld	t6,248(sp)
ffffffffc02012a4:	6142                	ld	sp,16(sp)
ffffffffc02012a6:	10200073          	sret

ffffffffc02012aa <forkrets>:
ffffffffc02012aa:	812a                	mv	sp,a0
ffffffffc02012ac:	b755                	j	ffffffffc0201250 <__trapret>

ffffffffc02012ae <default_init>:
ffffffffc02012ae:	00090797          	auipc	a5,0x90
ffffffffc02012b2:	4fa78793          	addi	a5,a5,1274 # ffffffffc02917a8 <free_area>
ffffffffc02012b6:	e79c                	sd	a5,8(a5)
ffffffffc02012b8:	e39c                	sd	a5,0(a5)
ffffffffc02012ba:	0007a823          	sw	zero,16(a5)
ffffffffc02012be:	8082                	ret

ffffffffc02012c0 <default_nr_free_pages>:
ffffffffc02012c0:	00090517          	auipc	a0,0x90
ffffffffc02012c4:	4f856503          	lwu	a0,1272(a0) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02012c8:	8082                	ret

ffffffffc02012ca <default_check>:
ffffffffc02012ca:	715d                	addi	sp,sp,-80
ffffffffc02012cc:	e0a2                	sd	s0,64(sp)
ffffffffc02012ce:	00090417          	auipc	s0,0x90
ffffffffc02012d2:	4da40413          	addi	s0,s0,1242 # ffffffffc02917a8 <free_area>
ffffffffc02012d6:	641c                	ld	a5,8(s0)
ffffffffc02012d8:	e486                	sd	ra,72(sp)
ffffffffc02012da:	fc26                	sd	s1,56(sp)
ffffffffc02012dc:	f84a                	sd	s2,48(sp)
ffffffffc02012de:	f44e                	sd	s3,40(sp)
ffffffffc02012e0:	f052                	sd	s4,32(sp)
ffffffffc02012e2:	ec56                	sd	s5,24(sp)
ffffffffc02012e4:	e85a                	sd	s6,16(sp)
ffffffffc02012e6:	e45e                	sd	s7,8(sp)
ffffffffc02012e8:	e062                	sd	s8,0(sp)
ffffffffc02012ea:	2a878d63          	beq	a5,s0,ffffffffc02015a4 <default_check+0x2da>
ffffffffc02012ee:	4481                	li	s1,0
ffffffffc02012f0:	4901                	li	s2,0
ffffffffc02012f2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02012f6:	8b09                	andi	a4,a4,2
ffffffffc02012f8:	2a070a63          	beqz	a4,ffffffffc02015ac <default_check+0x2e2>
ffffffffc02012fc:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201300:	679c                	ld	a5,8(a5)
ffffffffc0201302:	2905                	addiw	s2,s2,1
ffffffffc0201304:	9cb9                	addw	s1,s1,a4
ffffffffc0201306:	fe8796e3          	bne	a5,s0,ffffffffc02012f2 <default_check+0x28>
ffffffffc020130a:	89a6                	mv	s3,s1
ffffffffc020130c:	6df000ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc0201310:	6f351e63          	bne	a0,s3,ffffffffc0201a0c <default_check+0x742>
ffffffffc0201314:	4505                	li	a0,1
ffffffffc0201316:	657000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020131a:	8aaa                	mv	s5,a0
ffffffffc020131c:	42050863          	beqz	a0,ffffffffc020174c <default_check+0x482>
ffffffffc0201320:	4505                	li	a0,1
ffffffffc0201322:	64b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201326:	89aa                	mv	s3,a0
ffffffffc0201328:	70050263          	beqz	a0,ffffffffc0201a2c <default_check+0x762>
ffffffffc020132c:	4505                	li	a0,1
ffffffffc020132e:	63f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201332:	8a2a                	mv	s4,a0
ffffffffc0201334:	48050c63          	beqz	a0,ffffffffc02017cc <default_check+0x502>
ffffffffc0201338:	293a8a63          	beq	s5,s3,ffffffffc02015cc <default_check+0x302>
ffffffffc020133c:	28aa8863          	beq	s5,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201340:	28a98663          	beq	s3,a0,ffffffffc02015cc <default_check+0x302>
ffffffffc0201344:	000aa783          	lw	a5,0(s5)
ffffffffc0201348:	2a079263          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020134c:	0009a783          	lw	a5,0(s3)
ffffffffc0201350:	28079e63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc0201354:	411c                	lw	a5,0(a0)
ffffffffc0201356:	28079b63          	bnez	a5,ffffffffc02015ec <default_check+0x322>
ffffffffc020135a:	00095797          	auipc	a5,0x95
ffffffffc020135e:	54e7b783          	ld	a5,1358(a5) # ffffffffc02968a8 <pages>
ffffffffc0201362:	40fa8733          	sub	a4,s5,a5
ffffffffc0201366:	0000e617          	auipc	a2,0xe
ffffffffc020136a:	19a63603          	ld	a2,410(a2) # ffffffffc020f500 <nbase>
ffffffffc020136e:	8719                	srai	a4,a4,0x6
ffffffffc0201370:	9732                	add	a4,a4,a2
ffffffffc0201372:	00095697          	auipc	a3,0x95
ffffffffc0201376:	52e6b683          	ld	a3,1326(a3) # ffffffffc02968a0 <npage>
ffffffffc020137a:	06b2                	slli	a3,a3,0xc
ffffffffc020137c:	0732                	slli	a4,a4,0xc
ffffffffc020137e:	28d77763          	bgeu	a4,a3,ffffffffc020160c <default_check+0x342>
ffffffffc0201382:	40f98733          	sub	a4,s3,a5
ffffffffc0201386:	8719                	srai	a4,a4,0x6
ffffffffc0201388:	9732                	add	a4,a4,a2
ffffffffc020138a:	0732                	slli	a4,a4,0xc
ffffffffc020138c:	4cd77063          	bgeu	a4,a3,ffffffffc020184c <default_check+0x582>
ffffffffc0201390:	40f507b3          	sub	a5,a0,a5
ffffffffc0201394:	8799                	srai	a5,a5,0x6
ffffffffc0201396:	97b2                	add	a5,a5,a2
ffffffffc0201398:	07b2                	slli	a5,a5,0xc
ffffffffc020139a:	30d7f963          	bgeu	a5,a3,ffffffffc02016ac <default_check+0x3e2>
ffffffffc020139e:	4505                	li	a0,1
ffffffffc02013a0:	00043c03          	ld	s8,0(s0)
ffffffffc02013a4:	00843b83          	ld	s7,8(s0)
ffffffffc02013a8:	01042b03          	lw	s6,16(s0)
ffffffffc02013ac:	e400                	sd	s0,8(s0)
ffffffffc02013ae:	e000                	sd	s0,0(s0)
ffffffffc02013b0:	00090797          	auipc	a5,0x90
ffffffffc02013b4:	4007a423          	sw	zero,1032(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc02013b8:	5b5000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013bc:	2c051863          	bnez	a0,ffffffffc020168c <default_check+0x3c2>
ffffffffc02013c0:	4585                	li	a1,1
ffffffffc02013c2:	8556                	mv	a0,s5
ffffffffc02013c4:	5e7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013c8:	4585                	li	a1,1
ffffffffc02013ca:	854e                	mv	a0,s3
ffffffffc02013cc:	5df000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d0:	4585                	li	a1,1
ffffffffc02013d2:	8552                	mv	a0,s4
ffffffffc02013d4:	5d7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02013d8:	4818                	lw	a4,16(s0)
ffffffffc02013da:	478d                	li	a5,3
ffffffffc02013dc:	28f71863          	bne	a4,a5,ffffffffc020166c <default_check+0x3a2>
ffffffffc02013e0:	4505                	li	a0,1
ffffffffc02013e2:	58b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013e6:	89aa                	mv	s3,a0
ffffffffc02013e8:	26050263          	beqz	a0,ffffffffc020164c <default_check+0x382>
ffffffffc02013ec:	4505                	li	a0,1
ffffffffc02013ee:	57f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013f2:	8aaa                	mv	s5,a0
ffffffffc02013f4:	3a050c63          	beqz	a0,ffffffffc02017ac <default_check+0x4e2>
ffffffffc02013f8:	4505                	li	a0,1
ffffffffc02013fa:	573000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02013fe:	8a2a                	mv	s4,a0
ffffffffc0201400:	38050663          	beqz	a0,ffffffffc020178c <default_check+0x4c2>
ffffffffc0201404:	4505                	li	a0,1
ffffffffc0201406:	567000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020140a:	36051163          	bnez	a0,ffffffffc020176c <default_check+0x4a2>
ffffffffc020140e:	4585                	li	a1,1
ffffffffc0201410:	854e                	mv	a0,s3
ffffffffc0201412:	599000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201416:	641c                	ld	a5,8(s0)
ffffffffc0201418:	20878a63          	beq	a5,s0,ffffffffc020162c <default_check+0x362>
ffffffffc020141c:	4505                	li	a0,1
ffffffffc020141e:	54f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201422:	30a99563          	bne	s3,a0,ffffffffc020172c <default_check+0x462>
ffffffffc0201426:	4505                	li	a0,1
ffffffffc0201428:	545000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020142c:	2e051063          	bnez	a0,ffffffffc020170c <default_check+0x442>
ffffffffc0201430:	481c                	lw	a5,16(s0)
ffffffffc0201432:	2a079d63          	bnez	a5,ffffffffc02016ec <default_check+0x422>
ffffffffc0201436:	854e                	mv	a0,s3
ffffffffc0201438:	4585                	li	a1,1
ffffffffc020143a:	01843023          	sd	s8,0(s0)
ffffffffc020143e:	01743423          	sd	s7,8(s0)
ffffffffc0201442:	01642823          	sw	s6,16(s0)
ffffffffc0201446:	565000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020144a:	4585                	li	a1,1
ffffffffc020144c:	8556                	mv	a0,s5
ffffffffc020144e:	55d000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201452:	4585                	li	a1,1
ffffffffc0201454:	8552                	mv	a0,s4
ffffffffc0201456:	555000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020145a:	4515                	li	a0,5
ffffffffc020145c:	511000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201460:	89aa                	mv	s3,a0
ffffffffc0201462:	26050563          	beqz	a0,ffffffffc02016cc <default_check+0x402>
ffffffffc0201466:	651c                	ld	a5,8(a0)
ffffffffc0201468:	8385                	srli	a5,a5,0x1
ffffffffc020146a:	8b85                	andi	a5,a5,1
ffffffffc020146c:	54079063          	bnez	a5,ffffffffc02019ac <default_check+0x6e2>
ffffffffc0201470:	4505                	li	a0,1
ffffffffc0201472:	00043b03          	ld	s6,0(s0)
ffffffffc0201476:	00843a83          	ld	s5,8(s0)
ffffffffc020147a:	e000                	sd	s0,0(s0)
ffffffffc020147c:	e400                	sd	s0,8(s0)
ffffffffc020147e:	4ef000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201482:	50051563          	bnez	a0,ffffffffc020198c <default_check+0x6c2>
ffffffffc0201486:	08098a13          	addi	s4,s3,128
ffffffffc020148a:	8552                	mv	a0,s4
ffffffffc020148c:	458d                	li	a1,3
ffffffffc020148e:	01042b83          	lw	s7,16(s0)
ffffffffc0201492:	00090797          	auipc	a5,0x90
ffffffffc0201496:	3207a323          	sw	zero,806(a5) # ffffffffc02917b8 <free_area+0x10>
ffffffffc020149a:	511000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc020149e:	4511                	li	a0,4
ffffffffc02014a0:	4cd000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014a4:	4c051463          	bnez	a0,ffffffffc020196c <default_check+0x6a2>
ffffffffc02014a8:	0889b783          	ld	a5,136(s3)
ffffffffc02014ac:	8385                	srli	a5,a5,0x1
ffffffffc02014ae:	8b85                	andi	a5,a5,1
ffffffffc02014b0:	48078e63          	beqz	a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014b4:	0909a703          	lw	a4,144(s3)
ffffffffc02014b8:	478d                	li	a5,3
ffffffffc02014ba:	48f71963          	bne	a4,a5,ffffffffc020194c <default_check+0x682>
ffffffffc02014be:	450d                	li	a0,3
ffffffffc02014c0:	4ad000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014c4:	8c2a                	mv	s8,a0
ffffffffc02014c6:	46050363          	beqz	a0,ffffffffc020192c <default_check+0x662>
ffffffffc02014ca:	4505                	li	a0,1
ffffffffc02014cc:	4a1000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02014d0:	42051e63          	bnez	a0,ffffffffc020190c <default_check+0x642>
ffffffffc02014d4:	418a1c63          	bne	s4,s8,ffffffffc02018ec <default_check+0x622>
ffffffffc02014d8:	4585                	li	a1,1
ffffffffc02014da:	854e                	mv	a0,s3
ffffffffc02014dc:	4cf000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e0:	458d                	li	a1,3
ffffffffc02014e2:	8552                	mv	a0,s4
ffffffffc02014e4:	4c7000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02014e8:	0089b783          	ld	a5,8(s3)
ffffffffc02014ec:	04098c13          	addi	s8,s3,64
ffffffffc02014f0:	8385                	srli	a5,a5,0x1
ffffffffc02014f2:	8b85                	andi	a5,a5,1
ffffffffc02014f4:	3c078c63          	beqz	a5,ffffffffc02018cc <default_check+0x602>
ffffffffc02014f8:	0109a703          	lw	a4,16(s3)
ffffffffc02014fc:	4785                	li	a5,1
ffffffffc02014fe:	3cf71763          	bne	a4,a5,ffffffffc02018cc <default_check+0x602>
ffffffffc0201502:	008a3783          	ld	a5,8(s4)
ffffffffc0201506:	8385                	srli	a5,a5,0x1
ffffffffc0201508:	8b85                	andi	a5,a5,1
ffffffffc020150a:	3a078163          	beqz	a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc020150e:	010a2703          	lw	a4,16(s4)
ffffffffc0201512:	478d                	li	a5,3
ffffffffc0201514:	38f71c63          	bne	a4,a5,ffffffffc02018ac <default_check+0x5e2>
ffffffffc0201518:	4505                	li	a0,1
ffffffffc020151a:	453000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020151e:	36a99763          	bne	s3,a0,ffffffffc020188c <default_check+0x5c2>
ffffffffc0201522:	4585                	li	a1,1
ffffffffc0201524:	487000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201528:	4509                	li	a0,2
ffffffffc020152a:	443000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc020152e:	32aa1f63          	bne	s4,a0,ffffffffc020186c <default_check+0x5a2>
ffffffffc0201532:	4589                	li	a1,2
ffffffffc0201534:	477000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201538:	4585                	li	a1,1
ffffffffc020153a:	8562                	mv	a0,s8
ffffffffc020153c:	46f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201540:	4515                	li	a0,5
ffffffffc0201542:	42b000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201546:	89aa                	mv	s3,a0
ffffffffc0201548:	48050263          	beqz	a0,ffffffffc02019cc <default_check+0x702>
ffffffffc020154c:	4505                	li	a0,1
ffffffffc020154e:	41f000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201552:	2c051d63          	bnez	a0,ffffffffc020182c <default_check+0x562>
ffffffffc0201556:	481c                	lw	a5,16(s0)
ffffffffc0201558:	2a079a63          	bnez	a5,ffffffffc020180c <default_check+0x542>
ffffffffc020155c:	4595                	li	a1,5
ffffffffc020155e:	854e                	mv	a0,s3
ffffffffc0201560:	01742823          	sw	s7,16(s0)
ffffffffc0201564:	01643023          	sd	s6,0(s0)
ffffffffc0201568:	01543423          	sd	s5,8(s0)
ffffffffc020156c:	43f000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0201570:	641c                	ld	a5,8(s0)
ffffffffc0201572:	00878963          	beq	a5,s0,ffffffffc0201584 <default_check+0x2ba>
ffffffffc0201576:	ff87a703          	lw	a4,-8(a5)
ffffffffc020157a:	679c                	ld	a5,8(a5)
ffffffffc020157c:	397d                	addiw	s2,s2,-1
ffffffffc020157e:	9c99                	subw	s1,s1,a4
ffffffffc0201580:	fe879be3          	bne	a5,s0,ffffffffc0201576 <default_check+0x2ac>
ffffffffc0201584:	26091463          	bnez	s2,ffffffffc02017ec <default_check+0x522>
ffffffffc0201588:	46049263          	bnez	s1,ffffffffc02019ec <default_check+0x722>
ffffffffc020158c:	60a6                	ld	ra,72(sp)
ffffffffc020158e:	6406                	ld	s0,64(sp)
ffffffffc0201590:	74e2                	ld	s1,56(sp)
ffffffffc0201592:	7942                	ld	s2,48(sp)
ffffffffc0201594:	79a2                	ld	s3,40(sp)
ffffffffc0201596:	7a02                	ld	s4,32(sp)
ffffffffc0201598:	6ae2                	ld	s5,24(sp)
ffffffffc020159a:	6b42                	ld	s6,16(sp)
ffffffffc020159c:	6ba2                	ld	s7,8(sp)
ffffffffc020159e:	6c02                	ld	s8,0(sp)
ffffffffc02015a0:	6161                	addi	sp,sp,80
ffffffffc02015a2:	8082                	ret
ffffffffc02015a4:	4981                	li	s3,0
ffffffffc02015a6:	4481                	li	s1,0
ffffffffc02015a8:	4901                	li	s2,0
ffffffffc02015aa:	b38d                	j	ffffffffc020130c <default_check+0x42>
ffffffffc02015ac:	0000b697          	auipc	a3,0xb
ffffffffc02015b0:	9ac68693          	addi	a3,a3,-1620 # ffffffffc020bf58 <commands+0x950>
ffffffffc02015b4:	0000a617          	auipc	a2,0xa
ffffffffc02015b8:	26460613          	addi	a2,a2,612 # ffffffffc020b818 <commands+0x210>
ffffffffc02015bc:	0ef00593          	li	a1,239
ffffffffc02015c0:	0000b517          	auipc	a0,0xb
ffffffffc02015c4:	9a850513          	addi	a0,a0,-1624 # ffffffffc020bf68 <commands+0x960>
ffffffffc02015c8:	ed7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015cc:	0000b697          	auipc	a3,0xb
ffffffffc02015d0:	a3468693          	addi	a3,a3,-1484 # ffffffffc020c000 <commands+0x9f8>
ffffffffc02015d4:	0000a617          	auipc	a2,0xa
ffffffffc02015d8:	24460613          	addi	a2,a2,580 # ffffffffc020b818 <commands+0x210>
ffffffffc02015dc:	0bc00593          	li	a1,188
ffffffffc02015e0:	0000b517          	auipc	a0,0xb
ffffffffc02015e4:	98850513          	addi	a0,a0,-1656 # ffffffffc020bf68 <commands+0x960>
ffffffffc02015e8:	eb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02015ec:	0000b697          	auipc	a3,0xb
ffffffffc02015f0:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020c028 <commands+0xa20>
ffffffffc02015f4:	0000a617          	auipc	a2,0xa
ffffffffc02015f8:	22460613          	addi	a2,a2,548 # ffffffffc020b818 <commands+0x210>
ffffffffc02015fc:	0bd00593          	li	a1,189
ffffffffc0201600:	0000b517          	auipc	a0,0xb
ffffffffc0201604:	96850513          	addi	a0,a0,-1688 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201608:	e97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020160c:	0000b697          	auipc	a3,0xb
ffffffffc0201610:	a5c68693          	addi	a3,a3,-1444 # ffffffffc020c068 <commands+0xa60>
ffffffffc0201614:	0000a617          	auipc	a2,0xa
ffffffffc0201618:	20460613          	addi	a2,a2,516 # ffffffffc020b818 <commands+0x210>
ffffffffc020161c:	0bf00593          	li	a1,191
ffffffffc0201620:	0000b517          	auipc	a0,0xb
ffffffffc0201624:	94850513          	addi	a0,a0,-1720 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201628:	e77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020162c:	0000b697          	auipc	a3,0xb
ffffffffc0201630:	ac468693          	addi	a3,a3,-1340 # ffffffffc020c0f0 <commands+0xae8>
ffffffffc0201634:	0000a617          	auipc	a2,0xa
ffffffffc0201638:	1e460613          	addi	a2,a2,484 # ffffffffc020b818 <commands+0x210>
ffffffffc020163c:	0d800593          	li	a1,216
ffffffffc0201640:	0000b517          	auipc	a0,0xb
ffffffffc0201644:	92850513          	addi	a0,a0,-1752 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201648:	e57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020164c:	0000b697          	auipc	a3,0xb
ffffffffc0201650:	95468693          	addi	a3,a3,-1708 # ffffffffc020bfa0 <commands+0x998>
ffffffffc0201654:	0000a617          	auipc	a2,0xa
ffffffffc0201658:	1c460613          	addi	a2,a2,452 # ffffffffc020b818 <commands+0x210>
ffffffffc020165c:	0d100593          	li	a1,209
ffffffffc0201660:	0000b517          	auipc	a0,0xb
ffffffffc0201664:	90850513          	addi	a0,a0,-1784 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201668:	e37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020166c:	0000b697          	auipc	a3,0xb
ffffffffc0201670:	a7468693          	addi	a3,a3,-1420 # ffffffffc020c0e0 <commands+0xad8>
ffffffffc0201674:	0000a617          	auipc	a2,0xa
ffffffffc0201678:	1a460613          	addi	a2,a2,420 # ffffffffc020b818 <commands+0x210>
ffffffffc020167c:	0cf00593          	li	a1,207
ffffffffc0201680:	0000b517          	auipc	a0,0xb
ffffffffc0201684:	8e850513          	addi	a0,a0,-1816 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201688:	e17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020168c:	0000b697          	auipc	a3,0xb
ffffffffc0201690:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020c0c8 <commands+0xac0>
ffffffffc0201694:	0000a617          	auipc	a2,0xa
ffffffffc0201698:	18460613          	addi	a2,a2,388 # ffffffffc020b818 <commands+0x210>
ffffffffc020169c:	0ca00593          	li	a1,202
ffffffffc02016a0:	0000b517          	auipc	a0,0xb
ffffffffc02016a4:	8c850513          	addi	a0,a0,-1848 # ffffffffc020bf68 <commands+0x960>
ffffffffc02016a8:	df7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ac:	0000b697          	auipc	a3,0xb
ffffffffc02016b0:	9fc68693          	addi	a3,a3,-1540 # ffffffffc020c0a8 <commands+0xaa0>
ffffffffc02016b4:	0000a617          	auipc	a2,0xa
ffffffffc02016b8:	16460613          	addi	a2,a2,356 # ffffffffc020b818 <commands+0x210>
ffffffffc02016bc:	0c100593          	li	a1,193
ffffffffc02016c0:	0000b517          	auipc	a0,0xb
ffffffffc02016c4:	8a850513          	addi	a0,a0,-1880 # ffffffffc020bf68 <commands+0x960>
ffffffffc02016c8:	dd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016cc:	0000b697          	auipc	a3,0xb
ffffffffc02016d0:	a6c68693          	addi	a3,a3,-1428 # ffffffffc020c138 <commands+0xb30>
ffffffffc02016d4:	0000a617          	auipc	a2,0xa
ffffffffc02016d8:	14460613          	addi	a2,a2,324 # ffffffffc020b818 <commands+0x210>
ffffffffc02016dc:	0f700593          	li	a1,247
ffffffffc02016e0:	0000b517          	auipc	a0,0xb
ffffffffc02016e4:	88850513          	addi	a0,a0,-1912 # ffffffffc020bf68 <commands+0x960>
ffffffffc02016e8:	db7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02016ec:	0000b697          	auipc	a3,0xb
ffffffffc02016f0:	a3c68693          	addi	a3,a3,-1476 # ffffffffc020c128 <commands+0xb20>
ffffffffc02016f4:	0000a617          	auipc	a2,0xa
ffffffffc02016f8:	12460613          	addi	a2,a2,292 # ffffffffc020b818 <commands+0x210>
ffffffffc02016fc:	0de00593          	li	a1,222
ffffffffc0201700:	0000b517          	auipc	a0,0xb
ffffffffc0201704:	86850513          	addi	a0,a0,-1944 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201708:	d97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020170c:	0000b697          	auipc	a3,0xb
ffffffffc0201710:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020c0c8 <commands+0xac0>
ffffffffc0201714:	0000a617          	auipc	a2,0xa
ffffffffc0201718:	10460613          	addi	a2,a2,260 # ffffffffc020b818 <commands+0x210>
ffffffffc020171c:	0dc00593          	li	a1,220
ffffffffc0201720:	0000b517          	auipc	a0,0xb
ffffffffc0201724:	84850513          	addi	a0,a0,-1976 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201728:	d77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020172c:	0000b697          	auipc	a3,0xb
ffffffffc0201730:	9dc68693          	addi	a3,a3,-1572 # ffffffffc020c108 <commands+0xb00>
ffffffffc0201734:	0000a617          	auipc	a2,0xa
ffffffffc0201738:	0e460613          	addi	a2,a2,228 # ffffffffc020b818 <commands+0x210>
ffffffffc020173c:	0db00593          	li	a1,219
ffffffffc0201740:	0000b517          	auipc	a0,0xb
ffffffffc0201744:	82850513          	addi	a0,a0,-2008 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201748:	d57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020174c:	0000b697          	auipc	a3,0xb
ffffffffc0201750:	85468693          	addi	a3,a3,-1964 # ffffffffc020bfa0 <commands+0x998>
ffffffffc0201754:	0000a617          	auipc	a2,0xa
ffffffffc0201758:	0c460613          	addi	a2,a2,196 # ffffffffc020b818 <commands+0x210>
ffffffffc020175c:	0b800593          	li	a1,184
ffffffffc0201760:	0000b517          	auipc	a0,0xb
ffffffffc0201764:	80850513          	addi	a0,a0,-2040 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201768:	d37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020176c:	0000b697          	auipc	a3,0xb
ffffffffc0201770:	95c68693          	addi	a3,a3,-1700 # ffffffffc020c0c8 <commands+0xac0>
ffffffffc0201774:	0000a617          	auipc	a2,0xa
ffffffffc0201778:	0a460613          	addi	a2,a2,164 # ffffffffc020b818 <commands+0x210>
ffffffffc020177c:	0d500593          	li	a1,213
ffffffffc0201780:	0000a517          	auipc	a0,0xa
ffffffffc0201784:	7e850513          	addi	a0,a0,2024 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201788:	d17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020178c:	0000b697          	auipc	a3,0xb
ffffffffc0201790:	85468693          	addi	a3,a3,-1964 # ffffffffc020bfe0 <commands+0x9d8>
ffffffffc0201794:	0000a617          	auipc	a2,0xa
ffffffffc0201798:	08460613          	addi	a2,a2,132 # ffffffffc020b818 <commands+0x210>
ffffffffc020179c:	0d300593          	li	a1,211
ffffffffc02017a0:	0000a517          	auipc	a0,0xa
ffffffffc02017a4:	7c850513          	addi	a0,a0,1992 # ffffffffc020bf68 <commands+0x960>
ffffffffc02017a8:	cf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ac:	0000b697          	auipc	a3,0xb
ffffffffc02017b0:	81468693          	addi	a3,a3,-2028 # ffffffffc020bfc0 <commands+0x9b8>
ffffffffc02017b4:	0000a617          	auipc	a2,0xa
ffffffffc02017b8:	06460613          	addi	a2,a2,100 # ffffffffc020b818 <commands+0x210>
ffffffffc02017bc:	0d200593          	li	a1,210
ffffffffc02017c0:	0000a517          	auipc	a0,0xa
ffffffffc02017c4:	7a850513          	addi	a0,a0,1960 # ffffffffc020bf68 <commands+0x960>
ffffffffc02017c8:	cd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017cc:	0000b697          	auipc	a3,0xb
ffffffffc02017d0:	81468693          	addi	a3,a3,-2028 # ffffffffc020bfe0 <commands+0x9d8>
ffffffffc02017d4:	0000a617          	auipc	a2,0xa
ffffffffc02017d8:	04460613          	addi	a2,a2,68 # ffffffffc020b818 <commands+0x210>
ffffffffc02017dc:	0ba00593          	li	a1,186
ffffffffc02017e0:	0000a517          	auipc	a0,0xa
ffffffffc02017e4:	78850513          	addi	a0,a0,1928 # ffffffffc020bf68 <commands+0x960>
ffffffffc02017e8:	cb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02017ec:	0000b697          	auipc	a3,0xb
ffffffffc02017f0:	a9c68693          	addi	a3,a3,-1380 # ffffffffc020c288 <commands+0xc80>
ffffffffc02017f4:	0000a617          	auipc	a2,0xa
ffffffffc02017f8:	02460613          	addi	a2,a2,36 # ffffffffc020b818 <commands+0x210>
ffffffffc02017fc:	12400593          	li	a1,292
ffffffffc0201800:	0000a517          	auipc	a0,0xa
ffffffffc0201804:	76850513          	addi	a0,a0,1896 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201808:	c97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020180c:	0000b697          	auipc	a3,0xb
ffffffffc0201810:	91c68693          	addi	a3,a3,-1764 # ffffffffc020c128 <commands+0xb20>
ffffffffc0201814:	0000a617          	auipc	a2,0xa
ffffffffc0201818:	00460613          	addi	a2,a2,4 # ffffffffc020b818 <commands+0x210>
ffffffffc020181c:	11900593          	li	a1,281
ffffffffc0201820:	0000a517          	auipc	a0,0xa
ffffffffc0201824:	74850513          	addi	a0,a0,1864 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201828:	c77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020182c:	0000b697          	auipc	a3,0xb
ffffffffc0201830:	89c68693          	addi	a3,a3,-1892 # ffffffffc020c0c8 <commands+0xac0>
ffffffffc0201834:	0000a617          	auipc	a2,0xa
ffffffffc0201838:	fe460613          	addi	a2,a2,-28 # ffffffffc020b818 <commands+0x210>
ffffffffc020183c:	11700593          	li	a1,279
ffffffffc0201840:	0000a517          	auipc	a0,0xa
ffffffffc0201844:	72850513          	addi	a0,a0,1832 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201848:	c57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020184c:	0000b697          	auipc	a3,0xb
ffffffffc0201850:	83c68693          	addi	a3,a3,-1988 # ffffffffc020c088 <commands+0xa80>
ffffffffc0201854:	0000a617          	auipc	a2,0xa
ffffffffc0201858:	fc460613          	addi	a2,a2,-60 # ffffffffc020b818 <commands+0x210>
ffffffffc020185c:	0c000593          	li	a1,192
ffffffffc0201860:	0000a517          	auipc	a0,0xa
ffffffffc0201864:	70850513          	addi	a0,a0,1800 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201868:	c37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020186c:	0000b697          	auipc	a3,0xb
ffffffffc0201870:	9dc68693          	addi	a3,a3,-1572 # ffffffffc020c248 <commands+0xc40>
ffffffffc0201874:	0000a617          	auipc	a2,0xa
ffffffffc0201878:	fa460613          	addi	a2,a2,-92 # ffffffffc020b818 <commands+0x210>
ffffffffc020187c:	11100593          	li	a1,273
ffffffffc0201880:	0000a517          	auipc	a0,0xa
ffffffffc0201884:	6e850513          	addi	a0,a0,1768 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201888:	c17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020188c:	0000b697          	auipc	a3,0xb
ffffffffc0201890:	99c68693          	addi	a3,a3,-1636 # ffffffffc020c228 <commands+0xc20>
ffffffffc0201894:	0000a617          	auipc	a2,0xa
ffffffffc0201898:	f8460613          	addi	a2,a2,-124 # ffffffffc020b818 <commands+0x210>
ffffffffc020189c:	10f00593          	li	a1,271
ffffffffc02018a0:	0000a517          	auipc	a0,0xa
ffffffffc02018a4:	6c850513          	addi	a0,a0,1736 # ffffffffc020bf68 <commands+0x960>
ffffffffc02018a8:	bf7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ac:	0000b697          	auipc	a3,0xb
ffffffffc02018b0:	95468693          	addi	a3,a3,-1708 # ffffffffc020c200 <commands+0xbf8>
ffffffffc02018b4:	0000a617          	auipc	a2,0xa
ffffffffc02018b8:	f6460613          	addi	a2,a2,-156 # ffffffffc020b818 <commands+0x210>
ffffffffc02018bc:	10d00593          	li	a1,269
ffffffffc02018c0:	0000a517          	auipc	a0,0xa
ffffffffc02018c4:	6a850513          	addi	a0,a0,1704 # ffffffffc020bf68 <commands+0x960>
ffffffffc02018c8:	bd7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018cc:	0000b697          	auipc	a3,0xb
ffffffffc02018d0:	90c68693          	addi	a3,a3,-1780 # ffffffffc020c1d8 <commands+0xbd0>
ffffffffc02018d4:	0000a617          	auipc	a2,0xa
ffffffffc02018d8:	f4460613          	addi	a2,a2,-188 # ffffffffc020b818 <commands+0x210>
ffffffffc02018dc:	10c00593          	li	a1,268
ffffffffc02018e0:	0000a517          	auipc	a0,0xa
ffffffffc02018e4:	68850513          	addi	a0,a0,1672 # ffffffffc020bf68 <commands+0x960>
ffffffffc02018e8:	bb7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02018ec:	0000b697          	auipc	a3,0xb
ffffffffc02018f0:	8dc68693          	addi	a3,a3,-1828 # ffffffffc020c1c8 <commands+0xbc0>
ffffffffc02018f4:	0000a617          	auipc	a2,0xa
ffffffffc02018f8:	f2460613          	addi	a2,a2,-220 # ffffffffc020b818 <commands+0x210>
ffffffffc02018fc:	10700593          	li	a1,263
ffffffffc0201900:	0000a517          	auipc	a0,0xa
ffffffffc0201904:	66850513          	addi	a0,a0,1640 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201908:	b97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020190c:	0000a697          	auipc	a3,0xa
ffffffffc0201910:	7bc68693          	addi	a3,a3,1980 # ffffffffc020c0c8 <commands+0xac0>
ffffffffc0201914:	0000a617          	auipc	a2,0xa
ffffffffc0201918:	f0460613          	addi	a2,a2,-252 # ffffffffc020b818 <commands+0x210>
ffffffffc020191c:	10600593          	li	a1,262
ffffffffc0201920:	0000a517          	auipc	a0,0xa
ffffffffc0201924:	64850513          	addi	a0,a0,1608 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201928:	b77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020192c:	0000b697          	auipc	a3,0xb
ffffffffc0201930:	87c68693          	addi	a3,a3,-1924 # ffffffffc020c1a8 <commands+0xba0>
ffffffffc0201934:	0000a617          	auipc	a2,0xa
ffffffffc0201938:	ee460613          	addi	a2,a2,-284 # ffffffffc020b818 <commands+0x210>
ffffffffc020193c:	10500593          	li	a1,261
ffffffffc0201940:	0000a517          	auipc	a0,0xa
ffffffffc0201944:	62850513          	addi	a0,a0,1576 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201948:	b57fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020194c:	0000b697          	auipc	a3,0xb
ffffffffc0201950:	82c68693          	addi	a3,a3,-2004 # ffffffffc020c178 <commands+0xb70>
ffffffffc0201954:	0000a617          	auipc	a2,0xa
ffffffffc0201958:	ec460613          	addi	a2,a2,-316 # ffffffffc020b818 <commands+0x210>
ffffffffc020195c:	10400593          	li	a1,260
ffffffffc0201960:	0000a517          	auipc	a0,0xa
ffffffffc0201964:	60850513          	addi	a0,a0,1544 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201968:	b37fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020196c:	0000a697          	auipc	a3,0xa
ffffffffc0201970:	7f468693          	addi	a3,a3,2036 # ffffffffc020c160 <commands+0xb58>
ffffffffc0201974:	0000a617          	auipc	a2,0xa
ffffffffc0201978:	ea460613          	addi	a2,a2,-348 # ffffffffc020b818 <commands+0x210>
ffffffffc020197c:	10300593          	li	a1,259
ffffffffc0201980:	0000a517          	auipc	a0,0xa
ffffffffc0201984:	5e850513          	addi	a0,a0,1512 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201988:	b17fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020198c:	0000a697          	auipc	a3,0xa
ffffffffc0201990:	73c68693          	addi	a3,a3,1852 # ffffffffc020c0c8 <commands+0xac0>
ffffffffc0201994:	0000a617          	auipc	a2,0xa
ffffffffc0201998:	e8460613          	addi	a2,a2,-380 # ffffffffc020b818 <commands+0x210>
ffffffffc020199c:	0fd00593          	li	a1,253
ffffffffc02019a0:	0000a517          	auipc	a0,0xa
ffffffffc02019a4:	5c850513          	addi	a0,a0,1480 # ffffffffc020bf68 <commands+0x960>
ffffffffc02019a8:	af7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ac:	0000a697          	auipc	a3,0xa
ffffffffc02019b0:	79c68693          	addi	a3,a3,1948 # ffffffffc020c148 <commands+0xb40>
ffffffffc02019b4:	0000a617          	auipc	a2,0xa
ffffffffc02019b8:	e6460613          	addi	a2,a2,-412 # ffffffffc020b818 <commands+0x210>
ffffffffc02019bc:	0f800593          	li	a1,248
ffffffffc02019c0:	0000a517          	auipc	a0,0xa
ffffffffc02019c4:	5a850513          	addi	a0,a0,1448 # ffffffffc020bf68 <commands+0x960>
ffffffffc02019c8:	ad7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019cc:	0000b697          	auipc	a3,0xb
ffffffffc02019d0:	89c68693          	addi	a3,a3,-1892 # ffffffffc020c268 <commands+0xc60>
ffffffffc02019d4:	0000a617          	auipc	a2,0xa
ffffffffc02019d8:	e4460613          	addi	a2,a2,-444 # ffffffffc020b818 <commands+0x210>
ffffffffc02019dc:	11600593          	li	a1,278
ffffffffc02019e0:	0000a517          	auipc	a0,0xa
ffffffffc02019e4:	58850513          	addi	a0,a0,1416 # ffffffffc020bf68 <commands+0x960>
ffffffffc02019e8:	ab7fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02019ec:	0000b697          	auipc	a3,0xb
ffffffffc02019f0:	8ac68693          	addi	a3,a3,-1876 # ffffffffc020c298 <commands+0xc90>
ffffffffc02019f4:	0000a617          	auipc	a2,0xa
ffffffffc02019f8:	e2460613          	addi	a2,a2,-476 # ffffffffc020b818 <commands+0x210>
ffffffffc02019fc:	12500593          	li	a1,293
ffffffffc0201a00:	0000a517          	auipc	a0,0xa
ffffffffc0201a04:	56850513          	addi	a0,a0,1384 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201a08:	a97fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a0c:	0000a697          	auipc	a3,0xa
ffffffffc0201a10:	57468693          	addi	a3,a3,1396 # ffffffffc020bf80 <commands+0x978>
ffffffffc0201a14:	0000a617          	auipc	a2,0xa
ffffffffc0201a18:	e0460613          	addi	a2,a2,-508 # ffffffffc020b818 <commands+0x210>
ffffffffc0201a1c:	0f200593          	li	a1,242
ffffffffc0201a20:	0000a517          	auipc	a0,0xa
ffffffffc0201a24:	54850513          	addi	a0,a0,1352 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201a28:	a77fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201a2c:	0000a697          	auipc	a3,0xa
ffffffffc0201a30:	59468693          	addi	a3,a3,1428 # ffffffffc020bfc0 <commands+0x9b8>
ffffffffc0201a34:	0000a617          	auipc	a2,0xa
ffffffffc0201a38:	de460613          	addi	a2,a2,-540 # ffffffffc020b818 <commands+0x210>
ffffffffc0201a3c:	0b900593          	li	a1,185
ffffffffc0201a40:	0000a517          	auipc	a0,0xa
ffffffffc0201a44:	52850513          	addi	a0,a0,1320 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201a48:	a57fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201a4c <default_free_pages>:
ffffffffc0201a4c:	1141                	addi	sp,sp,-16
ffffffffc0201a4e:	e406                	sd	ra,8(sp)
ffffffffc0201a50:	14058463          	beqz	a1,ffffffffc0201b98 <default_free_pages+0x14c>
ffffffffc0201a54:	00659693          	slli	a3,a1,0x6
ffffffffc0201a58:	96aa                	add	a3,a3,a0
ffffffffc0201a5a:	87aa                	mv	a5,a0
ffffffffc0201a5c:	02d50263          	beq	a0,a3,ffffffffc0201a80 <default_free_pages+0x34>
ffffffffc0201a60:	6798                	ld	a4,8(a5)
ffffffffc0201a62:	8b05                	andi	a4,a4,1
ffffffffc0201a64:	10071a63          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a68:	6798                	ld	a4,8(a5)
ffffffffc0201a6a:	8b09                	andi	a4,a4,2
ffffffffc0201a6c:	10071663          	bnez	a4,ffffffffc0201b78 <default_free_pages+0x12c>
ffffffffc0201a70:	0007b423          	sd	zero,8(a5)
ffffffffc0201a74:	0007a023          	sw	zero,0(a5)
ffffffffc0201a78:	04078793          	addi	a5,a5,64
ffffffffc0201a7c:	fed792e3          	bne	a5,a3,ffffffffc0201a60 <default_free_pages+0x14>
ffffffffc0201a80:	2581                	sext.w	a1,a1
ffffffffc0201a82:	c90c                	sw	a1,16(a0)
ffffffffc0201a84:	00850893          	addi	a7,a0,8
ffffffffc0201a88:	4789                	li	a5,2
ffffffffc0201a8a:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0201a8e:	00090697          	auipc	a3,0x90
ffffffffc0201a92:	d1a68693          	addi	a3,a3,-742 # ffffffffc02917a8 <free_area>
ffffffffc0201a96:	4a98                	lw	a4,16(a3)
ffffffffc0201a98:	669c                	ld	a5,8(a3)
ffffffffc0201a9a:	01850613          	addi	a2,a0,24
ffffffffc0201a9e:	9db9                	addw	a1,a1,a4
ffffffffc0201aa0:	ca8c                	sw	a1,16(a3)
ffffffffc0201aa2:	0ad78463          	beq	a5,a3,ffffffffc0201b4a <default_free_pages+0xfe>
ffffffffc0201aa6:	fe878713          	addi	a4,a5,-24
ffffffffc0201aaa:	0006b803          	ld	a6,0(a3)
ffffffffc0201aae:	4581                	li	a1,0
ffffffffc0201ab0:	00e56a63          	bltu	a0,a4,ffffffffc0201ac4 <default_free_pages+0x78>
ffffffffc0201ab4:	6798                	ld	a4,8(a5)
ffffffffc0201ab6:	04d70c63          	beq	a4,a3,ffffffffc0201b0e <default_free_pages+0xc2>
ffffffffc0201aba:	87ba                	mv	a5,a4
ffffffffc0201abc:	fe878713          	addi	a4,a5,-24
ffffffffc0201ac0:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ab4 <default_free_pages+0x68>
ffffffffc0201ac4:	c199                	beqz	a1,ffffffffc0201aca <default_free_pages+0x7e>
ffffffffc0201ac6:	0106b023          	sd	a6,0(a3)
ffffffffc0201aca:	6398                	ld	a4,0(a5)
ffffffffc0201acc:	e390                	sd	a2,0(a5)
ffffffffc0201ace:	e710                	sd	a2,8(a4)
ffffffffc0201ad0:	f11c                	sd	a5,32(a0)
ffffffffc0201ad2:	ed18                	sd	a4,24(a0)
ffffffffc0201ad4:	00d70d63          	beq	a4,a3,ffffffffc0201aee <default_free_pages+0xa2>
ffffffffc0201ad8:	ff872583          	lw	a1,-8(a4)
ffffffffc0201adc:	fe870613          	addi	a2,a4,-24
ffffffffc0201ae0:	02059813          	slli	a6,a1,0x20
ffffffffc0201ae4:	01a85793          	srli	a5,a6,0x1a
ffffffffc0201ae8:	97b2                	add	a5,a5,a2
ffffffffc0201aea:	02f50c63          	beq	a0,a5,ffffffffc0201b22 <default_free_pages+0xd6>
ffffffffc0201aee:	711c                	ld	a5,32(a0)
ffffffffc0201af0:	00d78c63          	beq	a5,a3,ffffffffc0201b08 <default_free_pages+0xbc>
ffffffffc0201af4:	4910                	lw	a2,16(a0)
ffffffffc0201af6:	fe878693          	addi	a3,a5,-24
ffffffffc0201afa:	02061593          	slli	a1,a2,0x20
ffffffffc0201afe:	01a5d713          	srli	a4,a1,0x1a
ffffffffc0201b02:	972a                	add	a4,a4,a0
ffffffffc0201b04:	04e68a63          	beq	a3,a4,ffffffffc0201b58 <default_free_pages+0x10c>
ffffffffc0201b08:	60a2                	ld	ra,8(sp)
ffffffffc0201b0a:	0141                	addi	sp,sp,16
ffffffffc0201b0c:	8082                	ret
ffffffffc0201b0e:	e790                	sd	a2,8(a5)
ffffffffc0201b10:	f114                	sd	a3,32(a0)
ffffffffc0201b12:	6798                	ld	a4,8(a5)
ffffffffc0201b14:	ed1c                	sd	a5,24(a0)
ffffffffc0201b16:	02d70763          	beq	a4,a3,ffffffffc0201b44 <default_free_pages+0xf8>
ffffffffc0201b1a:	8832                	mv	a6,a2
ffffffffc0201b1c:	4585                	li	a1,1
ffffffffc0201b1e:	87ba                	mv	a5,a4
ffffffffc0201b20:	bf71                	j	ffffffffc0201abc <default_free_pages+0x70>
ffffffffc0201b22:	491c                	lw	a5,16(a0)
ffffffffc0201b24:	9dbd                	addw	a1,a1,a5
ffffffffc0201b26:	feb72c23          	sw	a1,-8(a4)
ffffffffc0201b2a:	57f5                	li	a5,-3
ffffffffc0201b2c:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0201b30:	01853803          	ld	a6,24(a0)
ffffffffc0201b34:	710c                	ld	a1,32(a0)
ffffffffc0201b36:	8532                	mv	a0,a2
ffffffffc0201b38:	00b83423          	sd	a1,8(a6)
ffffffffc0201b3c:	671c                	ld	a5,8(a4)
ffffffffc0201b3e:	0105b023          	sd	a6,0(a1)
ffffffffc0201b42:	b77d                	j	ffffffffc0201af0 <default_free_pages+0xa4>
ffffffffc0201b44:	e290                	sd	a2,0(a3)
ffffffffc0201b46:	873e                	mv	a4,a5
ffffffffc0201b48:	bf41                	j	ffffffffc0201ad8 <default_free_pages+0x8c>
ffffffffc0201b4a:	60a2                	ld	ra,8(sp)
ffffffffc0201b4c:	e390                	sd	a2,0(a5)
ffffffffc0201b4e:	e790                	sd	a2,8(a5)
ffffffffc0201b50:	f11c                	sd	a5,32(a0)
ffffffffc0201b52:	ed1c                	sd	a5,24(a0)
ffffffffc0201b54:	0141                	addi	sp,sp,16
ffffffffc0201b56:	8082                	ret
ffffffffc0201b58:	ff87a703          	lw	a4,-8(a5)
ffffffffc0201b5c:	ff078693          	addi	a3,a5,-16
ffffffffc0201b60:	9e39                	addw	a2,a2,a4
ffffffffc0201b62:	c910                	sw	a2,16(a0)
ffffffffc0201b64:	5775                	li	a4,-3
ffffffffc0201b66:	60e6b02f          	amoand.d	zero,a4,(a3)
ffffffffc0201b6a:	6398                	ld	a4,0(a5)
ffffffffc0201b6c:	679c                	ld	a5,8(a5)
ffffffffc0201b6e:	60a2                	ld	ra,8(sp)
ffffffffc0201b70:	e71c                	sd	a5,8(a4)
ffffffffc0201b72:	e398                	sd	a4,0(a5)
ffffffffc0201b74:	0141                	addi	sp,sp,16
ffffffffc0201b76:	8082                	ret
ffffffffc0201b78:	0000a697          	auipc	a3,0xa
ffffffffc0201b7c:	73868693          	addi	a3,a3,1848 # ffffffffc020c2b0 <commands+0xca8>
ffffffffc0201b80:	0000a617          	auipc	a2,0xa
ffffffffc0201b84:	c9860613          	addi	a2,a2,-872 # ffffffffc020b818 <commands+0x210>
ffffffffc0201b88:	08200593          	li	a1,130
ffffffffc0201b8c:	0000a517          	auipc	a0,0xa
ffffffffc0201b90:	3dc50513          	addi	a0,a0,988 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201b94:	90bfe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201b98:	0000a697          	auipc	a3,0xa
ffffffffc0201b9c:	71068693          	addi	a3,a3,1808 # ffffffffc020c2a8 <commands+0xca0>
ffffffffc0201ba0:	0000a617          	auipc	a2,0xa
ffffffffc0201ba4:	c7860613          	addi	a2,a2,-904 # ffffffffc020b818 <commands+0x210>
ffffffffc0201ba8:	07f00593          	li	a1,127
ffffffffc0201bac:	0000a517          	auipc	a0,0xa
ffffffffc0201bb0:	3bc50513          	addi	a0,a0,956 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201bb4:	8ebfe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201bb8 <default_alloc_pages>:
ffffffffc0201bb8:	c941                	beqz	a0,ffffffffc0201c48 <default_alloc_pages+0x90>
ffffffffc0201bba:	00090597          	auipc	a1,0x90
ffffffffc0201bbe:	bee58593          	addi	a1,a1,-1042 # ffffffffc02917a8 <free_area>
ffffffffc0201bc2:	0105a803          	lw	a6,16(a1)
ffffffffc0201bc6:	872a                	mv	a4,a0
ffffffffc0201bc8:	02081793          	slli	a5,a6,0x20
ffffffffc0201bcc:	9381                	srli	a5,a5,0x20
ffffffffc0201bce:	00a7ee63          	bltu	a5,a0,ffffffffc0201bea <default_alloc_pages+0x32>
ffffffffc0201bd2:	87ae                	mv	a5,a1
ffffffffc0201bd4:	a801                	j	ffffffffc0201be4 <default_alloc_pages+0x2c>
ffffffffc0201bd6:	ff87a683          	lw	a3,-8(a5)
ffffffffc0201bda:	02069613          	slli	a2,a3,0x20
ffffffffc0201bde:	9201                	srli	a2,a2,0x20
ffffffffc0201be0:	00e67763          	bgeu	a2,a4,ffffffffc0201bee <default_alloc_pages+0x36>
ffffffffc0201be4:	679c                	ld	a5,8(a5)
ffffffffc0201be6:	feb798e3          	bne	a5,a1,ffffffffc0201bd6 <default_alloc_pages+0x1e>
ffffffffc0201bea:	4501                	li	a0,0
ffffffffc0201bec:	8082                	ret
ffffffffc0201bee:	0007b883          	ld	a7,0(a5)
ffffffffc0201bf2:	0087b303          	ld	t1,8(a5)
ffffffffc0201bf6:	fe878513          	addi	a0,a5,-24
ffffffffc0201bfa:	00070e1b          	sext.w	t3,a4
ffffffffc0201bfe:	0068b423          	sd	t1,8(a7) # 10000008 <_binary_bin_sfs_img_size+0xff8ad08>
ffffffffc0201c02:	01133023          	sd	a7,0(t1)
ffffffffc0201c06:	02c77863          	bgeu	a4,a2,ffffffffc0201c36 <default_alloc_pages+0x7e>
ffffffffc0201c0a:	071a                	slli	a4,a4,0x6
ffffffffc0201c0c:	972a                	add	a4,a4,a0
ffffffffc0201c0e:	41c686bb          	subw	a3,a3,t3
ffffffffc0201c12:	cb14                	sw	a3,16(a4)
ffffffffc0201c14:	00870613          	addi	a2,a4,8
ffffffffc0201c18:	4689                	li	a3,2
ffffffffc0201c1a:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0201c1e:	0088b683          	ld	a3,8(a7)
ffffffffc0201c22:	01870613          	addi	a2,a4,24
ffffffffc0201c26:	0105a803          	lw	a6,16(a1)
ffffffffc0201c2a:	e290                	sd	a2,0(a3)
ffffffffc0201c2c:	00c8b423          	sd	a2,8(a7)
ffffffffc0201c30:	f314                	sd	a3,32(a4)
ffffffffc0201c32:	01173c23          	sd	a7,24(a4)
ffffffffc0201c36:	41c8083b          	subw	a6,a6,t3
ffffffffc0201c3a:	0105a823          	sw	a6,16(a1)
ffffffffc0201c3e:	5775                	li	a4,-3
ffffffffc0201c40:	17c1                	addi	a5,a5,-16
ffffffffc0201c42:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0201c46:	8082                	ret
ffffffffc0201c48:	1141                	addi	sp,sp,-16
ffffffffc0201c4a:	0000a697          	auipc	a3,0xa
ffffffffc0201c4e:	65e68693          	addi	a3,a3,1630 # ffffffffc020c2a8 <commands+0xca0>
ffffffffc0201c52:	0000a617          	auipc	a2,0xa
ffffffffc0201c56:	bc660613          	addi	a2,a2,-1082 # ffffffffc020b818 <commands+0x210>
ffffffffc0201c5a:	06100593          	li	a1,97
ffffffffc0201c5e:	0000a517          	auipc	a0,0xa
ffffffffc0201c62:	30a50513          	addi	a0,a0,778 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201c66:	e406                	sd	ra,8(sp)
ffffffffc0201c68:	837fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201c6c <default_init_memmap>:
ffffffffc0201c6c:	1141                	addi	sp,sp,-16
ffffffffc0201c6e:	e406                	sd	ra,8(sp)
ffffffffc0201c70:	c5f1                	beqz	a1,ffffffffc0201d3c <default_init_memmap+0xd0>
ffffffffc0201c72:	00659693          	slli	a3,a1,0x6
ffffffffc0201c76:	96aa                	add	a3,a3,a0
ffffffffc0201c78:	87aa                	mv	a5,a0
ffffffffc0201c7a:	00d50f63          	beq	a0,a3,ffffffffc0201c98 <default_init_memmap+0x2c>
ffffffffc0201c7e:	6798                	ld	a4,8(a5)
ffffffffc0201c80:	8b05                	andi	a4,a4,1
ffffffffc0201c82:	cf49                	beqz	a4,ffffffffc0201d1c <default_init_memmap+0xb0>
ffffffffc0201c84:	0007a823          	sw	zero,16(a5)
ffffffffc0201c88:	0007b423          	sd	zero,8(a5)
ffffffffc0201c8c:	0007a023          	sw	zero,0(a5)
ffffffffc0201c90:	04078793          	addi	a5,a5,64
ffffffffc0201c94:	fed795e3          	bne	a5,a3,ffffffffc0201c7e <default_init_memmap+0x12>
ffffffffc0201c98:	2581                	sext.w	a1,a1
ffffffffc0201c9a:	c90c                	sw	a1,16(a0)
ffffffffc0201c9c:	4789                	li	a5,2
ffffffffc0201c9e:	00850713          	addi	a4,a0,8
ffffffffc0201ca2:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0201ca6:	00090697          	auipc	a3,0x90
ffffffffc0201caa:	b0268693          	addi	a3,a3,-1278 # ffffffffc02917a8 <free_area>
ffffffffc0201cae:	4a98                	lw	a4,16(a3)
ffffffffc0201cb0:	669c                	ld	a5,8(a3)
ffffffffc0201cb2:	01850613          	addi	a2,a0,24
ffffffffc0201cb6:	9db9                	addw	a1,a1,a4
ffffffffc0201cb8:	ca8c                	sw	a1,16(a3)
ffffffffc0201cba:	04d78a63          	beq	a5,a3,ffffffffc0201d0e <default_init_memmap+0xa2>
ffffffffc0201cbe:	fe878713          	addi	a4,a5,-24
ffffffffc0201cc2:	0006b803          	ld	a6,0(a3)
ffffffffc0201cc6:	4581                	li	a1,0
ffffffffc0201cc8:	00e56a63          	bltu	a0,a4,ffffffffc0201cdc <default_init_memmap+0x70>
ffffffffc0201ccc:	6798                	ld	a4,8(a5)
ffffffffc0201cce:	02d70263          	beq	a4,a3,ffffffffc0201cf2 <default_init_memmap+0x86>
ffffffffc0201cd2:	87ba                	mv	a5,a4
ffffffffc0201cd4:	fe878713          	addi	a4,a5,-24
ffffffffc0201cd8:	fee57ae3          	bgeu	a0,a4,ffffffffc0201ccc <default_init_memmap+0x60>
ffffffffc0201cdc:	c199                	beqz	a1,ffffffffc0201ce2 <default_init_memmap+0x76>
ffffffffc0201cde:	0106b023          	sd	a6,0(a3)
ffffffffc0201ce2:	6398                	ld	a4,0(a5)
ffffffffc0201ce4:	60a2                	ld	ra,8(sp)
ffffffffc0201ce6:	e390                	sd	a2,0(a5)
ffffffffc0201ce8:	e710                	sd	a2,8(a4)
ffffffffc0201cea:	f11c                	sd	a5,32(a0)
ffffffffc0201cec:	ed18                	sd	a4,24(a0)
ffffffffc0201cee:	0141                	addi	sp,sp,16
ffffffffc0201cf0:	8082                	ret
ffffffffc0201cf2:	e790                	sd	a2,8(a5)
ffffffffc0201cf4:	f114                	sd	a3,32(a0)
ffffffffc0201cf6:	6798                	ld	a4,8(a5)
ffffffffc0201cf8:	ed1c                	sd	a5,24(a0)
ffffffffc0201cfa:	00d70663          	beq	a4,a3,ffffffffc0201d06 <default_init_memmap+0x9a>
ffffffffc0201cfe:	8832                	mv	a6,a2
ffffffffc0201d00:	4585                	li	a1,1
ffffffffc0201d02:	87ba                	mv	a5,a4
ffffffffc0201d04:	bfc1                	j	ffffffffc0201cd4 <default_init_memmap+0x68>
ffffffffc0201d06:	60a2                	ld	ra,8(sp)
ffffffffc0201d08:	e290                	sd	a2,0(a3)
ffffffffc0201d0a:	0141                	addi	sp,sp,16
ffffffffc0201d0c:	8082                	ret
ffffffffc0201d0e:	60a2                	ld	ra,8(sp)
ffffffffc0201d10:	e390                	sd	a2,0(a5)
ffffffffc0201d12:	e790                	sd	a2,8(a5)
ffffffffc0201d14:	f11c                	sd	a5,32(a0)
ffffffffc0201d16:	ed1c                	sd	a5,24(a0)
ffffffffc0201d18:	0141                	addi	sp,sp,16
ffffffffc0201d1a:	8082                	ret
ffffffffc0201d1c:	0000a697          	auipc	a3,0xa
ffffffffc0201d20:	5bc68693          	addi	a3,a3,1468 # ffffffffc020c2d8 <commands+0xcd0>
ffffffffc0201d24:	0000a617          	auipc	a2,0xa
ffffffffc0201d28:	af460613          	addi	a2,a2,-1292 # ffffffffc020b818 <commands+0x210>
ffffffffc0201d2c:	04800593          	li	a1,72
ffffffffc0201d30:	0000a517          	auipc	a0,0xa
ffffffffc0201d34:	23850513          	addi	a0,a0,568 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201d38:	f66fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0201d3c:	0000a697          	auipc	a3,0xa
ffffffffc0201d40:	56c68693          	addi	a3,a3,1388 # ffffffffc020c2a8 <commands+0xca0>
ffffffffc0201d44:	0000a617          	auipc	a2,0xa
ffffffffc0201d48:	ad460613          	addi	a2,a2,-1324 # ffffffffc020b818 <commands+0x210>
ffffffffc0201d4c:	04500593          	li	a1,69
ffffffffc0201d50:	0000a517          	auipc	a0,0xa
ffffffffc0201d54:	21850513          	addi	a0,a0,536 # ffffffffc020bf68 <commands+0x960>
ffffffffc0201d58:	f46fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201d5c <slob_free>:
ffffffffc0201d5c:	c94d                	beqz	a0,ffffffffc0201e0e <slob_free+0xb2>
ffffffffc0201d5e:	1141                	addi	sp,sp,-16
ffffffffc0201d60:	e022                	sd	s0,0(sp)
ffffffffc0201d62:	e406                	sd	ra,8(sp)
ffffffffc0201d64:	842a                	mv	s0,a0
ffffffffc0201d66:	e9c1                	bnez	a1,ffffffffc0201df6 <slob_free+0x9a>
ffffffffc0201d68:	100027f3          	csrr	a5,sstatus
ffffffffc0201d6c:	8b89                	andi	a5,a5,2
ffffffffc0201d6e:	4501                	li	a0,0
ffffffffc0201d70:	ebd9                	bnez	a5,ffffffffc0201e06 <slob_free+0xaa>
ffffffffc0201d72:	0008f617          	auipc	a2,0x8f
ffffffffc0201d76:	2de60613          	addi	a2,a2,734 # ffffffffc0291050 <slobfree>
ffffffffc0201d7a:	621c                	ld	a5,0(a2)
ffffffffc0201d7c:	873e                	mv	a4,a5
ffffffffc0201d7e:	679c                	ld	a5,8(a5)
ffffffffc0201d80:	02877a63          	bgeu	a4,s0,ffffffffc0201db4 <slob_free+0x58>
ffffffffc0201d84:	00f46463          	bltu	s0,a5,ffffffffc0201d8c <slob_free+0x30>
ffffffffc0201d88:	fef76ae3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201d8c:	400c                	lw	a1,0(s0)
ffffffffc0201d8e:	00459693          	slli	a3,a1,0x4
ffffffffc0201d92:	96a2                	add	a3,a3,s0
ffffffffc0201d94:	02d78a63          	beq	a5,a3,ffffffffc0201dc8 <slob_free+0x6c>
ffffffffc0201d98:	4314                	lw	a3,0(a4)
ffffffffc0201d9a:	e41c                	sd	a5,8(s0)
ffffffffc0201d9c:	00469793          	slli	a5,a3,0x4
ffffffffc0201da0:	97ba                	add	a5,a5,a4
ffffffffc0201da2:	02f40e63          	beq	s0,a5,ffffffffc0201dde <slob_free+0x82>
ffffffffc0201da6:	e700                	sd	s0,8(a4)
ffffffffc0201da8:	e218                	sd	a4,0(a2)
ffffffffc0201daa:	e129                	bnez	a0,ffffffffc0201dec <slob_free+0x90>
ffffffffc0201dac:	60a2                	ld	ra,8(sp)
ffffffffc0201dae:	6402                	ld	s0,0(sp)
ffffffffc0201db0:	0141                	addi	sp,sp,16
ffffffffc0201db2:	8082                	ret
ffffffffc0201db4:	fcf764e3          	bltu	a4,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201db8:	fcf472e3          	bgeu	s0,a5,ffffffffc0201d7c <slob_free+0x20>
ffffffffc0201dbc:	400c                	lw	a1,0(s0)
ffffffffc0201dbe:	00459693          	slli	a3,a1,0x4
ffffffffc0201dc2:	96a2                	add	a3,a3,s0
ffffffffc0201dc4:	fcd79ae3          	bne	a5,a3,ffffffffc0201d98 <slob_free+0x3c>
ffffffffc0201dc8:	4394                	lw	a3,0(a5)
ffffffffc0201dca:	679c                	ld	a5,8(a5)
ffffffffc0201dcc:	9db5                	addw	a1,a1,a3
ffffffffc0201dce:	c00c                	sw	a1,0(s0)
ffffffffc0201dd0:	4314                	lw	a3,0(a4)
ffffffffc0201dd2:	e41c                	sd	a5,8(s0)
ffffffffc0201dd4:	00469793          	slli	a5,a3,0x4
ffffffffc0201dd8:	97ba                	add	a5,a5,a4
ffffffffc0201dda:	fcf416e3          	bne	s0,a5,ffffffffc0201da6 <slob_free+0x4a>
ffffffffc0201dde:	401c                	lw	a5,0(s0)
ffffffffc0201de0:	640c                	ld	a1,8(s0)
ffffffffc0201de2:	e218                	sd	a4,0(a2)
ffffffffc0201de4:	9ebd                	addw	a3,a3,a5
ffffffffc0201de6:	c314                	sw	a3,0(a4)
ffffffffc0201de8:	e70c                	sd	a1,8(a4)
ffffffffc0201dea:	d169                	beqz	a0,ffffffffc0201dac <slob_free+0x50>
ffffffffc0201dec:	6402                	ld	s0,0(sp)
ffffffffc0201dee:	60a2                	ld	ra,8(sp)
ffffffffc0201df0:	0141                	addi	sp,sp,16
ffffffffc0201df2:	e7bfe06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0201df6:	25bd                	addiw	a1,a1,15
ffffffffc0201df8:	8191                	srli	a1,a1,0x4
ffffffffc0201dfa:	c10c                	sw	a1,0(a0)
ffffffffc0201dfc:	100027f3          	csrr	a5,sstatus
ffffffffc0201e00:	8b89                	andi	a5,a5,2
ffffffffc0201e02:	4501                	li	a0,0
ffffffffc0201e04:	d7bd                	beqz	a5,ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e06:	e6dfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201e0a:	4505                	li	a0,1
ffffffffc0201e0c:	b79d                	j	ffffffffc0201d72 <slob_free+0x16>
ffffffffc0201e0e:	8082                	ret

ffffffffc0201e10 <__slob_get_free_pages.constprop.0>:
ffffffffc0201e10:	4785                	li	a5,1
ffffffffc0201e12:	1141                	addi	sp,sp,-16
ffffffffc0201e14:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201e18:	e406                	sd	ra,8(sp)
ffffffffc0201e1a:	352000ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0201e1e:	c91d                	beqz	a0,ffffffffc0201e54 <__slob_get_free_pages.constprop.0+0x44>
ffffffffc0201e20:	00095697          	auipc	a3,0x95
ffffffffc0201e24:	a886b683          	ld	a3,-1400(a3) # ffffffffc02968a8 <pages>
ffffffffc0201e28:	8d15                	sub	a0,a0,a3
ffffffffc0201e2a:	8519                	srai	a0,a0,0x6
ffffffffc0201e2c:	0000d697          	auipc	a3,0xd
ffffffffc0201e30:	6d46b683          	ld	a3,1748(a3) # ffffffffc020f500 <nbase>
ffffffffc0201e34:	9536                	add	a0,a0,a3
ffffffffc0201e36:	00c51793          	slli	a5,a0,0xc
ffffffffc0201e3a:	83b1                	srli	a5,a5,0xc
ffffffffc0201e3c:	00095717          	auipc	a4,0x95
ffffffffc0201e40:	a6473703          	ld	a4,-1436(a4) # ffffffffc02968a0 <npage>
ffffffffc0201e44:	0532                	slli	a0,a0,0xc
ffffffffc0201e46:	00e7fa63          	bgeu	a5,a4,ffffffffc0201e5a <__slob_get_free_pages.constprop.0+0x4a>
ffffffffc0201e4a:	00095697          	auipc	a3,0x95
ffffffffc0201e4e:	a6e6b683          	ld	a3,-1426(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0201e52:	9536                	add	a0,a0,a3
ffffffffc0201e54:	60a2                	ld	ra,8(sp)
ffffffffc0201e56:	0141                	addi	sp,sp,16
ffffffffc0201e58:	8082                	ret
ffffffffc0201e5a:	86aa                	mv	a3,a0
ffffffffc0201e5c:	0000a617          	auipc	a2,0xa
ffffffffc0201e60:	4dc60613          	addi	a2,a2,1244 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0201e64:	07100593          	li	a1,113
ffffffffc0201e68:	0000a517          	auipc	a0,0xa
ffffffffc0201e6c:	4f850513          	addi	a0,a0,1272 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0201e70:	e2efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201e74 <slob_alloc.constprop.0>:
ffffffffc0201e74:	1101                	addi	sp,sp,-32
ffffffffc0201e76:	ec06                	sd	ra,24(sp)
ffffffffc0201e78:	e822                	sd	s0,16(sp)
ffffffffc0201e7a:	e426                	sd	s1,8(sp)
ffffffffc0201e7c:	e04a                	sd	s2,0(sp)
ffffffffc0201e7e:	01050713          	addi	a4,a0,16
ffffffffc0201e82:	6785                	lui	a5,0x1
ffffffffc0201e84:	0cf77363          	bgeu	a4,a5,ffffffffc0201f4a <slob_alloc.constprop.0+0xd6>
ffffffffc0201e88:	00f50493          	addi	s1,a0,15
ffffffffc0201e8c:	8091                	srli	s1,s1,0x4
ffffffffc0201e8e:	2481                	sext.w	s1,s1
ffffffffc0201e90:	10002673          	csrr	a2,sstatus
ffffffffc0201e94:	8a09                	andi	a2,a2,2
ffffffffc0201e96:	e25d                	bnez	a2,ffffffffc0201f3c <slob_alloc.constprop.0+0xc8>
ffffffffc0201e98:	0008f917          	auipc	s2,0x8f
ffffffffc0201e9c:	1b890913          	addi	s2,s2,440 # ffffffffc0291050 <slobfree>
ffffffffc0201ea0:	00093683          	ld	a3,0(s2)
ffffffffc0201ea4:	669c                	ld	a5,8(a3)
ffffffffc0201ea6:	4398                	lw	a4,0(a5)
ffffffffc0201ea8:	08975e63          	bge	a4,s1,ffffffffc0201f44 <slob_alloc.constprop.0+0xd0>
ffffffffc0201eac:	00f68b63          	beq	a3,a5,ffffffffc0201ec2 <slob_alloc.constprop.0+0x4e>
ffffffffc0201eb0:	6780                	ld	s0,8(a5)
ffffffffc0201eb2:	4018                	lw	a4,0(s0)
ffffffffc0201eb4:	02975a63          	bge	a4,s1,ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201eb8:	00093683          	ld	a3,0(s2)
ffffffffc0201ebc:	87a2                	mv	a5,s0
ffffffffc0201ebe:	fef699e3          	bne	a3,a5,ffffffffc0201eb0 <slob_alloc.constprop.0+0x3c>
ffffffffc0201ec2:	ee31                	bnez	a2,ffffffffc0201f1e <slob_alloc.constprop.0+0xaa>
ffffffffc0201ec4:	4501                	li	a0,0
ffffffffc0201ec6:	f4bff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201eca:	842a                	mv	s0,a0
ffffffffc0201ecc:	cd05                	beqz	a0,ffffffffc0201f04 <slob_alloc.constprop.0+0x90>
ffffffffc0201ece:	6585                	lui	a1,0x1
ffffffffc0201ed0:	e8dff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc0201ed4:	10002673          	csrr	a2,sstatus
ffffffffc0201ed8:	8a09                	andi	a2,a2,2
ffffffffc0201eda:	ee05                	bnez	a2,ffffffffc0201f12 <slob_alloc.constprop.0+0x9e>
ffffffffc0201edc:	00093783          	ld	a5,0(s2)
ffffffffc0201ee0:	6780                	ld	s0,8(a5)
ffffffffc0201ee2:	4018                	lw	a4,0(s0)
ffffffffc0201ee4:	fc974ae3          	blt	a4,s1,ffffffffc0201eb8 <slob_alloc.constprop.0+0x44>
ffffffffc0201ee8:	04e48763          	beq	s1,a4,ffffffffc0201f36 <slob_alloc.constprop.0+0xc2>
ffffffffc0201eec:	00449693          	slli	a3,s1,0x4
ffffffffc0201ef0:	96a2                	add	a3,a3,s0
ffffffffc0201ef2:	e794                	sd	a3,8(a5)
ffffffffc0201ef4:	640c                	ld	a1,8(s0)
ffffffffc0201ef6:	9f05                	subw	a4,a4,s1
ffffffffc0201ef8:	c298                	sw	a4,0(a3)
ffffffffc0201efa:	e68c                	sd	a1,8(a3)
ffffffffc0201efc:	c004                	sw	s1,0(s0)
ffffffffc0201efe:	00f93023          	sd	a5,0(s2)
ffffffffc0201f02:	e20d                	bnez	a2,ffffffffc0201f24 <slob_alloc.constprop.0+0xb0>
ffffffffc0201f04:	60e2                	ld	ra,24(sp)
ffffffffc0201f06:	8522                	mv	a0,s0
ffffffffc0201f08:	6442                	ld	s0,16(sp)
ffffffffc0201f0a:	64a2                	ld	s1,8(sp)
ffffffffc0201f0c:	6902                	ld	s2,0(sp)
ffffffffc0201f0e:	6105                	addi	sp,sp,32
ffffffffc0201f10:	8082                	ret
ffffffffc0201f12:	d61fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f16:	00093783          	ld	a5,0(s2)
ffffffffc0201f1a:	4605                	li	a2,1
ffffffffc0201f1c:	b7d1                	j	ffffffffc0201ee0 <slob_alloc.constprop.0+0x6c>
ffffffffc0201f1e:	d4ffe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f22:	b74d                	j	ffffffffc0201ec4 <slob_alloc.constprop.0+0x50>
ffffffffc0201f24:	d49fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0201f28:	60e2                	ld	ra,24(sp)
ffffffffc0201f2a:	8522                	mv	a0,s0
ffffffffc0201f2c:	6442                	ld	s0,16(sp)
ffffffffc0201f2e:	64a2                	ld	s1,8(sp)
ffffffffc0201f30:	6902                	ld	s2,0(sp)
ffffffffc0201f32:	6105                	addi	sp,sp,32
ffffffffc0201f34:	8082                	ret
ffffffffc0201f36:	6418                	ld	a4,8(s0)
ffffffffc0201f38:	e798                	sd	a4,8(a5)
ffffffffc0201f3a:	b7d1                	j	ffffffffc0201efe <slob_alloc.constprop.0+0x8a>
ffffffffc0201f3c:	d37fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0201f40:	4605                	li	a2,1
ffffffffc0201f42:	bf99                	j	ffffffffc0201e98 <slob_alloc.constprop.0+0x24>
ffffffffc0201f44:	843e                	mv	s0,a5
ffffffffc0201f46:	87b6                	mv	a5,a3
ffffffffc0201f48:	b745                	j	ffffffffc0201ee8 <slob_alloc.constprop.0+0x74>
ffffffffc0201f4a:	0000a697          	auipc	a3,0xa
ffffffffc0201f4e:	42668693          	addi	a3,a3,1062 # ffffffffc020c370 <default_pmm_manager+0x70>
ffffffffc0201f52:	0000a617          	auipc	a2,0xa
ffffffffc0201f56:	8c660613          	addi	a2,a2,-1850 # ffffffffc020b818 <commands+0x210>
ffffffffc0201f5a:	06300593          	li	a1,99
ffffffffc0201f5e:	0000a517          	auipc	a0,0xa
ffffffffc0201f62:	43250513          	addi	a0,a0,1074 # ffffffffc020c390 <default_pmm_manager+0x90>
ffffffffc0201f66:	d38fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0201f6a <kmalloc_init>:
ffffffffc0201f6a:	1141                	addi	sp,sp,-16
ffffffffc0201f6c:	0000a517          	auipc	a0,0xa
ffffffffc0201f70:	43c50513          	addi	a0,a0,1084 # ffffffffc020c3a8 <default_pmm_manager+0xa8>
ffffffffc0201f74:	e406                	sd	ra,8(sp)
ffffffffc0201f76:	a30fe0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0201f7a:	60a2                	ld	ra,8(sp)
ffffffffc0201f7c:	0000a517          	auipc	a0,0xa
ffffffffc0201f80:	44450513          	addi	a0,a0,1092 # ffffffffc020c3c0 <default_pmm_manager+0xc0>
ffffffffc0201f84:	0141                	addi	sp,sp,16
ffffffffc0201f86:	a20fe06f          	j	ffffffffc02001a6 <cprintf>

ffffffffc0201f8a <kallocated>:
ffffffffc0201f8a:	4501                	li	a0,0
ffffffffc0201f8c:	8082                	ret

ffffffffc0201f8e <kmalloc>:
ffffffffc0201f8e:	1101                	addi	sp,sp,-32
ffffffffc0201f90:	e04a                	sd	s2,0(sp)
ffffffffc0201f92:	6905                	lui	s2,0x1
ffffffffc0201f94:	e822                	sd	s0,16(sp)
ffffffffc0201f96:	ec06                	sd	ra,24(sp)
ffffffffc0201f98:	e426                	sd	s1,8(sp)
ffffffffc0201f9a:	fef90793          	addi	a5,s2,-17 # fef <_binary_bin_swap_img_size-0x6d11>
ffffffffc0201f9e:	842a                	mv	s0,a0
ffffffffc0201fa0:	04a7f963          	bgeu	a5,a0,ffffffffc0201ff2 <kmalloc+0x64>
ffffffffc0201fa4:	4561                	li	a0,24
ffffffffc0201fa6:	ecfff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201faa:	84aa                	mv	s1,a0
ffffffffc0201fac:	c929                	beqz	a0,ffffffffc0201ffe <kmalloc+0x70>
ffffffffc0201fae:	0004079b          	sext.w	a5,s0
ffffffffc0201fb2:	4501                	li	a0,0
ffffffffc0201fb4:	00f95763          	bge	s2,a5,ffffffffc0201fc2 <kmalloc+0x34>
ffffffffc0201fb8:	6705                	lui	a4,0x1
ffffffffc0201fba:	8785                	srai	a5,a5,0x1
ffffffffc0201fbc:	2505                	addiw	a0,a0,1
ffffffffc0201fbe:	fef74ee3          	blt	a4,a5,ffffffffc0201fba <kmalloc+0x2c>
ffffffffc0201fc2:	c088                	sw	a0,0(s1)
ffffffffc0201fc4:	e4dff0ef          	jal	ra,ffffffffc0201e10 <__slob_get_free_pages.constprop.0>
ffffffffc0201fc8:	e488                	sd	a0,8(s1)
ffffffffc0201fca:	842a                	mv	s0,a0
ffffffffc0201fcc:	c525                	beqz	a0,ffffffffc0202034 <kmalloc+0xa6>
ffffffffc0201fce:	100027f3          	csrr	a5,sstatus
ffffffffc0201fd2:	8b89                	andi	a5,a5,2
ffffffffc0201fd4:	ef8d                	bnez	a5,ffffffffc020200e <kmalloc+0x80>
ffffffffc0201fd6:	00095797          	auipc	a5,0x95
ffffffffc0201fda:	8b278793          	addi	a5,a5,-1870 # ffffffffc0296888 <bigblocks>
ffffffffc0201fde:	6398                	ld	a4,0(a5)
ffffffffc0201fe0:	e384                	sd	s1,0(a5)
ffffffffc0201fe2:	e898                	sd	a4,16(s1)
ffffffffc0201fe4:	60e2                	ld	ra,24(sp)
ffffffffc0201fe6:	8522                	mv	a0,s0
ffffffffc0201fe8:	6442                	ld	s0,16(sp)
ffffffffc0201fea:	64a2                	ld	s1,8(sp)
ffffffffc0201fec:	6902                	ld	s2,0(sp)
ffffffffc0201fee:	6105                	addi	sp,sp,32
ffffffffc0201ff0:	8082                	ret
ffffffffc0201ff2:	0541                	addi	a0,a0,16
ffffffffc0201ff4:	e81ff0ef          	jal	ra,ffffffffc0201e74 <slob_alloc.constprop.0>
ffffffffc0201ff8:	01050413          	addi	s0,a0,16
ffffffffc0201ffc:	f565                	bnez	a0,ffffffffc0201fe4 <kmalloc+0x56>
ffffffffc0201ffe:	4401                	li	s0,0
ffffffffc0202000:	60e2                	ld	ra,24(sp)
ffffffffc0202002:	8522                	mv	a0,s0
ffffffffc0202004:	6442                	ld	s0,16(sp)
ffffffffc0202006:	64a2                	ld	s1,8(sp)
ffffffffc0202008:	6902                	ld	s2,0(sp)
ffffffffc020200a:	6105                	addi	sp,sp,32
ffffffffc020200c:	8082                	ret
ffffffffc020200e:	c65fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202012:	00095797          	auipc	a5,0x95
ffffffffc0202016:	87678793          	addi	a5,a5,-1930 # ffffffffc0296888 <bigblocks>
ffffffffc020201a:	6398                	ld	a4,0(a5)
ffffffffc020201c:	e384                	sd	s1,0(a5)
ffffffffc020201e:	e898                	sd	a4,16(s1)
ffffffffc0202020:	c4dfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202024:	6480                	ld	s0,8(s1)
ffffffffc0202026:	60e2                	ld	ra,24(sp)
ffffffffc0202028:	64a2                	ld	s1,8(sp)
ffffffffc020202a:	8522                	mv	a0,s0
ffffffffc020202c:	6442                	ld	s0,16(sp)
ffffffffc020202e:	6902                	ld	s2,0(sp)
ffffffffc0202030:	6105                	addi	sp,sp,32
ffffffffc0202032:	8082                	ret
ffffffffc0202034:	45e1                	li	a1,24
ffffffffc0202036:	8526                	mv	a0,s1
ffffffffc0202038:	d25ff0ef          	jal	ra,ffffffffc0201d5c <slob_free>
ffffffffc020203c:	b765                	j	ffffffffc0201fe4 <kmalloc+0x56>

ffffffffc020203e <kfree>:
ffffffffc020203e:	c169                	beqz	a0,ffffffffc0202100 <kfree+0xc2>
ffffffffc0202040:	1101                	addi	sp,sp,-32
ffffffffc0202042:	e822                	sd	s0,16(sp)
ffffffffc0202044:	ec06                	sd	ra,24(sp)
ffffffffc0202046:	e426                	sd	s1,8(sp)
ffffffffc0202048:	03451793          	slli	a5,a0,0x34
ffffffffc020204c:	842a                	mv	s0,a0
ffffffffc020204e:	e3d9                	bnez	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202050:	100027f3          	csrr	a5,sstatus
ffffffffc0202054:	8b89                	andi	a5,a5,2
ffffffffc0202056:	e7d9                	bnez	a5,ffffffffc02020e4 <kfree+0xa6>
ffffffffc0202058:	00095797          	auipc	a5,0x95
ffffffffc020205c:	8307b783          	ld	a5,-2000(a5) # ffffffffc0296888 <bigblocks>
ffffffffc0202060:	4601                	li	a2,0
ffffffffc0202062:	cbad                	beqz	a5,ffffffffc02020d4 <kfree+0x96>
ffffffffc0202064:	00095697          	auipc	a3,0x95
ffffffffc0202068:	82468693          	addi	a3,a3,-2012 # ffffffffc0296888 <bigblocks>
ffffffffc020206c:	a021                	j	ffffffffc0202074 <kfree+0x36>
ffffffffc020206e:	01048693          	addi	a3,s1,16
ffffffffc0202072:	c3a5                	beqz	a5,ffffffffc02020d2 <kfree+0x94>
ffffffffc0202074:	6798                	ld	a4,8(a5)
ffffffffc0202076:	84be                	mv	s1,a5
ffffffffc0202078:	6b9c                	ld	a5,16(a5)
ffffffffc020207a:	fe871ae3          	bne	a4,s0,ffffffffc020206e <kfree+0x30>
ffffffffc020207e:	e29c                	sd	a5,0(a3)
ffffffffc0202080:	ee2d                	bnez	a2,ffffffffc02020fa <kfree+0xbc>
ffffffffc0202082:	c02007b7          	lui	a5,0xc0200
ffffffffc0202086:	4098                	lw	a4,0(s1)
ffffffffc0202088:	08f46963          	bltu	s0,a5,ffffffffc020211a <kfree+0xdc>
ffffffffc020208c:	00095697          	auipc	a3,0x95
ffffffffc0202090:	82c6b683          	ld	a3,-2004(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202094:	8c15                	sub	s0,s0,a3
ffffffffc0202096:	8031                	srli	s0,s0,0xc
ffffffffc0202098:	00095797          	auipc	a5,0x95
ffffffffc020209c:	8087b783          	ld	a5,-2040(a5) # ffffffffc02968a0 <npage>
ffffffffc02020a0:	06f47163          	bgeu	s0,a5,ffffffffc0202102 <kfree+0xc4>
ffffffffc02020a4:	0000d517          	auipc	a0,0xd
ffffffffc02020a8:	45c53503          	ld	a0,1116(a0) # ffffffffc020f500 <nbase>
ffffffffc02020ac:	8c09                	sub	s0,s0,a0
ffffffffc02020ae:	041a                	slli	s0,s0,0x6
ffffffffc02020b0:	00094517          	auipc	a0,0x94
ffffffffc02020b4:	7f853503          	ld	a0,2040(a0) # ffffffffc02968a8 <pages>
ffffffffc02020b8:	4585                	li	a1,1
ffffffffc02020ba:	9522                	add	a0,a0,s0
ffffffffc02020bc:	00e595bb          	sllw	a1,a1,a4
ffffffffc02020c0:	0ea000ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02020c4:	6442                	ld	s0,16(sp)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8526                	mv	a0,s1
ffffffffc02020ca:	64a2                	ld	s1,8(sp)
ffffffffc02020cc:	45e1                	li	a1,24
ffffffffc02020ce:	6105                	addi	sp,sp,32
ffffffffc02020d0:	b171                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020d2:	e20d                	bnez	a2,ffffffffc02020f4 <kfree+0xb6>
ffffffffc02020d4:	ff040513          	addi	a0,s0,-16
ffffffffc02020d8:	6442                	ld	s0,16(sp)
ffffffffc02020da:	60e2                	ld	ra,24(sp)
ffffffffc02020dc:	64a2                	ld	s1,8(sp)
ffffffffc02020de:	4581                	li	a1,0
ffffffffc02020e0:	6105                	addi	sp,sp,32
ffffffffc02020e2:	b9ad                	j	ffffffffc0201d5c <slob_free>
ffffffffc02020e4:	b8ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02020e8:	00094797          	auipc	a5,0x94
ffffffffc02020ec:	7a07b783          	ld	a5,1952(a5) # ffffffffc0296888 <bigblocks>
ffffffffc02020f0:	4605                	li	a2,1
ffffffffc02020f2:	fbad                	bnez	a5,ffffffffc0202064 <kfree+0x26>
ffffffffc02020f4:	b79fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020f8:	bff1                	j	ffffffffc02020d4 <kfree+0x96>
ffffffffc02020fa:	b73fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02020fe:	b751                	j	ffffffffc0202082 <kfree+0x44>
ffffffffc0202100:	8082                	ret
ffffffffc0202102:	0000a617          	auipc	a2,0xa
ffffffffc0202106:	30660613          	addi	a2,a2,774 # ffffffffc020c408 <default_pmm_manager+0x108>
ffffffffc020210a:	06900593          	li	a1,105
ffffffffc020210e:	0000a517          	auipc	a0,0xa
ffffffffc0202112:	25250513          	addi	a0,a0,594 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0202116:	b88fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020211a:	86a2                	mv	a3,s0
ffffffffc020211c:	0000a617          	auipc	a2,0xa
ffffffffc0202120:	2c460613          	addi	a2,a2,708 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0202124:	07700593          	li	a1,119
ffffffffc0202128:	0000a517          	auipc	a0,0xa
ffffffffc020212c:	23850513          	addi	a0,a0,568 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0202130:	b6efe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202134 <pa2page.part.0>:
ffffffffc0202134:	1141                	addi	sp,sp,-16
ffffffffc0202136:	0000a617          	auipc	a2,0xa
ffffffffc020213a:	2d260613          	addi	a2,a2,722 # ffffffffc020c408 <default_pmm_manager+0x108>
ffffffffc020213e:	06900593          	li	a1,105
ffffffffc0202142:	0000a517          	auipc	a0,0xa
ffffffffc0202146:	21e50513          	addi	a0,a0,542 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc020214a:	e406                	sd	ra,8(sp)
ffffffffc020214c:	b52fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202150 <pte2page.part.0>:
ffffffffc0202150:	1141                	addi	sp,sp,-16
ffffffffc0202152:	0000a617          	auipc	a2,0xa
ffffffffc0202156:	2d660613          	addi	a2,a2,726 # ffffffffc020c428 <default_pmm_manager+0x128>
ffffffffc020215a:	07f00593          	li	a1,127
ffffffffc020215e:	0000a517          	auipc	a0,0xa
ffffffffc0202162:	20250513          	addi	a0,a0,514 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0202166:	e406                	sd	ra,8(sp)
ffffffffc0202168:	b36fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020216c <alloc_pages>:
ffffffffc020216c:	100027f3          	csrr	a5,sstatus
ffffffffc0202170:	8b89                	andi	a5,a5,2
ffffffffc0202172:	e799                	bnez	a5,ffffffffc0202180 <alloc_pages+0x14>
ffffffffc0202174:	00094797          	auipc	a5,0x94
ffffffffc0202178:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020217c:	6f9c                	ld	a5,24(a5)
ffffffffc020217e:	8782                	jr	a5
ffffffffc0202180:	1141                	addi	sp,sp,-16
ffffffffc0202182:	e406                	sd	ra,8(sp)
ffffffffc0202184:	e022                	sd	s0,0(sp)
ffffffffc0202186:	842a                	mv	s0,a0
ffffffffc0202188:	aebfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020218c:	00094797          	auipc	a5,0x94
ffffffffc0202190:	7247b783          	ld	a5,1828(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202194:	6f9c                	ld	a5,24(a5)
ffffffffc0202196:	8522                	mv	a0,s0
ffffffffc0202198:	9782                	jalr	a5
ffffffffc020219a:	842a                	mv	s0,a0
ffffffffc020219c:	ad1fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02021a0:	60a2                	ld	ra,8(sp)
ffffffffc02021a2:	8522                	mv	a0,s0
ffffffffc02021a4:	6402                	ld	s0,0(sp)
ffffffffc02021a6:	0141                	addi	sp,sp,16
ffffffffc02021a8:	8082                	ret

ffffffffc02021aa <free_pages>:
ffffffffc02021aa:	100027f3          	csrr	a5,sstatus
ffffffffc02021ae:	8b89                	andi	a5,a5,2
ffffffffc02021b0:	e799                	bnez	a5,ffffffffc02021be <free_pages+0x14>
ffffffffc02021b2:	00094797          	auipc	a5,0x94
ffffffffc02021b6:	6fe7b783          	ld	a5,1790(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021ba:	739c                	ld	a5,32(a5)
ffffffffc02021bc:	8782                	jr	a5
ffffffffc02021be:	1101                	addi	sp,sp,-32
ffffffffc02021c0:	ec06                	sd	ra,24(sp)
ffffffffc02021c2:	e822                	sd	s0,16(sp)
ffffffffc02021c4:	e426                	sd	s1,8(sp)
ffffffffc02021c6:	842a                	mv	s0,a0
ffffffffc02021c8:	84ae                	mv	s1,a1
ffffffffc02021ca:	aa9fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02021ce:	00094797          	auipc	a5,0x94
ffffffffc02021d2:	6e27b783          	ld	a5,1762(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021d6:	739c                	ld	a5,32(a5)
ffffffffc02021d8:	85a6                	mv	a1,s1
ffffffffc02021da:	8522                	mv	a0,s0
ffffffffc02021dc:	9782                	jalr	a5
ffffffffc02021de:	6442                	ld	s0,16(sp)
ffffffffc02021e0:	60e2                	ld	ra,24(sp)
ffffffffc02021e2:	64a2                	ld	s1,8(sp)
ffffffffc02021e4:	6105                	addi	sp,sp,32
ffffffffc02021e6:	a87fe06f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02021ea <nr_free_pages>:
ffffffffc02021ea:	100027f3          	csrr	a5,sstatus
ffffffffc02021ee:	8b89                	andi	a5,a5,2
ffffffffc02021f0:	e799                	bnez	a5,ffffffffc02021fe <nr_free_pages+0x14>
ffffffffc02021f2:	00094797          	auipc	a5,0x94
ffffffffc02021f6:	6be7b783          	ld	a5,1726(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02021fa:	779c                	ld	a5,40(a5)
ffffffffc02021fc:	8782                	jr	a5
ffffffffc02021fe:	1141                	addi	sp,sp,-16
ffffffffc0202200:	e406                	sd	ra,8(sp)
ffffffffc0202202:	e022                	sd	s0,0(sp)
ffffffffc0202204:	a6ffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202208:	00094797          	auipc	a5,0x94
ffffffffc020220c:	6a87b783          	ld	a5,1704(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202210:	779c                	ld	a5,40(a5)
ffffffffc0202212:	9782                	jalr	a5
ffffffffc0202214:	842a                	mv	s0,a0
ffffffffc0202216:	a57fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020221a:	60a2                	ld	ra,8(sp)
ffffffffc020221c:	8522                	mv	a0,s0
ffffffffc020221e:	6402                	ld	s0,0(sp)
ffffffffc0202220:	0141                	addi	sp,sp,16
ffffffffc0202222:	8082                	ret

ffffffffc0202224 <get_pte>:
ffffffffc0202224:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0202228:	1ff7f793          	andi	a5,a5,511
ffffffffc020222c:	7139                	addi	sp,sp,-64
ffffffffc020222e:	078e                	slli	a5,a5,0x3
ffffffffc0202230:	f426                	sd	s1,40(sp)
ffffffffc0202232:	00f504b3          	add	s1,a0,a5
ffffffffc0202236:	6094                	ld	a3,0(s1)
ffffffffc0202238:	f04a                	sd	s2,32(sp)
ffffffffc020223a:	ec4e                	sd	s3,24(sp)
ffffffffc020223c:	e852                	sd	s4,16(sp)
ffffffffc020223e:	fc06                	sd	ra,56(sp)
ffffffffc0202240:	f822                	sd	s0,48(sp)
ffffffffc0202242:	e456                	sd	s5,8(sp)
ffffffffc0202244:	e05a                	sd	s6,0(sp)
ffffffffc0202246:	0016f793          	andi	a5,a3,1
ffffffffc020224a:	892e                	mv	s2,a1
ffffffffc020224c:	8a32                	mv	s4,a2
ffffffffc020224e:	00094997          	auipc	s3,0x94
ffffffffc0202252:	65298993          	addi	s3,s3,1618 # ffffffffc02968a0 <npage>
ffffffffc0202256:	efbd                	bnez	a5,ffffffffc02022d4 <get_pte+0xb0>
ffffffffc0202258:	14060c63          	beqz	a2,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020225c:	100027f3          	csrr	a5,sstatus
ffffffffc0202260:	8b89                	andi	a5,a5,2
ffffffffc0202262:	14079963          	bnez	a5,ffffffffc02023b4 <get_pte+0x190>
ffffffffc0202266:	00094797          	auipc	a5,0x94
ffffffffc020226a:	64a7b783          	ld	a5,1610(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020226e:	6f9c                	ld	a5,24(a5)
ffffffffc0202270:	4505                	li	a0,1
ffffffffc0202272:	9782                	jalr	a5
ffffffffc0202274:	842a                	mv	s0,a0
ffffffffc0202276:	12040d63          	beqz	s0,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020227a:	00094b17          	auipc	s6,0x94
ffffffffc020227e:	62eb0b13          	addi	s6,s6,1582 # ffffffffc02968a8 <pages>
ffffffffc0202282:	000b3503          	ld	a0,0(s6)
ffffffffc0202286:	00080ab7          	lui	s5,0x80
ffffffffc020228a:	00094997          	auipc	s3,0x94
ffffffffc020228e:	61698993          	addi	s3,s3,1558 # ffffffffc02968a0 <npage>
ffffffffc0202292:	40a40533          	sub	a0,s0,a0
ffffffffc0202296:	8519                	srai	a0,a0,0x6
ffffffffc0202298:	9556                	add	a0,a0,s5
ffffffffc020229a:	0009b703          	ld	a4,0(s3)
ffffffffc020229e:	00c51793          	slli	a5,a0,0xc
ffffffffc02022a2:	4685                	li	a3,1
ffffffffc02022a4:	c014                	sw	a3,0(s0)
ffffffffc02022a6:	83b1                	srli	a5,a5,0xc
ffffffffc02022a8:	0532                	slli	a0,a0,0xc
ffffffffc02022aa:	16e7f763          	bgeu	a5,a4,ffffffffc0202418 <get_pte+0x1f4>
ffffffffc02022ae:	00094797          	auipc	a5,0x94
ffffffffc02022b2:	60a7b783          	ld	a5,1546(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022b6:	6605                	lui	a2,0x1
ffffffffc02022b8:	4581                	li	a1,0
ffffffffc02022ba:	953e                	add	a0,a0,a5
ffffffffc02022bc:	07a090ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc02022c0:	000b3683          	ld	a3,0(s6)
ffffffffc02022c4:	40d406b3          	sub	a3,s0,a3
ffffffffc02022c8:	8699                	srai	a3,a3,0x6
ffffffffc02022ca:	96d6                	add	a3,a3,s5
ffffffffc02022cc:	06aa                	slli	a3,a3,0xa
ffffffffc02022ce:	0116e693          	ori	a3,a3,17
ffffffffc02022d2:	e094                	sd	a3,0(s1)
ffffffffc02022d4:	77fd                	lui	a5,0xfffff
ffffffffc02022d6:	068a                	slli	a3,a3,0x2
ffffffffc02022d8:	0009b703          	ld	a4,0(s3)
ffffffffc02022dc:	8efd                	and	a3,a3,a5
ffffffffc02022de:	00c6d793          	srli	a5,a3,0xc
ffffffffc02022e2:	10e7ff63          	bgeu	a5,a4,ffffffffc0202400 <get_pte+0x1dc>
ffffffffc02022e6:	00094a97          	auipc	s5,0x94
ffffffffc02022ea:	5d2a8a93          	addi	s5,s5,1490 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02022ee:	000ab403          	ld	s0,0(s5)
ffffffffc02022f2:	01595793          	srli	a5,s2,0x15
ffffffffc02022f6:	1ff7f793          	andi	a5,a5,511
ffffffffc02022fa:	96a2                	add	a3,a3,s0
ffffffffc02022fc:	00379413          	slli	s0,a5,0x3
ffffffffc0202300:	9436                	add	s0,s0,a3
ffffffffc0202302:	6014                	ld	a3,0(s0)
ffffffffc0202304:	0016f793          	andi	a5,a3,1
ffffffffc0202308:	ebad                	bnez	a5,ffffffffc020237a <get_pte+0x156>
ffffffffc020230a:	0a0a0363          	beqz	s4,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc020230e:	100027f3          	csrr	a5,sstatus
ffffffffc0202312:	8b89                	andi	a5,a5,2
ffffffffc0202314:	efcd                	bnez	a5,ffffffffc02023ce <get_pte+0x1aa>
ffffffffc0202316:	00094797          	auipc	a5,0x94
ffffffffc020231a:	59a7b783          	ld	a5,1434(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc020231e:	6f9c                	ld	a5,24(a5)
ffffffffc0202320:	4505                	li	a0,1
ffffffffc0202322:	9782                	jalr	a5
ffffffffc0202324:	84aa                	mv	s1,a0
ffffffffc0202326:	c4c9                	beqz	s1,ffffffffc02023b0 <get_pte+0x18c>
ffffffffc0202328:	00094b17          	auipc	s6,0x94
ffffffffc020232c:	580b0b13          	addi	s6,s6,1408 # ffffffffc02968a8 <pages>
ffffffffc0202330:	000b3503          	ld	a0,0(s6)
ffffffffc0202334:	00080a37          	lui	s4,0x80
ffffffffc0202338:	0009b703          	ld	a4,0(s3)
ffffffffc020233c:	40a48533          	sub	a0,s1,a0
ffffffffc0202340:	8519                	srai	a0,a0,0x6
ffffffffc0202342:	9552                	add	a0,a0,s4
ffffffffc0202344:	00c51793          	slli	a5,a0,0xc
ffffffffc0202348:	4685                	li	a3,1
ffffffffc020234a:	c094                	sw	a3,0(s1)
ffffffffc020234c:	83b1                	srli	a5,a5,0xc
ffffffffc020234e:	0532                	slli	a0,a0,0xc
ffffffffc0202350:	0ee7f163          	bgeu	a5,a4,ffffffffc0202432 <get_pte+0x20e>
ffffffffc0202354:	000ab783          	ld	a5,0(s5)
ffffffffc0202358:	6605                	lui	a2,0x1
ffffffffc020235a:	4581                	li	a1,0
ffffffffc020235c:	953e                	add	a0,a0,a5
ffffffffc020235e:	7d9080ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0202362:	000b3683          	ld	a3,0(s6)
ffffffffc0202366:	40d486b3          	sub	a3,s1,a3
ffffffffc020236a:	8699                	srai	a3,a3,0x6
ffffffffc020236c:	96d2                	add	a3,a3,s4
ffffffffc020236e:	06aa                	slli	a3,a3,0xa
ffffffffc0202370:	0116e693          	ori	a3,a3,17
ffffffffc0202374:	e014                	sd	a3,0(s0)
ffffffffc0202376:	0009b703          	ld	a4,0(s3)
ffffffffc020237a:	068a                	slli	a3,a3,0x2
ffffffffc020237c:	757d                	lui	a0,0xfffff
ffffffffc020237e:	8ee9                	and	a3,a3,a0
ffffffffc0202380:	00c6d793          	srli	a5,a3,0xc
ffffffffc0202384:	06e7f263          	bgeu	a5,a4,ffffffffc02023e8 <get_pte+0x1c4>
ffffffffc0202388:	000ab503          	ld	a0,0(s5)
ffffffffc020238c:	00c95913          	srli	s2,s2,0xc
ffffffffc0202390:	1ff97913          	andi	s2,s2,511
ffffffffc0202394:	96aa                	add	a3,a3,a0
ffffffffc0202396:	00391513          	slli	a0,s2,0x3
ffffffffc020239a:	9536                	add	a0,a0,a3
ffffffffc020239c:	70e2                	ld	ra,56(sp)
ffffffffc020239e:	7442                	ld	s0,48(sp)
ffffffffc02023a0:	74a2                	ld	s1,40(sp)
ffffffffc02023a2:	7902                	ld	s2,32(sp)
ffffffffc02023a4:	69e2                	ld	s3,24(sp)
ffffffffc02023a6:	6a42                	ld	s4,16(sp)
ffffffffc02023a8:	6aa2                	ld	s5,8(sp)
ffffffffc02023aa:	6b02                	ld	s6,0(sp)
ffffffffc02023ac:	6121                	addi	sp,sp,64
ffffffffc02023ae:	8082                	ret
ffffffffc02023b0:	4501                	li	a0,0
ffffffffc02023b2:	b7ed                	j	ffffffffc020239c <get_pte+0x178>
ffffffffc02023b4:	8bffe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023b8:	00094797          	auipc	a5,0x94
ffffffffc02023bc:	4f87b783          	ld	a5,1272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023c0:	6f9c                	ld	a5,24(a5)
ffffffffc02023c2:	4505                	li	a0,1
ffffffffc02023c4:	9782                	jalr	a5
ffffffffc02023c6:	842a                	mv	s0,a0
ffffffffc02023c8:	8a5fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023cc:	b56d                	j	ffffffffc0202276 <get_pte+0x52>
ffffffffc02023ce:	8a5fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02023d2:	00094797          	auipc	a5,0x94
ffffffffc02023d6:	4de7b783          	ld	a5,1246(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02023da:	6f9c                	ld	a5,24(a5)
ffffffffc02023dc:	4505                	li	a0,1
ffffffffc02023de:	9782                	jalr	a5
ffffffffc02023e0:	84aa                	mv	s1,a0
ffffffffc02023e2:	88bfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02023e6:	b781                	j	ffffffffc0202326 <get_pte+0x102>
ffffffffc02023e8:	0000a617          	auipc	a2,0xa
ffffffffc02023ec:	f5060613          	addi	a2,a2,-176 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc02023f0:	13200593          	li	a1,306
ffffffffc02023f4:	0000a517          	auipc	a0,0xa
ffffffffc02023f8:	05c50513          	addi	a0,a0,92 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02023fc:	8a2fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202400:	0000a617          	auipc	a2,0xa
ffffffffc0202404:	f3860613          	addi	a2,a2,-200 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0202408:	12500593          	li	a1,293
ffffffffc020240c:	0000a517          	auipc	a0,0xa
ffffffffc0202410:	04450513          	addi	a0,a0,68 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0202414:	88afe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202418:	86aa                	mv	a3,a0
ffffffffc020241a:	0000a617          	auipc	a2,0xa
ffffffffc020241e:	f1e60613          	addi	a2,a2,-226 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0202422:	12100593          	li	a1,289
ffffffffc0202426:	0000a517          	auipc	a0,0xa
ffffffffc020242a:	02a50513          	addi	a0,a0,42 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020242e:	870fe0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202432:	86aa                	mv	a3,a0
ffffffffc0202434:	0000a617          	auipc	a2,0xa
ffffffffc0202438:	f0460613          	addi	a2,a2,-252 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc020243c:	12f00593          	li	a1,303
ffffffffc0202440:	0000a517          	auipc	a0,0xa
ffffffffc0202444:	01050513          	addi	a0,a0,16 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0202448:	856fe0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020244c <boot_map_segment>:
ffffffffc020244c:	6785                	lui	a5,0x1
ffffffffc020244e:	7139                	addi	sp,sp,-64
ffffffffc0202450:	00d5c833          	xor	a6,a1,a3
ffffffffc0202454:	17fd                	addi	a5,a5,-1
ffffffffc0202456:	fc06                	sd	ra,56(sp)
ffffffffc0202458:	f822                	sd	s0,48(sp)
ffffffffc020245a:	f426                	sd	s1,40(sp)
ffffffffc020245c:	f04a                	sd	s2,32(sp)
ffffffffc020245e:	ec4e                	sd	s3,24(sp)
ffffffffc0202460:	e852                	sd	s4,16(sp)
ffffffffc0202462:	e456                	sd	s5,8(sp)
ffffffffc0202464:	00f87833          	and	a6,a6,a5
ffffffffc0202468:	08081563          	bnez	a6,ffffffffc02024f2 <boot_map_segment+0xa6>
ffffffffc020246c:	00f5f4b3          	and	s1,a1,a5
ffffffffc0202470:	963e                	add	a2,a2,a5
ffffffffc0202472:	94b2                	add	s1,s1,a2
ffffffffc0202474:	797d                	lui	s2,0xfffff
ffffffffc0202476:	80b1                	srli	s1,s1,0xc
ffffffffc0202478:	0125f5b3          	and	a1,a1,s2
ffffffffc020247c:	0126f6b3          	and	a3,a3,s2
ffffffffc0202480:	c0a1                	beqz	s1,ffffffffc02024c0 <boot_map_segment+0x74>
ffffffffc0202482:	00176713          	ori	a4,a4,1
ffffffffc0202486:	04b2                	slli	s1,s1,0xc
ffffffffc0202488:	02071993          	slli	s3,a4,0x20
ffffffffc020248c:	8a2a                	mv	s4,a0
ffffffffc020248e:	842e                	mv	s0,a1
ffffffffc0202490:	94ae                	add	s1,s1,a1
ffffffffc0202492:	40b68933          	sub	s2,a3,a1
ffffffffc0202496:	0209d993          	srli	s3,s3,0x20
ffffffffc020249a:	6a85                	lui	s5,0x1
ffffffffc020249c:	4605                	li	a2,1
ffffffffc020249e:	85a2                	mv	a1,s0
ffffffffc02024a0:	8552                	mv	a0,s4
ffffffffc02024a2:	d83ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02024a6:	008907b3          	add	a5,s2,s0
ffffffffc02024aa:	c505                	beqz	a0,ffffffffc02024d2 <boot_map_segment+0x86>
ffffffffc02024ac:	83b1                	srli	a5,a5,0xc
ffffffffc02024ae:	07aa                	slli	a5,a5,0xa
ffffffffc02024b0:	0137e7b3          	or	a5,a5,s3
ffffffffc02024b4:	0017e793          	ori	a5,a5,1
ffffffffc02024b8:	e11c                	sd	a5,0(a0)
ffffffffc02024ba:	9456                	add	s0,s0,s5
ffffffffc02024bc:	fe8490e3          	bne	s1,s0,ffffffffc020249c <boot_map_segment+0x50>
ffffffffc02024c0:	70e2                	ld	ra,56(sp)
ffffffffc02024c2:	7442                	ld	s0,48(sp)
ffffffffc02024c4:	74a2                	ld	s1,40(sp)
ffffffffc02024c6:	7902                	ld	s2,32(sp)
ffffffffc02024c8:	69e2                	ld	s3,24(sp)
ffffffffc02024ca:	6a42                	ld	s4,16(sp)
ffffffffc02024cc:	6aa2                	ld	s5,8(sp)
ffffffffc02024ce:	6121                	addi	sp,sp,64
ffffffffc02024d0:	8082                	ret
ffffffffc02024d2:	0000a697          	auipc	a3,0xa
ffffffffc02024d6:	fa668693          	addi	a3,a3,-90 # ffffffffc020c478 <default_pmm_manager+0x178>
ffffffffc02024da:	00009617          	auipc	a2,0x9
ffffffffc02024de:	33e60613          	addi	a2,a2,830 # ffffffffc020b818 <commands+0x210>
ffffffffc02024e2:	09c00593          	li	a1,156
ffffffffc02024e6:	0000a517          	auipc	a0,0xa
ffffffffc02024ea:	f6a50513          	addi	a0,a0,-150 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02024ee:	fb1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02024f2:	0000a697          	auipc	a3,0xa
ffffffffc02024f6:	f6e68693          	addi	a3,a3,-146 # ffffffffc020c460 <default_pmm_manager+0x160>
ffffffffc02024fa:	00009617          	auipc	a2,0x9
ffffffffc02024fe:	31e60613          	addi	a2,a2,798 # ffffffffc020b818 <commands+0x210>
ffffffffc0202502:	09500593          	li	a1,149
ffffffffc0202506:	0000a517          	auipc	a0,0xa
ffffffffc020250a:	f4a50513          	addi	a0,a0,-182 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020250e:	f91fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0202512 <get_page>:
ffffffffc0202512:	1141                	addi	sp,sp,-16
ffffffffc0202514:	e022                	sd	s0,0(sp)
ffffffffc0202516:	8432                	mv	s0,a2
ffffffffc0202518:	4601                	li	a2,0
ffffffffc020251a:	e406                	sd	ra,8(sp)
ffffffffc020251c:	d09ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202520:	c011                	beqz	s0,ffffffffc0202524 <get_page+0x12>
ffffffffc0202522:	e008                	sd	a0,0(s0)
ffffffffc0202524:	c511                	beqz	a0,ffffffffc0202530 <get_page+0x1e>
ffffffffc0202526:	611c                	ld	a5,0(a0)
ffffffffc0202528:	4501                	li	a0,0
ffffffffc020252a:	0017f713          	andi	a4,a5,1
ffffffffc020252e:	e709                	bnez	a4,ffffffffc0202538 <get_page+0x26>
ffffffffc0202530:	60a2                	ld	ra,8(sp)
ffffffffc0202532:	6402                	ld	s0,0(sp)
ffffffffc0202534:	0141                	addi	sp,sp,16
ffffffffc0202536:	8082                	ret
ffffffffc0202538:	078a                	slli	a5,a5,0x2
ffffffffc020253a:	83b1                	srli	a5,a5,0xc
ffffffffc020253c:	00094717          	auipc	a4,0x94
ffffffffc0202540:	36473703          	ld	a4,868(a4) # ffffffffc02968a0 <npage>
ffffffffc0202544:	00e7ff63          	bgeu	a5,a4,ffffffffc0202562 <get_page+0x50>
ffffffffc0202548:	60a2                	ld	ra,8(sp)
ffffffffc020254a:	6402                	ld	s0,0(sp)
ffffffffc020254c:	fff80537          	lui	a0,0xfff80
ffffffffc0202550:	97aa                	add	a5,a5,a0
ffffffffc0202552:	079a                	slli	a5,a5,0x6
ffffffffc0202554:	00094517          	auipc	a0,0x94
ffffffffc0202558:	35453503          	ld	a0,852(a0) # ffffffffc02968a8 <pages>
ffffffffc020255c:	953e                	add	a0,a0,a5
ffffffffc020255e:	0141                	addi	sp,sp,16
ffffffffc0202560:	8082                	ret
ffffffffc0202562:	bd3ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202566 <unmap_range>:
ffffffffc0202566:	7159                	addi	sp,sp,-112
ffffffffc0202568:	00c5e7b3          	or	a5,a1,a2
ffffffffc020256c:	f486                	sd	ra,104(sp)
ffffffffc020256e:	f0a2                	sd	s0,96(sp)
ffffffffc0202570:	eca6                	sd	s1,88(sp)
ffffffffc0202572:	e8ca                	sd	s2,80(sp)
ffffffffc0202574:	e4ce                	sd	s3,72(sp)
ffffffffc0202576:	e0d2                	sd	s4,64(sp)
ffffffffc0202578:	fc56                	sd	s5,56(sp)
ffffffffc020257a:	f85a                	sd	s6,48(sp)
ffffffffc020257c:	f45e                	sd	s7,40(sp)
ffffffffc020257e:	f062                	sd	s8,32(sp)
ffffffffc0202580:	ec66                	sd	s9,24(sp)
ffffffffc0202582:	e86a                	sd	s10,16(sp)
ffffffffc0202584:	17d2                	slli	a5,a5,0x34
ffffffffc0202586:	e3ed                	bnez	a5,ffffffffc0202668 <unmap_range+0x102>
ffffffffc0202588:	002007b7          	lui	a5,0x200
ffffffffc020258c:	842e                	mv	s0,a1
ffffffffc020258e:	0ef5ed63          	bltu	a1,a5,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202592:	8932                	mv	s2,a2
ffffffffc0202594:	0ec5fa63          	bgeu	a1,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc0202598:	4785                	li	a5,1
ffffffffc020259a:	07fe                	slli	a5,a5,0x1f
ffffffffc020259c:	0ec7e663          	bltu	a5,a2,ffffffffc0202688 <unmap_range+0x122>
ffffffffc02025a0:	89aa                	mv	s3,a0
ffffffffc02025a2:	6a05                	lui	s4,0x1
ffffffffc02025a4:	00094c97          	auipc	s9,0x94
ffffffffc02025a8:	2fcc8c93          	addi	s9,s9,764 # ffffffffc02968a0 <npage>
ffffffffc02025ac:	00094c17          	auipc	s8,0x94
ffffffffc02025b0:	2fcc0c13          	addi	s8,s8,764 # ffffffffc02968a8 <pages>
ffffffffc02025b4:	fff80bb7          	lui	s7,0xfff80
ffffffffc02025b8:	00094d17          	auipc	s10,0x94
ffffffffc02025bc:	2f8d0d13          	addi	s10,s10,760 # ffffffffc02968b0 <pmm_manager>
ffffffffc02025c0:	00200b37          	lui	s6,0x200
ffffffffc02025c4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02025c8:	4601                	li	a2,0
ffffffffc02025ca:	85a2                	mv	a1,s0
ffffffffc02025cc:	854e                	mv	a0,s3
ffffffffc02025ce:	c57ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02025d2:	84aa                	mv	s1,a0
ffffffffc02025d4:	cd29                	beqz	a0,ffffffffc020262e <unmap_range+0xc8>
ffffffffc02025d6:	611c                	ld	a5,0(a0)
ffffffffc02025d8:	e395                	bnez	a5,ffffffffc02025fc <unmap_range+0x96>
ffffffffc02025da:	9452                	add	s0,s0,s4
ffffffffc02025dc:	ff2466e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc02025e0:	70a6                	ld	ra,104(sp)
ffffffffc02025e2:	7406                	ld	s0,96(sp)
ffffffffc02025e4:	64e6                	ld	s1,88(sp)
ffffffffc02025e6:	6946                	ld	s2,80(sp)
ffffffffc02025e8:	69a6                	ld	s3,72(sp)
ffffffffc02025ea:	6a06                	ld	s4,64(sp)
ffffffffc02025ec:	7ae2                	ld	s5,56(sp)
ffffffffc02025ee:	7b42                	ld	s6,48(sp)
ffffffffc02025f0:	7ba2                	ld	s7,40(sp)
ffffffffc02025f2:	7c02                	ld	s8,32(sp)
ffffffffc02025f4:	6ce2                	ld	s9,24(sp)
ffffffffc02025f6:	6d42                	ld	s10,16(sp)
ffffffffc02025f8:	6165                	addi	sp,sp,112
ffffffffc02025fa:	8082                	ret
ffffffffc02025fc:	0017f713          	andi	a4,a5,1
ffffffffc0202600:	df69                	beqz	a4,ffffffffc02025da <unmap_range+0x74>
ffffffffc0202602:	000cb703          	ld	a4,0(s9)
ffffffffc0202606:	078a                	slli	a5,a5,0x2
ffffffffc0202608:	83b1                	srli	a5,a5,0xc
ffffffffc020260a:	08e7ff63          	bgeu	a5,a4,ffffffffc02026a8 <unmap_range+0x142>
ffffffffc020260e:	000c3503          	ld	a0,0(s8)
ffffffffc0202612:	97de                	add	a5,a5,s7
ffffffffc0202614:	079a                	slli	a5,a5,0x6
ffffffffc0202616:	953e                	add	a0,a0,a5
ffffffffc0202618:	411c                	lw	a5,0(a0)
ffffffffc020261a:	fff7871b          	addiw	a4,a5,-1
ffffffffc020261e:	c118                	sw	a4,0(a0)
ffffffffc0202620:	cf11                	beqz	a4,ffffffffc020263c <unmap_range+0xd6>
ffffffffc0202622:	0004b023          	sd	zero,0(s1)
ffffffffc0202626:	12040073          	sfence.vma	s0
ffffffffc020262a:	9452                	add	s0,s0,s4
ffffffffc020262c:	bf45                	j	ffffffffc02025dc <unmap_range+0x76>
ffffffffc020262e:	945a                	add	s0,s0,s6
ffffffffc0202630:	01547433          	and	s0,s0,s5
ffffffffc0202634:	d455                	beqz	s0,ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc0202636:	f92469e3          	bltu	s0,s2,ffffffffc02025c8 <unmap_range+0x62>
ffffffffc020263a:	b75d                	j	ffffffffc02025e0 <unmap_range+0x7a>
ffffffffc020263c:	100027f3          	csrr	a5,sstatus
ffffffffc0202640:	8b89                	andi	a5,a5,2
ffffffffc0202642:	e799                	bnez	a5,ffffffffc0202650 <unmap_range+0xea>
ffffffffc0202644:	000d3783          	ld	a5,0(s10)
ffffffffc0202648:	4585                	li	a1,1
ffffffffc020264a:	739c                	ld	a5,32(a5)
ffffffffc020264c:	9782                	jalr	a5
ffffffffc020264e:	bfd1                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202650:	e42a                	sd	a0,8(sp)
ffffffffc0202652:	e20fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202656:	000d3783          	ld	a5,0(s10)
ffffffffc020265a:	6522                	ld	a0,8(sp)
ffffffffc020265c:	4585                	li	a1,1
ffffffffc020265e:	739c                	ld	a5,32(a5)
ffffffffc0202660:	9782                	jalr	a5
ffffffffc0202662:	e0afe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202666:	bf75                	j	ffffffffc0202622 <unmap_range+0xbc>
ffffffffc0202668:	0000a697          	auipc	a3,0xa
ffffffffc020266c:	e2068693          	addi	a3,a3,-480 # ffffffffc020c488 <default_pmm_manager+0x188>
ffffffffc0202670:	00009617          	auipc	a2,0x9
ffffffffc0202674:	1a860613          	addi	a2,a2,424 # ffffffffc020b818 <commands+0x210>
ffffffffc0202678:	15a00593          	li	a1,346
ffffffffc020267c:	0000a517          	auipc	a0,0xa
ffffffffc0202680:	dd450513          	addi	a0,a0,-556 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0202684:	e1bfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202688:	0000a697          	auipc	a3,0xa
ffffffffc020268c:	e3068693          	addi	a3,a3,-464 # ffffffffc020c4b8 <default_pmm_manager+0x1b8>
ffffffffc0202690:	00009617          	auipc	a2,0x9
ffffffffc0202694:	18860613          	addi	a2,a2,392 # ffffffffc020b818 <commands+0x210>
ffffffffc0202698:	15b00593          	li	a1,347
ffffffffc020269c:	0000a517          	auipc	a0,0xa
ffffffffc02026a0:	db450513          	addi	a0,a0,-588 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02026a4:	dfbfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02026a8:	a8dff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02026ac <exit_range>:
ffffffffc02026ac:	7119                	addi	sp,sp,-128
ffffffffc02026ae:	00c5e7b3          	or	a5,a1,a2
ffffffffc02026b2:	fc86                	sd	ra,120(sp)
ffffffffc02026b4:	f8a2                	sd	s0,112(sp)
ffffffffc02026b6:	f4a6                	sd	s1,104(sp)
ffffffffc02026b8:	f0ca                	sd	s2,96(sp)
ffffffffc02026ba:	ecce                	sd	s3,88(sp)
ffffffffc02026bc:	e8d2                	sd	s4,80(sp)
ffffffffc02026be:	e4d6                	sd	s5,72(sp)
ffffffffc02026c0:	e0da                	sd	s6,64(sp)
ffffffffc02026c2:	fc5e                	sd	s7,56(sp)
ffffffffc02026c4:	f862                	sd	s8,48(sp)
ffffffffc02026c6:	f466                	sd	s9,40(sp)
ffffffffc02026c8:	f06a                	sd	s10,32(sp)
ffffffffc02026ca:	ec6e                	sd	s11,24(sp)
ffffffffc02026cc:	17d2                	slli	a5,a5,0x34
ffffffffc02026ce:	20079a63          	bnez	a5,ffffffffc02028e2 <exit_range+0x236>
ffffffffc02026d2:	002007b7          	lui	a5,0x200
ffffffffc02026d6:	24f5e463          	bltu	a1,a5,ffffffffc020291e <exit_range+0x272>
ffffffffc02026da:	8ab2                	mv	s5,a2
ffffffffc02026dc:	24c5f163          	bgeu	a1,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e0:	4785                	li	a5,1
ffffffffc02026e2:	07fe                	slli	a5,a5,0x1f
ffffffffc02026e4:	22c7ed63          	bltu	a5,a2,ffffffffc020291e <exit_range+0x272>
ffffffffc02026e8:	c00009b7          	lui	s3,0xc0000
ffffffffc02026ec:	0135f9b3          	and	s3,a1,s3
ffffffffc02026f0:	ffe00937          	lui	s2,0xffe00
ffffffffc02026f4:	400007b7          	lui	a5,0x40000
ffffffffc02026f8:	5cfd                	li	s9,-1
ffffffffc02026fa:	8c2a                	mv	s8,a0
ffffffffc02026fc:	0125f933          	and	s2,a1,s2
ffffffffc0202700:	99be                	add	s3,s3,a5
ffffffffc0202702:	00094d17          	auipc	s10,0x94
ffffffffc0202706:	19ed0d13          	addi	s10,s10,414 # ffffffffc02968a0 <npage>
ffffffffc020270a:	00ccdc93          	srli	s9,s9,0xc
ffffffffc020270e:	00094717          	auipc	a4,0x94
ffffffffc0202712:	19a70713          	addi	a4,a4,410 # ffffffffc02968a8 <pages>
ffffffffc0202716:	00094d97          	auipc	s11,0x94
ffffffffc020271a:	19ad8d93          	addi	s11,s11,410 # ffffffffc02968b0 <pmm_manager>
ffffffffc020271e:	c0000437          	lui	s0,0xc0000
ffffffffc0202722:	944e                	add	s0,s0,s3
ffffffffc0202724:	8079                	srli	s0,s0,0x1e
ffffffffc0202726:	1ff47413          	andi	s0,s0,511
ffffffffc020272a:	040e                	slli	s0,s0,0x3
ffffffffc020272c:	9462                	add	s0,s0,s8
ffffffffc020272e:	00043a03          	ld	s4,0(s0) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202732:	001a7793          	andi	a5,s4,1
ffffffffc0202736:	eb99                	bnez	a5,ffffffffc020274c <exit_range+0xa0>
ffffffffc0202738:	12098463          	beqz	s3,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc020273c:	400007b7          	lui	a5,0x40000
ffffffffc0202740:	97ce                	add	a5,a5,s3
ffffffffc0202742:	894e                	mv	s2,s3
ffffffffc0202744:	1159fe63          	bgeu	s3,s5,ffffffffc0202860 <exit_range+0x1b4>
ffffffffc0202748:	89be                	mv	s3,a5
ffffffffc020274a:	bfd1                	j	ffffffffc020271e <exit_range+0x72>
ffffffffc020274c:	000d3783          	ld	a5,0(s10)
ffffffffc0202750:	0a0a                	slli	s4,s4,0x2
ffffffffc0202752:	00ca5a13          	srli	s4,s4,0xc
ffffffffc0202756:	1cfa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020275a:	fff80637          	lui	a2,0xfff80
ffffffffc020275e:	9652                	add	a2,a2,s4
ffffffffc0202760:	000806b7          	lui	a3,0x80
ffffffffc0202764:	96b2                	add	a3,a3,a2
ffffffffc0202766:	0196f5b3          	and	a1,a3,s9
ffffffffc020276a:	061a                	slli	a2,a2,0x6
ffffffffc020276c:	06b2                	slli	a3,a3,0xc
ffffffffc020276e:	18f5fa63          	bgeu	a1,a5,ffffffffc0202902 <exit_range+0x256>
ffffffffc0202772:	00094817          	auipc	a6,0x94
ffffffffc0202776:	14680813          	addi	a6,a6,326 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020277a:	00083b03          	ld	s6,0(a6)
ffffffffc020277e:	4b85                	li	s7,1
ffffffffc0202780:	fff80e37          	lui	t3,0xfff80
ffffffffc0202784:	9b36                	add	s6,s6,a3
ffffffffc0202786:	00080337          	lui	t1,0x80
ffffffffc020278a:	6885                	lui	a7,0x1
ffffffffc020278c:	a819                	j	ffffffffc02027a2 <exit_range+0xf6>
ffffffffc020278e:	4b81                	li	s7,0
ffffffffc0202790:	002007b7          	lui	a5,0x200
ffffffffc0202794:	993e                	add	s2,s2,a5
ffffffffc0202796:	08090c63          	beqz	s2,ffffffffc020282e <exit_range+0x182>
ffffffffc020279a:	09397a63          	bgeu	s2,s3,ffffffffc020282e <exit_range+0x182>
ffffffffc020279e:	0f597063          	bgeu	s2,s5,ffffffffc020287e <exit_range+0x1d2>
ffffffffc02027a2:	01595493          	srli	s1,s2,0x15
ffffffffc02027a6:	1ff4f493          	andi	s1,s1,511
ffffffffc02027aa:	048e                	slli	s1,s1,0x3
ffffffffc02027ac:	94da                	add	s1,s1,s6
ffffffffc02027ae:	609c                	ld	a5,0(s1)
ffffffffc02027b0:	0017f693          	andi	a3,a5,1
ffffffffc02027b4:	dee9                	beqz	a3,ffffffffc020278e <exit_range+0xe2>
ffffffffc02027b6:	000d3583          	ld	a1,0(s10)
ffffffffc02027ba:	078a                	slli	a5,a5,0x2
ffffffffc02027bc:	83b1                	srli	a5,a5,0xc
ffffffffc02027be:	14b7fe63          	bgeu	a5,a1,ffffffffc020291a <exit_range+0x26e>
ffffffffc02027c2:	97f2                	add	a5,a5,t3
ffffffffc02027c4:	006786b3          	add	a3,a5,t1
ffffffffc02027c8:	0196feb3          	and	t4,a3,s9
ffffffffc02027cc:	00679513          	slli	a0,a5,0x6
ffffffffc02027d0:	06b2                	slli	a3,a3,0xc
ffffffffc02027d2:	12bef863          	bgeu	t4,a1,ffffffffc0202902 <exit_range+0x256>
ffffffffc02027d6:	00083783          	ld	a5,0(a6)
ffffffffc02027da:	96be                	add	a3,a3,a5
ffffffffc02027dc:	011685b3          	add	a1,a3,a7
ffffffffc02027e0:	629c                	ld	a5,0(a3)
ffffffffc02027e2:	8b85                	andi	a5,a5,1
ffffffffc02027e4:	f7d5                	bnez	a5,ffffffffc0202790 <exit_range+0xe4>
ffffffffc02027e6:	06a1                	addi	a3,a3,8
ffffffffc02027e8:	fed59ce3          	bne	a1,a3,ffffffffc02027e0 <exit_range+0x134>
ffffffffc02027ec:	631c                	ld	a5,0(a4)
ffffffffc02027ee:	953e                	add	a0,a0,a5
ffffffffc02027f0:	100027f3          	csrr	a5,sstatus
ffffffffc02027f4:	8b89                	andi	a5,a5,2
ffffffffc02027f6:	e7d9                	bnez	a5,ffffffffc0202884 <exit_range+0x1d8>
ffffffffc02027f8:	000db783          	ld	a5,0(s11)
ffffffffc02027fc:	4585                	li	a1,1
ffffffffc02027fe:	e032                	sd	a2,0(sp)
ffffffffc0202800:	739c                	ld	a5,32(a5)
ffffffffc0202802:	9782                	jalr	a5
ffffffffc0202804:	6602                	ld	a2,0(sp)
ffffffffc0202806:	00094817          	auipc	a6,0x94
ffffffffc020280a:	0b280813          	addi	a6,a6,178 # ffffffffc02968b8 <va_pa_offset>
ffffffffc020280e:	fff80e37          	lui	t3,0xfff80
ffffffffc0202812:	00080337          	lui	t1,0x80
ffffffffc0202816:	6885                	lui	a7,0x1
ffffffffc0202818:	00094717          	auipc	a4,0x94
ffffffffc020281c:	09070713          	addi	a4,a4,144 # ffffffffc02968a8 <pages>
ffffffffc0202820:	0004b023          	sd	zero,0(s1)
ffffffffc0202824:	002007b7          	lui	a5,0x200
ffffffffc0202828:	993e                	add	s2,s2,a5
ffffffffc020282a:	f60918e3          	bnez	s2,ffffffffc020279a <exit_range+0xee>
ffffffffc020282e:	f00b85e3          	beqz	s7,ffffffffc0202738 <exit_range+0x8c>
ffffffffc0202832:	000d3783          	ld	a5,0(s10)
ffffffffc0202836:	0efa7263          	bgeu	s4,a5,ffffffffc020291a <exit_range+0x26e>
ffffffffc020283a:	6308                	ld	a0,0(a4)
ffffffffc020283c:	9532                	add	a0,a0,a2
ffffffffc020283e:	100027f3          	csrr	a5,sstatus
ffffffffc0202842:	8b89                	andi	a5,a5,2
ffffffffc0202844:	efad                	bnez	a5,ffffffffc02028be <exit_range+0x212>
ffffffffc0202846:	000db783          	ld	a5,0(s11)
ffffffffc020284a:	4585                	li	a1,1
ffffffffc020284c:	739c                	ld	a5,32(a5)
ffffffffc020284e:	9782                	jalr	a5
ffffffffc0202850:	00094717          	auipc	a4,0x94
ffffffffc0202854:	05870713          	addi	a4,a4,88 # ffffffffc02968a8 <pages>
ffffffffc0202858:	00043023          	sd	zero,0(s0)
ffffffffc020285c:	ee0990e3          	bnez	s3,ffffffffc020273c <exit_range+0x90>
ffffffffc0202860:	70e6                	ld	ra,120(sp)
ffffffffc0202862:	7446                	ld	s0,112(sp)
ffffffffc0202864:	74a6                	ld	s1,104(sp)
ffffffffc0202866:	7906                	ld	s2,96(sp)
ffffffffc0202868:	69e6                	ld	s3,88(sp)
ffffffffc020286a:	6a46                	ld	s4,80(sp)
ffffffffc020286c:	6aa6                	ld	s5,72(sp)
ffffffffc020286e:	6b06                	ld	s6,64(sp)
ffffffffc0202870:	7be2                	ld	s7,56(sp)
ffffffffc0202872:	7c42                	ld	s8,48(sp)
ffffffffc0202874:	7ca2                	ld	s9,40(sp)
ffffffffc0202876:	7d02                	ld	s10,32(sp)
ffffffffc0202878:	6de2                	ld	s11,24(sp)
ffffffffc020287a:	6109                	addi	sp,sp,128
ffffffffc020287c:	8082                	ret
ffffffffc020287e:	ea0b8fe3          	beqz	s7,ffffffffc020273c <exit_range+0x90>
ffffffffc0202882:	bf45                	j	ffffffffc0202832 <exit_range+0x186>
ffffffffc0202884:	e032                	sd	a2,0(sp)
ffffffffc0202886:	e42a                	sd	a0,8(sp)
ffffffffc0202888:	beafe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020288c:	000db783          	ld	a5,0(s11)
ffffffffc0202890:	6522                	ld	a0,8(sp)
ffffffffc0202892:	4585                	li	a1,1
ffffffffc0202894:	739c                	ld	a5,32(a5)
ffffffffc0202896:	9782                	jalr	a5
ffffffffc0202898:	bd4fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020289c:	6602                	ld	a2,0(sp)
ffffffffc020289e:	00094717          	auipc	a4,0x94
ffffffffc02028a2:	00a70713          	addi	a4,a4,10 # ffffffffc02968a8 <pages>
ffffffffc02028a6:	6885                	lui	a7,0x1
ffffffffc02028a8:	00080337          	lui	t1,0x80
ffffffffc02028ac:	fff80e37          	lui	t3,0xfff80
ffffffffc02028b0:	00094817          	auipc	a6,0x94
ffffffffc02028b4:	00880813          	addi	a6,a6,8 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02028b8:	0004b023          	sd	zero,0(s1)
ffffffffc02028bc:	b7a5                	j	ffffffffc0202824 <exit_range+0x178>
ffffffffc02028be:	e02a                	sd	a0,0(sp)
ffffffffc02028c0:	bb2fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02028c4:	000db783          	ld	a5,0(s11)
ffffffffc02028c8:	6502                	ld	a0,0(sp)
ffffffffc02028ca:	4585                	li	a1,1
ffffffffc02028cc:	739c                	ld	a5,32(a5)
ffffffffc02028ce:	9782                	jalr	a5
ffffffffc02028d0:	b9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02028d4:	00094717          	auipc	a4,0x94
ffffffffc02028d8:	fd470713          	addi	a4,a4,-44 # ffffffffc02968a8 <pages>
ffffffffc02028dc:	00043023          	sd	zero,0(s0)
ffffffffc02028e0:	bfb5                	j	ffffffffc020285c <exit_range+0x1b0>
ffffffffc02028e2:	0000a697          	auipc	a3,0xa
ffffffffc02028e6:	ba668693          	addi	a3,a3,-1114 # ffffffffc020c488 <default_pmm_manager+0x188>
ffffffffc02028ea:	00009617          	auipc	a2,0x9
ffffffffc02028ee:	f2e60613          	addi	a2,a2,-210 # ffffffffc020b818 <commands+0x210>
ffffffffc02028f2:	16f00593          	li	a1,367
ffffffffc02028f6:	0000a517          	auipc	a0,0xa
ffffffffc02028fa:	b5a50513          	addi	a0,a0,-1190 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02028fe:	ba1fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0202902:	0000a617          	auipc	a2,0xa
ffffffffc0202906:	a3660613          	addi	a2,a2,-1482 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc020290a:	07100593          	li	a1,113
ffffffffc020290e:	0000a517          	auipc	a0,0xa
ffffffffc0202912:	a5250513          	addi	a0,a0,-1454 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0202916:	b89fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020291a:	81bff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc020291e:	0000a697          	auipc	a3,0xa
ffffffffc0202922:	b9a68693          	addi	a3,a3,-1126 # ffffffffc020c4b8 <default_pmm_manager+0x1b8>
ffffffffc0202926:	00009617          	auipc	a2,0x9
ffffffffc020292a:	ef260613          	addi	a2,a2,-270 # ffffffffc020b818 <commands+0x210>
ffffffffc020292e:	17000593          	li	a1,368
ffffffffc0202932:	0000a517          	auipc	a0,0xa
ffffffffc0202936:	b1e50513          	addi	a0,a0,-1250 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020293a:	b65fd0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020293e <page_remove>:
ffffffffc020293e:	7179                	addi	sp,sp,-48
ffffffffc0202940:	4601                	li	a2,0
ffffffffc0202942:	ec26                	sd	s1,24(sp)
ffffffffc0202944:	f406                	sd	ra,40(sp)
ffffffffc0202946:	f022                	sd	s0,32(sp)
ffffffffc0202948:	84ae                	mv	s1,a1
ffffffffc020294a:	8dbff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020294e:	c511                	beqz	a0,ffffffffc020295a <page_remove+0x1c>
ffffffffc0202950:	611c                	ld	a5,0(a0)
ffffffffc0202952:	842a                	mv	s0,a0
ffffffffc0202954:	0017f713          	andi	a4,a5,1
ffffffffc0202958:	e711                	bnez	a4,ffffffffc0202964 <page_remove+0x26>
ffffffffc020295a:	70a2                	ld	ra,40(sp)
ffffffffc020295c:	7402                	ld	s0,32(sp)
ffffffffc020295e:	64e2                	ld	s1,24(sp)
ffffffffc0202960:	6145                	addi	sp,sp,48
ffffffffc0202962:	8082                	ret
ffffffffc0202964:	078a                	slli	a5,a5,0x2
ffffffffc0202966:	83b1                	srli	a5,a5,0xc
ffffffffc0202968:	00094717          	auipc	a4,0x94
ffffffffc020296c:	f3873703          	ld	a4,-200(a4) # ffffffffc02968a0 <npage>
ffffffffc0202970:	06e7f363          	bgeu	a5,a4,ffffffffc02029d6 <page_remove+0x98>
ffffffffc0202974:	fff80537          	lui	a0,0xfff80
ffffffffc0202978:	97aa                	add	a5,a5,a0
ffffffffc020297a:	079a                	slli	a5,a5,0x6
ffffffffc020297c:	00094517          	auipc	a0,0x94
ffffffffc0202980:	f2c53503          	ld	a0,-212(a0) # ffffffffc02968a8 <pages>
ffffffffc0202984:	953e                	add	a0,a0,a5
ffffffffc0202986:	411c                	lw	a5,0(a0)
ffffffffc0202988:	fff7871b          	addiw	a4,a5,-1
ffffffffc020298c:	c118                	sw	a4,0(a0)
ffffffffc020298e:	cb11                	beqz	a4,ffffffffc02029a2 <page_remove+0x64>
ffffffffc0202990:	00043023          	sd	zero,0(s0)
ffffffffc0202994:	12048073          	sfence.vma	s1
ffffffffc0202998:	70a2                	ld	ra,40(sp)
ffffffffc020299a:	7402                	ld	s0,32(sp)
ffffffffc020299c:	64e2                	ld	s1,24(sp)
ffffffffc020299e:	6145                	addi	sp,sp,48
ffffffffc02029a0:	8082                	ret
ffffffffc02029a2:	100027f3          	csrr	a5,sstatus
ffffffffc02029a6:	8b89                	andi	a5,a5,2
ffffffffc02029a8:	eb89                	bnez	a5,ffffffffc02029ba <page_remove+0x7c>
ffffffffc02029aa:	00094797          	auipc	a5,0x94
ffffffffc02029ae:	f067b783          	ld	a5,-250(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029b2:	739c                	ld	a5,32(a5)
ffffffffc02029b4:	4585                	li	a1,1
ffffffffc02029b6:	9782                	jalr	a5
ffffffffc02029b8:	bfe1                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029ba:	e42a                	sd	a0,8(sp)
ffffffffc02029bc:	ab6fe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02029c0:	00094797          	auipc	a5,0x94
ffffffffc02029c4:	ef07b783          	ld	a5,-272(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc02029c8:	739c                	ld	a5,32(a5)
ffffffffc02029ca:	6522                	ld	a0,8(sp)
ffffffffc02029cc:	4585                	li	a1,1
ffffffffc02029ce:	9782                	jalr	a5
ffffffffc02029d0:	a9cfe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02029d4:	bf75                	j	ffffffffc0202990 <page_remove+0x52>
ffffffffc02029d6:	f5eff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc02029da <page_insert>:
ffffffffc02029da:	7139                	addi	sp,sp,-64
ffffffffc02029dc:	e852                	sd	s4,16(sp)
ffffffffc02029de:	8a32                	mv	s4,a2
ffffffffc02029e0:	f822                	sd	s0,48(sp)
ffffffffc02029e2:	4605                	li	a2,1
ffffffffc02029e4:	842e                	mv	s0,a1
ffffffffc02029e6:	85d2                	mv	a1,s4
ffffffffc02029e8:	f426                	sd	s1,40(sp)
ffffffffc02029ea:	fc06                	sd	ra,56(sp)
ffffffffc02029ec:	f04a                	sd	s2,32(sp)
ffffffffc02029ee:	ec4e                	sd	s3,24(sp)
ffffffffc02029f0:	e456                	sd	s5,8(sp)
ffffffffc02029f2:	84b6                	mv	s1,a3
ffffffffc02029f4:	831ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc02029f8:	c961                	beqz	a0,ffffffffc0202ac8 <page_insert+0xee>
ffffffffc02029fa:	4014                	lw	a3,0(s0)
ffffffffc02029fc:	611c                	ld	a5,0(a0)
ffffffffc02029fe:	89aa                	mv	s3,a0
ffffffffc0202a00:	0016871b          	addiw	a4,a3,1
ffffffffc0202a04:	c018                	sw	a4,0(s0)
ffffffffc0202a06:	0017f713          	andi	a4,a5,1
ffffffffc0202a0a:	ef05                	bnez	a4,ffffffffc0202a42 <page_insert+0x68>
ffffffffc0202a0c:	00094717          	auipc	a4,0x94
ffffffffc0202a10:	e9c73703          	ld	a4,-356(a4) # ffffffffc02968a8 <pages>
ffffffffc0202a14:	8c19                	sub	s0,s0,a4
ffffffffc0202a16:	000807b7          	lui	a5,0x80
ffffffffc0202a1a:	8419                	srai	s0,s0,0x6
ffffffffc0202a1c:	943e                	add	s0,s0,a5
ffffffffc0202a1e:	042a                	slli	s0,s0,0xa
ffffffffc0202a20:	8cc1                	or	s1,s1,s0
ffffffffc0202a22:	0014e493          	ori	s1,s1,1
ffffffffc0202a26:	0099b023          	sd	s1,0(s3) # ffffffffc0000000 <_binary_bin_sfs_img_size+0xffffffffbff8ad00>
ffffffffc0202a2a:	120a0073          	sfence.vma	s4
ffffffffc0202a2e:	4501                	li	a0,0
ffffffffc0202a30:	70e2                	ld	ra,56(sp)
ffffffffc0202a32:	7442                	ld	s0,48(sp)
ffffffffc0202a34:	74a2                	ld	s1,40(sp)
ffffffffc0202a36:	7902                	ld	s2,32(sp)
ffffffffc0202a38:	69e2                	ld	s3,24(sp)
ffffffffc0202a3a:	6a42                	ld	s4,16(sp)
ffffffffc0202a3c:	6aa2                	ld	s5,8(sp)
ffffffffc0202a3e:	6121                	addi	sp,sp,64
ffffffffc0202a40:	8082                	ret
ffffffffc0202a42:	078a                	slli	a5,a5,0x2
ffffffffc0202a44:	83b1                	srli	a5,a5,0xc
ffffffffc0202a46:	00094717          	auipc	a4,0x94
ffffffffc0202a4a:	e5a73703          	ld	a4,-422(a4) # ffffffffc02968a0 <npage>
ffffffffc0202a4e:	06e7ff63          	bgeu	a5,a4,ffffffffc0202acc <page_insert+0xf2>
ffffffffc0202a52:	00094a97          	auipc	s5,0x94
ffffffffc0202a56:	e56a8a93          	addi	s5,s5,-426 # ffffffffc02968a8 <pages>
ffffffffc0202a5a:	000ab703          	ld	a4,0(s5)
ffffffffc0202a5e:	fff80937          	lui	s2,0xfff80
ffffffffc0202a62:	993e                	add	s2,s2,a5
ffffffffc0202a64:	091a                	slli	s2,s2,0x6
ffffffffc0202a66:	993a                	add	s2,s2,a4
ffffffffc0202a68:	01240c63          	beq	s0,s2,ffffffffc0202a80 <page_insert+0xa6>
ffffffffc0202a6c:	00092783          	lw	a5,0(s2) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202a70:	fff7869b          	addiw	a3,a5,-1
ffffffffc0202a74:	00d92023          	sw	a3,0(s2)
ffffffffc0202a78:	c691                	beqz	a3,ffffffffc0202a84 <page_insert+0xaa>
ffffffffc0202a7a:	120a0073          	sfence.vma	s4
ffffffffc0202a7e:	bf59                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a80:	c014                	sw	a3,0(s0)
ffffffffc0202a82:	bf49                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202a84:	100027f3          	csrr	a5,sstatus
ffffffffc0202a88:	8b89                	andi	a5,a5,2
ffffffffc0202a8a:	ef91                	bnez	a5,ffffffffc0202aa6 <page_insert+0xcc>
ffffffffc0202a8c:	00094797          	auipc	a5,0x94
ffffffffc0202a90:	e247b783          	ld	a5,-476(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202a94:	739c                	ld	a5,32(a5)
ffffffffc0202a96:	4585                	li	a1,1
ffffffffc0202a98:	854a                	mv	a0,s2
ffffffffc0202a9a:	9782                	jalr	a5
ffffffffc0202a9c:	000ab703          	ld	a4,0(s5)
ffffffffc0202aa0:	120a0073          	sfence.vma	s4
ffffffffc0202aa4:	bf85                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202aa6:	9ccfe0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0202aaa:	00094797          	auipc	a5,0x94
ffffffffc0202aae:	e067b783          	ld	a5,-506(a5) # ffffffffc02968b0 <pmm_manager>
ffffffffc0202ab2:	739c                	ld	a5,32(a5)
ffffffffc0202ab4:	4585                	li	a1,1
ffffffffc0202ab6:	854a                	mv	a0,s2
ffffffffc0202ab8:	9782                	jalr	a5
ffffffffc0202aba:	9b2fe0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0202abe:	000ab703          	ld	a4,0(s5)
ffffffffc0202ac2:	120a0073          	sfence.vma	s4
ffffffffc0202ac6:	b7b9                	j	ffffffffc0202a14 <page_insert+0x3a>
ffffffffc0202ac8:	5571                	li	a0,-4
ffffffffc0202aca:	b79d                	j	ffffffffc0202a30 <page_insert+0x56>
ffffffffc0202acc:	e68ff0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>

ffffffffc0202ad0 <pmm_init>:
ffffffffc0202ad0:	0000a797          	auipc	a5,0xa
ffffffffc0202ad4:	83078793          	addi	a5,a5,-2000 # ffffffffc020c300 <default_pmm_manager>
ffffffffc0202ad8:	638c                	ld	a1,0(a5)
ffffffffc0202ada:	7159                	addi	sp,sp,-112
ffffffffc0202adc:	f85a                	sd	s6,48(sp)
ffffffffc0202ade:	0000a517          	auipc	a0,0xa
ffffffffc0202ae2:	9f250513          	addi	a0,a0,-1550 # ffffffffc020c4d0 <default_pmm_manager+0x1d0>
ffffffffc0202ae6:	00094b17          	auipc	s6,0x94
ffffffffc0202aea:	dcab0b13          	addi	s6,s6,-566 # ffffffffc02968b0 <pmm_manager>
ffffffffc0202aee:	f486                	sd	ra,104(sp)
ffffffffc0202af0:	e8ca                	sd	s2,80(sp)
ffffffffc0202af2:	e4ce                	sd	s3,72(sp)
ffffffffc0202af4:	f0a2                	sd	s0,96(sp)
ffffffffc0202af6:	eca6                	sd	s1,88(sp)
ffffffffc0202af8:	e0d2                	sd	s4,64(sp)
ffffffffc0202afa:	fc56                	sd	s5,56(sp)
ffffffffc0202afc:	f45e                	sd	s7,40(sp)
ffffffffc0202afe:	f062                	sd	s8,32(sp)
ffffffffc0202b00:	ec66                	sd	s9,24(sp)
ffffffffc0202b02:	00fb3023          	sd	a5,0(s6)
ffffffffc0202b06:	ea0fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b0a:	000b3783          	ld	a5,0(s6)
ffffffffc0202b0e:	00094997          	auipc	s3,0x94
ffffffffc0202b12:	daa98993          	addi	s3,s3,-598 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0202b16:	679c                	ld	a5,8(a5)
ffffffffc0202b18:	9782                	jalr	a5
ffffffffc0202b1a:	57f5                	li	a5,-3
ffffffffc0202b1c:	07fa                	slli	a5,a5,0x1e
ffffffffc0202b1e:	00f9b023          	sd	a5,0(s3)
ffffffffc0202b22:	f27fd0ef          	jal	ra,ffffffffc0200a48 <get_memory_base>
ffffffffc0202b26:	892a                	mv	s2,a0
ffffffffc0202b28:	f2bfd0ef          	jal	ra,ffffffffc0200a52 <get_memory_size>
ffffffffc0202b2c:	280502e3          	beqz	a0,ffffffffc02035b0 <pmm_init+0xae0>
ffffffffc0202b30:	84aa                	mv	s1,a0
ffffffffc0202b32:	0000a517          	auipc	a0,0xa
ffffffffc0202b36:	9d650513          	addi	a0,a0,-1578 # ffffffffc020c508 <default_pmm_manager+0x208>
ffffffffc0202b3a:	e6cfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b3e:	00990433          	add	s0,s2,s1
ffffffffc0202b42:	fff40693          	addi	a3,s0,-1
ffffffffc0202b46:	864a                	mv	a2,s2
ffffffffc0202b48:	85a6                	mv	a1,s1
ffffffffc0202b4a:	0000a517          	auipc	a0,0xa
ffffffffc0202b4e:	9d650513          	addi	a0,a0,-1578 # ffffffffc020c520 <default_pmm_manager+0x220>
ffffffffc0202b52:	e54fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202b56:	c8000737          	lui	a4,0xc8000
ffffffffc0202b5a:	87a2                	mv	a5,s0
ffffffffc0202b5c:	5e876e63          	bltu	a4,s0,ffffffffc0203158 <pmm_init+0x688>
ffffffffc0202b60:	757d                	lui	a0,0xfffff
ffffffffc0202b62:	00095617          	auipc	a2,0x95
ffffffffc0202b66:	dad60613          	addi	a2,a2,-595 # ffffffffc029790f <end+0xfff>
ffffffffc0202b6a:	8e69                	and	a2,a2,a0
ffffffffc0202b6c:	00094497          	auipc	s1,0x94
ffffffffc0202b70:	d3448493          	addi	s1,s1,-716 # ffffffffc02968a0 <npage>
ffffffffc0202b74:	00c7d513          	srli	a0,a5,0xc
ffffffffc0202b78:	00094b97          	auipc	s7,0x94
ffffffffc0202b7c:	d30b8b93          	addi	s7,s7,-720 # ffffffffc02968a8 <pages>
ffffffffc0202b80:	e088                	sd	a0,0(s1)
ffffffffc0202b82:	00cbb023          	sd	a2,0(s7)
ffffffffc0202b86:	000807b7          	lui	a5,0x80
ffffffffc0202b8a:	86b2                	mv	a3,a2
ffffffffc0202b8c:	02f50863          	beq	a0,a5,ffffffffc0202bbc <pmm_init+0xec>
ffffffffc0202b90:	4781                	li	a5,0
ffffffffc0202b92:	4585                	li	a1,1
ffffffffc0202b94:	fff806b7          	lui	a3,0xfff80
ffffffffc0202b98:	00679513          	slli	a0,a5,0x6
ffffffffc0202b9c:	9532                	add	a0,a0,a2
ffffffffc0202b9e:	00850713          	addi	a4,a0,8 # fffffffffffff008 <end+0x3fd686f8>
ffffffffc0202ba2:	40b7302f          	amoor.d	zero,a1,(a4)
ffffffffc0202ba6:	6088                	ld	a0,0(s1)
ffffffffc0202ba8:	0785                	addi	a5,a5,1
ffffffffc0202baa:	000bb603          	ld	a2,0(s7)
ffffffffc0202bae:	00d50733          	add	a4,a0,a3
ffffffffc0202bb2:	fee7e3e3          	bltu	a5,a4,ffffffffc0202b98 <pmm_init+0xc8>
ffffffffc0202bb6:	071a                	slli	a4,a4,0x6
ffffffffc0202bb8:	00e606b3          	add	a3,a2,a4
ffffffffc0202bbc:	c02007b7          	lui	a5,0xc0200
ffffffffc0202bc0:	3af6eae3          	bltu	a3,a5,ffffffffc0203774 <pmm_init+0xca4>
ffffffffc0202bc4:	0009b583          	ld	a1,0(s3)
ffffffffc0202bc8:	77fd                	lui	a5,0xfffff
ffffffffc0202bca:	8c7d                	and	s0,s0,a5
ffffffffc0202bcc:	8e8d                	sub	a3,a3,a1
ffffffffc0202bce:	5e86e363          	bltu	a3,s0,ffffffffc02031b4 <pmm_init+0x6e4>
ffffffffc0202bd2:	0000a517          	auipc	a0,0xa
ffffffffc0202bd6:	97650513          	addi	a0,a0,-1674 # ffffffffc020c548 <default_pmm_manager+0x248>
ffffffffc0202bda:	dccfd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bde:	000b3783          	ld	a5,0(s6)
ffffffffc0202be2:	7b9c                	ld	a5,48(a5)
ffffffffc0202be4:	9782                	jalr	a5
ffffffffc0202be6:	0000a517          	auipc	a0,0xa
ffffffffc0202bea:	97a50513          	addi	a0,a0,-1670 # ffffffffc020c560 <default_pmm_manager+0x260>
ffffffffc0202bee:	db8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202bf2:	100027f3          	csrr	a5,sstatus
ffffffffc0202bf6:	8b89                	andi	a5,a5,2
ffffffffc0202bf8:	5a079363          	bnez	a5,ffffffffc020319e <pmm_init+0x6ce>
ffffffffc0202bfc:	000b3783          	ld	a5,0(s6)
ffffffffc0202c00:	4505                	li	a0,1
ffffffffc0202c02:	6f9c                	ld	a5,24(a5)
ffffffffc0202c04:	9782                	jalr	a5
ffffffffc0202c06:	842a                	mv	s0,a0
ffffffffc0202c08:	180408e3          	beqz	s0,ffffffffc0203598 <pmm_init+0xac8>
ffffffffc0202c0c:	000bb683          	ld	a3,0(s7)
ffffffffc0202c10:	5a7d                	li	s4,-1
ffffffffc0202c12:	6098                	ld	a4,0(s1)
ffffffffc0202c14:	40d406b3          	sub	a3,s0,a3
ffffffffc0202c18:	8699                	srai	a3,a3,0x6
ffffffffc0202c1a:	00080437          	lui	s0,0x80
ffffffffc0202c1e:	96a2                	add	a3,a3,s0
ffffffffc0202c20:	00ca5793          	srli	a5,s4,0xc
ffffffffc0202c24:	8ff5                	and	a5,a5,a3
ffffffffc0202c26:	06b2                	slli	a3,a3,0xc
ffffffffc0202c28:	30e7fde3          	bgeu	a5,a4,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202c2c:	0009b403          	ld	s0,0(s3)
ffffffffc0202c30:	6605                	lui	a2,0x1
ffffffffc0202c32:	4581                	li	a1,0
ffffffffc0202c34:	9436                	add	s0,s0,a3
ffffffffc0202c36:	8522                	mv	a0,s0
ffffffffc0202c38:	6fe080ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0202c3c:	0009b683          	ld	a3,0(s3)
ffffffffc0202c40:	77fd                	lui	a5,0xfffff
ffffffffc0202c42:	00009917          	auipc	s2,0x9
ffffffffc0202c46:	75d90913          	addi	s2,s2,1885 # ffffffffc020c39f <default_pmm_manager+0x9f>
ffffffffc0202c4a:	00f97933          	and	s2,s2,a5
ffffffffc0202c4e:	c0200ab7          	lui	s5,0xc0200
ffffffffc0202c52:	3fe00637          	lui	a2,0x3fe00
ffffffffc0202c56:	964a                	add	a2,a2,s2
ffffffffc0202c58:	4729                	li	a4,10
ffffffffc0202c5a:	40da86b3          	sub	a3,s5,a3
ffffffffc0202c5e:	c02005b7          	lui	a1,0xc0200
ffffffffc0202c62:	8522                	mv	a0,s0
ffffffffc0202c64:	fe8ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c68:	c8000637          	lui	a2,0xc8000
ffffffffc0202c6c:	41260633          	sub	a2,a2,s2
ffffffffc0202c70:	3f596ce3          	bltu	s2,s5,ffffffffc0203868 <pmm_init+0xd98>
ffffffffc0202c74:	0009b683          	ld	a3,0(s3)
ffffffffc0202c78:	85ca                	mv	a1,s2
ffffffffc0202c7a:	4719                	li	a4,6
ffffffffc0202c7c:	40d906b3          	sub	a3,s2,a3
ffffffffc0202c80:	8522                	mv	a0,s0
ffffffffc0202c82:	00094917          	auipc	s2,0x94
ffffffffc0202c86:	c1690913          	addi	s2,s2,-1002 # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0202c8a:	fc2ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0202c8e:	00893023          	sd	s0,0(s2)
ffffffffc0202c92:	2d5464e3          	bltu	s0,s5,ffffffffc020375a <pmm_init+0xc8a>
ffffffffc0202c96:	0009b783          	ld	a5,0(s3)
ffffffffc0202c9a:	1a7e                	slli	s4,s4,0x3f
ffffffffc0202c9c:	8c1d                	sub	s0,s0,a5
ffffffffc0202c9e:	00c45793          	srli	a5,s0,0xc
ffffffffc0202ca2:	00094717          	auipc	a4,0x94
ffffffffc0202ca6:	be873723          	sd	s0,-1042(a4) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0202caa:	0147ea33          	or	s4,a5,s4
ffffffffc0202cae:	180a1073          	csrw	satp,s4
ffffffffc0202cb2:	12000073          	sfence.vma
ffffffffc0202cb6:	0000a517          	auipc	a0,0xa
ffffffffc0202cba:	8ea50513          	addi	a0,a0,-1814 # ffffffffc020c5a0 <default_pmm_manager+0x2a0>
ffffffffc0202cbe:	ce8fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202cc2:	0000e717          	auipc	a4,0xe
ffffffffc0202cc6:	33e70713          	addi	a4,a4,830 # ffffffffc0211000 <bootstack>
ffffffffc0202cca:	0000e797          	auipc	a5,0xe
ffffffffc0202cce:	33678793          	addi	a5,a5,822 # ffffffffc0211000 <bootstack>
ffffffffc0202cd2:	5cf70d63          	beq	a4,a5,ffffffffc02032ac <pmm_init+0x7dc>
ffffffffc0202cd6:	100027f3          	csrr	a5,sstatus
ffffffffc0202cda:	8b89                	andi	a5,a5,2
ffffffffc0202cdc:	4a079763          	bnez	a5,ffffffffc020318a <pmm_init+0x6ba>
ffffffffc0202ce0:	000b3783          	ld	a5,0(s6)
ffffffffc0202ce4:	779c                	ld	a5,40(a5)
ffffffffc0202ce6:	9782                	jalr	a5
ffffffffc0202ce8:	842a                	mv	s0,a0
ffffffffc0202cea:	6098                	ld	a4,0(s1)
ffffffffc0202cec:	c80007b7          	lui	a5,0xc8000
ffffffffc0202cf0:	83b1                	srli	a5,a5,0xc
ffffffffc0202cf2:	08e7e3e3          	bltu	a5,a4,ffffffffc0203578 <pmm_init+0xaa8>
ffffffffc0202cf6:	00093503          	ld	a0,0(s2)
ffffffffc0202cfa:	04050fe3          	beqz	a0,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202cfe:	03451793          	slli	a5,a0,0x34
ffffffffc0202d02:	04079be3          	bnez	a5,ffffffffc0203558 <pmm_init+0xa88>
ffffffffc0202d06:	4601                	li	a2,0
ffffffffc0202d08:	4581                	li	a1,0
ffffffffc0202d0a:	809ff0ef          	jal	ra,ffffffffc0202512 <get_page>
ffffffffc0202d0e:	2e0511e3          	bnez	a0,ffffffffc02037f0 <pmm_init+0xd20>
ffffffffc0202d12:	100027f3          	csrr	a5,sstatus
ffffffffc0202d16:	8b89                	andi	a5,a5,2
ffffffffc0202d18:	44079e63          	bnez	a5,ffffffffc0203174 <pmm_init+0x6a4>
ffffffffc0202d1c:	000b3783          	ld	a5,0(s6)
ffffffffc0202d20:	4505                	li	a0,1
ffffffffc0202d22:	6f9c                	ld	a5,24(a5)
ffffffffc0202d24:	9782                	jalr	a5
ffffffffc0202d26:	8a2a                	mv	s4,a0
ffffffffc0202d28:	00093503          	ld	a0,0(s2)
ffffffffc0202d2c:	4681                	li	a3,0
ffffffffc0202d2e:	4601                	li	a2,0
ffffffffc0202d30:	85d2                	mv	a1,s4
ffffffffc0202d32:	ca9ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202d36:	26051be3          	bnez	a0,ffffffffc02037ac <pmm_init+0xcdc>
ffffffffc0202d3a:	00093503          	ld	a0,0(s2)
ffffffffc0202d3e:	4601                	li	a2,0
ffffffffc0202d40:	4581                	li	a1,0
ffffffffc0202d42:	ce2ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202d46:	280505e3          	beqz	a0,ffffffffc02037d0 <pmm_init+0xd00>
ffffffffc0202d4a:	611c                	ld	a5,0(a0)
ffffffffc0202d4c:	0017f713          	andi	a4,a5,1
ffffffffc0202d50:	26070ee3          	beqz	a4,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202d54:	6098                	ld	a4,0(s1)
ffffffffc0202d56:	078a                	slli	a5,a5,0x2
ffffffffc0202d58:	83b1                	srli	a5,a5,0xc
ffffffffc0202d5a:	62e7f363          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202d5e:	000bb683          	ld	a3,0(s7)
ffffffffc0202d62:	fff80637          	lui	a2,0xfff80
ffffffffc0202d66:	97b2                	add	a5,a5,a2
ffffffffc0202d68:	079a                	slli	a5,a5,0x6
ffffffffc0202d6a:	97b6                	add	a5,a5,a3
ffffffffc0202d6c:	2afa12e3          	bne	s4,a5,ffffffffc0203810 <pmm_init+0xd40>
ffffffffc0202d70:	000a2683          	lw	a3,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202d74:	4785                	li	a5,1
ffffffffc0202d76:	2cf699e3          	bne	a3,a5,ffffffffc0203848 <pmm_init+0xd78>
ffffffffc0202d7a:	00093503          	ld	a0,0(s2)
ffffffffc0202d7e:	77fd                	lui	a5,0xfffff
ffffffffc0202d80:	6114                	ld	a3,0(a0)
ffffffffc0202d82:	068a                	slli	a3,a3,0x2
ffffffffc0202d84:	8efd                	and	a3,a3,a5
ffffffffc0202d86:	00c6d613          	srli	a2,a3,0xc
ffffffffc0202d8a:	2ae673e3          	bgeu	a2,a4,ffffffffc0203830 <pmm_init+0xd60>
ffffffffc0202d8e:	0009bc03          	ld	s8,0(s3)
ffffffffc0202d92:	96e2                	add	a3,a3,s8
ffffffffc0202d94:	0006ba83          	ld	s5,0(a3) # fffffffffff80000 <end+0x3fce96f0>
ffffffffc0202d98:	0a8a                	slli	s5,s5,0x2
ffffffffc0202d9a:	00fafab3          	and	s5,s5,a5
ffffffffc0202d9e:	00cad793          	srli	a5,s5,0xc
ffffffffc0202da2:	06e7f3e3          	bgeu	a5,a4,ffffffffc0203608 <pmm_init+0xb38>
ffffffffc0202da6:	4601                	li	a2,0
ffffffffc0202da8:	6585                	lui	a1,0x1
ffffffffc0202daa:	9ae2                	add	s5,s5,s8
ffffffffc0202dac:	c78ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202db0:	0aa1                	addi	s5,s5,8
ffffffffc0202db2:	03551be3          	bne	a0,s5,ffffffffc02035e8 <pmm_init+0xb18>
ffffffffc0202db6:	100027f3          	csrr	a5,sstatus
ffffffffc0202dba:	8b89                	andi	a5,a5,2
ffffffffc0202dbc:	3a079163          	bnez	a5,ffffffffc020315e <pmm_init+0x68e>
ffffffffc0202dc0:	000b3783          	ld	a5,0(s6)
ffffffffc0202dc4:	4505                	li	a0,1
ffffffffc0202dc6:	6f9c                	ld	a5,24(a5)
ffffffffc0202dc8:	9782                	jalr	a5
ffffffffc0202dca:	8c2a                	mv	s8,a0
ffffffffc0202dcc:	00093503          	ld	a0,0(s2)
ffffffffc0202dd0:	46d1                	li	a3,20
ffffffffc0202dd2:	6605                	lui	a2,0x1
ffffffffc0202dd4:	85e2                	mv	a1,s8
ffffffffc0202dd6:	c05ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202dda:	1a0519e3          	bnez	a0,ffffffffc020378c <pmm_init+0xcbc>
ffffffffc0202dde:	00093503          	ld	a0,0(s2)
ffffffffc0202de2:	4601                	li	a2,0
ffffffffc0202de4:	6585                	lui	a1,0x1
ffffffffc0202de6:	c3eff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202dea:	10050ce3          	beqz	a0,ffffffffc0203702 <pmm_init+0xc32>
ffffffffc0202dee:	611c                	ld	a5,0(a0)
ffffffffc0202df0:	0107f713          	andi	a4,a5,16
ffffffffc0202df4:	0e0707e3          	beqz	a4,ffffffffc02036e2 <pmm_init+0xc12>
ffffffffc0202df8:	8b91                	andi	a5,a5,4
ffffffffc0202dfa:	0c0784e3          	beqz	a5,ffffffffc02036c2 <pmm_init+0xbf2>
ffffffffc0202dfe:	00093503          	ld	a0,0(s2)
ffffffffc0202e02:	611c                	ld	a5,0(a0)
ffffffffc0202e04:	8bc1                	andi	a5,a5,16
ffffffffc0202e06:	08078ee3          	beqz	a5,ffffffffc02036a2 <pmm_init+0xbd2>
ffffffffc0202e0a:	000c2703          	lw	a4,0(s8)
ffffffffc0202e0e:	4785                	li	a5,1
ffffffffc0202e10:	06f719e3          	bne	a4,a5,ffffffffc0203682 <pmm_init+0xbb2>
ffffffffc0202e14:	4681                	li	a3,0
ffffffffc0202e16:	6605                	lui	a2,0x1
ffffffffc0202e18:	85d2                	mv	a1,s4
ffffffffc0202e1a:	bc1ff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202e1e:	040512e3          	bnez	a0,ffffffffc0203662 <pmm_init+0xb92>
ffffffffc0202e22:	000a2703          	lw	a4,0(s4)
ffffffffc0202e26:	4789                	li	a5,2
ffffffffc0202e28:	00f71de3          	bne	a4,a5,ffffffffc0203642 <pmm_init+0xb72>
ffffffffc0202e2c:	000c2783          	lw	a5,0(s8)
ffffffffc0202e30:	7e079963          	bnez	a5,ffffffffc0203622 <pmm_init+0xb52>
ffffffffc0202e34:	00093503          	ld	a0,0(s2)
ffffffffc0202e38:	4601                	li	a2,0
ffffffffc0202e3a:	6585                	lui	a1,0x1
ffffffffc0202e3c:	be8ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202e40:	54050263          	beqz	a0,ffffffffc0203384 <pmm_init+0x8b4>
ffffffffc0202e44:	6118                	ld	a4,0(a0)
ffffffffc0202e46:	00177793          	andi	a5,a4,1
ffffffffc0202e4a:	180781e3          	beqz	a5,ffffffffc02037cc <pmm_init+0xcfc>
ffffffffc0202e4e:	6094                	ld	a3,0(s1)
ffffffffc0202e50:	00271793          	slli	a5,a4,0x2
ffffffffc0202e54:	83b1                	srli	a5,a5,0xc
ffffffffc0202e56:	52d7f563          	bgeu	a5,a3,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202e5a:	000bb683          	ld	a3,0(s7)
ffffffffc0202e5e:	fff80ab7          	lui	s5,0xfff80
ffffffffc0202e62:	97d6                	add	a5,a5,s5
ffffffffc0202e64:	079a                	slli	a5,a5,0x6
ffffffffc0202e66:	97b6                	add	a5,a5,a3
ffffffffc0202e68:	58fa1e63          	bne	s4,a5,ffffffffc0203404 <pmm_init+0x934>
ffffffffc0202e6c:	8b41                	andi	a4,a4,16
ffffffffc0202e6e:	56071b63          	bnez	a4,ffffffffc02033e4 <pmm_init+0x914>
ffffffffc0202e72:	00093503          	ld	a0,0(s2)
ffffffffc0202e76:	4581                	li	a1,0
ffffffffc0202e78:	ac7ff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e7c:	000a2c83          	lw	s9,0(s4)
ffffffffc0202e80:	4785                	li	a5,1
ffffffffc0202e82:	5cfc9163          	bne	s9,a5,ffffffffc0203444 <pmm_init+0x974>
ffffffffc0202e86:	000c2783          	lw	a5,0(s8)
ffffffffc0202e8a:	58079d63          	bnez	a5,ffffffffc0203424 <pmm_init+0x954>
ffffffffc0202e8e:	00093503          	ld	a0,0(s2)
ffffffffc0202e92:	6585                	lui	a1,0x1
ffffffffc0202e94:	aabff0ef          	jal	ra,ffffffffc020293e <page_remove>
ffffffffc0202e98:	000a2783          	lw	a5,0(s4)
ffffffffc0202e9c:	200793e3          	bnez	a5,ffffffffc02038a2 <pmm_init+0xdd2>
ffffffffc0202ea0:	000c2783          	lw	a5,0(s8)
ffffffffc0202ea4:	1c079fe3          	bnez	a5,ffffffffc0203882 <pmm_init+0xdb2>
ffffffffc0202ea8:	00093a03          	ld	s4,0(s2)
ffffffffc0202eac:	608c                	ld	a1,0(s1)
ffffffffc0202eae:	000a3683          	ld	a3,0(s4)
ffffffffc0202eb2:	068a                	slli	a3,a3,0x2
ffffffffc0202eb4:	82b1                	srli	a3,a3,0xc
ffffffffc0202eb6:	4cb6f563          	bgeu	a3,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202eba:	000bb503          	ld	a0,0(s7)
ffffffffc0202ebe:	96d6                	add	a3,a3,s5
ffffffffc0202ec0:	069a                	slli	a3,a3,0x6
ffffffffc0202ec2:	00d507b3          	add	a5,a0,a3
ffffffffc0202ec6:	439c                	lw	a5,0(a5)
ffffffffc0202ec8:	4f979e63          	bne	a5,s9,ffffffffc02033c4 <pmm_init+0x8f4>
ffffffffc0202ecc:	8699                	srai	a3,a3,0x6
ffffffffc0202ece:	00080637          	lui	a2,0x80
ffffffffc0202ed2:	96b2                	add	a3,a3,a2
ffffffffc0202ed4:	00c69713          	slli	a4,a3,0xc
ffffffffc0202ed8:	8331                	srli	a4,a4,0xc
ffffffffc0202eda:	06b2                	slli	a3,a3,0xc
ffffffffc0202edc:	06b773e3          	bgeu	a4,a1,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0202ee0:	0009b703          	ld	a4,0(s3)
ffffffffc0202ee4:	96ba                	add	a3,a3,a4
ffffffffc0202ee6:	629c                	ld	a5,0(a3)
ffffffffc0202ee8:	078a                	slli	a5,a5,0x2
ffffffffc0202eea:	83b1                	srli	a5,a5,0xc
ffffffffc0202eec:	48b7fa63          	bgeu	a5,a1,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202ef0:	8f91                	sub	a5,a5,a2
ffffffffc0202ef2:	079a                	slli	a5,a5,0x6
ffffffffc0202ef4:	953e                	add	a0,a0,a5
ffffffffc0202ef6:	100027f3          	csrr	a5,sstatus
ffffffffc0202efa:	8b89                	andi	a5,a5,2
ffffffffc0202efc:	32079463          	bnez	a5,ffffffffc0203224 <pmm_init+0x754>
ffffffffc0202f00:	000b3783          	ld	a5,0(s6)
ffffffffc0202f04:	4585                	li	a1,1
ffffffffc0202f06:	739c                	ld	a5,32(a5)
ffffffffc0202f08:	9782                	jalr	a5
ffffffffc0202f0a:	000a3783          	ld	a5,0(s4)
ffffffffc0202f0e:	6098                	ld	a4,0(s1)
ffffffffc0202f10:	078a                	slli	a5,a5,0x2
ffffffffc0202f12:	83b1                	srli	a5,a5,0xc
ffffffffc0202f14:	46e7f663          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc0202f18:	000bb503          	ld	a0,0(s7)
ffffffffc0202f1c:	fff80737          	lui	a4,0xfff80
ffffffffc0202f20:	97ba                	add	a5,a5,a4
ffffffffc0202f22:	079a                	slli	a5,a5,0x6
ffffffffc0202f24:	953e                	add	a0,a0,a5
ffffffffc0202f26:	100027f3          	csrr	a5,sstatus
ffffffffc0202f2a:	8b89                	andi	a5,a5,2
ffffffffc0202f2c:	2e079063          	bnez	a5,ffffffffc020320c <pmm_init+0x73c>
ffffffffc0202f30:	000b3783          	ld	a5,0(s6)
ffffffffc0202f34:	4585                	li	a1,1
ffffffffc0202f36:	739c                	ld	a5,32(a5)
ffffffffc0202f38:	9782                	jalr	a5
ffffffffc0202f3a:	00093783          	ld	a5,0(s2)
ffffffffc0202f3e:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0202f42:	12000073          	sfence.vma
ffffffffc0202f46:	100027f3          	csrr	a5,sstatus
ffffffffc0202f4a:	8b89                	andi	a5,a5,2
ffffffffc0202f4c:	2a079663          	bnez	a5,ffffffffc02031f8 <pmm_init+0x728>
ffffffffc0202f50:	000b3783          	ld	a5,0(s6)
ffffffffc0202f54:	779c                	ld	a5,40(a5)
ffffffffc0202f56:	9782                	jalr	a5
ffffffffc0202f58:	8a2a                	mv	s4,a0
ffffffffc0202f5a:	7d441463          	bne	s0,s4,ffffffffc0203722 <pmm_init+0xc52>
ffffffffc0202f5e:	0000a517          	auipc	a0,0xa
ffffffffc0202f62:	99a50513          	addi	a0,a0,-1638 # ffffffffc020c8f8 <default_pmm_manager+0x5f8>
ffffffffc0202f66:	a40fd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0202f6a:	100027f3          	csrr	a5,sstatus
ffffffffc0202f6e:	8b89                	andi	a5,a5,2
ffffffffc0202f70:	26079a63          	bnez	a5,ffffffffc02031e4 <pmm_init+0x714>
ffffffffc0202f74:	000b3783          	ld	a5,0(s6)
ffffffffc0202f78:	779c                	ld	a5,40(a5)
ffffffffc0202f7a:	9782                	jalr	a5
ffffffffc0202f7c:	8c2a                	mv	s8,a0
ffffffffc0202f7e:	6098                	ld	a4,0(s1)
ffffffffc0202f80:	c0200437          	lui	s0,0xc0200
ffffffffc0202f84:	7afd                	lui	s5,0xfffff
ffffffffc0202f86:	00c71793          	slli	a5,a4,0xc
ffffffffc0202f8a:	6a05                	lui	s4,0x1
ffffffffc0202f8c:	02f47c63          	bgeu	s0,a5,ffffffffc0202fc4 <pmm_init+0x4f4>
ffffffffc0202f90:	00c45793          	srli	a5,s0,0xc
ffffffffc0202f94:	00093503          	ld	a0,0(s2)
ffffffffc0202f98:	3ae7f763          	bgeu	a5,a4,ffffffffc0203346 <pmm_init+0x876>
ffffffffc0202f9c:	0009b583          	ld	a1,0(s3)
ffffffffc0202fa0:	4601                	li	a2,0
ffffffffc0202fa2:	95a2                	add	a1,a1,s0
ffffffffc0202fa4:	a80ff0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc0202fa8:	36050f63          	beqz	a0,ffffffffc0203326 <pmm_init+0x856>
ffffffffc0202fac:	611c                	ld	a5,0(a0)
ffffffffc0202fae:	078a                	slli	a5,a5,0x2
ffffffffc0202fb0:	0157f7b3          	and	a5,a5,s5
ffffffffc0202fb4:	3a879663          	bne	a5,s0,ffffffffc0203360 <pmm_init+0x890>
ffffffffc0202fb8:	6098                	ld	a4,0(s1)
ffffffffc0202fba:	9452                	add	s0,s0,s4
ffffffffc0202fbc:	00c71793          	slli	a5,a4,0xc
ffffffffc0202fc0:	fcf468e3          	bltu	s0,a5,ffffffffc0202f90 <pmm_init+0x4c0>
ffffffffc0202fc4:	00093783          	ld	a5,0(s2)
ffffffffc0202fc8:	639c                	ld	a5,0(a5)
ffffffffc0202fca:	48079d63          	bnez	a5,ffffffffc0203464 <pmm_init+0x994>
ffffffffc0202fce:	100027f3          	csrr	a5,sstatus
ffffffffc0202fd2:	8b89                	andi	a5,a5,2
ffffffffc0202fd4:	26079463          	bnez	a5,ffffffffc020323c <pmm_init+0x76c>
ffffffffc0202fd8:	000b3783          	ld	a5,0(s6)
ffffffffc0202fdc:	4505                	li	a0,1
ffffffffc0202fde:	6f9c                	ld	a5,24(a5)
ffffffffc0202fe0:	9782                	jalr	a5
ffffffffc0202fe2:	8a2a                	mv	s4,a0
ffffffffc0202fe4:	00093503          	ld	a0,0(s2)
ffffffffc0202fe8:	4699                	li	a3,6
ffffffffc0202fea:	10000613          	li	a2,256
ffffffffc0202fee:	85d2                	mv	a1,s4
ffffffffc0202ff0:	9ebff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0202ff4:	4a051863          	bnez	a0,ffffffffc02034a4 <pmm_init+0x9d4>
ffffffffc0202ff8:	000a2703          	lw	a4,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0202ffc:	4785                	li	a5,1
ffffffffc0202ffe:	48f71363          	bne	a4,a5,ffffffffc0203484 <pmm_init+0x9b4>
ffffffffc0203002:	00093503          	ld	a0,0(s2)
ffffffffc0203006:	6405                	lui	s0,0x1
ffffffffc0203008:	4699                	li	a3,6
ffffffffc020300a:	10040613          	addi	a2,s0,256 # 1100 <_binary_bin_swap_img_size-0x6c00>
ffffffffc020300e:	85d2                	mv	a1,s4
ffffffffc0203010:	9cbff0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203014:	38051863          	bnez	a0,ffffffffc02033a4 <pmm_init+0x8d4>
ffffffffc0203018:	000a2703          	lw	a4,0(s4)
ffffffffc020301c:	4789                	li	a5,2
ffffffffc020301e:	4ef71363          	bne	a4,a5,ffffffffc0203504 <pmm_init+0xa34>
ffffffffc0203022:	0000a597          	auipc	a1,0xa
ffffffffc0203026:	a1e58593          	addi	a1,a1,-1506 # ffffffffc020ca40 <default_pmm_manager+0x740>
ffffffffc020302a:	10000513          	li	a0,256
ffffffffc020302e:	29c080ef          	jal	ra,ffffffffc020b2ca <strcpy>
ffffffffc0203032:	10040593          	addi	a1,s0,256
ffffffffc0203036:	10000513          	li	a0,256
ffffffffc020303a:	2a2080ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc020303e:	4a051363          	bnez	a0,ffffffffc02034e4 <pmm_init+0xa14>
ffffffffc0203042:	000bb683          	ld	a3,0(s7)
ffffffffc0203046:	00080737          	lui	a4,0x80
ffffffffc020304a:	547d                	li	s0,-1
ffffffffc020304c:	40da06b3          	sub	a3,s4,a3
ffffffffc0203050:	8699                	srai	a3,a3,0x6
ffffffffc0203052:	609c                	ld	a5,0(s1)
ffffffffc0203054:	96ba                	add	a3,a3,a4
ffffffffc0203056:	8031                	srli	s0,s0,0xc
ffffffffc0203058:	0086f733          	and	a4,a3,s0
ffffffffc020305c:	06b2                	slli	a3,a3,0xc
ffffffffc020305e:	6ef77263          	bgeu	a4,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203062:	0009b783          	ld	a5,0(s3)
ffffffffc0203066:	10000513          	li	a0,256
ffffffffc020306a:	96be                	add	a3,a3,a5
ffffffffc020306c:	10068023          	sb	zero,256(a3)
ffffffffc0203070:	224080ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc0203074:	44051863          	bnez	a0,ffffffffc02034c4 <pmm_init+0x9f4>
ffffffffc0203078:	00093a83          	ld	s5,0(s2)
ffffffffc020307c:	609c                	ld	a5,0(s1)
ffffffffc020307e:	000ab683          	ld	a3,0(s5) # fffffffffffff000 <end+0x3fd686f0>
ffffffffc0203082:	068a                	slli	a3,a3,0x2
ffffffffc0203084:	82b1                	srli	a3,a3,0xc
ffffffffc0203086:	2ef6fd63          	bgeu	a3,a5,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc020308a:	8c75                	and	s0,s0,a3
ffffffffc020308c:	06b2                	slli	a3,a3,0xc
ffffffffc020308e:	6af47a63          	bgeu	s0,a5,ffffffffc0203742 <pmm_init+0xc72>
ffffffffc0203092:	0009b403          	ld	s0,0(s3)
ffffffffc0203096:	9436                	add	s0,s0,a3
ffffffffc0203098:	100027f3          	csrr	a5,sstatus
ffffffffc020309c:	8b89                	andi	a5,a5,2
ffffffffc020309e:	1e079c63          	bnez	a5,ffffffffc0203296 <pmm_init+0x7c6>
ffffffffc02030a2:	000b3783          	ld	a5,0(s6)
ffffffffc02030a6:	4585                	li	a1,1
ffffffffc02030a8:	8552                	mv	a0,s4
ffffffffc02030aa:	739c                	ld	a5,32(a5)
ffffffffc02030ac:	9782                	jalr	a5
ffffffffc02030ae:	601c                	ld	a5,0(s0)
ffffffffc02030b0:	6098                	ld	a4,0(s1)
ffffffffc02030b2:	078a                	slli	a5,a5,0x2
ffffffffc02030b4:	83b1                	srli	a5,a5,0xc
ffffffffc02030b6:	2ce7f563          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ba:	000bb503          	ld	a0,0(s7)
ffffffffc02030be:	fff80737          	lui	a4,0xfff80
ffffffffc02030c2:	97ba                	add	a5,a5,a4
ffffffffc02030c4:	079a                	slli	a5,a5,0x6
ffffffffc02030c6:	953e                	add	a0,a0,a5
ffffffffc02030c8:	100027f3          	csrr	a5,sstatus
ffffffffc02030cc:	8b89                	andi	a5,a5,2
ffffffffc02030ce:	1a079863          	bnez	a5,ffffffffc020327e <pmm_init+0x7ae>
ffffffffc02030d2:	000b3783          	ld	a5,0(s6)
ffffffffc02030d6:	4585                	li	a1,1
ffffffffc02030d8:	739c                	ld	a5,32(a5)
ffffffffc02030da:	9782                	jalr	a5
ffffffffc02030dc:	000ab783          	ld	a5,0(s5)
ffffffffc02030e0:	6098                	ld	a4,0(s1)
ffffffffc02030e2:	078a                	slli	a5,a5,0x2
ffffffffc02030e4:	83b1                	srli	a5,a5,0xc
ffffffffc02030e6:	28e7fd63          	bgeu	a5,a4,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02030ea:	000bb503          	ld	a0,0(s7)
ffffffffc02030ee:	fff80737          	lui	a4,0xfff80
ffffffffc02030f2:	97ba                	add	a5,a5,a4
ffffffffc02030f4:	079a                	slli	a5,a5,0x6
ffffffffc02030f6:	953e                	add	a0,a0,a5
ffffffffc02030f8:	100027f3          	csrr	a5,sstatus
ffffffffc02030fc:	8b89                	andi	a5,a5,2
ffffffffc02030fe:	16079463          	bnez	a5,ffffffffc0203266 <pmm_init+0x796>
ffffffffc0203102:	000b3783          	ld	a5,0(s6)
ffffffffc0203106:	4585                	li	a1,1
ffffffffc0203108:	739c                	ld	a5,32(a5)
ffffffffc020310a:	9782                	jalr	a5
ffffffffc020310c:	00093783          	ld	a5,0(s2)
ffffffffc0203110:	0007b023          	sd	zero,0(a5)
ffffffffc0203114:	12000073          	sfence.vma
ffffffffc0203118:	100027f3          	csrr	a5,sstatus
ffffffffc020311c:	8b89                	andi	a5,a5,2
ffffffffc020311e:	12079a63          	bnez	a5,ffffffffc0203252 <pmm_init+0x782>
ffffffffc0203122:	000b3783          	ld	a5,0(s6)
ffffffffc0203126:	779c                	ld	a5,40(a5)
ffffffffc0203128:	9782                	jalr	a5
ffffffffc020312a:	842a                	mv	s0,a0
ffffffffc020312c:	488c1e63          	bne	s8,s0,ffffffffc02035c8 <pmm_init+0xaf8>
ffffffffc0203130:	0000a517          	auipc	a0,0xa
ffffffffc0203134:	98850513          	addi	a0,a0,-1656 # ffffffffc020cab8 <default_pmm_manager+0x7b8>
ffffffffc0203138:	86efd0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020313c:	7406                	ld	s0,96(sp)
ffffffffc020313e:	70a6                	ld	ra,104(sp)
ffffffffc0203140:	64e6                	ld	s1,88(sp)
ffffffffc0203142:	6946                	ld	s2,80(sp)
ffffffffc0203144:	69a6                	ld	s3,72(sp)
ffffffffc0203146:	6a06                	ld	s4,64(sp)
ffffffffc0203148:	7ae2                	ld	s5,56(sp)
ffffffffc020314a:	7b42                	ld	s6,48(sp)
ffffffffc020314c:	7ba2                	ld	s7,40(sp)
ffffffffc020314e:	7c02                	ld	s8,32(sp)
ffffffffc0203150:	6ce2                	ld	s9,24(sp)
ffffffffc0203152:	6165                	addi	sp,sp,112
ffffffffc0203154:	e17fe06f          	j	ffffffffc0201f6a <kmalloc_init>
ffffffffc0203158:	c80007b7          	lui	a5,0xc8000
ffffffffc020315c:	b411                	j	ffffffffc0202b60 <pmm_init+0x90>
ffffffffc020315e:	b15fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203162:	000b3783          	ld	a5,0(s6)
ffffffffc0203166:	4505                	li	a0,1
ffffffffc0203168:	6f9c                	ld	a5,24(a5)
ffffffffc020316a:	9782                	jalr	a5
ffffffffc020316c:	8c2a                	mv	s8,a0
ffffffffc020316e:	afffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203172:	b9a9                	j	ffffffffc0202dcc <pmm_init+0x2fc>
ffffffffc0203174:	afffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203178:	000b3783          	ld	a5,0(s6)
ffffffffc020317c:	4505                	li	a0,1
ffffffffc020317e:	6f9c                	ld	a5,24(a5)
ffffffffc0203180:	9782                	jalr	a5
ffffffffc0203182:	8a2a                	mv	s4,a0
ffffffffc0203184:	ae9fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203188:	b645                	j	ffffffffc0202d28 <pmm_init+0x258>
ffffffffc020318a:	ae9fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020318e:	000b3783          	ld	a5,0(s6)
ffffffffc0203192:	779c                	ld	a5,40(a5)
ffffffffc0203194:	9782                	jalr	a5
ffffffffc0203196:	842a                	mv	s0,a0
ffffffffc0203198:	ad5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020319c:	b6b9                	j	ffffffffc0202cea <pmm_init+0x21a>
ffffffffc020319e:	ad5fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031a2:	000b3783          	ld	a5,0(s6)
ffffffffc02031a6:	4505                	li	a0,1
ffffffffc02031a8:	6f9c                	ld	a5,24(a5)
ffffffffc02031aa:	9782                	jalr	a5
ffffffffc02031ac:	842a                	mv	s0,a0
ffffffffc02031ae:	abffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031b2:	bc99                	j	ffffffffc0202c08 <pmm_init+0x138>
ffffffffc02031b4:	6705                	lui	a4,0x1
ffffffffc02031b6:	177d                	addi	a4,a4,-1
ffffffffc02031b8:	96ba                	add	a3,a3,a4
ffffffffc02031ba:	8ff5                	and	a5,a5,a3
ffffffffc02031bc:	00c7d713          	srli	a4,a5,0xc
ffffffffc02031c0:	1ca77063          	bgeu	a4,a0,ffffffffc0203380 <pmm_init+0x8b0>
ffffffffc02031c4:	000b3683          	ld	a3,0(s6)
ffffffffc02031c8:	fff80537          	lui	a0,0xfff80
ffffffffc02031cc:	972a                	add	a4,a4,a0
ffffffffc02031ce:	6a94                	ld	a3,16(a3)
ffffffffc02031d0:	8c1d                	sub	s0,s0,a5
ffffffffc02031d2:	00671513          	slli	a0,a4,0x6
ffffffffc02031d6:	00c45593          	srli	a1,s0,0xc
ffffffffc02031da:	9532                	add	a0,a0,a2
ffffffffc02031dc:	9682                	jalr	a3
ffffffffc02031de:	0009b583          	ld	a1,0(s3)
ffffffffc02031e2:	bac5                	j	ffffffffc0202bd2 <pmm_init+0x102>
ffffffffc02031e4:	a8ffd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031e8:	000b3783          	ld	a5,0(s6)
ffffffffc02031ec:	779c                	ld	a5,40(a5)
ffffffffc02031ee:	9782                	jalr	a5
ffffffffc02031f0:	8c2a                	mv	s8,a0
ffffffffc02031f2:	a7bfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02031f6:	b361                	j	ffffffffc0202f7e <pmm_init+0x4ae>
ffffffffc02031f8:	a7bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02031fc:	000b3783          	ld	a5,0(s6)
ffffffffc0203200:	779c                	ld	a5,40(a5)
ffffffffc0203202:	9782                	jalr	a5
ffffffffc0203204:	8a2a                	mv	s4,a0
ffffffffc0203206:	a67fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020320a:	bb81                	j	ffffffffc0202f5a <pmm_init+0x48a>
ffffffffc020320c:	e42a                	sd	a0,8(sp)
ffffffffc020320e:	a65fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203212:	000b3783          	ld	a5,0(s6)
ffffffffc0203216:	6522                	ld	a0,8(sp)
ffffffffc0203218:	4585                	li	a1,1
ffffffffc020321a:	739c                	ld	a5,32(a5)
ffffffffc020321c:	9782                	jalr	a5
ffffffffc020321e:	a4ffd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203222:	bb21                	j	ffffffffc0202f3a <pmm_init+0x46a>
ffffffffc0203224:	e42a                	sd	a0,8(sp)
ffffffffc0203226:	a4dfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020322a:	000b3783          	ld	a5,0(s6)
ffffffffc020322e:	6522                	ld	a0,8(sp)
ffffffffc0203230:	4585                	li	a1,1
ffffffffc0203232:	739c                	ld	a5,32(a5)
ffffffffc0203234:	9782                	jalr	a5
ffffffffc0203236:	a37fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020323a:	b9c1                	j	ffffffffc0202f0a <pmm_init+0x43a>
ffffffffc020323c:	a37fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203240:	000b3783          	ld	a5,0(s6)
ffffffffc0203244:	4505                	li	a0,1
ffffffffc0203246:	6f9c                	ld	a5,24(a5)
ffffffffc0203248:	9782                	jalr	a5
ffffffffc020324a:	8a2a                	mv	s4,a0
ffffffffc020324c:	a21fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203250:	bb51                	j	ffffffffc0202fe4 <pmm_init+0x514>
ffffffffc0203252:	a21fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203256:	000b3783          	ld	a5,0(s6)
ffffffffc020325a:	779c                	ld	a5,40(a5)
ffffffffc020325c:	9782                	jalr	a5
ffffffffc020325e:	842a                	mv	s0,a0
ffffffffc0203260:	a0dfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203264:	b5e1                	j	ffffffffc020312c <pmm_init+0x65c>
ffffffffc0203266:	e42a                	sd	a0,8(sp)
ffffffffc0203268:	a0bfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020326c:	000b3783          	ld	a5,0(s6)
ffffffffc0203270:	6522                	ld	a0,8(sp)
ffffffffc0203272:	4585                	li	a1,1
ffffffffc0203274:	739c                	ld	a5,32(a5)
ffffffffc0203276:	9782                	jalr	a5
ffffffffc0203278:	9f5fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc020327c:	bd41                	j	ffffffffc020310c <pmm_init+0x63c>
ffffffffc020327e:	e42a                	sd	a0,8(sp)
ffffffffc0203280:	9f3fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203284:	000b3783          	ld	a5,0(s6)
ffffffffc0203288:	6522                	ld	a0,8(sp)
ffffffffc020328a:	4585                	li	a1,1
ffffffffc020328c:	739c                	ld	a5,32(a5)
ffffffffc020328e:	9782                	jalr	a5
ffffffffc0203290:	9ddfd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203294:	b5a1                	j	ffffffffc02030dc <pmm_init+0x60c>
ffffffffc0203296:	9ddfd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020329a:	000b3783          	ld	a5,0(s6)
ffffffffc020329e:	4585                	li	a1,1
ffffffffc02032a0:	8552                	mv	a0,s4
ffffffffc02032a2:	739c                	ld	a5,32(a5)
ffffffffc02032a4:	9782                	jalr	a5
ffffffffc02032a6:	9c7fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02032aa:	b511                	j	ffffffffc02030ae <pmm_init+0x5de>
ffffffffc02032ac:	00010417          	auipc	s0,0x10
ffffffffc02032b0:	d5440413          	addi	s0,s0,-684 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032b4:	00010797          	auipc	a5,0x10
ffffffffc02032b8:	d4c78793          	addi	a5,a5,-692 # ffffffffc0213000 <boot_page_table_sv39>
ffffffffc02032bc:	a0f41de3          	bne	s0,a5,ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc02032c0:	4581                	li	a1,0
ffffffffc02032c2:	6605                	lui	a2,0x1
ffffffffc02032c4:	8522                	mv	a0,s0
ffffffffc02032c6:	070080ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc02032ca:	0000d597          	auipc	a1,0xd
ffffffffc02032ce:	d3658593          	addi	a1,a1,-714 # ffffffffc0210000 <bootstackguard>
ffffffffc02032d2:	0000e797          	auipc	a5,0xe
ffffffffc02032d6:	d20786a3          	sb	zero,-723(a5) # ffffffffc0210fff <bootstackguard+0xfff>
ffffffffc02032da:	0000d797          	auipc	a5,0xd
ffffffffc02032de:	d2078323          	sb	zero,-730(a5) # ffffffffc0210000 <bootstackguard>
ffffffffc02032e2:	00093503          	ld	a0,0(s2)
ffffffffc02032e6:	2555ec63          	bltu	a1,s5,ffffffffc020353e <pmm_init+0xa6e>
ffffffffc02032ea:	0009b683          	ld	a3,0(s3)
ffffffffc02032ee:	4701                	li	a4,0
ffffffffc02032f0:	6605                	lui	a2,0x1
ffffffffc02032f2:	40d586b3          	sub	a3,a1,a3
ffffffffc02032f6:	956ff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc02032fa:	00093503          	ld	a0,0(s2)
ffffffffc02032fe:	23546363          	bltu	s0,s5,ffffffffc0203524 <pmm_init+0xa54>
ffffffffc0203302:	0009b683          	ld	a3,0(s3)
ffffffffc0203306:	4701                	li	a4,0
ffffffffc0203308:	6605                	lui	a2,0x1
ffffffffc020330a:	40d406b3          	sub	a3,s0,a3
ffffffffc020330e:	85a2                	mv	a1,s0
ffffffffc0203310:	93cff0ef          	jal	ra,ffffffffc020244c <boot_map_segment>
ffffffffc0203314:	12000073          	sfence.vma
ffffffffc0203318:	00009517          	auipc	a0,0x9
ffffffffc020331c:	2b050513          	addi	a0,a0,688 # ffffffffc020c5c8 <default_pmm_manager+0x2c8>
ffffffffc0203320:	e87fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0203324:	ba4d                	j	ffffffffc0202cd6 <pmm_init+0x206>
ffffffffc0203326:	00009697          	auipc	a3,0x9
ffffffffc020332a:	5f268693          	addi	a3,a3,1522 # ffffffffc020c918 <default_pmm_manager+0x618>
ffffffffc020332e:	00008617          	auipc	a2,0x8
ffffffffc0203332:	4ea60613          	addi	a2,a2,1258 # ffffffffc020b818 <commands+0x210>
ffffffffc0203336:	29500593          	li	a1,661
ffffffffc020333a:	00009517          	auipc	a0,0x9
ffffffffc020333e:	11650513          	addi	a0,a0,278 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203342:	95cfd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203346:	86a2                	mv	a3,s0
ffffffffc0203348:	00009617          	auipc	a2,0x9
ffffffffc020334c:	ff060613          	addi	a2,a2,-16 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0203350:	29500593          	li	a1,661
ffffffffc0203354:	00009517          	auipc	a0,0x9
ffffffffc0203358:	0fc50513          	addi	a0,a0,252 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020335c:	942fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203360:	00009697          	auipc	a3,0x9
ffffffffc0203364:	5f868693          	addi	a3,a3,1528 # ffffffffc020c958 <default_pmm_manager+0x658>
ffffffffc0203368:	00008617          	auipc	a2,0x8
ffffffffc020336c:	4b060613          	addi	a2,a2,1200 # ffffffffc020b818 <commands+0x210>
ffffffffc0203370:	29600593          	li	a1,662
ffffffffc0203374:	00009517          	auipc	a0,0x9
ffffffffc0203378:	0dc50513          	addi	a0,a0,220 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020337c:	922fd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203380:	db5fe0ef          	jal	ra,ffffffffc0202134 <pa2page.part.0>
ffffffffc0203384:	00009697          	auipc	a3,0x9
ffffffffc0203388:	3fc68693          	addi	a3,a3,1020 # ffffffffc020c780 <default_pmm_manager+0x480>
ffffffffc020338c:	00008617          	auipc	a2,0x8
ffffffffc0203390:	48c60613          	addi	a2,a2,1164 # ffffffffc020b818 <commands+0x210>
ffffffffc0203394:	27200593          	li	a1,626
ffffffffc0203398:	00009517          	auipc	a0,0x9
ffffffffc020339c:	0b850513          	addi	a0,a0,184 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02033a0:	8fefd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033a4:	00009697          	auipc	a3,0x9
ffffffffc02033a8:	63c68693          	addi	a3,a3,1596 # ffffffffc020c9e0 <default_pmm_manager+0x6e0>
ffffffffc02033ac:	00008617          	auipc	a2,0x8
ffffffffc02033b0:	46c60613          	addi	a2,a2,1132 # ffffffffc020b818 <commands+0x210>
ffffffffc02033b4:	29f00593          	li	a1,671
ffffffffc02033b8:	00009517          	auipc	a0,0x9
ffffffffc02033bc:	09850513          	addi	a0,a0,152 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02033c0:	8defd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033c4:	00009697          	auipc	a3,0x9
ffffffffc02033c8:	4dc68693          	addi	a3,a3,1244 # ffffffffc020c8a0 <default_pmm_manager+0x5a0>
ffffffffc02033cc:	00008617          	auipc	a2,0x8
ffffffffc02033d0:	44c60613          	addi	a2,a2,1100 # ffffffffc020b818 <commands+0x210>
ffffffffc02033d4:	27e00593          	li	a1,638
ffffffffc02033d8:	00009517          	auipc	a0,0x9
ffffffffc02033dc:	07850513          	addi	a0,a0,120 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02033e0:	8befd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02033e4:	00009697          	auipc	a3,0x9
ffffffffc02033e8:	48c68693          	addi	a3,a3,1164 # ffffffffc020c870 <default_pmm_manager+0x570>
ffffffffc02033ec:	00008617          	auipc	a2,0x8
ffffffffc02033f0:	42c60613          	addi	a2,a2,1068 # ffffffffc020b818 <commands+0x210>
ffffffffc02033f4:	27400593          	li	a1,628
ffffffffc02033f8:	00009517          	auipc	a0,0x9
ffffffffc02033fc:	05850513          	addi	a0,a0,88 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203400:	89efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203404:	00009697          	auipc	a3,0x9
ffffffffc0203408:	2dc68693          	addi	a3,a3,732 # ffffffffc020c6e0 <default_pmm_manager+0x3e0>
ffffffffc020340c:	00008617          	auipc	a2,0x8
ffffffffc0203410:	40c60613          	addi	a2,a2,1036 # ffffffffc020b818 <commands+0x210>
ffffffffc0203414:	27300593          	li	a1,627
ffffffffc0203418:	00009517          	auipc	a0,0x9
ffffffffc020341c:	03850513          	addi	a0,a0,56 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203420:	87efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203424:	00009697          	auipc	a3,0x9
ffffffffc0203428:	43468693          	addi	a3,a3,1076 # ffffffffc020c858 <default_pmm_manager+0x558>
ffffffffc020342c:	00008617          	auipc	a2,0x8
ffffffffc0203430:	3ec60613          	addi	a2,a2,1004 # ffffffffc020b818 <commands+0x210>
ffffffffc0203434:	27800593          	li	a1,632
ffffffffc0203438:	00009517          	auipc	a0,0x9
ffffffffc020343c:	01850513          	addi	a0,a0,24 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203440:	85efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203444:	00009697          	auipc	a3,0x9
ffffffffc0203448:	2b468693          	addi	a3,a3,692 # ffffffffc020c6f8 <default_pmm_manager+0x3f8>
ffffffffc020344c:	00008617          	auipc	a2,0x8
ffffffffc0203450:	3cc60613          	addi	a2,a2,972 # ffffffffc020b818 <commands+0x210>
ffffffffc0203454:	27700593          	li	a1,631
ffffffffc0203458:	00009517          	auipc	a0,0x9
ffffffffc020345c:	ff850513          	addi	a0,a0,-8 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203460:	83efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203464:	00009697          	auipc	a3,0x9
ffffffffc0203468:	50c68693          	addi	a3,a3,1292 # ffffffffc020c970 <default_pmm_manager+0x670>
ffffffffc020346c:	00008617          	auipc	a2,0x8
ffffffffc0203470:	3ac60613          	addi	a2,a2,940 # ffffffffc020b818 <commands+0x210>
ffffffffc0203474:	29900593          	li	a1,665
ffffffffc0203478:	00009517          	auipc	a0,0x9
ffffffffc020347c:	fd850513          	addi	a0,a0,-40 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203480:	81efd0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203484:	00009697          	auipc	a3,0x9
ffffffffc0203488:	54468693          	addi	a3,a3,1348 # ffffffffc020c9c8 <default_pmm_manager+0x6c8>
ffffffffc020348c:	00008617          	auipc	a2,0x8
ffffffffc0203490:	38c60613          	addi	a2,a2,908 # ffffffffc020b818 <commands+0x210>
ffffffffc0203494:	29e00593          	li	a1,670
ffffffffc0203498:	00009517          	auipc	a0,0x9
ffffffffc020349c:	fb850513          	addi	a0,a0,-72 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02034a0:	ffffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034a4:	00009697          	auipc	a3,0x9
ffffffffc02034a8:	4e468693          	addi	a3,a3,1252 # ffffffffc020c988 <default_pmm_manager+0x688>
ffffffffc02034ac:	00008617          	auipc	a2,0x8
ffffffffc02034b0:	36c60613          	addi	a2,a2,876 # ffffffffc020b818 <commands+0x210>
ffffffffc02034b4:	29d00593          	li	a1,669
ffffffffc02034b8:	00009517          	auipc	a0,0x9
ffffffffc02034bc:	f9850513          	addi	a0,a0,-104 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02034c0:	fdffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034c4:	00009697          	auipc	a3,0x9
ffffffffc02034c8:	5cc68693          	addi	a3,a3,1484 # ffffffffc020ca90 <default_pmm_manager+0x790>
ffffffffc02034cc:	00008617          	auipc	a2,0x8
ffffffffc02034d0:	34c60613          	addi	a2,a2,844 # ffffffffc020b818 <commands+0x210>
ffffffffc02034d4:	2a700593          	li	a1,679
ffffffffc02034d8:	00009517          	auipc	a0,0x9
ffffffffc02034dc:	f7850513          	addi	a0,a0,-136 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02034e0:	fbffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02034e4:	00009697          	auipc	a3,0x9
ffffffffc02034e8:	57468693          	addi	a3,a3,1396 # ffffffffc020ca58 <default_pmm_manager+0x758>
ffffffffc02034ec:	00008617          	auipc	a2,0x8
ffffffffc02034f0:	32c60613          	addi	a2,a2,812 # ffffffffc020b818 <commands+0x210>
ffffffffc02034f4:	2a400593          	li	a1,676
ffffffffc02034f8:	00009517          	auipc	a0,0x9
ffffffffc02034fc:	f5850513          	addi	a0,a0,-168 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203500:	f9ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203504:	00009697          	auipc	a3,0x9
ffffffffc0203508:	52468693          	addi	a3,a3,1316 # ffffffffc020ca28 <default_pmm_manager+0x728>
ffffffffc020350c:	00008617          	auipc	a2,0x8
ffffffffc0203510:	30c60613          	addi	a2,a2,780 # ffffffffc020b818 <commands+0x210>
ffffffffc0203514:	2a000593          	li	a1,672
ffffffffc0203518:	00009517          	auipc	a0,0x9
ffffffffc020351c:	f3850513          	addi	a0,a0,-200 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203520:	f7ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203524:	86a2                	mv	a3,s0
ffffffffc0203526:	00009617          	auipc	a2,0x9
ffffffffc020352a:	eba60613          	addi	a2,a2,-326 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc020352e:	0dc00593          	li	a1,220
ffffffffc0203532:	00009517          	auipc	a0,0x9
ffffffffc0203536:	f1e50513          	addi	a0,a0,-226 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020353a:	f65fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020353e:	86ae                	mv	a3,a1
ffffffffc0203540:	00009617          	auipc	a2,0x9
ffffffffc0203544:	ea060613          	addi	a2,a2,-352 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0203548:	0db00593          	li	a1,219
ffffffffc020354c:	00009517          	auipc	a0,0x9
ffffffffc0203550:	f0450513          	addi	a0,a0,-252 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203554:	f4bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203558:	00009697          	auipc	a3,0x9
ffffffffc020355c:	0b868693          	addi	a3,a3,184 # ffffffffc020c610 <default_pmm_manager+0x310>
ffffffffc0203560:	00008617          	auipc	a2,0x8
ffffffffc0203564:	2b860613          	addi	a2,a2,696 # ffffffffc020b818 <commands+0x210>
ffffffffc0203568:	25700593          	li	a1,599
ffffffffc020356c:	00009517          	auipc	a0,0x9
ffffffffc0203570:	ee450513          	addi	a0,a0,-284 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203574:	f2bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203578:	00009697          	auipc	a3,0x9
ffffffffc020357c:	07868693          	addi	a3,a3,120 # ffffffffc020c5f0 <default_pmm_manager+0x2f0>
ffffffffc0203580:	00008617          	auipc	a2,0x8
ffffffffc0203584:	29860613          	addi	a2,a2,664 # ffffffffc020b818 <commands+0x210>
ffffffffc0203588:	25600593          	li	a1,598
ffffffffc020358c:	00009517          	auipc	a0,0x9
ffffffffc0203590:	ec450513          	addi	a0,a0,-316 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203594:	f0bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203598:	00009617          	auipc	a2,0x9
ffffffffc020359c:	fe860613          	addi	a2,a2,-24 # ffffffffc020c580 <default_pmm_manager+0x280>
ffffffffc02035a0:	0aa00593          	li	a1,170
ffffffffc02035a4:	00009517          	auipc	a0,0x9
ffffffffc02035a8:	eac50513          	addi	a0,a0,-340 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02035ac:	ef3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035b0:	00009617          	auipc	a2,0x9
ffffffffc02035b4:	f3860613          	addi	a2,a2,-200 # ffffffffc020c4e8 <default_pmm_manager+0x1e8>
ffffffffc02035b8:	06500593          	li	a1,101
ffffffffc02035bc:	00009517          	auipc	a0,0x9
ffffffffc02035c0:	e9450513          	addi	a0,a0,-364 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02035c4:	edbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035c8:	00009697          	auipc	a3,0x9
ffffffffc02035cc:	30868693          	addi	a3,a3,776 # ffffffffc020c8d0 <default_pmm_manager+0x5d0>
ffffffffc02035d0:	00008617          	auipc	a2,0x8
ffffffffc02035d4:	24860613          	addi	a2,a2,584 # ffffffffc020b818 <commands+0x210>
ffffffffc02035d8:	2b000593          	li	a1,688
ffffffffc02035dc:	00009517          	auipc	a0,0x9
ffffffffc02035e0:	e7450513          	addi	a0,a0,-396 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02035e4:	ebbfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02035e8:	00009697          	auipc	a3,0x9
ffffffffc02035ec:	12868693          	addi	a3,a3,296 # ffffffffc020c710 <default_pmm_manager+0x410>
ffffffffc02035f0:	00008617          	auipc	a2,0x8
ffffffffc02035f4:	22860613          	addi	a2,a2,552 # ffffffffc020b818 <commands+0x210>
ffffffffc02035f8:	26500593          	li	a1,613
ffffffffc02035fc:	00009517          	auipc	a0,0x9
ffffffffc0203600:	e5450513          	addi	a0,a0,-428 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203604:	e9bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203608:	86d6                	mv	a3,s5
ffffffffc020360a:	00009617          	auipc	a2,0x9
ffffffffc020360e:	d2e60613          	addi	a2,a2,-722 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0203612:	26400593          	li	a1,612
ffffffffc0203616:	00009517          	auipc	a0,0x9
ffffffffc020361a:	e3a50513          	addi	a0,a0,-454 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020361e:	e81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203622:	00009697          	auipc	a3,0x9
ffffffffc0203626:	23668693          	addi	a3,a3,566 # ffffffffc020c858 <default_pmm_manager+0x558>
ffffffffc020362a:	00008617          	auipc	a2,0x8
ffffffffc020362e:	1ee60613          	addi	a2,a2,494 # ffffffffc020b818 <commands+0x210>
ffffffffc0203632:	27100593          	li	a1,625
ffffffffc0203636:	00009517          	auipc	a0,0x9
ffffffffc020363a:	e1a50513          	addi	a0,a0,-486 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020363e:	e61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203642:	00009697          	auipc	a3,0x9
ffffffffc0203646:	1fe68693          	addi	a3,a3,510 # ffffffffc020c840 <default_pmm_manager+0x540>
ffffffffc020364a:	00008617          	auipc	a2,0x8
ffffffffc020364e:	1ce60613          	addi	a2,a2,462 # ffffffffc020b818 <commands+0x210>
ffffffffc0203652:	27000593          	li	a1,624
ffffffffc0203656:	00009517          	auipc	a0,0x9
ffffffffc020365a:	dfa50513          	addi	a0,a0,-518 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020365e:	e41fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203662:	00009697          	auipc	a3,0x9
ffffffffc0203666:	1ae68693          	addi	a3,a3,430 # ffffffffc020c810 <default_pmm_manager+0x510>
ffffffffc020366a:	00008617          	auipc	a2,0x8
ffffffffc020366e:	1ae60613          	addi	a2,a2,430 # ffffffffc020b818 <commands+0x210>
ffffffffc0203672:	26f00593          	li	a1,623
ffffffffc0203676:	00009517          	auipc	a0,0x9
ffffffffc020367a:	dda50513          	addi	a0,a0,-550 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020367e:	e21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203682:	00009697          	auipc	a3,0x9
ffffffffc0203686:	17668693          	addi	a3,a3,374 # ffffffffc020c7f8 <default_pmm_manager+0x4f8>
ffffffffc020368a:	00008617          	auipc	a2,0x8
ffffffffc020368e:	18e60613          	addi	a2,a2,398 # ffffffffc020b818 <commands+0x210>
ffffffffc0203692:	26d00593          	li	a1,621
ffffffffc0203696:	00009517          	auipc	a0,0x9
ffffffffc020369a:	dba50513          	addi	a0,a0,-582 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020369e:	e01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036a2:	00009697          	auipc	a3,0x9
ffffffffc02036a6:	13668693          	addi	a3,a3,310 # ffffffffc020c7d8 <default_pmm_manager+0x4d8>
ffffffffc02036aa:	00008617          	auipc	a2,0x8
ffffffffc02036ae:	16e60613          	addi	a2,a2,366 # ffffffffc020b818 <commands+0x210>
ffffffffc02036b2:	26c00593          	li	a1,620
ffffffffc02036b6:	00009517          	auipc	a0,0x9
ffffffffc02036ba:	d9a50513          	addi	a0,a0,-614 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02036be:	de1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036c2:	00009697          	auipc	a3,0x9
ffffffffc02036c6:	10668693          	addi	a3,a3,262 # ffffffffc020c7c8 <default_pmm_manager+0x4c8>
ffffffffc02036ca:	00008617          	auipc	a2,0x8
ffffffffc02036ce:	14e60613          	addi	a2,a2,334 # ffffffffc020b818 <commands+0x210>
ffffffffc02036d2:	26b00593          	li	a1,619
ffffffffc02036d6:	00009517          	auipc	a0,0x9
ffffffffc02036da:	d7a50513          	addi	a0,a0,-646 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02036de:	dc1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02036e2:	00009697          	auipc	a3,0x9
ffffffffc02036e6:	0d668693          	addi	a3,a3,214 # ffffffffc020c7b8 <default_pmm_manager+0x4b8>
ffffffffc02036ea:	00008617          	auipc	a2,0x8
ffffffffc02036ee:	12e60613          	addi	a2,a2,302 # ffffffffc020b818 <commands+0x210>
ffffffffc02036f2:	26a00593          	li	a1,618
ffffffffc02036f6:	00009517          	auipc	a0,0x9
ffffffffc02036fa:	d5a50513          	addi	a0,a0,-678 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02036fe:	da1fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203702:	00009697          	auipc	a3,0x9
ffffffffc0203706:	07e68693          	addi	a3,a3,126 # ffffffffc020c780 <default_pmm_manager+0x480>
ffffffffc020370a:	00008617          	auipc	a2,0x8
ffffffffc020370e:	10e60613          	addi	a2,a2,270 # ffffffffc020b818 <commands+0x210>
ffffffffc0203712:	26900593          	li	a1,617
ffffffffc0203716:	00009517          	auipc	a0,0x9
ffffffffc020371a:	d3a50513          	addi	a0,a0,-710 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020371e:	d81fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203722:	00009697          	auipc	a3,0x9
ffffffffc0203726:	1ae68693          	addi	a3,a3,430 # ffffffffc020c8d0 <default_pmm_manager+0x5d0>
ffffffffc020372a:	00008617          	auipc	a2,0x8
ffffffffc020372e:	0ee60613          	addi	a2,a2,238 # ffffffffc020b818 <commands+0x210>
ffffffffc0203732:	28600593          	li	a1,646
ffffffffc0203736:	00009517          	auipc	a0,0x9
ffffffffc020373a:	d1a50513          	addi	a0,a0,-742 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020373e:	d61fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203742:	00009617          	auipc	a2,0x9
ffffffffc0203746:	bf660613          	addi	a2,a2,-1034 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc020374a:	07100593          	li	a1,113
ffffffffc020374e:	00009517          	auipc	a0,0x9
ffffffffc0203752:	c1250513          	addi	a0,a0,-1006 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0203756:	d49fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020375a:	86a2                	mv	a3,s0
ffffffffc020375c:	00009617          	auipc	a2,0x9
ffffffffc0203760:	c8460613          	addi	a2,a2,-892 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0203764:	0ca00593          	li	a1,202
ffffffffc0203768:	00009517          	auipc	a0,0x9
ffffffffc020376c:	ce850513          	addi	a0,a0,-792 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203770:	d2ffc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203774:	00009617          	auipc	a2,0x9
ffffffffc0203778:	c6c60613          	addi	a2,a2,-916 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc020377c:	08100593          	li	a1,129
ffffffffc0203780:	00009517          	auipc	a0,0x9
ffffffffc0203784:	cd050513          	addi	a0,a0,-816 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203788:	d17fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020378c:	00009697          	auipc	a3,0x9
ffffffffc0203790:	fb468693          	addi	a3,a3,-76 # ffffffffc020c740 <default_pmm_manager+0x440>
ffffffffc0203794:	00008617          	auipc	a2,0x8
ffffffffc0203798:	08460613          	addi	a2,a2,132 # ffffffffc020b818 <commands+0x210>
ffffffffc020379c:	26800593          	li	a1,616
ffffffffc02037a0:	00009517          	auipc	a0,0x9
ffffffffc02037a4:	cb050513          	addi	a0,a0,-848 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02037a8:	cf7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037ac:	00009697          	auipc	a3,0x9
ffffffffc02037b0:	ed468693          	addi	a3,a3,-300 # ffffffffc020c680 <default_pmm_manager+0x380>
ffffffffc02037b4:	00008617          	auipc	a2,0x8
ffffffffc02037b8:	06460613          	addi	a2,a2,100 # ffffffffc020b818 <commands+0x210>
ffffffffc02037bc:	25c00593          	li	a1,604
ffffffffc02037c0:	00009517          	auipc	a0,0x9
ffffffffc02037c4:	c9050513          	addi	a0,a0,-880 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02037c8:	cd7fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037cc:	985fe0ef          	jal	ra,ffffffffc0202150 <pte2page.part.0>
ffffffffc02037d0:	00009697          	auipc	a3,0x9
ffffffffc02037d4:	ee068693          	addi	a3,a3,-288 # ffffffffc020c6b0 <default_pmm_manager+0x3b0>
ffffffffc02037d8:	00008617          	auipc	a2,0x8
ffffffffc02037dc:	04060613          	addi	a2,a2,64 # ffffffffc020b818 <commands+0x210>
ffffffffc02037e0:	25f00593          	li	a1,607
ffffffffc02037e4:	00009517          	auipc	a0,0x9
ffffffffc02037e8:	c6c50513          	addi	a0,a0,-916 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02037ec:	cb3fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02037f0:	00009697          	auipc	a3,0x9
ffffffffc02037f4:	e6068693          	addi	a3,a3,-416 # ffffffffc020c650 <default_pmm_manager+0x350>
ffffffffc02037f8:	00008617          	auipc	a2,0x8
ffffffffc02037fc:	02060613          	addi	a2,a2,32 # ffffffffc020b818 <commands+0x210>
ffffffffc0203800:	25800593          	li	a1,600
ffffffffc0203804:	00009517          	auipc	a0,0x9
ffffffffc0203808:	c4c50513          	addi	a0,a0,-948 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020380c:	c93fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203810:	00009697          	auipc	a3,0x9
ffffffffc0203814:	ed068693          	addi	a3,a3,-304 # ffffffffc020c6e0 <default_pmm_manager+0x3e0>
ffffffffc0203818:	00008617          	auipc	a2,0x8
ffffffffc020381c:	00060613          	mv	a2,a2
ffffffffc0203820:	26000593          	li	a1,608
ffffffffc0203824:	00009517          	auipc	a0,0x9
ffffffffc0203828:	c2c50513          	addi	a0,a0,-980 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020382c:	c73fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203830:	00009617          	auipc	a2,0x9
ffffffffc0203834:	b0860613          	addi	a2,a2,-1272 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0203838:	26300593          	li	a1,611
ffffffffc020383c:	00009517          	auipc	a0,0x9
ffffffffc0203840:	c1450513          	addi	a0,a0,-1004 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203844:	c5bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203848:	00009697          	auipc	a3,0x9
ffffffffc020384c:	eb068693          	addi	a3,a3,-336 # ffffffffc020c6f8 <default_pmm_manager+0x3f8>
ffffffffc0203850:	00008617          	auipc	a2,0x8
ffffffffc0203854:	fc860613          	addi	a2,a2,-56 # ffffffffc020b818 <commands+0x210>
ffffffffc0203858:	26100593          	li	a1,609
ffffffffc020385c:	00009517          	auipc	a0,0x9
ffffffffc0203860:	bf450513          	addi	a0,a0,-1036 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203864:	c3bfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203868:	86ca                	mv	a3,s2
ffffffffc020386a:	00009617          	auipc	a2,0x9
ffffffffc020386e:	b7660613          	addi	a2,a2,-1162 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0203872:	0c600593          	li	a1,198
ffffffffc0203876:	00009517          	auipc	a0,0x9
ffffffffc020387a:	bda50513          	addi	a0,a0,-1062 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020387e:	c21fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203882:	00009697          	auipc	a3,0x9
ffffffffc0203886:	fd668693          	addi	a3,a3,-42 # ffffffffc020c858 <default_pmm_manager+0x558>
ffffffffc020388a:	00008617          	auipc	a2,0x8
ffffffffc020388e:	f8e60613          	addi	a2,a2,-114 # ffffffffc020b818 <commands+0x210>
ffffffffc0203892:	27c00593          	li	a1,636
ffffffffc0203896:	00009517          	auipc	a0,0x9
ffffffffc020389a:	bba50513          	addi	a0,a0,-1094 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc020389e:	c01fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02038a2:	00009697          	auipc	a3,0x9
ffffffffc02038a6:	fe668693          	addi	a3,a3,-26 # ffffffffc020c888 <default_pmm_manager+0x588>
ffffffffc02038aa:	00008617          	auipc	a2,0x8
ffffffffc02038ae:	f6e60613          	addi	a2,a2,-146 # ffffffffc020b818 <commands+0x210>
ffffffffc02038b2:	27b00593          	li	a1,635
ffffffffc02038b6:	00009517          	auipc	a0,0x9
ffffffffc02038ba:	b9a50513          	addi	a0,a0,-1126 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc02038be:	be1fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02038c2 <copy_range>:
ffffffffc02038c2:	7159                	addi	sp,sp,-112
ffffffffc02038c4:	00d667b3          	or	a5,a2,a3
ffffffffc02038c8:	f486                	sd	ra,104(sp)
ffffffffc02038ca:	f0a2                	sd	s0,96(sp)
ffffffffc02038cc:	eca6                	sd	s1,88(sp)
ffffffffc02038ce:	e8ca                	sd	s2,80(sp)
ffffffffc02038d0:	e4ce                	sd	s3,72(sp)
ffffffffc02038d2:	e0d2                	sd	s4,64(sp)
ffffffffc02038d4:	fc56                	sd	s5,56(sp)
ffffffffc02038d6:	f85a                	sd	s6,48(sp)
ffffffffc02038d8:	f45e                	sd	s7,40(sp)
ffffffffc02038da:	f062                	sd	s8,32(sp)
ffffffffc02038dc:	ec66                	sd	s9,24(sp)
ffffffffc02038de:	e86a                	sd	s10,16(sp)
ffffffffc02038e0:	e46e                	sd	s11,8(sp)
ffffffffc02038e2:	17d2                	slli	a5,a5,0x34
ffffffffc02038e4:	22079563          	bnez	a5,ffffffffc0203b0e <copy_range+0x24c>
ffffffffc02038e8:	002007b7          	lui	a5,0x200
ffffffffc02038ec:	8432                	mv	s0,a2
ffffffffc02038ee:	1af66863          	bltu	a2,a5,ffffffffc0203a9e <copy_range+0x1dc>
ffffffffc02038f2:	8936                	mv	s2,a3
ffffffffc02038f4:	1ad67563          	bgeu	a2,a3,ffffffffc0203a9e <copy_range+0x1dc>
ffffffffc02038f8:	4785                	li	a5,1
ffffffffc02038fa:	07fe                	slli	a5,a5,0x1f
ffffffffc02038fc:	1ad7e163          	bltu	a5,a3,ffffffffc0203a9e <copy_range+0x1dc>
ffffffffc0203900:	5b7d                	li	s6,-1
ffffffffc0203902:	8aaa                	mv	s5,a0
ffffffffc0203904:	89ae                	mv	s3,a1
ffffffffc0203906:	6a05                	lui	s4,0x1
ffffffffc0203908:	00093c17          	auipc	s8,0x93
ffffffffc020390c:	f98c0c13          	addi	s8,s8,-104 # ffffffffc02968a0 <npage>
ffffffffc0203910:	00093b97          	auipc	s7,0x93
ffffffffc0203914:	f98b8b93          	addi	s7,s7,-104 # ffffffffc02968a8 <pages>
ffffffffc0203918:	00cb5b13          	srli	s6,s6,0xc
ffffffffc020391c:	00093c97          	auipc	s9,0x93
ffffffffc0203920:	f94c8c93          	addi	s9,s9,-108 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203924:	4601                	li	a2,0
ffffffffc0203926:	85a2                	mv	a1,s0
ffffffffc0203928:	854e                	mv	a0,s3
ffffffffc020392a:	8fbfe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020392e:	84aa                	mv	s1,a0
ffffffffc0203930:	c965                	beqz	a0,ffffffffc0203a20 <copy_range+0x15e>
ffffffffc0203932:	611c                	ld	a5,0(a0)
ffffffffc0203934:	8b85                	andi	a5,a5,1
ffffffffc0203936:	e78d                	bnez	a5,ffffffffc0203960 <copy_range+0x9e>
ffffffffc0203938:	9452                	add	s0,s0,s4
ffffffffc020393a:	ff2465e3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc020393e:	4481                	li	s1,0
ffffffffc0203940:	70a6                	ld	ra,104(sp)
ffffffffc0203942:	7406                	ld	s0,96(sp)
ffffffffc0203944:	6946                	ld	s2,80(sp)
ffffffffc0203946:	69a6                	ld	s3,72(sp)
ffffffffc0203948:	6a06                	ld	s4,64(sp)
ffffffffc020394a:	7ae2                	ld	s5,56(sp)
ffffffffc020394c:	7b42                	ld	s6,48(sp)
ffffffffc020394e:	7ba2                	ld	s7,40(sp)
ffffffffc0203950:	7c02                	ld	s8,32(sp)
ffffffffc0203952:	6ce2                	ld	s9,24(sp)
ffffffffc0203954:	6d42                	ld	s10,16(sp)
ffffffffc0203956:	6da2                	ld	s11,8(sp)
ffffffffc0203958:	8526                	mv	a0,s1
ffffffffc020395a:	64e6                	ld	s1,88(sp)
ffffffffc020395c:	6165                	addi	sp,sp,112
ffffffffc020395e:	8082                	ret
ffffffffc0203960:	4605                	li	a2,1
ffffffffc0203962:	85a2                	mv	a1,s0
ffffffffc0203964:	8556                	mv	a0,s5
ffffffffc0203966:	8bffe0ef          	jal	ra,ffffffffc0202224 <get_pte>
ffffffffc020396a:	c165                	beqz	a0,ffffffffc0203a4a <copy_range+0x188>
ffffffffc020396c:	609c                	ld	a5,0(s1)
ffffffffc020396e:	0017f713          	andi	a4,a5,1
ffffffffc0203972:	01f7f493          	andi	s1,a5,31
ffffffffc0203976:	18070063          	beqz	a4,ffffffffc0203af6 <copy_range+0x234>
ffffffffc020397a:	000c3683          	ld	a3,0(s8)
ffffffffc020397e:	078a                	slli	a5,a5,0x2
ffffffffc0203980:	00c7d713          	srli	a4,a5,0xc
ffffffffc0203984:	14d77d63          	bgeu	a4,a3,ffffffffc0203ade <copy_range+0x21c>
ffffffffc0203988:	000bb783          	ld	a5,0(s7)
ffffffffc020398c:	fff806b7          	lui	a3,0xfff80
ffffffffc0203990:	9736                	add	a4,a4,a3
ffffffffc0203992:	071a                	slli	a4,a4,0x6
ffffffffc0203994:	00e78db3          	add	s11,a5,a4
ffffffffc0203998:	10002773          	csrr	a4,sstatus
ffffffffc020399c:	8b09                	andi	a4,a4,2
ffffffffc020399e:	eb59                	bnez	a4,ffffffffc0203a34 <copy_range+0x172>
ffffffffc02039a0:	000cb703          	ld	a4,0(s9)
ffffffffc02039a4:	4505                	li	a0,1
ffffffffc02039a6:	6f18                	ld	a4,24(a4)
ffffffffc02039a8:	9702                	jalr	a4
ffffffffc02039aa:	8d2a                	mv	s10,a0
ffffffffc02039ac:	0c0d8963          	beqz	s11,ffffffffc0203a7e <copy_range+0x1bc>
ffffffffc02039b0:	100d0763          	beqz	s10,ffffffffc0203abe <copy_range+0x1fc>
ffffffffc02039b4:	000bb703          	ld	a4,0(s7)
ffffffffc02039b8:	000805b7          	lui	a1,0x80
ffffffffc02039bc:	000c3603          	ld	a2,0(s8)
ffffffffc02039c0:	40ed86b3          	sub	a3,s11,a4
ffffffffc02039c4:	8699                	srai	a3,a3,0x6
ffffffffc02039c6:	96ae                	add	a3,a3,a1
ffffffffc02039c8:	0166f7b3          	and	a5,a3,s6
ffffffffc02039cc:	06b2                	slli	a3,a3,0xc
ffffffffc02039ce:	08c7fc63          	bgeu	a5,a2,ffffffffc0203a66 <copy_range+0x1a4>
ffffffffc02039d2:	40ed07b3          	sub	a5,s10,a4
ffffffffc02039d6:	00093717          	auipc	a4,0x93
ffffffffc02039da:	ee270713          	addi	a4,a4,-286 # ffffffffc02968b8 <va_pa_offset>
ffffffffc02039de:	6308                	ld	a0,0(a4)
ffffffffc02039e0:	8799                	srai	a5,a5,0x6
ffffffffc02039e2:	97ae                	add	a5,a5,a1
ffffffffc02039e4:	0167f733          	and	a4,a5,s6
ffffffffc02039e8:	00a685b3          	add	a1,a3,a0
ffffffffc02039ec:	07b2                	slli	a5,a5,0xc
ffffffffc02039ee:	06c77b63          	bgeu	a4,a2,ffffffffc0203a64 <copy_range+0x1a2>
ffffffffc02039f2:	6605                	lui	a2,0x1
ffffffffc02039f4:	953e                	add	a0,a0,a5
ffffffffc02039f6:	193070ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc02039fa:	86a6                	mv	a3,s1
ffffffffc02039fc:	8622                	mv	a2,s0
ffffffffc02039fe:	85ea                	mv	a1,s10
ffffffffc0203a00:	8556                	mv	a0,s5
ffffffffc0203a02:	fd9fe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203a06:	84aa                	mv	s1,a0
ffffffffc0203a08:	d905                	beqz	a0,ffffffffc0203938 <copy_range+0x76>
ffffffffc0203a0a:	100027f3          	csrr	a5,sstatus
ffffffffc0203a0e:	8b89                	andi	a5,a5,2
ffffffffc0203a10:	ef9d                	bnez	a5,ffffffffc0203a4e <copy_range+0x18c>
ffffffffc0203a12:	000cb783          	ld	a5,0(s9)
ffffffffc0203a16:	4585                	li	a1,1
ffffffffc0203a18:	856a                	mv	a0,s10
ffffffffc0203a1a:	739c                	ld	a5,32(a5)
ffffffffc0203a1c:	9782                	jalr	a5
ffffffffc0203a1e:	b70d                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a20:	00200637          	lui	a2,0x200
ffffffffc0203a24:	9432                	add	s0,s0,a2
ffffffffc0203a26:	ffe00637          	lui	a2,0xffe00
ffffffffc0203a2a:	8c71                	and	s0,s0,a2
ffffffffc0203a2c:	d809                	beqz	s0,ffffffffc020393e <copy_range+0x7c>
ffffffffc0203a2e:	ef246be3          	bltu	s0,s2,ffffffffc0203924 <copy_range+0x62>
ffffffffc0203a32:	b731                	j	ffffffffc020393e <copy_range+0x7c>
ffffffffc0203a34:	a3efd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203a38:	000cb703          	ld	a4,0(s9)
ffffffffc0203a3c:	4505                	li	a0,1
ffffffffc0203a3e:	6f18                	ld	a4,24(a4)
ffffffffc0203a40:	9702                	jalr	a4
ffffffffc0203a42:	8d2a                	mv	s10,a0
ffffffffc0203a44:	a28fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203a48:	b795                	j	ffffffffc02039ac <copy_range+0xea>
ffffffffc0203a4a:	54f1                	li	s1,-4
ffffffffc0203a4c:	bdd5                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a4e:	a24fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203a52:	000cb783          	ld	a5,0(s9)
ffffffffc0203a56:	4585                	li	a1,1
ffffffffc0203a58:	856a                	mv	a0,s10
ffffffffc0203a5a:	739c                	ld	a5,32(a5)
ffffffffc0203a5c:	9782                	jalr	a5
ffffffffc0203a5e:	a0efd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203a62:	bdf9                	j	ffffffffc0203940 <copy_range+0x7e>
ffffffffc0203a64:	86be                	mv	a3,a5
ffffffffc0203a66:	00009617          	auipc	a2,0x9
ffffffffc0203a6a:	8d260613          	addi	a2,a2,-1838 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0203a6e:	07100593          	li	a1,113
ffffffffc0203a72:	00009517          	auipc	a0,0x9
ffffffffc0203a76:	8ee50513          	addi	a0,a0,-1810 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0203a7a:	a25fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a7e:	00009697          	auipc	a3,0x9
ffffffffc0203a82:	05a68693          	addi	a3,a3,90 # ffffffffc020cad8 <default_pmm_manager+0x7d8>
ffffffffc0203a86:	00008617          	auipc	a2,0x8
ffffffffc0203a8a:	d9260613          	addi	a2,a2,-622 # ffffffffc020b818 <commands+0x210>
ffffffffc0203a8e:	1ce00593          	li	a1,462
ffffffffc0203a92:	00009517          	auipc	a0,0x9
ffffffffc0203a96:	9be50513          	addi	a0,a0,-1602 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203a9a:	a05fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203a9e:	00009697          	auipc	a3,0x9
ffffffffc0203aa2:	a1a68693          	addi	a3,a3,-1510 # ffffffffc020c4b8 <default_pmm_manager+0x1b8>
ffffffffc0203aa6:	00008617          	auipc	a2,0x8
ffffffffc0203aaa:	d7260613          	addi	a2,a2,-654 # ffffffffc020b818 <commands+0x210>
ffffffffc0203aae:	1b600593          	li	a1,438
ffffffffc0203ab2:	00009517          	auipc	a0,0x9
ffffffffc0203ab6:	99e50513          	addi	a0,a0,-1634 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203aba:	9e5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203abe:	00009697          	auipc	a3,0x9
ffffffffc0203ac2:	02a68693          	addi	a3,a3,42 # ffffffffc020cae8 <default_pmm_manager+0x7e8>
ffffffffc0203ac6:	00008617          	auipc	a2,0x8
ffffffffc0203aca:	d5260613          	addi	a2,a2,-686 # ffffffffc020b818 <commands+0x210>
ffffffffc0203ace:	1cf00593          	li	a1,463
ffffffffc0203ad2:	00009517          	auipc	a0,0x9
ffffffffc0203ad6:	97e50513          	addi	a0,a0,-1666 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203ada:	9c5fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ade:	00009617          	auipc	a2,0x9
ffffffffc0203ae2:	92a60613          	addi	a2,a2,-1750 # ffffffffc020c408 <default_pmm_manager+0x108>
ffffffffc0203ae6:	06900593          	li	a1,105
ffffffffc0203aea:	00009517          	auipc	a0,0x9
ffffffffc0203aee:	87650513          	addi	a0,a0,-1930 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0203af2:	9adfc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203af6:	00009617          	auipc	a2,0x9
ffffffffc0203afa:	93260613          	addi	a2,a2,-1742 # ffffffffc020c428 <default_pmm_manager+0x128>
ffffffffc0203afe:	07f00593          	li	a1,127
ffffffffc0203b02:	00009517          	auipc	a0,0x9
ffffffffc0203b06:	85e50513          	addi	a0,a0,-1954 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0203b0a:	995fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203b0e:	00009697          	auipc	a3,0x9
ffffffffc0203b12:	97a68693          	addi	a3,a3,-1670 # ffffffffc020c488 <default_pmm_manager+0x188>
ffffffffc0203b16:	00008617          	auipc	a2,0x8
ffffffffc0203b1a:	d0260613          	addi	a2,a2,-766 # ffffffffc020b818 <commands+0x210>
ffffffffc0203b1e:	1b500593          	li	a1,437
ffffffffc0203b22:	00009517          	auipc	a0,0x9
ffffffffc0203b26:	92e50513          	addi	a0,a0,-1746 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203b2a:	975fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203b2e <pgdir_alloc_page>:
ffffffffc0203b2e:	7179                	addi	sp,sp,-48
ffffffffc0203b30:	ec26                	sd	s1,24(sp)
ffffffffc0203b32:	e84a                	sd	s2,16(sp)
ffffffffc0203b34:	e052                	sd	s4,0(sp)
ffffffffc0203b36:	f406                	sd	ra,40(sp)
ffffffffc0203b38:	f022                	sd	s0,32(sp)
ffffffffc0203b3a:	e44e                	sd	s3,8(sp)
ffffffffc0203b3c:	8a2a                	mv	s4,a0
ffffffffc0203b3e:	84ae                	mv	s1,a1
ffffffffc0203b40:	8932                	mv	s2,a2
ffffffffc0203b42:	100027f3          	csrr	a5,sstatus
ffffffffc0203b46:	8b89                	andi	a5,a5,2
ffffffffc0203b48:	00093997          	auipc	s3,0x93
ffffffffc0203b4c:	d6898993          	addi	s3,s3,-664 # ffffffffc02968b0 <pmm_manager>
ffffffffc0203b50:	ef8d                	bnez	a5,ffffffffc0203b8a <pgdir_alloc_page+0x5c>
ffffffffc0203b52:	0009b783          	ld	a5,0(s3)
ffffffffc0203b56:	4505                	li	a0,1
ffffffffc0203b58:	6f9c                	ld	a5,24(a5)
ffffffffc0203b5a:	9782                	jalr	a5
ffffffffc0203b5c:	842a                	mv	s0,a0
ffffffffc0203b5e:	cc09                	beqz	s0,ffffffffc0203b78 <pgdir_alloc_page+0x4a>
ffffffffc0203b60:	86ca                	mv	a3,s2
ffffffffc0203b62:	8626                	mv	a2,s1
ffffffffc0203b64:	85a2                	mv	a1,s0
ffffffffc0203b66:	8552                	mv	a0,s4
ffffffffc0203b68:	e73fe0ef          	jal	ra,ffffffffc02029da <page_insert>
ffffffffc0203b6c:	e915                	bnez	a0,ffffffffc0203ba0 <pgdir_alloc_page+0x72>
ffffffffc0203b6e:	4018                	lw	a4,0(s0)
ffffffffc0203b70:	fc04                	sd	s1,56(s0)
ffffffffc0203b72:	4785                	li	a5,1
ffffffffc0203b74:	04f71e63          	bne	a4,a5,ffffffffc0203bd0 <pgdir_alloc_page+0xa2>
ffffffffc0203b78:	70a2                	ld	ra,40(sp)
ffffffffc0203b7a:	8522                	mv	a0,s0
ffffffffc0203b7c:	7402                	ld	s0,32(sp)
ffffffffc0203b7e:	64e2                	ld	s1,24(sp)
ffffffffc0203b80:	6942                	ld	s2,16(sp)
ffffffffc0203b82:	69a2                	ld	s3,8(sp)
ffffffffc0203b84:	6a02                	ld	s4,0(sp)
ffffffffc0203b86:	6145                	addi	sp,sp,48
ffffffffc0203b88:	8082                	ret
ffffffffc0203b8a:	8e8fd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203b8e:	0009b783          	ld	a5,0(s3)
ffffffffc0203b92:	4505                	li	a0,1
ffffffffc0203b94:	6f9c                	ld	a5,24(a5)
ffffffffc0203b96:	9782                	jalr	a5
ffffffffc0203b98:	842a                	mv	s0,a0
ffffffffc0203b9a:	8d2fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203b9e:	b7c1                	j	ffffffffc0203b5e <pgdir_alloc_page+0x30>
ffffffffc0203ba0:	100027f3          	csrr	a5,sstatus
ffffffffc0203ba4:	8b89                	andi	a5,a5,2
ffffffffc0203ba6:	eb89                	bnez	a5,ffffffffc0203bb8 <pgdir_alloc_page+0x8a>
ffffffffc0203ba8:	0009b783          	ld	a5,0(s3)
ffffffffc0203bac:	8522                	mv	a0,s0
ffffffffc0203bae:	4585                	li	a1,1
ffffffffc0203bb0:	739c                	ld	a5,32(a5)
ffffffffc0203bb2:	4401                	li	s0,0
ffffffffc0203bb4:	9782                	jalr	a5
ffffffffc0203bb6:	b7c9                	j	ffffffffc0203b78 <pgdir_alloc_page+0x4a>
ffffffffc0203bb8:	8bafd0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0203bbc:	0009b783          	ld	a5,0(s3)
ffffffffc0203bc0:	8522                	mv	a0,s0
ffffffffc0203bc2:	4585                	li	a1,1
ffffffffc0203bc4:	739c                	ld	a5,32(a5)
ffffffffc0203bc6:	4401                	li	s0,0
ffffffffc0203bc8:	9782                	jalr	a5
ffffffffc0203bca:	8a2fd0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0203bce:	b76d                	j	ffffffffc0203b78 <pgdir_alloc_page+0x4a>
ffffffffc0203bd0:	00009697          	auipc	a3,0x9
ffffffffc0203bd4:	f2868693          	addi	a3,a3,-216 # ffffffffc020caf8 <default_pmm_manager+0x7f8>
ffffffffc0203bd8:	00008617          	auipc	a2,0x8
ffffffffc0203bdc:	c4060613          	addi	a2,a2,-960 # ffffffffc020b818 <commands+0x210>
ffffffffc0203be0:	23d00593          	li	a1,573
ffffffffc0203be4:	00009517          	auipc	a0,0x9
ffffffffc0203be8:	86c50513          	addi	a0,a0,-1940 # ffffffffc020c450 <default_pmm_manager+0x150>
ffffffffc0203bec:	8b3fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203bf0 <check_vma_overlap.part.0>:
ffffffffc0203bf0:	1141                	addi	sp,sp,-16
ffffffffc0203bf2:	00009697          	auipc	a3,0x9
ffffffffc0203bf6:	f1e68693          	addi	a3,a3,-226 # ffffffffc020cb10 <default_pmm_manager+0x810>
ffffffffc0203bfa:	00008617          	auipc	a2,0x8
ffffffffc0203bfe:	c1e60613          	addi	a2,a2,-994 # ffffffffc020b818 <commands+0x210>
ffffffffc0203c02:	07400593          	li	a1,116
ffffffffc0203c06:	00009517          	auipc	a0,0x9
ffffffffc0203c0a:	f2a50513          	addi	a0,a0,-214 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203c0e:	e406                	sd	ra,8(sp)
ffffffffc0203c10:	88ffc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203c14 <mm_create>:
ffffffffc0203c14:	1141                	addi	sp,sp,-16
ffffffffc0203c16:	05800513          	li	a0,88
ffffffffc0203c1a:	e022                	sd	s0,0(sp)
ffffffffc0203c1c:	e406                	sd	ra,8(sp)
ffffffffc0203c1e:	b70fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203c22:	842a                	mv	s0,a0
ffffffffc0203c24:	c115                	beqz	a0,ffffffffc0203c48 <mm_create+0x34>
ffffffffc0203c26:	e408                	sd	a0,8(s0)
ffffffffc0203c28:	e008                	sd	a0,0(s0)
ffffffffc0203c2a:	00053823          	sd	zero,16(a0)
ffffffffc0203c2e:	00053c23          	sd	zero,24(a0)
ffffffffc0203c32:	02052023          	sw	zero,32(a0)
ffffffffc0203c36:	02053423          	sd	zero,40(a0)
ffffffffc0203c3a:	02052823          	sw	zero,48(a0)
ffffffffc0203c3e:	4585                	li	a1,1
ffffffffc0203c40:	03850513          	addi	a0,a0,56
ffffffffc0203c44:	123000ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc0203c48:	60a2                	ld	ra,8(sp)
ffffffffc0203c4a:	8522                	mv	a0,s0
ffffffffc0203c4c:	6402                	ld	s0,0(sp)
ffffffffc0203c4e:	0141                	addi	sp,sp,16
ffffffffc0203c50:	8082                	ret

ffffffffc0203c52 <find_vma>:
ffffffffc0203c52:	86aa                	mv	a3,a0
ffffffffc0203c54:	c505                	beqz	a0,ffffffffc0203c7c <find_vma+0x2a>
ffffffffc0203c56:	6908                	ld	a0,16(a0)
ffffffffc0203c58:	c501                	beqz	a0,ffffffffc0203c60 <find_vma+0xe>
ffffffffc0203c5a:	651c                	ld	a5,8(a0)
ffffffffc0203c5c:	02f5f263          	bgeu	a1,a5,ffffffffc0203c80 <find_vma+0x2e>
ffffffffc0203c60:	669c                	ld	a5,8(a3)
ffffffffc0203c62:	00f68d63          	beq	a3,a5,ffffffffc0203c7c <find_vma+0x2a>
ffffffffc0203c66:	fe87b703          	ld	a4,-24(a5) # 1fffe8 <_binary_bin_sfs_img_size+0x18ace8>
ffffffffc0203c6a:	00e5e663          	bltu	a1,a4,ffffffffc0203c76 <find_vma+0x24>
ffffffffc0203c6e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0203c72:	00e5ec63          	bltu	a1,a4,ffffffffc0203c8a <find_vma+0x38>
ffffffffc0203c76:	679c                	ld	a5,8(a5)
ffffffffc0203c78:	fef697e3          	bne	a3,a5,ffffffffc0203c66 <find_vma+0x14>
ffffffffc0203c7c:	4501                	li	a0,0
ffffffffc0203c7e:	8082                	ret
ffffffffc0203c80:	691c                	ld	a5,16(a0)
ffffffffc0203c82:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0203c60 <find_vma+0xe>
ffffffffc0203c86:	ea88                	sd	a0,16(a3)
ffffffffc0203c88:	8082                	ret
ffffffffc0203c8a:	fe078513          	addi	a0,a5,-32
ffffffffc0203c8e:	ea88                	sd	a0,16(a3)
ffffffffc0203c90:	8082                	ret

ffffffffc0203c92 <insert_vma_struct>:
ffffffffc0203c92:	6590                	ld	a2,8(a1)
ffffffffc0203c94:	0105b803          	ld	a6,16(a1) # 80010 <_binary_bin_sfs_img_size+0xad10>
ffffffffc0203c98:	1141                	addi	sp,sp,-16
ffffffffc0203c9a:	e406                	sd	ra,8(sp)
ffffffffc0203c9c:	87aa                	mv	a5,a0
ffffffffc0203c9e:	01066763          	bltu	a2,a6,ffffffffc0203cac <insert_vma_struct+0x1a>
ffffffffc0203ca2:	a085                	j	ffffffffc0203d02 <insert_vma_struct+0x70>
ffffffffc0203ca4:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203ca8:	04e66863          	bltu	a2,a4,ffffffffc0203cf8 <insert_vma_struct+0x66>
ffffffffc0203cac:	86be                	mv	a3,a5
ffffffffc0203cae:	679c                	ld	a5,8(a5)
ffffffffc0203cb0:	fef51ae3          	bne	a0,a5,ffffffffc0203ca4 <insert_vma_struct+0x12>
ffffffffc0203cb4:	02a68463          	beq	a3,a0,ffffffffc0203cdc <insert_vma_struct+0x4a>
ffffffffc0203cb8:	ff06b703          	ld	a4,-16(a3)
ffffffffc0203cbc:	fe86b883          	ld	a7,-24(a3)
ffffffffc0203cc0:	08e8f163          	bgeu	a7,a4,ffffffffc0203d42 <insert_vma_struct+0xb0>
ffffffffc0203cc4:	04e66f63          	bltu	a2,a4,ffffffffc0203d22 <insert_vma_struct+0x90>
ffffffffc0203cc8:	00f50a63          	beq	a0,a5,ffffffffc0203cdc <insert_vma_struct+0x4a>
ffffffffc0203ccc:	fe87b703          	ld	a4,-24(a5)
ffffffffc0203cd0:	05076963          	bltu	a4,a6,ffffffffc0203d22 <insert_vma_struct+0x90>
ffffffffc0203cd4:	ff07b603          	ld	a2,-16(a5)
ffffffffc0203cd8:	02c77363          	bgeu	a4,a2,ffffffffc0203cfe <insert_vma_struct+0x6c>
ffffffffc0203cdc:	5118                	lw	a4,32(a0)
ffffffffc0203cde:	e188                	sd	a0,0(a1)
ffffffffc0203ce0:	02058613          	addi	a2,a1,32
ffffffffc0203ce4:	e390                	sd	a2,0(a5)
ffffffffc0203ce6:	e690                	sd	a2,8(a3)
ffffffffc0203ce8:	60a2                	ld	ra,8(sp)
ffffffffc0203cea:	f59c                	sd	a5,40(a1)
ffffffffc0203cec:	f194                	sd	a3,32(a1)
ffffffffc0203cee:	0017079b          	addiw	a5,a4,1
ffffffffc0203cf2:	d11c                	sw	a5,32(a0)
ffffffffc0203cf4:	0141                	addi	sp,sp,16
ffffffffc0203cf6:	8082                	ret
ffffffffc0203cf8:	fca690e3          	bne	a3,a0,ffffffffc0203cb8 <insert_vma_struct+0x26>
ffffffffc0203cfc:	bfd1                	j	ffffffffc0203cd0 <insert_vma_struct+0x3e>
ffffffffc0203cfe:	ef3ff0ef          	jal	ra,ffffffffc0203bf0 <check_vma_overlap.part.0>
ffffffffc0203d02:	00009697          	auipc	a3,0x9
ffffffffc0203d06:	e3e68693          	addi	a3,a3,-450 # ffffffffc020cb40 <default_pmm_manager+0x840>
ffffffffc0203d0a:	00008617          	auipc	a2,0x8
ffffffffc0203d0e:	b0e60613          	addi	a2,a2,-1266 # ffffffffc020b818 <commands+0x210>
ffffffffc0203d12:	07a00593          	li	a1,122
ffffffffc0203d16:	00009517          	auipc	a0,0x9
ffffffffc0203d1a:	e1a50513          	addi	a0,a0,-486 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203d1e:	f80fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d22:	00009697          	auipc	a3,0x9
ffffffffc0203d26:	e5e68693          	addi	a3,a3,-418 # ffffffffc020cb80 <default_pmm_manager+0x880>
ffffffffc0203d2a:	00008617          	auipc	a2,0x8
ffffffffc0203d2e:	aee60613          	addi	a2,a2,-1298 # ffffffffc020b818 <commands+0x210>
ffffffffc0203d32:	07300593          	li	a1,115
ffffffffc0203d36:	00009517          	auipc	a0,0x9
ffffffffc0203d3a:	dfa50513          	addi	a0,a0,-518 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203d3e:	f60fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203d42:	00009697          	auipc	a3,0x9
ffffffffc0203d46:	e1e68693          	addi	a3,a3,-482 # ffffffffc020cb60 <default_pmm_manager+0x860>
ffffffffc0203d4a:	00008617          	auipc	a2,0x8
ffffffffc0203d4e:	ace60613          	addi	a2,a2,-1330 # ffffffffc020b818 <commands+0x210>
ffffffffc0203d52:	07200593          	li	a1,114
ffffffffc0203d56:	00009517          	auipc	a0,0x9
ffffffffc0203d5a:	dda50513          	addi	a0,a0,-550 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203d5e:	f40fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203d62 <mm_destroy>:
ffffffffc0203d62:	591c                	lw	a5,48(a0)
ffffffffc0203d64:	1141                	addi	sp,sp,-16
ffffffffc0203d66:	e406                	sd	ra,8(sp)
ffffffffc0203d68:	e022                	sd	s0,0(sp)
ffffffffc0203d6a:	e78d                	bnez	a5,ffffffffc0203d94 <mm_destroy+0x32>
ffffffffc0203d6c:	842a                	mv	s0,a0
ffffffffc0203d6e:	6508                	ld	a0,8(a0)
ffffffffc0203d70:	00a40c63          	beq	s0,a0,ffffffffc0203d88 <mm_destroy+0x26>
ffffffffc0203d74:	6118                	ld	a4,0(a0)
ffffffffc0203d76:	651c                	ld	a5,8(a0)
ffffffffc0203d78:	1501                	addi	a0,a0,-32
ffffffffc0203d7a:	e71c                	sd	a5,8(a4)
ffffffffc0203d7c:	e398                	sd	a4,0(a5)
ffffffffc0203d7e:	ac0fe0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0203d82:	6408                	ld	a0,8(s0)
ffffffffc0203d84:	fea418e3          	bne	s0,a0,ffffffffc0203d74 <mm_destroy+0x12>
ffffffffc0203d88:	8522                	mv	a0,s0
ffffffffc0203d8a:	6402                	ld	s0,0(sp)
ffffffffc0203d8c:	60a2                	ld	ra,8(sp)
ffffffffc0203d8e:	0141                	addi	sp,sp,16
ffffffffc0203d90:	aaefe06f          	j	ffffffffc020203e <kfree>
ffffffffc0203d94:	00009697          	auipc	a3,0x9
ffffffffc0203d98:	e0c68693          	addi	a3,a3,-500 # ffffffffc020cba0 <default_pmm_manager+0x8a0>
ffffffffc0203d9c:	00008617          	auipc	a2,0x8
ffffffffc0203da0:	a7c60613          	addi	a2,a2,-1412 # ffffffffc020b818 <commands+0x210>
ffffffffc0203da4:	09e00593          	li	a1,158
ffffffffc0203da8:	00009517          	auipc	a0,0x9
ffffffffc0203dac:	d8850513          	addi	a0,a0,-632 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203db0:	eeefc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203db4 <mm_map>:
ffffffffc0203db4:	7139                	addi	sp,sp,-64
ffffffffc0203db6:	f822                	sd	s0,48(sp)
ffffffffc0203db8:	6405                	lui	s0,0x1
ffffffffc0203dba:	147d                	addi	s0,s0,-1
ffffffffc0203dbc:	77fd                	lui	a5,0xfffff
ffffffffc0203dbe:	9622                	add	a2,a2,s0
ffffffffc0203dc0:	962e                	add	a2,a2,a1
ffffffffc0203dc2:	f426                	sd	s1,40(sp)
ffffffffc0203dc4:	fc06                	sd	ra,56(sp)
ffffffffc0203dc6:	00f5f4b3          	and	s1,a1,a5
ffffffffc0203dca:	f04a                	sd	s2,32(sp)
ffffffffc0203dcc:	ec4e                	sd	s3,24(sp)
ffffffffc0203dce:	e852                	sd	s4,16(sp)
ffffffffc0203dd0:	e456                	sd	s5,8(sp)
ffffffffc0203dd2:	002005b7          	lui	a1,0x200
ffffffffc0203dd6:	00f67433          	and	s0,a2,a5
ffffffffc0203dda:	06b4e363          	bltu	s1,a1,ffffffffc0203e40 <mm_map+0x8c>
ffffffffc0203dde:	0684f163          	bgeu	s1,s0,ffffffffc0203e40 <mm_map+0x8c>
ffffffffc0203de2:	4785                	li	a5,1
ffffffffc0203de4:	07fe                	slli	a5,a5,0x1f
ffffffffc0203de6:	0487ed63          	bltu	a5,s0,ffffffffc0203e40 <mm_map+0x8c>
ffffffffc0203dea:	89aa                	mv	s3,a0
ffffffffc0203dec:	cd21                	beqz	a0,ffffffffc0203e44 <mm_map+0x90>
ffffffffc0203dee:	85a6                	mv	a1,s1
ffffffffc0203df0:	8ab6                	mv	s5,a3
ffffffffc0203df2:	8a3a                	mv	s4,a4
ffffffffc0203df4:	e5fff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc0203df8:	c501                	beqz	a0,ffffffffc0203e00 <mm_map+0x4c>
ffffffffc0203dfa:	651c                	ld	a5,8(a0)
ffffffffc0203dfc:	0487e263          	bltu	a5,s0,ffffffffc0203e40 <mm_map+0x8c>
ffffffffc0203e00:	03000513          	li	a0,48
ffffffffc0203e04:	98afe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203e08:	892a                	mv	s2,a0
ffffffffc0203e0a:	5571                	li	a0,-4
ffffffffc0203e0c:	02090163          	beqz	s2,ffffffffc0203e2e <mm_map+0x7a>
ffffffffc0203e10:	854e                	mv	a0,s3
ffffffffc0203e12:	00993423          	sd	s1,8(s2)
ffffffffc0203e16:	00893823          	sd	s0,16(s2)
ffffffffc0203e1a:	01592c23          	sw	s5,24(s2)
ffffffffc0203e1e:	85ca                	mv	a1,s2
ffffffffc0203e20:	e73ff0ef          	jal	ra,ffffffffc0203c92 <insert_vma_struct>
ffffffffc0203e24:	4501                	li	a0,0
ffffffffc0203e26:	000a0463          	beqz	s4,ffffffffc0203e2e <mm_map+0x7a>
ffffffffc0203e2a:	012a3023          	sd	s2,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0203e2e:	70e2                	ld	ra,56(sp)
ffffffffc0203e30:	7442                	ld	s0,48(sp)
ffffffffc0203e32:	74a2                	ld	s1,40(sp)
ffffffffc0203e34:	7902                	ld	s2,32(sp)
ffffffffc0203e36:	69e2                	ld	s3,24(sp)
ffffffffc0203e38:	6a42                	ld	s4,16(sp)
ffffffffc0203e3a:	6aa2                	ld	s5,8(sp)
ffffffffc0203e3c:	6121                	addi	sp,sp,64
ffffffffc0203e3e:	8082                	ret
ffffffffc0203e40:	5575                	li	a0,-3
ffffffffc0203e42:	b7f5                	j	ffffffffc0203e2e <mm_map+0x7a>
ffffffffc0203e44:	00009697          	auipc	a3,0x9
ffffffffc0203e48:	d7468693          	addi	a3,a3,-652 # ffffffffc020cbb8 <default_pmm_manager+0x8b8>
ffffffffc0203e4c:	00008617          	auipc	a2,0x8
ffffffffc0203e50:	9cc60613          	addi	a2,a2,-1588 # ffffffffc020b818 <commands+0x210>
ffffffffc0203e54:	0b300593          	li	a1,179
ffffffffc0203e58:	00009517          	auipc	a0,0x9
ffffffffc0203e5c:	cd850513          	addi	a0,a0,-808 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203e60:	e3efc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203e64 <dup_mmap>:
ffffffffc0203e64:	7139                	addi	sp,sp,-64
ffffffffc0203e66:	fc06                	sd	ra,56(sp)
ffffffffc0203e68:	f822                	sd	s0,48(sp)
ffffffffc0203e6a:	f426                	sd	s1,40(sp)
ffffffffc0203e6c:	f04a                	sd	s2,32(sp)
ffffffffc0203e6e:	ec4e                	sd	s3,24(sp)
ffffffffc0203e70:	e852                	sd	s4,16(sp)
ffffffffc0203e72:	e456                	sd	s5,8(sp)
ffffffffc0203e74:	c52d                	beqz	a0,ffffffffc0203ede <dup_mmap+0x7a>
ffffffffc0203e76:	892a                	mv	s2,a0
ffffffffc0203e78:	84ae                	mv	s1,a1
ffffffffc0203e7a:	842e                	mv	s0,a1
ffffffffc0203e7c:	e595                	bnez	a1,ffffffffc0203ea8 <dup_mmap+0x44>
ffffffffc0203e7e:	a085                	j	ffffffffc0203ede <dup_mmap+0x7a>
ffffffffc0203e80:	854a                	mv	a0,s2
ffffffffc0203e82:	0155b423          	sd	s5,8(a1) # 200008 <_binary_bin_sfs_img_size+0x18ad08>
ffffffffc0203e86:	0145b823          	sd	s4,16(a1)
ffffffffc0203e8a:	0135ac23          	sw	s3,24(a1)
ffffffffc0203e8e:	e05ff0ef          	jal	ra,ffffffffc0203c92 <insert_vma_struct>
ffffffffc0203e92:	ff043683          	ld	a3,-16(s0) # ff0 <_binary_bin_swap_img_size-0x6d10>
ffffffffc0203e96:	fe843603          	ld	a2,-24(s0)
ffffffffc0203e9a:	6c8c                	ld	a1,24(s1)
ffffffffc0203e9c:	01893503          	ld	a0,24(s2)
ffffffffc0203ea0:	4701                	li	a4,0
ffffffffc0203ea2:	a21ff0ef          	jal	ra,ffffffffc02038c2 <copy_range>
ffffffffc0203ea6:	e105                	bnez	a0,ffffffffc0203ec6 <dup_mmap+0x62>
ffffffffc0203ea8:	6000                	ld	s0,0(s0)
ffffffffc0203eaa:	02848863          	beq	s1,s0,ffffffffc0203eda <dup_mmap+0x76>
ffffffffc0203eae:	03000513          	li	a0,48
ffffffffc0203eb2:	fe843a83          	ld	s5,-24(s0)
ffffffffc0203eb6:	ff043a03          	ld	s4,-16(s0)
ffffffffc0203eba:	ff842983          	lw	s3,-8(s0)
ffffffffc0203ebe:	8d0fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203ec2:	85aa                	mv	a1,a0
ffffffffc0203ec4:	fd55                	bnez	a0,ffffffffc0203e80 <dup_mmap+0x1c>
ffffffffc0203ec6:	5571                	li	a0,-4
ffffffffc0203ec8:	70e2                	ld	ra,56(sp)
ffffffffc0203eca:	7442                	ld	s0,48(sp)
ffffffffc0203ecc:	74a2                	ld	s1,40(sp)
ffffffffc0203ece:	7902                	ld	s2,32(sp)
ffffffffc0203ed0:	69e2                	ld	s3,24(sp)
ffffffffc0203ed2:	6a42                	ld	s4,16(sp)
ffffffffc0203ed4:	6aa2                	ld	s5,8(sp)
ffffffffc0203ed6:	6121                	addi	sp,sp,64
ffffffffc0203ed8:	8082                	ret
ffffffffc0203eda:	4501                	li	a0,0
ffffffffc0203edc:	b7f5                	j	ffffffffc0203ec8 <dup_mmap+0x64>
ffffffffc0203ede:	00009697          	auipc	a3,0x9
ffffffffc0203ee2:	cea68693          	addi	a3,a3,-790 # ffffffffc020cbc8 <default_pmm_manager+0x8c8>
ffffffffc0203ee6:	00008617          	auipc	a2,0x8
ffffffffc0203eea:	93260613          	addi	a2,a2,-1742 # ffffffffc020b818 <commands+0x210>
ffffffffc0203eee:	0cf00593          	li	a1,207
ffffffffc0203ef2:	00009517          	auipc	a0,0x9
ffffffffc0203ef6:	c3e50513          	addi	a0,a0,-962 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203efa:	da4fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203efe <exit_mmap>:
ffffffffc0203efe:	1101                	addi	sp,sp,-32
ffffffffc0203f00:	ec06                	sd	ra,24(sp)
ffffffffc0203f02:	e822                	sd	s0,16(sp)
ffffffffc0203f04:	e426                	sd	s1,8(sp)
ffffffffc0203f06:	e04a                	sd	s2,0(sp)
ffffffffc0203f08:	c531                	beqz	a0,ffffffffc0203f54 <exit_mmap+0x56>
ffffffffc0203f0a:	591c                	lw	a5,48(a0)
ffffffffc0203f0c:	84aa                	mv	s1,a0
ffffffffc0203f0e:	e3b9                	bnez	a5,ffffffffc0203f54 <exit_mmap+0x56>
ffffffffc0203f10:	6500                	ld	s0,8(a0)
ffffffffc0203f12:	01853903          	ld	s2,24(a0)
ffffffffc0203f16:	02850663          	beq	a0,s0,ffffffffc0203f42 <exit_mmap+0x44>
ffffffffc0203f1a:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f1e:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f22:	854a                	mv	a0,s2
ffffffffc0203f24:	e42fe0ef          	jal	ra,ffffffffc0202566 <unmap_range>
ffffffffc0203f28:	6400                	ld	s0,8(s0)
ffffffffc0203f2a:	fe8498e3          	bne	s1,s0,ffffffffc0203f1a <exit_mmap+0x1c>
ffffffffc0203f2e:	6400                	ld	s0,8(s0)
ffffffffc0203f30:	00848c63          	beq	s1,s0,ffffffffc0203f48 <exit_mmap+0x4a>
ffffffffc0203f34:	ff043603          	ld	a2,-16(s0)
ffffffffc0203f38:	fe843583          	ld	a1,-24(s0)
ffffffffc0203f3c:	854a                	mv	a0,s2
ffffffffc0203f3e:	f6efe0ef          	jal	ra,ffffffffc02026ac <exit_range>
ffffffffc0203f42:	6400                	ld	s0,8(s0)
ffffffffc0203f44:	fe8498e3          	bne	s1,s0,ffffffffc0203f34 <exit_mmap+0x36>
ffffffffc0203f48:	60e2                	ld	ra,24(sp)
ffffffffc0203f4a:	6442                	ld	s0,16(sp)
ffffffffc0203f4c:	64a2                	ld	s1,8(sp)
ffffffffc0203f4e:	6902                	ld	s2,0(sp)
ffffffffc0203f50:	6105                	addi	sp,sp,32
ffffffffc0203f52:	8082                	ret
ffffffffc0203f54:	00009697          	auipc	a3,0x9
ffffffffc0203f58:	c9468693          	addi	a3,a3,-876 # ffffffffc020cbe8 <default_pmm_manager+0x8e8>
ffffffffc0203f5c:	00008617          	auipc	a2,0x8
ffffffffc0203f60:	8bc60613          	addi	a2,a2,-1860 # ffffffffc020b818 <commands+0x210>
ffffffffc0203f64:	0e800593          	li	a1,232
ffffffffc0203f68:	00009517          	auipc	a0,0x9
ffffffffc0203f6c:	bc850513          	addi	a0,a0,-1080 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203f70:	d2efc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0203f74 <vmm_init>:
ffffffffc0203f74:	7139                	addi	sp,sp,-64
ffffffffc0203f76:	05800513          	li	a0,88
ffffffffc0203f7a:	fc06                	sd	ra,56(sp)
ffffffffc0203f7c:	f822                	sd	s0,48(sp)
ffffffffc0203f7e:	f426                	sd	s1,40(sp)
ffffffffc0203f80:	f04a                	sd	s2,32(sp)
ffffffffc0203f82:	ec4e                	sd	s3,24(sp)
ffffffffc0203f84:	e852                	sd	s4,16(sp)
ffffffffc0203f86:	e456                	sd	s5,8(sp)
ffffffffc0203f88:	806fe0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203f8c:	2e050963          	beqz	a0,ffffffffc020427e <vmm_init+0x30a>
ffffffffc0203f90:	e508                	sd	a0,8(a0)
ffffffffc0203f92:	e108                	sd	a0,0(a0)
ffffffffc0203f94:	00053823          	sd	zero,16(a0)
ffffffffc0203f98:	00053c23          	sd	zero,24(a0)
ffffffffc0203f9c:	02052023          	sw	zero,32(a0)
ffffffffc0203fa0:	02053423          	sd	zero,40(a0)
ffffffffc0203fa4:	02052823          	sw	zero,48(a0)
ffffffffc0203fa8:	84aa                	mv	s1,a0
ffffffffc0203faa:	4585                	li	a1,1
ffffffffc0203fac:	03850513          	addi	a0,a0,56
ffffffffc0203fb0:	5b6000ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc0203fb4:	03200413          	li	s0,50
ffffffffc0203fb8:	a811                	j	ffffffffc0203fcc <vmm_init+0x58>
ffffffffc0203fba:	e500                	sd	s0,8(a0)
ffffffffc0203fbc:	e91c                	sd	a5,16(a0)
ffffffffc0203fbe:	00052c23          	sw	zero,24(a0)
ffffffffc0203fc2:	146d                	addi	s0,s0,-5
ffffffffc0203fc4:	8526                	mv	a0,s1
ffffffffc0203fc6:	ccdff0ef          	jal	ra,ffffffffc0203c92 <insert_vma_struct>
ffffffffc0203fca:	c80d                	beqz	s0,ffffffffc0203ffc <vmm_init+0x88>
ffffffffc0203fcc:	03000513          	li	a0,48
ffffffffc0203fd0:	fbffd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0203fd4:	85aa                	mv	a1,a0
ffffffffc0203fd6:	00240793          	addi	a5,s0,2
ffffffffc0203fda:	f165                	bnez	a0,ffffffffc0203fba <vmm_init+0x46>
ffffffffc0203fdc:	00009697          	auipc	a3,0x9
ffffffffc0203fe0:	da468693          	addi	a3,a3,-604 # ffffffffc020cd80 <default_pmm_manager+0xa80>
ffffffffc0203fe4:	00008617          	auipc	a2,0x8
ffffffffc0203fe8:	83460613          	addi	a2,a2,-1996 # ffffffffc020b818 <commands+0x210>
ffffffffc0203fec:	12c00593          	li	a1,300
ffffffffc0203ff0:	00009517          	auipc	a0,0x9
ffffffffc0203ff4:	b4050513          	addi	a0,a0,-1216 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0203ff8:	ca6fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0203ffc:	03700413          	li	s0,55
ffffffffc0204000:	1f900913          	li	s2,505
ffffffffc0204004:	a819                	j	ffffffffc020401a <vmm_init+0xa6>
ffffffffc0204006:	e500                	sd	s0,8(a0)
ffffffffc0204008:	e91c                	sd	a5,16(a0)
ffffffffc020400a:	00052c23          	sw	zero,24(a0)
ffffffffc020400e:	0415                	addi	s0,s0,5
ffffffffc0204010:	8526                	mv	a0,s1
ffffffffc0204012:	c81ff0ef          	jal	ra,ffffffffc0203c92 <insert_vma_struct>
ffffffffc0204016:	03240a63          	beq	s0,s2,ffffffffc020404a <vmm_init+0xd6>
ffffffffc020401a:	03000513          	li	a0,48
ffffffffc020401e:	f71fd0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0204022:	85aa                	mv	a1,a0
ffffffffc0204024:	00240793          	addi	a5,s0,2
ffffffffc0204028:	fd79                	bnez	a0,ffffffffc0204006 <vmm_init+0x92>
ffffffffc020402a:	00009697          	auipc	a3,0x9
ffffffffc020402e:	d5668693          	addi	a3,a3,-682 # ffffffffc020cd80 <default_pmm_manager+0xa80>
ffffffffc0204032:	00007617          	auipc	a2,0x7
ffffffffc0204036:	7e660613          	addi	a2,a2,2022 # ffffffffc020b818 <commands+0x210>
ffffffffc020403a:	13300593          	li	a1,307
ffffffffc020403e:	00009517          	auipc	a0,0x9
ffffffffc0204042:	af250513          	addi	a0,a0,-1294 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0204046:	c58fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020404a:	649c                	ld	a5,8(s1)
ffffffffc020404c:	471d                	li	a4,7
ffffffffc020404e:	1fb00593          	li	a1,507
ffffffffc0204052:	16f48663          	beq	s1,a5,ffffffffc02041be <vmm_init+0x24a>
ffffffffc0204056:	fe87b603          	ld	a2,-24(a5) # ffffffffffffefe8 <end+0x3fd686d8>
ffffffffc020405a:	ffe70693          	addi	a3,a4,-2
ffffffffc020405e:	10d61063          	bne	a2,a3,ffffffffc020415e <vmm_init+0x1ea>
ffffffffc0204062:	ff07b683          	ld	a3,-16(a5)
ffffffffc0204066:	0ed71c63          	bne	a4,a3,ffffffffc020415e <vmm_init+0x1ea>
ffffffffc020406a:	0715                	addi	a4,a4,5
ffffffffc020406c:	679c                	ld	a5,8(a5)
ffffffffc020406e:	feb712e3          	bne	a4,a1,ffffffffc0204052 <vmm_init+0xde>
ffffffffc0204072:	4a1d                	li	s4,7
ffffffffc0204074:	4415                	li	s0,5
ffffffffc0204076:	1f900a93          	li	s5,505
ffffffffc020407a:	85a2                	mv	a1,s0
ffffffffc020407c:	8526                	mv	a0,s1
ffffffffc020407e:	bd5ff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc0204082:	892a                	mv	s2,a0
ffffffffc0204084:	16050d63          	beqz	a0,ffffffffc02041fe <vmm_init+0x28a>
ffffffffc0204088:	00140593          	addi	a1,s0,1
ffffffffc020408c:	8526                	mv	a0,s1
ffffffffc020408e:	bc5ff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc0204092:	89aa                	mv	s3,a0
ffffffffc0204094:	14050563          	beqz	a0,ffffffffc02041de <vmm_init+0x26a>
ffffffffc0204098:	85d2                	mv	a1,s4
ffffffffc020409a:	8526                	mv	a0,s1
ffffffffc020409c:	bb7ff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc02040a0:	16051f63          	bnez	a0,ffffffffc020421e <vmm_init+0x2aa>
ffffffffc02040a4:	00340593          	addi	a1,s0,3
ffffffffc02040a8:	8526                	mv	a0,s1
ffffffffc02040aa:	ba9ff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc02040ae:	1a051863          	bnez	a0,ffffffffc020425e <vmm_init+0x2ea>
ffffffffc02040b2:	00440593          	addi	a1,s0,4
ffffffffc02040b6:	8526                	mv	a0,s1
ffffffffc02040b8:	b9bff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc02040bc:	18051163          	bnez	a0,ffffffffc020423e <vmm_init+0x2ca>
ffffffffc02040c0:	00893783          	ld	a5,8(s2)
ffffffffc02040c4:	0a879d63          	bne	a5,s0,ffffffffc020417e <vmm_init+0x20a>
ffffffffc02040c8:	01093783          	ld	a5,16(s2)
ffffffffc02040cc:	0b479963          	bne	a5,s4,ffffffffc020417e <vmm_init+0x20a>
ffffffffc02040d0:	0089b783          	ld	a5,8(s3)
ffffffffc02040d4:	0c879563          	bne	a5,s0,ffffffffc020419e <vmm_init+0x22a>
ffffffffc02040d8:	0109b783          	ld	a5,16(s3)
ffffffffc02040dc:	0d479163          	bne	a5,s4,ffffffffc020419e <vmm_init+0x22a>
ffffffffc02040e0:	0415                	addi	s0,s0,5
ffffffffc02040e2:	0a15                	addi	s4,s4,5
ffffffffc02040e4:	f9541be3          	bne	s0,s5,ffffffffc020407a <vmm_init+0x106>
ffffffffc02040e8:	4411                	li	s0,4
ffffffffc02040ea:	597d                	li	s2,-1
ffffffffc02040ec:	85a2                	mv	a1,s0
ffffffffc02040ee:	8526                	mv	a0,s1
ffffffffc02040f0:	b63ff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc02040f4:	0004059b          	sext.w	a1,s0
ffffffffc02040f8:	c90d                	beqz	a0,ffffffffc020412a <vmm_init+0x1b6>
ffffffffc02040fa:	6914                	ld	a3,16(a0)
ffffffffc02040fc:	6510                	ld	a2,8(a0)
ffffffffc02040fe:	00009517          	auipc	a0,0x9
ffffffffc0204102:	c0a50513          	addi	a0,a0,-1014 # ffffffffc020cd08 <default_pmm_manager+0xa08>
ffffffffc0204106:	8a0fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020410a:	00009697          	auipc	a3,0x9
ffffffffc020410e:	c2668693          	addi	a3,a3,-986 # ffffffffc020cd30 <default_pmm_manager+0xa30>
ffffffffc0204112:	00007617          	auipc	a2,0x7
ffffffffc0204116:	70660613          	addi	a2,a2,1798 # ffffffffc020b818 <commands+0x210>
ffffffffc020411a:	15900593          	li	a1,345
ffffffffc020411e:	00009517          	auipc	a0,0x9
ffffffffc0204122:	a1250513          	addi	a0,a0,-1518 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc0204126:	b78fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020412a:	147d                	addi	s0,s0,-1
ffffffffc020412c:	fd2410e3          	bne	s0,s2,ffffffffc02040ec <vmm_init+0x178>
ffffffffc0204130:	8526                	mv	a0,s1
ffffffffc0204132:	c31ff0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc0204136:	00009517          	auipc	a0,0x9
ffffffffc020413a:	c1250513          	addi	a0,a0,-1006 # ffffffffc020cd48 <default_pmm_manager+0xa48>
ffffffffc020413e:	868fc0ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0204142:	7442                	ld	s0,48(sp)
ffffffffc0204144:	70e2                	ld	ra,56(sp)
ffffffffc0204146:	74a2                	ld	s1,40(sp)
ffffffffc0204148:	7902                	ld	s2,32(sp)
ffffffffc020414a:	69e2                	ld	s3,24(sp)
ffffffffc020414c:	6a42                	ld	s4,16(sp)
ffffffffc020414e:	6aa2                	ld	s5,8(sp)
ffffffffc0204150:	00009517          	auipc	a0,0x9
ffffffffc0204154:	c1850513          	addi	a0,a0,-1000 # ffffffffc020cd68 <default_pmm_manager+0xa68>
ffffffffc0204158:	6121                	addi	sp,sp,64
ffffffffc020415a:	84cfc06f          	j	ffffffffc02001a6 <cprintf>
ffffffffc020415e:	00009697          	auipc	a3,0x9
ffffffffc0204162:	ac268693          	addi	a3,a3,-1342 # ffffffffc020cc20 <default_pmm_manager+0x920>
ffffffffc0204166:	00007617          	auipc	a2,0x7
ffffffffc020416a:	6b260613          	addi	a2,a2,1714 # ffffffffc020b818 <commands+0x210>
ffffffffc020416e:	13d00593          	li	a1,317
ffffffffc0204172:	00009517          	auipc	a0,0x9
ffffffffc0204176:	9be50513          	addi	a0,a0,-1602 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020417a:	b24fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020417e:	00009697          	auipc	a3,0x9
ffffffffc0204182:	b2a68693          	addi	a3,a3,-1238 # ffffffffc020cca8 <default_pmm_manager+0x9a8>
ffffffffc0204186:	00007617          	auipc	a2,0x7
ffffffffc020418a:	69260613          	addi	a2,a2,1682 # ffffffffc020b818 <commands+0x210>
ffffffffc020418e:	14e00593          	li	a1,334
ffffffffc0204192:	00009517          	auipc	a0,0x9
ffffffffc0204196:	99e50513          	addi	a0,a0,-1634 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020419a:	b04fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020419e:	00009697          	auipc	a3,0x9
ffffffffc02041a2:	b3a68693          	addi	a3,a3,-1222 # ffffffffc020ccd8 <default_pmm_manager+0x9d8>
ffffffffc02041a6:	00007617          	auipc	a2,0x7
ffffffffc02041aa:	67260613          	addi	a2,a2,1650 # ffffffffc020b818 <commands+0x210>
ffffffffc02041ae:	14f00593          	li	a1,335
ffffffffc02041b2:	00009517          	auipc	a0,0x9
ffffffffc02041b6:	97e50513          	addi	a0,a0,-1666 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc02041ba:	ae4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041be:	00009697          	auipc	a3,0x9
ffffffffc02041c2:	a4a68693          	addi	a3,a3,-1462 # ffffffffc020cc08 <default_pmm_manager+0x908>
ffffffffc02041c6:	00007617          	auipc	a2,0x7
ffffffffc02041ca:	65260613          	addi	a2,a2,1618 # ffffffffc020b818 <commands+0x210>
ffffffffc02041ce:	13b00593          	li	a1,315
ffffffffc02041d2:	00009517          	auipc	a0,0x9
ffffffffc02041d6:	95e50513          	addi	a0,a0,-1698 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc02041da:	ac4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041de:	00009697          	auipc	a3,0x9
ffffffffc02041e2:	a8a68693          	addi	a3,a3,-1398 # ffffffffc020cc68 <default_pmm_manager+0x968>
ffffffffc02041e6:	00007617          	auipc	a2,0x7
ffffffffc02041ea:	63260613          	addi	a2,a2,1586 # ffffffffc020b818 <commands+0x210>
ffffffffc02041ee:	14600593          	li	a1,326
ffffffffc02041f2:	00009517          	auipc	a0,0x9
ffffffffc02041f6:	93e50513          	addi	a0,a0,-1730 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc02041fa:	aa4fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02041fe:	00009697          	auipc	a3,0x9
ffffffffc0204202:	a5a68693          	addi	a3,a3,-1446 # ffffffffc020cc58 <default_pmm_manager+0x958>
ffffffffc0204206:	00007617          	auipc	a2,0x7
ffffffffc020420a:	61260613          	addi	a2,a2,1554 # ffffffffc020b818 <commands+0x210>
ffffffffc020420e:	14400593          	li	a1,324
ffffffffc0204212:	00009517          	auipc	a0,0x9
ffffffffc0204216:	91e50513          	addi	a0,a0,-1762 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020421a:	a84fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020421e:	00009697          	auipc	a3,0x9
ffffffffc0204222:	a5a68693          	addi	a3,a3,-1446 # ffffffffc020cc78 <default_pmm_manager+0x978>
ffffffffc0204226:	00007617          	auipc	a2,0x7
ffffffffc020422a:	5f260613          	addi	a2,a2,1522 # ffffffffc020b818 <commands+0x210>
ffffffffc020422e:	14800593          	li	a1,328
ffffffffc0204232:	00009517          	auipc	a0,0x9
ffffffffc0204236:	8fe50513          	addi	a0,a0,-1794 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020423a:	a64fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020423e:	00009697          	auipc	a3,0x9
ffffffffc0204242:	a5a68693          	addi	a3,a3,-1446 # ffffffffc020cc98 <default_pmm_manager+0x998>
ffffffffc0204246:	00007617          	auipc	a2,0x7
ffffffffc020424a:	5d260613          	addi	a2,a2,1490 # ffffffffc020b818 <commands+0x210>
ffffffffc020424e:	14c00593          	li	a1,332
ffffffffc0204252:	00009517          	auipc	a0,0x9
ffffffffc0204256:	8de50513          	addi	a0,a0,-1826 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020425a:	a44fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020425e:	00009697          	auipc	a3,0x9
ffffffffc0204262:	a2a68693          	addi	a3,a3,-1494 # ffffffffc020cc88 <default_pmm_manager+0x988>
ffffffffc0204266:	00007617          	auipc	a2,0x7
ffffffffc020426a:	5b260613          	addi	a2,a2,1458 # ffffffffc020b818 <commands+0x210>
ffffffffc020426e:	14a00593          	li	a1,330
ffffffffc0204272:	00009517          	auipc	a0,0x9
ffffffffc0204276:	8be50513          	addi	a0,a0,-1858 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020427a:	a24fc0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020427e:	00009697          	auipc	a3,0x9
ffffffffc0204282:	93a68693          	addi	a3,a3,-1734 # ffffffffc020cbb8 <default_pmm_manager+0x8b8>
ffffffffc0204286:	00007617          	auipc	a2,0x7
ffffffffc020428a:	59260613          	addi	a2,a2,1426 # ffffffffc020b818 <commands+0x210>
ffffffffc020428e:	12400593          	li	a1,292
ffffffffc0204292:	00009517          	auipc	a0,0x9
ffffffffc0204296:	89e50513          	addi	a0,a0,-1890 # ffffffffc020cb30 <default_pmm_manager+0x830>
ffffffffc020429a:	a04fc0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020429e <user_mem_check>:
ffffffffc020429e:	7179                	addi	sp,sp,-48
ffffffffc02042a0:	f022                	sd	s0,32(sp)
ffffffffc02042a2:	f406                	sd	ra,40(sp)
ffffffffc02042a4:	ec26                	sd	s1,24(sp)
ffffffffc02042a6:	e84a                	sd	s2,16(sp)
ffffffffc02042a8:	e44e                	sd	s3,8(sp)
ffffffffc02042aa:	e052                	sd	s4,0(sp)
ffffffffc02042ac:	842e                	mv	s0,a1
ffffffffc02042ae:	c135                	beqz	a0,ffffffffc0204312 <user_mem_check+0x74>
ffffffffc02042b0:	002007b7          	lui	a5,0x200
ffffffffc02042b4:	04f5e663          	bltu	a1,a5,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042b8:	00c584b3          	add	s1,a1,a2
ffffffffc02042bc:	0495f263          	bgeu	a1,s1,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042c0:	4785                	li	a5,1
ffffffffc02042c2:	07fe                	slli	a5,a5,0x1f
ffffffffc02042c4:	0297ee63          	bltu	a5,s1,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042c8:	892a                	mv	s2,a0
ffffffffc02042ca:	89b6                	mv	s3,a3
ffffffffc02042cc:	6a05                	lui	s4,0x1
ffffffffc02042ce:	a821                	j	ffffffffc02042e6 <user_mem_check+0x48>
ffffffffc02042d0:	0027f693          	andi	a3,a5,2
ffffffffc02042d4:	9752                	add	a4,a4,s4
ffffffffc02042d6:	8ba1                	andi	a5,a5,8
ffffffffc02042d8:	c685                	beqz	a3,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042da:	c399                	beqz	a5,ffffffffc02042e0 <user_mem_check+0x42>
ffffffffc02042dc:	02e46263          	bltu	s0,a4,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042e0:	6900                	ld	s0,16(a0)
ffffffffc02042e2:	04947663          	bgeu	s0,s1,ffffffffc020432e <user_mem_check+0x90>
ffffffffc02042e6:	85a2                	mv	a1,s0
ffffffffc02042e8:	854a                	mv	a0,s2
ffffffffc02042ea:	969ff0ef          	jal	ra,ffffffffc0203c52 <find_vma>
ffffffffc02042ee:	c909                	beqz	a0,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042f0:	6518                	ld	a4,8(a0)
ffffffffc02042f2:	00e46763          	bltu	s0,a4,ffffffffc0204300 <user_mem_check+0x62>
ffffffffc02042f6:	4d1c                	lw	a5,24(a0)
ffffffffc02042f8:	fc099ce3          	bnez	s3,ffffffffc02042d0 <user_mem_check+0x32>
ffffffffc02042fc:	8b85                	andi	a5,a5,1
ffffffffc02042fe:	f3ed                	bnez	a5,ffffffffc02042e0 <user_mem_check+0x42>
ffffffffc0204300:	4501                	li	a0,0
ffffffffc0204302:	70a2                	ld	ra,40(sp)
ffffffffc0204304:	7402                	ld	s0,32(sp)
ffffffffc0204306:	64e2                	ld	s1,24(sp)
ffffffffc0204308:	6942                	ld	s2,16(sp)
ffffffffc020430a:	69a2                	ld	s3,8(sp)
ffffffffc020430c:	6a02                	ld	s4,0(sp)
ffffffffc020430e:	6145                	addi	sp,sp,48
ffffffffc0204310:	8082                	ret
ffffffffc0204312:	c02007b7          	lui	a5,0xc0200
ffffffffc0204316:	4501                	li	a0,0
ffffffffc0204318:	fef5e5e3          	bltu	a1,a5,ffffffffc0204302 <user_mem_check+0x64>
ffffffffc020431c:	962e                	add	a2,a2,a1
ffffffffc020431e:	fec5f2e3          	bgeu	a1,a2,ffffffffc0204302 <user_mem_check+0x64>
ffffffffc0204322:	c8000537          	lui	a0,0xc8000
ffffffffc0204326:	0505                	addi	a0,a0,1
ffffffffc0204328:	00a63533          	sltu	a0,a2,a0
ffffffffc020432c:	bfd9                	j	ffffffffc0204302 <user_mem_check+0x64>
ffffffffc020432e:	4505                	li	a0,1
ffffffffc0204330:	bfc9                	j	ffffffffc0204302 <user_mem_check+0x64>

ffffffffc0204332 <copy_from_user>:
ffffffffc0204332:	1101                	addi	sp,sp,-32
ffffffffc0204334:	e822                	sd	s0,16(sp)
ffffffffc0204336:	e426                	sd	s1,8(sp)
ffffffffc0204338:	8432                	mv	s0,a2
ffffffffc020433a:	84b6                	mv	s1,a3
ffffffffc020433c:	e04a                	sd	s2,0(sp)
ffffffffc020433e:	86ba                	mv	a3,a4
ffffffffc0204340:	892e                	mv	s2,a1
ffffffffc0204342:	8626                	mv	a2,s1
ffffffffc0204344:	85a2                	mv	a1,s0
ffffffffc0204346:	ec06                	sd	ra,24(sp)
ffffffffc0204348:	f57ff0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc020434c:	c519                	beqz	a0,ffffffffc020435a <copy_from_user+0x28>
ffffffffc020434e:	8626                	mv	a2,s1
ffffffffc0204350:	85a2                	mv	a1,s0
ffffffffc0204352:	854a                	mv	a0,s2
ffffffffc0204354:	034070ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0204358:	4505                	li	a0,1
ffffffffc020435a:	60e2                	ld	ra,24(sp)
ffffffffc020435c:	6442                	ld	s0,16(sp)
ffffffffc020435e:	64a2                	ld	s1,8(sp)
ffffffffc0204360:	6902                	ld	s2,0(sp)
ffffffffc0204362:	6105                	addi	sp,sp,32
ffffffffc0204364:	8082                	ret

ffffffffc0204366 <copy_to_user>:
ffffffffc0204366:	1101                	addi	sp,sp,-32
ffffffffc0204368:	e822                	sd	s0,16(sp)
ffffffffc020436a:	8436                	mv	s0,a3
ffffffffc020436c:	e04a                	sd	s2,0(sp)
ffffffffc020436e:	4685                	li	a3,1
ffffffffc0204370:	8932                	mv	s2,a2
ffffffffc0204372:	8622                	mv	a2,s0
ffffffffc0204374:	e426                	sd	s1,8(sp)
ffffffffc0204376:	ec06                	sd	ra,24(sp)
ffffffffc0204378:	84ae                	mv	s1,a1
ffffffffc020437a:	f25ff0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc020437e:	c519                	beqz	a0,ffffffffc020438c <copy_to_user+0x26>
ffffffffc0204380:	8622                	mv	a2,s0
ffffffffc0204382:	85ca                	mv	a1,s2
ffffffffc0204384:	8526                	mv	a0,s1
ffffffffc0204386:	002070ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020438a:	4505                	li	a0,1
ffffffffc020438c:	60e2                	ld	ra,24(sp)
ffffffffc020438e:	6442                	ld	s0,16(sp)
ffffffffc0204390:	64a2                	ld	s1,8(sp)
ffffffffc0204392:	6902                	ld	s2,0(sp)
ffffffffc0204394:	6105                	addi	sp,sp,32
ffffffffc0204396:	8082                	ret

ffffffffc0204398 <copy_string>:
ffffffffc0204398:	7139                	addi	sp,sp,-64
ffffffffc020439a:	ec4e                	sd	s3,24(sp)
ffffffffc020439c:	6985                	lui	s3,0x1
ffffffffc020439e:	99b2                	add	s3,s3,a2
ffffffffc02043a0:	77fd                	lui	a5,0xfffff
ffffffffc02043a2:	00f9f9b3          	and	s3,s3,a5
ffffffffc02043a6:	f426                	sd	s1,40(sp)
ffffffffc02043a8:	f04a                	sd	s2,32(sp)
ffffffffc02043aa:	e852                	sd	s4,16(sp)
ffffffffc02043ac:	e456                	sd	s5,8(sp)
ffffffffc02043ae:	fc06                	sd	ra,56(sp)
ffffffffc02043b0:	f822                	sd	s0,48(sp)
ffffffffc02043b2:	84b2                	mv	s1,a2
ffffffffc02043b4:	8aaa                	mv	s5,a0
ffffffffc02043b6:	8a2e                	mv	s4,a1
ffffffffc02043b8:	8936                	mv	s2,a3
ffffffffc02043ba:	40c989b3          	sub	s3,s3,a2
ffffffffc02043be:	a015                	j	ffffffffc02043e2 <copy_string+0x4a>
ffffffffc02043c0:	6ef060ef          	jal	ra,ffffffffc020b2ae <strnlen>
ffffffffc02043c4:	87aa                	mv	a5,a0
ffffffffc02043c6:	85a6                	mv	a1,s1
ffffffffc02043c8:	8552                	mv	a0,s4
ffffffffc02043ca:	8622                	mv	a2,s0
ffffffffc02043cc:	0487e363          	bltu	a5,s0,ffffffffc0204412 <copy_string+0x7a>
ffffffffc02043d0:	0329f763          	bgeu	s3,s2,ffffffffc02043fe <copy_string+0x66>
ffffffffc02043d4:	7b5060ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc02043d8:	9a22                	add	s4,s4,s0
ffffffffc02043da:	94a2                	add	s1,s1,s0
ffffffffc02043dc:	40890933          	sub	s2,s2,s0
ffffffffc02043e0:	6985                	lui	s3,0x1
ffffffffc02043e2:	4681                	li	a3,0
ffffffffc02043e4:	85a6                	mv	a1,s1
ffffffffc02043e6:	8556                	mv	a0,s5
ffffffffc02043e8:	844a                	mv	s0,s2
ffffffffc02043ea:	0129f363          	bgeu	s3,s2,ffffffffc02043f0 <copy_string+0x58>
ffffffffc02043ee:	844e                	mv	s0,s3
ffffffffc02043f0:	8622                	mv	a2,s0
ffffffffc02043f2:	eadff0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc02043f6:	87aa                	mv	a5,a0
ffffffffc02043f8:	85a2                	mv	a1,s0
ffffffffc02043fa:	8526                	mv	a0,s1
ffffffffc02043fc:	f3f1                	bnez	a5,ffffffffc02043c0 <copy_string+0x28>
ffffffffc02043fe:	4501                	li	a0,0
ffffffffc0204400:	70e2                	ld	ra,56(sp)
ffffffffc0204402:	7442                	ld	s0,48(sp)
ffffffffc0204404:	74a2                	ld	s1,40(sp)
ffffffffc0204406:	7902                	ld	s2,32(sp)
ffffffffc0204408:	69e2                	ld	s3,24(sp)
ffffffffc020440a:	6a42                	ld	s4,16(sp)
ffffffffc020440c:	6aa2                	ld	s5,8(sp)
ffffffffc020440e:	6121                	addi	sp,sp,64
ffffffffc0204410:	8082                	ret
ffffffffc0204412:	00178613          	addi	a2,a5,1 # fffffffffffff001 <end+0x3fd686f1>
ffffffffc0204416:	773060ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020441a:	4505                	li	a0,1
ffffffffc020441c:	b7d5                	j	ffffffffc0204400 <copy_string+0x68>

ffffffffc020441e <__down.constprop.0>:
ffffffffc020441e:	715d                	addi	sp,sp,-80
ffffffffc0204420:	e0a2                	sd	s0,64(sp)
ffffffffc0204422:	e486                	sd	ra,72(sp)
ffffffffc0204424:	fc26                	sd	s1,56(sp)
ffffffffc0204426:	842a                	mv	s0,a0
ffffffffc0204428:	100027f3          	csrr	a5,sstatus
ffffffffc020442c:	8b89                	andi	a5,a5,2
ffffffffc020442e:	ebb1                	bnez	a5,ffffffffc0204482 <__down.constprop.0+0x64>
ffffffffc0204430:	411c                	lw	a5,0(a0)
ffffffffc0204432:	00f05a63          	blez	a5,ffffffffc0204446 <__down.constprop.0+0x28>
ffffffffc0204436:	37fd                	addiw	a5,a5,-1
ffffffffc0204438:	c11c                	sw	a5,0(a0)
ffffffffc020443a:	4501                	li	a0,0
ffffffffc020443c:	60a6                	ld	ra,72(sp)
ffffffffc020443e:	6406                	ld	s0,64(sp)
ffffffffc0204440:	74e2                	ld	s1,56(sp)
ffffffffc0204442:	6161                	addi	sp,sp,80
ffffffffc0204444:	8082                	ret
ffffffffc0204446:	00850413          	addi	s0,a0,8 # ffffffffc8000008 <end+0x7d696f8>
ffffffffc020444a:	0024                	addi	s1,sp,8
ffffffffc020444c:	10000613          	li	a2,256
ffffffffc0204450:	85a6                	mv	a1,s1
ffffffffc0204452:	8522                	mv	a0,s0
ffffffffc0204454:	2d8000ef          	jal	ra,ffffffffc020472c <wait_current_set>
ffffffffc0204458:	575020ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc020445c:	100027f3          	csrr	a5,sstatus
ffffffffc0204460:	8b89                	andi	a5,a5,2
ffffffffc0204462:	efb9                	bnez	a5,ffffffffc02044c0 <__down.constprop.0+0xa2>
ffffffffc0204464:	8526                	mv	a0,s1
ffffffffc0204466:	19c000ef          	jal	ra,ffffffffc0204602 <wait_in_queue>
ffffffffc020446a:	e531                	bnez	a0,ffffffffc02044b6 <__down.constprop.0+0x98>
ffffffffc020446c:	4542                	lw	a0,16(sp)
ffffffffc020446e:	10000793          	li	a5,256
ffffffffc0204472:	fcf515e3          	bne	a0,a5,ffffffffc020443c <__down.constprop.0+0x1e>
ffffffffc0204476:	60a6                	ld	ra,72(sp)
ffffffffc0204478:	6406                	ld	s0,64(sp)
ffffffffc020447a:	74e2                	ld	s1,56(sp)
ffffffffc020447c:	4501                	li	a0,0
ffffffffc020447e:	6161                	addi	sp,sp,80
ffffffffc0204480:	8082                	ret
ffffffffc0204482:	ff0fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204486:	401c                	lw	a5,0(s0)
ffffffffc0204488:	00f05c63          	blez	a5,ffffffffc02044a0 <__down.constprop.0+0x82>
ffffffffc020448c:	37fd                	addiw	a5,a5,-1
ffffffffc020448e:	c01c                	sw	a5,0(s0)
ffffffffc0204490:	fdcfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0204494:	60a6                	ld	ra,72(sp)
ffffffffc0204496:	6406                	ld	s0,64(sp)
ffffffffc0204498:	74e2                	ld	s1,56(sp)
ffffffffc020449a:	4501                	li	a0,0
ffffffffc020449c:	6161                	addi	sp,sp,80
ffffffffc020449e:	8082                	ret
ffffffffc02044a0:	0421                	addi	s0,s0,8
ffffffffc02044a2:	0024                	addi	s1,sp,8
ffffffffc02044a4:	10000613          	li	a2,256
ffffffffc02044a8:	85a6                	mv	a1,s1
ffffffffc02044aa:	8522                	mv	a0,s0
ffffffffc02044ac:	280000ef          	jal	ra,ffffffffc020472c <wait_current_set>
ffffffffc02044b0:	fbcfc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044b4:	b755                	j	ffffffffc0204458 <__down.constprop.0+0x3a>
ffffffffc02044b6:	85a6                	mv	a1,s1
ffffffffc02044b8:	8522                	mv	a0,s0
ffffffffc02044ba:	0ee000ef          	jal	ra,ffffffffc02045a8 <wait_queue_del>
ffffffffc02044be:	b77d                	j	ffffffffc020446c <__down.constprop.0+0x4e>
ffffffffc02044c0:	fb2fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02044c4:	8526                	mv	a0,s1
ffffffffc02044c6:	13c000ef          	jal	ra,ffffffffc0204602 <wait_in_queue>
ffffffffc02044ca:	e501                	bnez	a0,ffffffffc02044d2 <__down.constprop.0+0xb4>
ffffffffc02044cc:	fa0fc0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02044d0:	bf71                	j	ffffffffc020446c <__down.constprop.0+0x4e>
ffffffffc02044d2:	85a6                	mv	a1,s1
ffffffffc02044d4:	8522                	mv	a0,s0
ffffffffc02044d6:	0d2000ef          	jal	ra,ffffffffc02045a8 <wait_queue_del>
ffffffffc02044da:	bfcd                	j	ffffffffc02044cc <__down.constprop.0+0xae>

ffffffffc02044dc <__up.constprop.0>:
ffffffffc02044dc:	1101                	addi	sp,sp,-32
ffffffffc02044de:	e822                	sd	s0,16(sp)
ffffffffc02044e0:	ec06                	sd	ra,24(sp)
ffffffffc02044e2:	e426                	sd	s1,8(sp)
ffffffffc02044e4:	e04a                	sd	s2,0(sp)
ffffffffc02044e6:	842a                	mv	s0,a0
ffffffffc02044e8:	100027f3          	csrr	a5,sstatus
ffffffffc02044ec:	8b89                	andi	a5,a5,2
ffffffffc02044ee:	4901                	li	s2,0
ffffffffc02044f0:	eba1                	bnez	a5,ffffffffc0204540 <__up.constprop.0+0x64>
ffffffffc02044f2:	00840493          	addi	s1,s0,8
ffffffffc02044f6:	8526                	mv	a0,s1
ffffffffc02044f8:	0ee000ef          	jal	ra,ffffffffc02045e6 <wait_queue_first>
ffffffffc02044fc:	85aa                	mv	a1,a0
ffffffffc02044fe:	cd0d                	beqz	a0,ffffffffc0204538 <__up.constprop.0+0x5c>
ffffffffc0204500:	6118                	ld	a4,0(a0)
ffffffffc0204502:	10000793          	li	a5,256
ffffffffc0204506:	0ec72703          	lw	a4,236(a4)
ffffffffc020450a:	02f71f63          	bne	a4,a5,ffffffffc0204548 <__up.constprop.0+0x6c>
ffffffffc020450e:	4685                	li	a3,1
ffffffffc0204510:	10000613          	li	a2,256
ffffffffc0204514:	8526                	mv	a0,s1
ffffffffc0204516:	0fa000ef          	jal	ra,ffffffffc0204610 <wakeup_wait>
ffffffffc020451a:	00091863          	bnez	s2,ffffffffc020452a <__up.constprop.0+0x4e>
ffffffffc020451e:	60e2                	ld	ra,24(sp)
ffffffffc0204520:	6442                	ld	s0,16(sp)
ffffffffc0204522:	64a2                	ld	s1,8(sp)
ffffffffc0204524:	6902                	ld	s2,0(sp)
ffffffffc0204526:	6105                	addi	sp,sp,32
ffffffffc0204528:	8082                	ret
ffffffffc020452a:	6442                	ld	s0,16(sp)
ffffffffc020452c:	60e2                	ld	ra,24(sp)
ffffffffc020452e:	64a2                	ld	s1,8(sp)
ffffffffc0204530:	6902                	ld	s2,0(sp)
ffffffffc0204532:	6105                	addi	sp,sp,32
ffffffffc0204534:	f38fc06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0204538:	401c                	lw	a5,0(s0)
ffffffffc020453a:	2785                	addiw	a5,a5,1
ffffffffc020453c:	c01c                	sw	a5,0(s0)
ffffffffc020453e:	bff1                	j	ffffffffc020451a <__up.constprop.0+0x3e>
ffffffffc0204540:	f32fc0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0204544:	4905                	li	s2,1
ffffffffc0204546:	b775                	j	ffffffffc02044f2 <__up.constprop.0+0x16>
ffffffffc0204548:	00009697          	auipc	a3,0x9
ffffffffc020454c:	84868693          	addi	a3,a3,-1976 # ffffffffc020cd90 <default_pmm_manager+0xa90>
ffffffffc0204550:	00007617          	auipc	a2,0x7
ffffffffc0204554:	2c860613          	addi	a2,a2,712 # ffffffffc020b818 <commands+0x210>
ffffffffc0204558:	45e5                	li	a1,25
ffffffffc020455a:	00009517          	auipc	a0,0x9
ffffffffc020455e:	85e50513          	addi	a0,a0,-1954 # ffffffffc020cdb8 <default_pmm_manager+0xab8>
ffffffffc0204562:	f3dfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204566 <sem_init>:
ffffffffc0204566:	c10c                	sw	a1,0(a0)
ffffffffc0204568:	0521                	addi	a0,a0,8
ffffffffc020456a:	a825                	j	ffffffffc02045a2 <wait_queue_init>

ffffffffc020456c <up>:
ffffffffc020456c:	f71ff06f          	j	ffffffffc02044dc <__up.constprop.0>

ffffffffc0204570 <down>:
ffffffffc0204570:	1141                	addi	sp,sp,-16
ffffffffc0204572:	e406                	sd	ra,8(sp)
ffffffffc0204574:	eabff0ef          	jal	ra,ffffffffc020441e <__down.constprop.0>
ffffffffc0204578:	2501                	sext.w	a0,a0
ffffffffc020457a:	e501                	bnez	a0,ffffffffc0204582 <down+0x12>
ffffffffc020457c:	60a2                	ld	ra,8(sp)
ffffffffc020457e:	0141                	addi	sp,sp,16
ffffffffc0204580:	8082                	ret
ffffffffc0204582:	00009697          	auipc	a3,0x9
ffffffffc0204586:	84668693          	addi	a3,a3,-1978 # ffffffffc020cdc8 <default_pmm_manager+0xac8>
ffffffffc020458a:	00007617          	auipc	a2,0x7
ffffffffc020458e:	28e60613          	addi	a2,a2,654 # ffffffffc020b818 <commands+0x210>
ffffffffc0204592:	04000593          	li	a1,64
ffffffffc0204596:	00009517          	auipc	a0,0x9
ffffffffc020459a:	82250513          	addi	a0,a0,-2014 # ffffffffc020cdb8 <default_pmm_manager+0xab8>
ffffffffc020459e:	f01fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045a2 <wait_queue_init>:
ffffffffc02045a2:	e508                	sd	a0,8(a0)
ffffffffc02045a4:	e108                	sd	a0,0(a0)
ffffffffc02045a6:	8082                	ret

ffffffffc02045a8 <wait_queue_del>:
ffffffffc02045a8:	7198                	ld	a4,32(a1)
ffffffffc02045aa:	01858793          	addi	a5,a1,24
ffffffffc02045ae:	00e78b63          	beq	a5,a4,ffffffffc02045c4 <wait_queue_del+0x1c>
ffffffffc02045b2:	6994                	ld	a3,16(a1)
ffffffffc02045b4:	00a69863          	bne	a3,a0,ffffffffc02045c4 <wait_queue_del+0x1c>
ffffffffc02045b8:	6d94                	ld	a3,24(a1)
ffffffffc02045ba:	e698                	sd	a4,8(a3)
ffffffffc02045bc:	e314                	sd	a3,0(a4)
ffffffffc02045be:	f19c                	sd	a5,32(a1)
ffffffffc02045c0:	ed9c                	sd	a5,24(a1)
ffffffffc02045c2:	8082                	ret
ffffffffc02045c4:	1141                	addi	sp,sp,-16
ffffffffc02045c6:	00009697          	auipc	a3,0x9
ffffffffc02045ca:	86268693          	addi	a3,a3,-1950 # ffffffffc020ce28 <default_pmm_manager+0xb28>
ffffffffc02045ce:	00007617          	auipc	a2,0x7
ffffffffc02045d2:	24a60613          	addi	a2,a2,586 # ffffffffc020b818 <commands+0x210>
ffffffffc02045d6:	45f1                	li	a1,28
ffffffffc02045d8:	00009517          	auipc	a0,0x9
ffffffffc02045dc:	83850513          	addi	a0,a0,-1992 # ffffffffc020ce10 <default_pmm_manager+0xb10>
ffffffffc02045e0:	e406                	sd	ra,8(sp)
ffffffffc02045e2:	ebdfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02045e6 <wait_queue_first>:
ffffffffc02045e6:	651c                	ld	a5,8(a0)
ffffffffc02045e8:	00f50563          	beq	a0,a5,ffffffffc02045f2 <wait_queue_first+0xc>
ffffffffc02045ec:	fe878513          	addi	a0,a5,-24
ffffffffc02045f0:	8082                	ret
ffffffffc02045f2:	4501                	li	a0,0
ffffffffc02045f4:	8082                	ret

ffffffffc02045f6 <wait_queue_empty>:
ffffffffc02045f6:	651c                	ld	a5,8(a0)
ffffffffc02045f8:	40a78533          	sub	a0,a5,a0
ffffffffc02045fc:	00153513          	seqz	a0,a0
ffffffffc0204600:	8082                	ret

ffffffffc0204602 <wait_in_queue>:
ffffffffc0204602:	711c                	ld	a5,32(a0)
ffffffffc0204604:	0561                	addi	a0,a0,24
ffffffffc0204606:	40a78533          	sub	a0,a5,a0
ffffffffc020460a:	00a03533          	snez	a0,a0
ffffffffc020460e:	8082                	ret

ffffffffc0204610 <wakeup_wait>:
ffffffffc0204610:	e689                	bnez	a3,ffffffffc020461a <wakeup_wait+0xa>
ffffffffc0204612:	6188                	ld	a0,0(a1)
ffffffffc0204614:	c590                	sw	a2,8(a1)
ffffffffc0204616:	3050206f          	j	ffffffffc020711a <wakeup_proc>
ffffffffc020461a:	7198                	ld	a4,32(a1)
ffffffffc020461c:	01858793          	addi	a5,a1,24
ffffffffc0204620:	00e78e63          	beq	a5,a4,ffffffffc020463c <wakeup_wait+0x2c>
ffffffffc0204624:	6994                	ld	a3,16(a1)
ffffffffc0204626:	00d51b63          	bne	a0,a3,ffffffffc020463c <wakeup_wait+0x2c>
ffffffffc020462a:	6d94                	ld	a3,24(a1)
ffffffffc020462c:	6188                	ld	a0,0(a1)
ffffffffc020462e:	e698                	sd	a4,8(a3)
ffffffffc0204630:	e314                	sd	a3,0(a4)
ffffffffc0204632:	f19c                	sd	a5,32(a1)
ffffffffc0204634:	ed9c                	sd	a5,24(a1)
ffffffffc0204636:	c590                	sw	a2,8(a1)
ffffffffc0204638:	2e30206f          	j	ffffffffc020711a <wakeup_proc>
ffffffffc020463c:	1141                	addi	sp,sp,-16
ffffffffc020463e:	00008697          	auipc	a3,0x8
ffffffffc0204642:	7ea68693          	addi	a3,a3,2026 # ffffffffc020ce28 <default_pmm_manager+0xb28>
ffffffffc0204646:	00007617          	auipc	a2,0x7
ffffffffc020464a:	1d260613          	addi	a2,a2,466 # ffffffffc020b818 <commands+0x210>
ffffffffc020464e:	45f1                	li	a1,28
ffffffffc0204650:	00008517          	auipc	a0,0x8
ffffffffc0204654:	7c050513          	addi	a0,a0,1984 # ffffffffc020ce10 <default_pmm_manager+0xb10>
ffffffffc0204658:	e406                	sd	ra,8(sp)
ffffffffc020465a:	e45fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020465e <wakeup_queue>:
ffffffffc020465e:	651c                	ld	a5,8(a0)
ffffffffc0204660:	0ca78563          	beq	a5,a0,ffffffffc020472a <wakeup_queue+0xcc>
ffffffffc0204664:	1101                	addi	sp,sp,-32
ffffffffc0204666:	e822                	sd	s0,16(sp)
ffffffffc0204668:	e426                	sd	s1,8(sp)
ffffffffc020466a:	e04a                	sd	s2,0(sp)
ffffffffc020466c:	ec06                	sd	ra,24(sp)
ffffffffc020466e:	84aa                	mv	s1,a0
ffffffffc0204670:	892e                	mv	s2,a1
ffffffffc0204672:	fe878413          	addi	s0,a5,-24
ffffffffc0204676:	e23d                	bnez	a2,ffffffffc02046dc <wakeup_queue+0x7e>
ffffffffc0204678:	6008                	ld	a0,0(s0)
ffffffffc020467a:	01242423          	sw	s2,8(s0)
ffffffffc020467e:	29d020ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc0204682:	701c                	ld	a5,32(s0)
ffffffffc0204684:	01840713          	addi	a4,s0,24
ffffffffc0204688:	02e78463          	beq	a5,a4,ffffffffc02046b0 <wakeup_queue+0x52>
ffffffffc020468c:	6818                	ld	a4,16(s0)
ffffffffc020468e:	02e49163          	bne	s1,a4,ffffffffc02046b0 <wakeup_queue+0x52>
ffffffffc0204692:	02f48f63          	beq	s1,a5,ffffffffc02046d0 <wakeup_queue+0x72>
ffffffffc0204696:	fe87b503          	ld	a0,-24(a5)
ffffffffc020469a:	ff27a823          	sw	s2,-16(a5)
ffffffffc020469e:	fe878413          	addi	s0,a5,-24
ffffffffc02046a2:	279020ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc02046a6:	701c                	ld	a5,32(s0)
ffffffffc02046a8:	01840713          	addi	a4,s0,24
ffffffffc02046ac:	fee790e3          	bne	a5,a4,ffffffffc020468c <wakeup_queue+0x2e>
ffffffffc02046b0:	00008697          	auipc	a3,0x8
ffffffffc02046b4:	77868693          	addi	a3,a3,1912 # ffffffffc020ce28 <default_pmm_manager+0xb28>
ffffffffc02046b8:	00007617          	auipc	a2,0x7
ffffffffc02046bc:	16060613          	addi	a2,a2,352 # ffffffffc020b818 <commands+0x210>
ffffffffc02046c0:	02200593          	li	a1,34
ffffffffc02046c4:	00008517          	auipc	a0,0x8
ffffffffc02046c8:	74c50513          	addi	a0,a0,1868 # ffffffffc020ce10 <default_pmm_manager+0xb10>
ffffffffc02046cc:	dd3fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02046d0:	60e2                	ld	ra,24(sp)
ffffffffc02046d2:	6442                	ld	s0,16(sp)
ffffffffc02046d4:	64a2                	ld	s1,8(sp)
ffffffffc02046d6:	6902                	ld	s2,0(sp)
ffffffffc02046d8:	6105                	addi	sp,sp,32
ffffffffc02046da:	8082                	ret
ffffffffc02046dc:	6798                	ld	a4,8(a5)
ffffffffc02046de:	02f70763          	beq	a4,a5,ffffffffc020470c <wakeup_queue+0xae>
ffffffffc02046e2:	6814                	ld	a3,16(s0)
ffffffffc02046e4:	02d49463          	bne	s1,a3,ffffffffc020470c <wakeup_queue+0xae>
ffffffffc02046e8:	6c14                	ld	a3,24(s0)
ffffffffc02046ea:	6008                	ld	a0,0(s0)
ffffffffc02046ec:	e698                	sd	a4,8(a3)
ffffffffc02046ee:	e314                	sd	a3,0(a4)
ffffffffc02046f0:	f01c                	sd	a5,32(s0)
ffffffffc02046f2:	ec1c                	sd	a5,24(s0)
ffffffffc02046f4:	01242423          	sw	s2,8(s0)
ffffffffc02046f8:	223020ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc02046fc:	6480                	ld	s0,8(s1)
ffffffffc02046fe:	fc8489e3          	beq	s1,s0,ffffffffc02046d0 <wakeup_queue+0x72>
ffffffffc0204702:	6418                	ld	a4,8(s0)
ffffffffc0204704:	87a2                	mv	a5,s0
ffffffffc0204706:	1421                	addi	s0,s0,-24
ffffffffc0204708:	fce79de3          	bne	a5,a4,ffffffffc02046e2 <wakeup_queue+0x84>
ffffffffc020470c:	00008697          	auipc	a3,0x8
ffffffffc0204710:	71c68693          	addi	a3,a3,1820 # ffffffffc020ce28 <default_pmm_manager+0xb28>
ffffffffc0204714:	00007617          	auipc	a2,0x7
ffffffffc0204718:	10460613          	addi	a2,a2,260 # ffffffffc020b818 <commands+0x210>
ffffffffc020471c:	45f1                	li	a1,28
ffffffffc020471e:	00008517          	auipc	a0,0x8
ffffffffc0204722:	6f250513          	addi	a0,a0,1778 # ffffffffc020ce10 <default_pmm_manager+0xb10>
ffffffffc0204726:	d79fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020472a:	8082                	ret

ffffffffc020472c <wait_current_set>:
ffffffffc020472c:	00092797          	auipc	a5,0x92
ffffffffc0204730:	1947b783          	ld	a5,404(a5) # ffffffffc02968c0 <current>
ffffffffc0204734:	c39d                	beqz	a5,ffffffffc020475a <wait_current_set+0x2e>
ffffffffc0204736:	01858713          	addi	a4,a1,24
ffffffffc020473a:	800006b7          	lui	a3,0x80000
ffffffffc020473e:	ed98                	sd	a4,24(a1)
ffffffffc0204740:	e19c                	sd	a5,0(a1)
ffffffffc0204742:	c594                	sw	a3,8(a1)
ffffffffc0204744:	4685                	li	a3,1
ffffffffc0204746:	c394                	sw	a3,0(a5)
ffffffffc0204748:	0ec7a623          	sw	a2,236(a5)
ffffffffc020474c:	611c                	ld	a5,0(a0)
ffffffffc020474e:	e988                	sd	a0,16(a1)
ffffffffc0204750:	e118                	sd	a4,0(a0)
ffffffffc0204752:	e798                	sd	a4,8(a5)
ffffffffc0204754:	f188                	sd	a0,32(a1)
ffffffffc0204756:	ed9c                	sd	a5,24(a1)
ffffffffc0204758:	8082                	ret
ffffffffc020475a:	1141                	addi	sp,sp,-16
ffffffffc020475c:	00008697          	auipc	a3,0x8
ffffffffc0204760:	70c68693          	addi	a3,a3,1804 # ffffffffc020ce68 <default_pmm_manager+0xb68>
ffffffffc0204764:	00007617          	auipc	a2,0x7
ffffffffc0204768:	0b460613          	addi	a2,a2,180 # ffffffffc020b818 <commands+0x210>
ffffffffc020476c:	07400593          	li	a1,116
ffffffffc0204770:	00008517          	auipc	a0,0x8
ffffffffc0204774:	6a050513          	addi	a0,a0,1696 # ffffffffc020ce10 <default_pmm_manager+0xb10>
ffffffffc0204778:	e406                	sd	ra,8(sp)
ffffffffc020477a:	d25fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020477e <get_fd_array.part.0>:
ffffffffc020477e:	1141                	addi	sp,sp,-16
ffffffffc0204780:	00008697          	auipc	a3,0x8
ffffffffc0204784:	6f868693          	addi	a3,a3,1784 # ffffffffc020ce78 <default_pmm_manager+0xb78>
ffffffffc0204788:	00007617          	auipc	a2,0x7
ffffffffc020478c:	09060613          	addi	a2,a2,144 # ffffffffc020b818 <commands+0x210>
ffffffffc0204790:	45d1                	li	a1,20
ffffffffc0204792:	00008517          	auipc	a0,0x8
ffffffffc0204796:	71650513          	addi	a0,a0,1814 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc020479a:	e406                	sd	ra,8(sp)
ffffffffc020479c:	d03fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02047a0 <fd_array_alloc>:
ffffffffc02047a0:	00092797          	auipc	a5,0x92
ffffffffc02047a4:	1207b783          	ld	a5,288(a5) # ffffffffc02968c0 <current>
ffffffffc02047a8:	1487b783          	ld	a5,328(a5)
ffffffffc02047ac:	1141                	addi	sp,sp,-16
ffffffffc02047ae:	e406                	sd	ra,8(sp)
ffffffffc02047b0:	c3a5                	beqz	a5,ffffffffc0204810 <fd_array_alloc+0x70>
ffffffffc02047b2:	4b98                	lw	a4,16(a5)
ffffffffc02047b4:	04e05e63          	blez	a4,ffffffffc0204810 <fd_array_alloc+0x70>
ffffffffc02047b8:	775d                	lui	a4,0xffff7
ffffffffc02047ba:	ad970713          	addi	a4,a4,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc02047be:	679c                	ld	a5,8(a5)
ffffffffc02047c0:	02e50863          	beq	a0,a4,ffffffffc02047f0 <fd_array_alloc+0x50>
ffffffffc02047c4:	04700713          	li	a4,71
ffffffffc02047c8:	04a76263          	bltu	a4,a0,ffffffffc020480c <fd_array_alloc+0x6c>
ffffffffc02047cc:	00351713          	slli	a4,a0,0x3
ffffffffc02047d0:	40a70533          	sub	a0,a4,a0
ffffffffc02047d4:	050e                	slli	a0,a0,0x3
ffffffffc02047d6:	97aa                	add	a5,a5,a0
ffffffffc02047d8:	4398                	lw	a4,0(a5)
ffffffffc02047da:	e71d                	bnez	a4,ffffffffc0204808 <fd_array_alloc+0x68>
ffffffffc02047dc:	5b88                	lw	a0,48(a5)
ffffffffc02047de:	e91d                	bnez	a0,ffffffffc0204814 <fd_array_alloc+0x74>
ffffffffc02047e0:	4705                	li	a4,1
ffffffffc02047e2:	c398                	sw	a4,0(a5)
ffffffffc02047e4:	0207b423          	sd	zero,40(a5)
ffffffffc02047e8:	e19c                	sd	a5,0(a1)
ffffffffc02047ea:	60a2                	ld	ra,8(sp)
ffffffffc02047ec:	0141                	addi	sp,sp,16
ffffffffc02047ee:	8082                	ret
ffffffffc02047f0:	6685                	lui	a3,0x1
ffffffffc02047f2:	fc068693          	addi	a3,a3,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02047f6:	96be                	add	a3,a3,a5
ffffffffc02047f8:	4398                	lw	a4,0(a5)
ffffffffc02047fa:	d36d                	beqz	a4,ffffffffc02047dc <fd_array_alloc+0x3c>
ffffffffc02047fc:	03878793          	addi	a5,a5,56
ffffffffc0204800:	fef69ce3          	bne	a3,a5,ffffffffc02047f8 <fd_array_alloc+0x58>
ffffffffc0204804:	5529                	li	a0,-22
ffffffffc0204806:	b7d5                	j	ffffffffc02047ea <fd_array_alloc+0x4a>
ffffffffc0204808:	5545                	li	a0,-15
ffffffffc020480a:	b7c5                	j	ffffffffc02047ea <fd_array_alloc+0x4a>
ffffffffc020480c:	5575                	li	a0,-3
ffffffffc020480e:	bff1                	j	ffffffffc02047ea <fd_array_alloc+0x4a>
ffffffffc0204810:	f6fff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>
ffffffffc0204814:	00008697          	auipc	a3,0x8
ffffffffc0204818:	6a468693          	addi	a3,a3,1700 # ffffffffc020ceb8 <default_pmm_manager+0xbb8>
ffffffffc020481c:	00007617          	auipc	a2,0x7
ffffffffc0204820:	ffc60613          	addi	a2,a2,-4 # ffffffffc020b818 <commands+0x210>
ffffffffc0204824:	03b00593          	li	a1,59
ffffffffc0204828:	00008517          	auipc	a0,0x8
ffffffffc020482c:	68050513          	addi	a0,a0,1664 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204830:	c6ffb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204834 <fd_array_free>:
ffffffffc0204834:	411c                	lw	a5,0(a0)
ffffffffc0204836:	1141                	addi	sp,sp,-16
ffffffffc0204838:	e022                	sd	s0,0(sp)
ffffffffc020483a:	e406                	sd	ra,8(sp)
ffffffffc020483c:	4705                	li	a4,1
ffffffffc020483e:	842a                	mv	s0,a0
ffffffffc0204840:	04e78063          	beq	a5,a4,ffffffffc0204880 <fd_array_free+0x4c>
ffffffffc0204844:	470d                	li	a4,3
ffffffffc0204846:	04e79563          	bne	a5,a4,ffffffffc0204890 <fd_array_free+0x5c>
ffffffffc020484a:	591c                	lw	a5,48(a0)
ffffffffc020484c:	c38d                	beqz	a5,ffffffffc020486e <fd_array_free+0x3a>
ffffffffc020484e:	00008697          	auipc	a3,0x8
ffffffffc0204852:	66a68693          	addi	a3,a3,1642 # ffffffffc020ceb8 <default_pmm_manager+0xbb8>
ffffffffc0204856:	00007617          	auipc	a2,0x7
ffffffffc020485a:	fc260613          	addi	a2,a2,-62 # ffffffffc020b818 <commands+0x210>
ffffffffc020485e:	04500593          	li	a1,69
ffffffffc0204862:	00008517          	auipc	a0,0x8
ffffffffc0204866:	64650513          	addi	a0,a0,1606 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc020486a:	c35fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020486e:	7408                	ld	a0,40(s0)
ffffffffc0204870:	720030ef          	jal	ra,ffffffffc0207f90 <vfs_close>
ffffffffc0204874:	60a2                	ld	ra,8(sp)
ffffffffc0204876:	00042023          	sw	zero,0(s0)
ffffffffc020487a:	6402                	ld	s0,0(sp)
ffffffffc020487c:	0141                	addi	sp,sp,16
ffffffffc020487e:	8082                	ret
ffffffffc0204880:	591c                	lw	a5,48(a0)
ffffffffc0204882:	f7f1                	bnez	a5,ffffffffc020484e <fd_array_free+0x1a>
ffffffffc0204884:	60a2                	ld	ra,8(sp)
ffffffffc0204886:	00042023          	sw	zero,0(s0)
ffffffffc020488a:	6402                	ld	s0,0(sp)
ffffffffc020488c:	0141                	addi	sp,sp,16
ffffffffc020488e:	8082                	ret
ffffffffc0204890:	00008697          	auipc	a3,0x8
ffffffffc0204894:	66068693          	addi	a3,a3,1632 # ffffffffc020cef0 <default_pmm_manager+0xbf0>
ffffffffc0204898:	00007617          	auipc	a2,0x7
ffffffffc020489c:	f8060613          	addi	a2,a2,-128 # ffffffffc020b818 <commands+0x210>
ffffffffc02048a0:	04400593          	li	a1,68
ffffffffc02048a4:	00008517          	auipc	a0,0x8
ffffffffc02048a8:	60450513          	addi	a0,a0,1540 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc02048ac:	bf3fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02048b0 <fd_array_release>:
ffffffffc02048b0:	4118                	lw	a4,0(a0)
ffffffffc02048b2:	1141                	addi	sp,sp,-16
ffffffffc02048b4:	e406                	sd	ra,8(sp)
ffffffffc02048b6:	4685                	li	a3,1
ffffffffc02048b8:	3779                	addiw	a4,a4,-2
ffffffffc02048ba:	04e6e063          	bltu	a3,a4,ffffffffc02048fa <fd_array_release+0x4a>
ffffffffc02048be:	5918                	lw	a4,48(a0)
ffffffffc02048c0:	00e05d63          	blez	a4,ffffffffc02048da <fd_array_release+0x2a>
ffffffffc02048c4:	fff7069b          	addiw	a3,a4,-1
ffffffffc02048c8:	d914                	sw	a3,48(a0)
ffffffffc02048ca:	c681                	beqz	a3,ffffffffc02048d2 <fd_array_release+0x22>
ffffffffc02048cc:	60a2                	ld	ra,8(sp)
ffffffffc02048ce:	0141                	addi	sp,sp,16
ffffffffc02048d0:	8082                	ret
ffffffffc02048d2:	60a2                	ld	ra,8(sp)
ffffffffc02048d4:	0141                	addi	sp,sp,16
ffffffffc02048d6:	f5fff06f          	j	ffffffffc0204834 <fd_array_free>
ffffffffc02048da:	00008697          	auipc	a3,0x8
ffffffffc02048de:	68668693          	addi	a3,a3,1670 # ffffffffc020cf60 <default_pmm_manager+0xc60>
ffffffffc02048e2:	00007617          	auipc	a2,0x7
ffffffffc02048e6:	f3660613          	addi	a2,a2,-202 # ffffffffc020b818 <commands+0x210>
ffffffffc02048ea:	05600593          	li	a1,86
ffffffffc02048ee:	00008517          	auipc	a0,0x8
ffffffffc02048f2:	5ba50513          	addi	a0,a0,1466 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc02048f6:	ba9fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02048fa:	00008697          	auipc	a3,0x8
ffffffffc02048fe:	62e68693          	addi	a3,a3,1582 # ffffffffc020cf28 <default_pmm_manager+0xc28>
ffffffffc0204902:	00007617          	auipc	a2,0x7
ffffffffc0204906:	f1660613          	addi	a2,a2,-234 # ffffffffc020b818 <commands+0x210>
ffffffffc020490a:	05500593          	li	a1,85
ffffffffc020490e:	00008517          	auipc	a0,0x8
ffffffffc0204912:	59a50513          	addi	a0,a0,1434 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204916:	b89fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020491a <fd_array_open.part.0>:
ffffffffc020491a:	1141                	addi	sp,sp,-16
ffffffffc020491c:	00008697          	auipc	a3,0x8
ffffffffc0204920:	65c68693          	addi	a3,a3,1628 # ffffffffc020cf78 <default_pmm_manager+0xc78>
ffffffffc0204924:	00007617          	auipc	a2,0x7
ffffffffc0204928:	ef460613          	addi	a2,a2,-268 # ffffffffc020b818 <commands+0x210>
ffffffffc020492c:	05f00593          	li	a1,95
ffffffffc0204930:	00008517          	auipc	a0,0x8
ffffffffc0204934:	57850513          	addi	a0,a0,1400 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204938:	e406                	sd	ra,8(sp)
ffffffffc020493a:	b65fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020493e <fd_array_init>:
ffffffffc020493e:	4781                	li	a5,0
ffffffffc0204940:	04800713          	li	a4,72
ffffffffc0204944:	cd1c                	sw	a5,24(a0)
ffffffffc0204946:	02052823          	sw	zero,48(a0)
ffffffffc020494a:	00052023          	sw	zero,0(a0)
ffffffffc020494e:	2785                	addiw	a5,a5,1
ffffffffc0204950:	03850513          	addi	a0,a0,56
ffffffffc0204954:	fee798e3          	bne	a5,a4,ffffffffc0204944 <fd_array_init+0x6>
ffffffffc0204958:	8082                	ret

ffffffffc020495a <fd_array_close>:
ffffffffc020495a:	4118                	lw	a4,0(a0)
ffffffffc020495c:	1141                	addi	sp,sp,-16
ffffffffc020495e:	e406                	sd	ra,8(sp)
ffffffffc0204960:	e022                	sd	s0,0(sp)
ffffffffc0204962:	4789                	li	a5,2
ffffffffc0204964:	04f71a63          	bne	a4,a5,ffffffffc02049b8 <fd_array_close+0x5e>
ffffffffc0204968:	591c                	lw	a5,48(a0)
ffffffffc020496a:	842a                	mv	s0,a0
ffffffffc020496c:	02f05663          	blez	a5,ffffffffc0204998 <fd_array_close+0x3e>
ffffffffc0204970:	37fd                	addiw	a5,a5,-1
ffffffffc0204972:	470d                	li	a4,3
ffffffffc0204974:	c118                	sw	a4,0(a0)
ffffffffc0204976:	d91c                	sw	a5,48(a0)
ffffffffc0204978:	0007871b          	sext.w	a4,a5
ffffffffc020497c:	c709                	beqz	a4,ffffffffc0204986 <fd_array_close+0x2c>
ffffffffc020497e:	60a2                	ld	ra,8(sp)
ffffffffc0204980:	6402                	ld	s0,0(sp)
ffffffffc0204982:	0141                	addi	sp,sp,16
ffffffffc0204984:	8082                	ret
ffffffffc0204986:	7508                	ld	a0,40(a0)
ffffffffc0204988:	608030ef          	jal	ra,ffffffffc0207f90 <vfs_close>
ffffffffc020498c:	60a2                	ld	ra,8(sp)
ffffffffc020498e:	00042023          	sw	zero,0(s0)
ffffffffc0204992:	6402                	ld	s0,0(sp)
ffffffffc0204994:	0141                	addi	sp,sp,16
ffffffffc0204996:	8082                	ret
ffffffffc0204998:	00008697          	auipc	a3,0x8
ffffffffc020499c:	5c868693          	addi	a3,a3,1480 # ffffffffc020cf60 <default_pmm_manager+0xc60>
ffffffffc02049a0:	00007617          	auipc	a2,0x7
ffffffffc02049a4:	e7860613          	addi	a2,a2,-392 # ffffffffc020b818 <commands+0x210>
ffffffffc02049a8:	06800593          	li	a1,104
ffffffffc02049ac:	00008517          	auipc	a0,0x8
ffffffffc02049b0:	4fc50513          	addi	a0,a0,1276 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc02049b4:	aebfb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02049b8:	00008697          	auipc	a3,0x8
ffffffffc02049bc:	51868693          	addi	a3,a3,1304 # ffffffffc020ced0 <default_pmm_manager+0xbd0>
ffffffffc02049c0:	00007617          	auipc	a2,0x7
ffffffffc02049c4:	e5860613          	addi	a2,a2,-424 # ffffffffc020b818 <commands+0x210>
ffffffffc02049c8:	06700593          	li	a1,103
ffffffffc02049cc:	00008517          	auipc	a0,0x8
ffffffffc02049d0:	4dc50513          	addi	a0,a0,1244 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc02049d4:	acbfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02049d8 <fd_array_dup>:
ffffffffc02049d8:	7179                	addi	sp,sp,-48
ffffffffc02049da:	e84a                	sd	s2,16(sp)
ffffffffc02049dc:	00052903          	lw	s2,0(a0)
ffffffffc02049e0:	f406                	sd	ra,40(sp)
ffffffffc02049e2:	f022                	sd	s0,32(sp)
ffffffffc02049e4:	ec26                	sd	s1,24(sp)
ffffffffc02049e6:	e44e                	sd	s3,8(sp)
ffffffffc02049e8:	4785                	li	a5,1
ffffffffc02049ea:	04f91663          	bne	s2,a5,ffffffffc0204a36 <fd_array_dup+0x5e>
ffffffffc02049ee:	0005a983          	lw	s3,0(a1)
ffffffffc02049f2:	4789                	li	a5,2
ffffffffc02049f4:	04f99163          	bne	s3,a5,ffffffffc0204a36 <fd_array_dup+0x5e>
ffffffffc02049f8:	7584                	ld	s1,40(a1)
ffffffffc02049fa:	699c                	ld	a5,16(a1)
ffffffffc02049fc:	7194                	ld	a3,32(a1)
ffffffffc02049fe:	6598                	ld	a4,8(a1)
ffffffffc0204a00:	842a                	mv	s0,a0
ffffffffc0204a02:	e91c                	sd	a5,16(a0)
ffffffffc0204a04:	f114                	sd	a3,32(a0)
ffffffffc0204a06:	e518                	sd	a4,8(a0)
ffffffffc0204a08:	8526                	mv	a0,s1
ffffffffc0204a0a:	4e5020ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc0204a0e:	8526                	mv	a0,s1
ffffffffc0204a10:	4eb020ef          	jal	ra,ffffffffc02076fa <inode_open_inc>
ffffffffc0204a14:	401c                	lw	a5,0(s0)
ffffffffc0204a16:	f404                	sd	s1,40(s0)
ffffffffc0204a18:	03279f63          	bne	a5,s2,ffffffffc0204a56 <fd_array_dup+0x7e>
ffffffffc0204a1c:	cc8d                	beqz	s1,ffffffffc0204a56 <fd_array_dup+0x7e>
ffffffffc0204a1e:	581c                	lw	a5,48(s0)
ffffffffc0204a20:	01342023          	sw	s3,0(s0)
ffffffffc0204a24:	70a2                	ld	ra,40(sp)
ffffffffc0204a26:	2785                	addiw	a5,a5,1
ffffffffc0204a28:	d81c                	sw	a5,48(s0)
ffffffffc0204a2a:	7402                	ld	s0,32(sp)
ffffffffc0204a2c:	64e2                	ld	s1,24(sp)
ffffffffc0204a2e:	6942                	ld	s2,16(sp)
ffffffffc0204a30:	69a2                	ld	s3,8(sp)
ffffffffc0204a32:	6145                	addi	sp,sp,48
ffffffffc0204a34:	8082                	ret
ffffffffc0204a36:	00008697          	auipc	a3,0x8
ffffffffc0204a3a:	57268693          	addi	a3,a3,1394 # ffffffffc020cfa8 <default_pmm_manager+0xca8>
ffffffffc0204a3e:	00007617          	auipc	a2,0x7
ffffffffc0204a42:	dda60613          	addi	a2,a2,-550 # ffffffffc020b818 <commands+0x210>
ffffffffc0204a46:	07300593          	li	a1,115
ffffffffc0204a4a:	00008517          	auipc	a0,0x8
ffffffffc0204a4e:	45e50513          	addi	a0,a0,1118 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204a52:	a4dfb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204a56:	ec5ff0ef          	jal	ra,ffffffffc020491a <fd_array_open.part.0>

ffffffffc0204a5a <file_testfd>:
ffffffffc0204a5a:	04700793          	li	a5,71
ffffffffc0204a5e:	04a7e263          	bltu	a5,a0,ffffffffc0204aa2 <file_testfd+0x48>
ffffffffc0204a62:	00092797          	auipc	a5,0x92
ffffffffc0204a66:	e5e7b783          	ld	a5,-418(a5) # ffffffffc02968c0 <current>
ffffffffc0204a6a:	1487b783          	ld	a5,328(a5)
ffffffffc0204a6e:	cf85                	beqz	a5,ffffffffc0204aa6 <file_testfd+0x4c>
ffffffffc0204a70:	4b98                	lw	a4,16(a5)
ffffffffc0204a72:	02e05a63          	blez	a4,ffffffffc0204aa6 <file_testfd+0x4c>
ffffffffc0204a76:	6798                	ld	a4,8(a5)
ffffffffc0204a78:	00351793          	slli	a5,a0,0x3
ffffffffc0204a7c:	8f89                	sub	a5,a5,a0
ffffffffc0204a7e:	078e                	slli	a5,a5,0x3
ffffffffc0204a80:	97ba                	add	a5,a5,a4
ffffffffc0204a82:	4394                	lw	a3,0(a5)
ffffffffc0204a84:	4709                	li	a4,2
ffffffffc0204a86:	00e69e63          	bne	a3,a4,ffffffffc0204aa2 <file_testfd+0x48>
ffffffffc0204a8a:	4f98                	lw	a4,24(a5)
ffffffffc0204a8c:	00a71b63          	bne	a4,a0,ffffffffc0204aa2 <file_testfd+0x48>
ffffffffc0204a90:	c199                	beqz	a1,ffffffffc0204a96 <file_testfd+0x3c>
ffffffffc0204a92:	6788                	ld	a0,8(a5)
ffffffffc0204a94:	c901                	beqz	a0,ffffffffc0204aa4 <file_testfd+0x4a>
ffffffffc0204a96:	4505                	li	a0,1
ffffffffc0204a98:	c611                	beqz	a2,ffffffffc0204aa4 <file_testfd+0x4a>
ffffffffc0204a9a:	6b88                	ld	a0,16(a5)
ffffffffc0204a9c:	00a03533          	snez	a0,a0
ffffffffc0204aa0:	8082                	ret
ffffffffc0204aa2:	4501                	li	a0,0
ffffffffc0204aa4:	8082                	ret
ffffffffc0204aa6:	1141                	addi	sp,sp,-16
ffffffffc0204aa8:	e406                	sd	ra,8(sp)
ffffffffc0204aaa:	cd5ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>

ffffffffc0204aae <file_open>:
ffffffffc0204aae:	711d                	addi	sp,sp,-96
ffffffffc0204ab0:	ec86                	sd	ra,88(sp)
ffffffffc0204ab2:	e8a2                	sd	s0,80(sp)
ffffffffc0204ab4:	e4a6                	sd	s1,72(sp)
ffffffffc0204ab6:	e0ca                	sd	s2,64(sp)
ffffffffc0204ab8:	fc4e                	sd	s3,56(sp)
ffffffffc0204aba:	f852                	sd	s4,48(sp)
ffffffffc0204abc:	0035f793          	andi	a5,a1,3
ffffffffc0204ac0:	470d                	li	a4,3
ffffffffc0204ac2:	0ce78163          	beq	a5,a4,ffffffffc0204b84 <file_open+0xd6>
ffffffffc0204ac6:	078e                	slli	a5,a5,0x3
ffffffffc0204ac8:	00008717          	auipc	a4,0x8
ffffffffc0204acc:	75070713          	addi	a4,a4,1872 # ffffffffc020d218 <CSWTCH.79>
ffffffffc0204ad0:	892a                	mv	s2,a0
ffffffffc0204ad2:	00008697          	auipc	a3,0x8
ffffffffc0204ad6:	72e68693          	addi	a3,a3,1838 # ffffffffc020d200 <CSWTCH.78>
ffffffffc0204ada:	755d                	lui	a0,0xffff7
ffffffffc0204adc:	96be                	add	a3,a3,a5
ffffffffc0204ade:	84ae                	mv	s1,a1
ffffffffc0204ae0:	97ba                	add	a5,a5,a4
ffffffffc0204ae2:	858a                	mv	a1,sp
ffffffffc0204ae4:	ad950513          	addi	a0,a0,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc0204ae8:	0006ba03          	ld	s4,0(a3)
ffffffffc0204aec:	0007b983          	ld	s3,0(a5)
ffffffffc0204af0:	cb1ff0ef          	jal	ra,ffffffffc02047a0 <fd_array_alloc>
ffffffffc0204af4:	842a                	mv	s0,a0
ffffffffc0204af6:	c911                	beqz	a0,ffffffffc0204b0a <file_open+0x5c>
ffffffffc0204af8:	60e6                	ld	ra,88(sp)
ffffffffc0204afa:	8522                	mv	a0,s0
ffffffffc0204afc:	6446                	ld	s0,80(sp)
ffffffffc0204afe:	64a6                	ld	s1,72(sp)
ffffffffc0204b00:	6906                	ld	s2,64(sp)
ffffffffc0204b02:	79e2                	ld	s3,56(sp)
ffffffffc0204b04:	7a42                	ld	s4,48(sp)
ffffffffc0204b06:	6125                	addi	sp,sp,96
ffffffffc0204b08:	8082                	ret
ffffffffc0204b0a:	0030                	addi	a2,sp,8
ffffffffc0204b0c:	85a6                	mv	a1,s1
ffffffffc0204b0e:	854a                	mv	a0,s2
ffffffffc0204b10:	2da030ef          	jal	ra,ffffffffc0207dea <vfs_open>
ffffffffc0204b14:	842a                	mv	s0,a0
ffffffffc0204b16:	e13d                	bnez	a0,ffffffffc0204b7c <file_open+0xce>
ffffffffc0204b18:	6782                	ld	a5,0(sp)
ffffffffc0204b1a:	0204f493          	andi	s1,s1,32
ffffffffc0204b1e:	6422                	ld	s0,8(sp)
ffffffffc0204b20:	0207b023          	sd	zero,32(a5)
ffffffffc0204b24:	c885                	beqz	s1,ffffffffc0204b54 <file_open+0xa6>
ffffffffc0204b26:	c03d                	beqz	s0,ffffffffc0204b8c <file_open+0xde>
ffffffffc0204b28:	783c                	ld	a5,112(s0)
ffffffffc0204b2a:	c3ad                	beqz	a5,ffffffffc0204b8c <file_open+0xde>
ffffffffc0204b2c:	779c                	ld	a5,40(a5)
ffffffffc0204b2e:	cfb9                	beqz	a5,ffffffffc0204b8c <file_open+0xde>
ffffffffc0204b30:	8522                	mv	a0,s0
ffffffffc0204b32:	00008597          	auipc	a1,0x8
ffffffffc0204b36:	4fe58593          	addi	a1,a1,1278 # ffffffffc020d030 <default_pmm_manager+0xd30>
ffffffffc0204b3a:	3cd020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0204b3e:	783c                	ld	a5,112(s0)
ffffffffc0204b40:	6522                	ld	a0,8(sp)
ffffffffc0204b42:	080c                	addi	a1,sp,16
ffffffffc0204b44:	779c                	ld	a5,40(a5)
ffffffffc0204b46:	9782                	jalr	a5
ffffffffc0204b48:	842a                	mv	s0,a0
ffffffffc0204b4a:	e515                	bnez	a0,ffffffffc0204b76 <file_open+0xc8>
ffffffffc0204b4c:	6782                	ld	a5,0(sp)
ffffffffc0204b4e:	7722                	ld	a4,40(sp)
ffffffffc0204b50:	6422                	ld	s0,8(sp)
ffffffffc0204b52:	f398                	sd	a4,32(a5)
ffffffffc0204b54:	4394                	lw	a3,0(a5)
ffffffffc0204b56:	f780                	sd	s0,40(a5)
ffffffffc0204b58:	0147b423          	sd	s4,8(a5)
ffffffffc0204b5c:	0137b823          	sd	s3,16(a5)
ffffffffc0204b60:	4705                	li	a4,1
ffffffffc0204b62:	02e69363          	bne	a3,a4,ffffffffc0204b88 <file_open+0xda>
ffffffffc0204b66:	c00d                	beqz	s0,ffffffffc0204b88 <file_open+0xda>
ffffffffc0204b68:	5b98                	lw	a4,48(a5)
ffffffffc0204b6a:	4689                	li	a3,2
ffffffffc0204b6c:	4f80                	lw	s0,24(a5)
ffffffffc0204b6e:	2705                	addiw	a4,a4,1
ffffffffc0204b70:	c394                	sw	a3,0(a5)
ffffffffc0204b72:	db98                	sw	a4,48(a5)
ffffffffc0204b74:	b751                	j	ffffffffc0204af8 <file_open+0x4a>
ffffffffc0204b76:	6522                	ld	a0,8(sp)
ffffffffc0204b78:	418030ef          	jal	ra,ffffffffc0207f90 <vfs_close>
ffffffffc0204b7c:	6502                	ld	a0,0(sp)
ffffffffc0204b7e:	cb7ff0ef          	jal	ra,ffffffffc0204834 <fd_array_free>
ffffffffc0204b82:	bf9d                	j	ffffffffc0204af8 <file_open+0x4a>
ffffffffc0204b84:	5475                	li	s0,-3
ffffffffc0204b86:	bf8d                	j	ffffffffc0204af8 <file_open+0x4a>
ffffffffc0204b88:	d93ff0ef          	jal	ra,ffffffffc020491a <fd_array_open.part.0>
ffffffffc0204b8c:	00008697          	auipc	a3,0x8
ffffffffc0204b90:	45468693          	addi	a3,a3,1108 # ffffffffc020cfe0 <default_pmm_manager+0xce0>
ffffffffc0204b94:	00007617          	auipc	a2,0x7
ffffffffc0204b98:	c8460613          	addi	a2,a2,-892 # ffffffffc020b818 <commands+0x210>
ffffffffc0204b9c:	0b500593          	li	a1,181
ffffffffc0204ba0:	00008517          	auipc	a0,0x8
ffffffffc0204ba4:	30850513          	addi	a0,a0,776 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204ba8:	8f7fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204bac <file_close>:
ffffffffc0204bac:	04700713          	li	a4,71
ffffffffc0204bb0:	04a76563          	bltu	a4,a0,ffffffffc0204bfa <file_close+0x4e>
ffffffffc0204bb4:	00092717          	auipc	a4,0x92
ffffffffc0204bb8:	d0c73703          	ld	a4,-756(a4) # ffffffffc02968c0 <current>
ffffffffc0204bbc:	14873703          	ld	a4,328(a4)
ffffffffc0204bc0:	1141                	addi	sp,sp,-16
ffffffffc0204bc2:	e406                	sd	ra,8(sp)
ffffffffc0204bc4:	cf0d                	beqz	a4,ffffffffc0204bfe <file_close+0x52>
ffffffffc0204bc6:	4b14                	lw	a3,16(a4)
ffffffffc0204bc8:	02d05b63          	blez	a3,ffffffffc0204bfe <file_close+0x52>
ffffffffc0204bcc:	6718                	ld	a4,8(a4)
ffffffffc0204bce:	87aa                	mv	a5,a0
ffffffffc0204bd0:	050e                	slli	a0,a0,0x3
ffffffffc0204bd2:	8d1d                	sub	a0,a0,a5
ffffffffc0204bd4:	050e                	slli	a0,a0,0x3
ffffffffc0204bd6:	953a                	add	a0,a0,a4
ffffffffc0204bd8:	4114                	lw	a3,0(a0)
ffffffffc0204bda:	4709                	li	a4,2
ffffffffc0204bdc:	00e69b63          	bne	a3,a4,ffffffffc0204bf2 <file_close+0x46>
ffffffffc0204be0:	4d18                	lw	a4,24(a0)
ffffffffc0204be2:	00f71863          	bne	a4,a5,ffffffffc0204bf2 <file_close+0x46>
ffffffffc0204be6:	d75ff0ef          	jal	ra,ffffffffc020495a <fd_array_close>
ffffffffc0204bea:	60a2                	ld	ra,8(sp)
ffffffffc0204bec:	4501                	li	a0,0
ffffffffc0204bee:	0141                	addi	sp,sp,16
ffffffffc0204bf0:	8082                	ret
ffffffffc0204bf2:	60a2                	ld	ra,8(sp)
ffffffffc0204bf4:	5575                	li	a0,-3
ffffffffc0204bf6:	0141                	addi	sp,sp,16
ffffffffc0204bf8:	8082                	ret
ffffffffc0204bfa:	5575                	li	a0,-3
ffffffffc0204bfc:	8082                	ret
ffffffffc0204bfe:	b81ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>

ffffffffc0204c02 <file_read>:
ffffffffc0204c02:	715d                	addi	sp,sp,-80
ffffffffc0204c04:	e486                	sd	ra,72(sp)
ffffffffc0204c06:	e0a2                	sd	s0,64(sp)
ffffffffc0204c08:	fc26                	sd	s1,56(sp)
ffffffffc0204c0a:	f84a                	sd	s2,48(sp)
ffffffffc0204c0c:	f44e                	sd	s3,40(sp)
ffffffffc0204c0e:	f052                	sd	s4,32(sp)
ffffffffc0204c10:	0006b023          	sd	zero,0(a3)
ffffffffc0204c14:	04700793          	li	a5,71
ffffffffc0204c18:	0aa7e463          	bltu	a5,a0,ffffffffc0204cc0 <file_read+0xbe>
ffffffffc0204c1c:	00092797          	auipc	a5,0x92
ffffffffc0204c20:	ca47b783          	ld	a5,-860(a5) # ffffffffc02968c0 <current>
ffffffffc0204c24:	1487b783          	ld	a5,328(a5)
ffffffffc0204c28:	cfd1                	beqz	a5,ffffffffc0204cc4 <file_read+0xc2>
ffffffffc0204c2a:	4b98                	lw	a4,16(a5)
ffffffffc0204c2c:	08e05c63          	blez	a4,ffffffffc0204cc4 <file_read+0xc2>
ffffffffc0204c30:	6780                	ld	s0,8(a5)
ffffffffc0204c32:	00351793          	slli	a5,a0,0x3
ffffffffc0204c36:	8f89                	sub	a5,a5,a0
ffffffffc0204c38:	078e                	slli	a5,a5,0x3
ffffffffc0204c3a:	943e                	add	s0,s0,a5
ffffffffc0204c3c:	00042983          	lw	s3,0(s0)
ffffffffc0204c40:	4789                	li	a5,2
ffffffffc0204c42:	06f99f63          	bne	s3,a5,ffffffffc0204cc0 <file_read+0xbe>
ffffffffc0204c46:	4c1c                	lw	a5,24(s0)
ffffffffc0204c48:	06a79c63          	bne	a5,a0,ffffffffc0204cc0 <file_read+0xbe>
ffffffffc0204c4c:	641c                	ld	a5,8(s0)
ffffffffc0204c4e:	cbad                	beqz	a5,ffffffffc0204cc0 <file_read+0xbe>
ffffffffc0204c50:	581c                	lw	a5,48(s0)
ffffffffc0204c52:	8a36                	mv	s4,a3
ffffffffc0204c54:	7014                	ld	a3,32(s0)
ffffffffc0204c56:	2785                	addiw	a5,a5,1
ffffffffc0204c58:	850a                	mv	a0,sp
ffffffffc0204c5a:	d81c                	sw	a5,48(s0)
ffffffffc0204c5c:	792000ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc0204c60:	02843903          	ld	s2,40(s0)
ffffffffc0204c64:	84aa                	mv	s1,a0
ffffffffc0204c66:	06090163          	beqz	s2,ffffffffc0204cc8 <file_read+0xc6>
ffffffffc0204c6a:	07093783          	ld	a5,112(s2)
ffffffffc0204c6e:	cfa9                	beqz	a5,ffffffffc0204cc8 <file_read+0xc6>
ffffffffc0204c70:	6f9c                	ld	a5,24(a5)
ffffffffc0204c72:	cbb9                	beqz	a5,ffffffffc0204cc8 <file_read+0xc6>
ffffffffc0204c74:	00008597          	auipc	a1,0x8
ffffffffc0204c78:	41458593          	addi	a1,a1,1044 # ffffffffc020d088 <default_pmm_manager+0xd88>
ffffffffc0204c7c:	854a                	mv	a0,s2
ffffffffc0204c7e:	289020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0204c82:	07093783          	ld	a5,112(s2)
ffffffffc0204c86:	7408                	ld	a0,40(s0)
ffffffffc0204c88:	85a6                	mv	a1,s1
ffffffffc0204c8a:	6f9c                	ld	a5,24(a5)
ffffffffc0204c8c:	9782                	jalr	a5
ffffffffc0204c8e:	689c                	ld	a5,16(s1)
ffffffffc0204c90:	6c94                	ld	a3,24(s1)
ffffffffc0204c92:	4018                	lw	a4,0(s0)
ffffffffc0204c94:	84aa                	mv	s1,a0
ffffffffc0204c96:	8f95                	sub	a5,a5,a3
ffffffffc0204c98:	03370063          	beq	a4,s3,ffffffffc0204cb8 <file_read+0xb6>
ffffffffc0204c9c:	00fa3023          	sd	a5,0(s4) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc0204ca0:	8522                	mv	a0,s0
ffffffffc0204ca2:	c0fff0ef          	jal	ra,ffffffffc02048b0 <fd_array_release>
ffffffffc0204ca6:	60a6                	ld	ra,72(sp)
ffffffffc0204ca8:	6406                	ld	s0,64(sp)
ffffffffc0204caa:	7942                	ld	s2,48(sp)
ffffffffc0204cac:	79a2                	ld	s3,40(sp)
ffffffffc0204cae:	7a02                	ld	s4,32(sp)
ffffffffc0204cb0:	8526                	mv	a0,s1
ffffffffc0204cb2:	74e2                	ld	s1,56(sp)
ffffffffc0204cb4:	6161                	addi	sp,sp,80
ffffffffc0204cb6:	8082                	ret
ffffffffc0204cb8:	7018                	ld	a4,32(s0)
ffffffffc0204cba:	973e                	add	a4,a4,a5
ffffffffc0204cbc:	f018                	sd	a4,32(s0)
ffffffffc0204cbe:	bff9                	j	ffffffffc0204c9c <file_read+0x9a>
ffffffffc0204cc0:	54f5                	li	s1,-3
ffffffffc0204cc2:	b7d5                	j	ffffffffc0204ca6 <file_read+0xa4>
ffffffffc0204cc4:	abbff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>
ffffffffc0204cc8:	00008697          	auipc	a3,0x8
ffffffffc0204ccc:	37068693          	addi	a3,a3,880 # ffffffffc020d038 <default_pmm_manager+0xd38>
ffffffffc0204cd0:	00007617          	auipc	a2,0x7
ffffffffc0204cd4:	b4860613          	addi	a2,a2,-1208 # ffffffffc020b818 <commands+0x210>
ffffffffc0204cd8:	0de00593          	li	a1,222
ffffffffc0204cdc:	00008517          	auipc	a0,0x8
ffffffffc0204ce0:	1cc50513          	addi	a0,a0,460 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204ce4:	fbafb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204ce8 <file_write>:
ffffffffc0204ce8:	715d                	addi	sp,sp,-80
ffffffffc0204cea:	e486                	sd	ra,72(sp)
ffffffffc0204cec:	e0a2                	sd	s0,64(sp)
ffffffffc0204cee:	fc26                	sd	s1,56(sp)
ffffffffc0204cf0:	f84a                	sd	s2,48(sp)
ffffffffc0204cf2:	f44e                	sd	s3,40(sp)
ffffffffc0204cf4:	f052                	sd	s4,32(sp)
ffffffffc0204cf6:	0006b023          	sd	zero,0(a3)
ffffffffc0204cfa:	04700793          	li	a5,71
ffffffffc0204cfe:	0aa7e463          	bltu	a5,a0,ffffffffc0204da6 <file_write+0xbe>
ffffffffc0204d02:	00092797          	auipc	a5,0x92
ffffffffc0204d06:	bbe7b783          	ld	a5,-1090(a5) # ffffffffc02968c0 <current>
ffffffffc0204d0a:	1487b783          	ld	a5,328(a5)
ffffffffc0204d0e:	cfd1                	beqz	a5,ffffffffc0204daa <file_write+0xc2>
ffffffffc0204d10:	4b98                	lw	a4,16(a5)
ffffffffc0204d12:	08e05c63          	blez	a4,ffffffffc0204daa <file_write+0xc2>
ffffffffc0204d16:	6780                	ld	s0,8(a5)
ffffffffc0204d18:	00351793          	slli	a5,a0,0x3
ffffffffc0204d1c:	8f89                	sub	a5,a5,a0
ffffffffc0204d1e:	078e                	slli	a5,a5,0x3
ffffffffc0204d20:	943e                	add	s0,s0,a5
ffffffffc0204d22:	00042983          	lw	s3,0(s0)
ffffffffc0204d26:	4789                	li	a5,2
ffffffffc0204d28:	06f99f63          	bne	s3,a5,ffffffffc0204da6 <file_write+0xbe>
ffffffffc0204d2c:	4c1c                	lw	a5,24(s0)
ffffffffc0204d2e:	06a79c63          	bne	a5,a0,ffffffffc0204da6 <file_write+0xbe>
ffffffffc0204d32:	681c                	ld	a5,16(s0)
ffffffffc0204d34:	cbad                	beqz	a5,ffffffffc0204da6 <file_write+0xbe>
ffffffffc0204d36:	581c                	lw	a5,48(s0)
ffffffffc0204d38:	8a36                	mv	s4,a3
ffffffffc0204d3a:	7014                	ld	a3,32(s0)
ffffffffc0204d3c:	2785                	addiw	a5,a5,1
ffffffffc0204d3e:	850a                	mv	a0,sp
ffffffffc0204d40:	d81c                	sw	a5,48(s0)
ffffffffc0204d42:	6ac000ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc0204d46:	02843903          	ld	s2,40(s0)
ffffffffc0204d4a:	84aa                	mv	s1,a0
ffffffffc0204d4c:	06090163          	beqz	s2,ffffffffc0204dae <file_write+0xc6>
ffffffffc0204d50:	07093783          	ld	a5,112(s2)
ffffffffc0204d54:	cfa9                	beqz	a5,ffffffffc0204dae <file_write+0xc6>
ffffffffc0204d56:	739c                	ld	a5,32(a5)
ffffffffc0204d58:	cbb9                	beqz	a5,ffffffffc0204dae <file_write+0xc6>
ffffffffc0204d5a:	00008597          	auipc	a1,0x8
ffffffffc0204d5e:	38658593          	addi	a1,a1,902 # ffffffffc020d0e0 <default_pmm_manager+0xde0>
ffffffffc0204d62:	854a                	mv	a0,s2
ffffffffc0204d64:	1a3020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0204d68:	07093783          	ld	a5,112(s2)
ffffffffc0204d6c:	7408                	ld	a0,40(s0)
ffffffffc0204d6e:	85a6                	mv	a1,s1
ffffffffc0204d70:	739c                	ld	a5,32(a5)
ffffffffc0204d72:	9782                	jalr	a5
ffffffffc0204d74:	689c                	ld	a5,16(s1)
ffffffffc0204d76:	6c94                	ld	a3,24(s1)
ffffffffc0204d78:	4018                	lw	a4,0(s0)
ffffffffc0204d7a:	84aa                	mv	s1,a0
ffffffffc0204d7c:	8f95                	sub	a5,a5,a3
ffffffffc0204d7e:	03370063          	beq	a4,s3,ffffffffc0204d9e <file_write+0xb6>
ffffffffc0204d82:	00fa3023          	sd	a5,0(s4)
ffffffffc0204d86:	8522                	mv	a0,s0
ffffffffc0204d88:	b29ff0ef          	jal	ra,ffffffffc02048b0 <fd_array_release>
ffffffffc0204d8c:	60a6                	ld	ra,72(sp)
ffffffffc0204d8e:	6406                	ld	s0,64(sp)
ffffffffc0204d90:	7942                	ld	s2,48(sp)
ffffffffc0204d92:	79a2                	ld	s3,40(sp)
ffffffffc0204d94:	7a02                	ld	s4,32(sp)
ffffffffc0204d96:	8526                	mv	a0,s1
ffffffffc0204d98:	74e2                	ld	s1,56(sp)
ffffffffc0204d9a:	6161                	addi	sp,sp,80
ffffffffc0204d9c:	8082                	ret
ffffffffc0204d9e:	7018                	ld	a4,32(s0)
ffffffffc0204da0:	973e                	add	a4,a4,a5
ffffffffc0204da2:	f018                	sd	a4,32(s0)
ffffffffc0204da4:	bff9                	j	ffffffffc0204d82 <file_write+0x9a>
ffffffffc0204da6:	54f5                	li	s1,-3
ffffffffc0204da8:	b7d5                	j	ffffffffc0204d8c <file_write+0xa4>
ffffffffc0204daa:	9d5ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>
ffffffffc0204dae:	00008697          	auipc	a3,0x8
ffffffffc0204db2:	2e268693          	addi	a3,a3,738 # ffffffffc020d090 <default_pmm_manager+0xd90>
ffffffffc0204db6:	00007617          	auipc	a2,0x7
ffffffffc0204dba:	a6260613          	addi	a2,a2,-1438 # ffffffffc020b818 <commands+0x210>
ffffffffc0204dbe:	0f800593          	li	a1,248
ffffffffc0204dc2:	00008517          	auipc	a0,0x8
ffffffffc0204dc6:	0e650513          	addi	a0,a0,230 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204dca:	ed4fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204dce <file_seek>:
ffffffffc0204dce:	7139                	addi	sp,sp,-64
ffffffffc0204dd0:	fc06                	sd	ra,56(sp)
ffffffffc0204dd2:	f822                	sd	s0,48(sp)
ffffffffc0204dd4:	f426                	sd	s1,40(sp)
ffffffffc0204dd6:	f04a                	sd	s2,32(sp)
ffffffffc0204dd8:	04700793          	li	a5,71
ffffffffc0204ddc:	08a7e863          	bltu	a5,a0,ffffffffc0204e6c <file_seek+0x9e>
ffffffffc0204de0:	00092797          	auipc	a5,0x92
ffffffffc0204de4:	ae07b783          	ld	a5,-1312(a5) # ffffffffc02968c0 <current>
ffffffffc0204de8:	1487b783          	ld	a5,328(a5)
ffffffffc0204dec:	cfdd                	beqz	a5,ffffffffc0204eaa <file_seek+0xdc>
ffffffffc0204dee:	4b98                	lw	a4,16(a5)
ffffffffc0204df0:	0ae05d63          	blez	a4,ffffffffc0204eaa <file_seek+0xdc>
ffffffffc0204df4:	6780                	ld	s0,8(a5)
ffffffffc0204df6:	00351793          	slli	a5,a0,0x3
ffffffffc0204dfa:	8f89                	sub	a5,a5,a0
ffffffffc0204dfc:	078e                	slli	a5,a5,0x3
ffffffffc0204dfe:	943e                	add	s0,s0,a5
ffffffffc0204e00:	4018                	lw	a4,0(s0)
ffffffffc0204e02:	4789                	li	a5,2
ffffffffc0204e04:	06f71463          	bne	a4,a5,ffffffffc0204e6c <file_seek+0x9e>
ffffffffc0204e08:	4c1c                	lw	a5,24(s0)
ffffffffc0204e0a:	06a79163          	bne	a5,a0,ffffffffc0204e6c <file_seek+0x9e>
ffffffffc0204e0e:	581c                	lw	a5,48(s0)
ffffffffc0204e10:	4685                	li	a3,1
ffffffffc0204e12:	892e                	mv	s2,a1
ffffffffc0204e14:	2785                	addiw	a5,a5,1
ffffffffc0204e16:	d81c                	sw	a5,48(s0)
ffffffffc0204e18:	02d60063          	beq	a2,a3,ffffffffc0204e38 <file_seek+0x6a>
ffffffffc0204e1c:	06e60063          	beq	a2,a4,ffffffffc0204e7c <file_seek+0xae>
ffffffffc0204e20:	54f5                	li	s1,-3
ffffffffc0204e22:	ce11                	beqz	a2,ffffffffc0204e3e <file_seek+0x70>
ffffffffc0204e24:	8522                	mv	a0,s0
ffffffffc0204e26:	a8bff0ef          	jal	ra,ffffffffc02048b0 <fd_array_release>
ffffffffc0204e2a:	70e2                	ld	ra,56(sp)
ffffffffc0204e2c:	7442                	ld	s0,48(sp)
ffffffffc0204e2e:	7902                	ld	s2,32(sp)
ffffffffc0204e30:	8526                	mv	a0,s1
ffffffffc0204e32:	74a2                	ld	s1,40(sp)
ffffffffc0204e34:	6121                	addi	sp,sp,64
ffffffffc0204e36:	8082                	ret
ffffffffc0204e38:	701c                	ld	a5,32(s0)
ffffffffc0204e3a:	00f58933          	add	s2,a1,a5
ffffffffc0204e3e:	7404                	ld	s1,40(s0)
ffffffffc0204e40:	c4bd                	beqz	s1,ffffffffc0204eae <file_seek+0xe0>
ffffffffc0204e42:	78bc                	ld	a5,112(s1)
ffffffffc0204e44:	c7ad                	beqz	a5,ffffffffc0204eae <file_seek+0xe0>
ffffffffc0204e46:	6fbc                	ld	a5,88(a5)
ffffffffc0204e48:	c3bd                	beqz	a5,ffffffffc0204eae <file_seek+0xe0>
ffffffffc0204e4a:	8526                	mv	a0,s1
ffffffffc0204e4c:	00008597          	auipc	a1,0x8
ffffffffc0204e50:	2ec58593          	addi	a1,a1,748 # ffffffffc020d138 <default_pmm_manager+0xe38>
ffffffffc0204e54:	0b3020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0204e58:	78bc                	ld	a5,112(s1)
ffffffffc0204e5a:	7408                	ld	a0,40(s0)
ffffffffc0204e5c:	85ca                	mv	a1,s2
ffffffffc0204e5e:	6fbc                	ld	a5,88(a5)
ffffffffc0204e60:	9782                	jalr	a5
ffffffffc0204e62:	84aa                	mv	s1,a0
ffffffffc0204e64:	f161                	bnez	a0,ffffffffc0204e24 <file_seek+0x56>
ffffffffc0204e66:	03243023          	sd	s2,32(s0)
ffffffffc0204e6a:	bf6d                	j	ffffffffc0204e24 <file_seek+0x56>
ffffffffc0204e6c:	70e2                	ld	ra,56(sp)
ffffffffc0204e6e:	7442                	ld	s0,48(sp)
ffffffffc0204e70:	54f5                	li	s1,-3
ffffffffc0204e72:	7902                	ld	s2,32(sp)
ffffffffc0204e74:	8526                	mv	a0,s1
ffffffffc0204e76:	74a2                	ld	s1,40(sp)
ffffffffc0204e78:	6121                	addi	sp,sp,64
ffffffffc0204e7a:	8082                	ret
ffffffffc0204e7c:	7404                	ld	s1,40(s0)
ffffffffc0204e7e:	c8a1                	beqz	s1,ffffffffc0204ece <file_seek+0x100>
ffffffffc0204e80:	78bc                	ld	a5,112(s1)
ffffffffc0204e82:	c7b1                	beqz	a5,ffffffffc0204ece <file_seek+0x100>
ffffffffc0204e84:	779c                	ld	a5,40(a5)
ffffffffc0204e86:	c7a1                	beqz	a5,ffffffffc0204ece <file_seek+0x100>
ffffffffc0204e88:	8526                	mv	a0,s1
ffffffffc0204e8a:	00008597          	auipc	a1,0x8
ffffffffc0204e8e:	1a658593          	addi	a1,a1,422 # ffffffffc020d030 <default_pmm_manager+0xd30>
ffffffffc0204e92:	075020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0204e96:	78bc                	ld	a5,112(s1)
ffffffffc0204e98:	7408                	ld	a0,40(s0)
ffffffffc0204e9a:	858a                	mv	a1,sp
ffffffffc0204e9c:	779c                	ld	a5,40(a5)
ffffffffc0204e9e:	9782                	jalr	a5
ffffffffc0204ea0:	84aa                	mv	s1,a0
ffffffffc0204ea2:	f149                	bnez	a0,ffffffffc0204e24 <file_seek+0x56>
ffffffffc0204ea4:	67e2                	ld	a5,24(sp)
ffffffffc0204ea6:	993e                	add	s2,s2,a5
ffffffffc0204ea8:	bf59                	j	ffffffffc0204e3e <file_seek+0x70>
ffffffffc0204eaa:	8d5ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>
ffffffffc0204eae:	00008697          	auipc	a3,0x8
ffffffffc0204eb2:	23a68693          	addi	a3,a3,570 # ffffffffc020d0e8 <default_pmm_manager+0xde8>
ffffffffc0204eb6:	00007617          	auipc	a2,0x7
ffffffffc0204eba:	96260613          	addi	a2,a2,-1694 # ffffffffc020b818 <commands+0x210>
ffffffffc0204ebe:	11a00593          	li	a1,282
ffffffffc0204ec2:	00008517          	auipc	a0,0x8
ffffffffc0204ec6:	fe650513          	addi	a0,a0,-26 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204eca:	dd4fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204ece:	00008697          	auipc	a3,0x8
ffffffffc0204ed2:	11268693          	addi	a3,a3,274 # ffffffffc020cfe0 <default_pmm_manager+0xce0>
ffffffffc0204ed6:	00007617          	auipc	a2,0x7
ffffffffc0204eda:	94260613          	addi	a2,a2,-1726 # ffffffffc020b818 <commands+0x210>
ffffffffc0204ede:	11200593          	li	a1,274
ffffffffc0204ee2:	00008517          	auipc	a0,0x8
ffffffffc0204ee6:	fc650513          	addi	a0,a0,-58 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204eea:	db4fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0204eee <file_fstat>:
ffffffffc0204eee:	1101                	addi	sp,sp,-32
ffffffffc0204ef0:	ec06                	sd	ra,24(sp)
ffffffffc0204ef2:	e822                	sd	s0,16(sp)
ffffffffc0204ef4:	e426                	sd	s1,8(sp)
ffffffffc0204ef6:	e04a                	sd	s2,0(sp)
ffffffffc0204ef8:	04700793          	li	a5,71
ffffffffc0204efc:	06a7ef63          	bltu	a5,a0,ffffffffc0204f7a <file_fstat+0x8c>
ffffffffc0204f00:	00092797          	auipc	a5,0x92
ffffffffc0204f04:	9c07b783          	ld	a5,-1600(a5) # ffffffffc02968c0 <current>
ffffffffc0204f08:	1487b783          	ld	a5,328(a5)
ffffffffc0204f0c:	cfd9                	beqz	a5,ffffffffc0204faa <file_fstat+0xbc>
ffffffffc0204f0e:	4b98                	lw	a4,16(a5)
ffffffffc0204f10:	08e05d63          	blez	a4,ffffffffc0204faa <file_fstat+0xbc>
ffffffffc0204f14:	6780                	ld	s0,8(a5)
ffffffffc0204f16:	00351793          	slli	a5,a0,0x3
ffffffffc0204f1a:	8f89                	sub	a5,a5,a0
ffffffffc0204f1c:	078e                	slli	a5,a5,0x3
ffffffffc0204f1e:	943e                	add	s0,s0,a5
ffffffffc0204f20:	4018                	lw	a4,0(s0)
ffffffffc0204f22:	4789                	li	a5,2
ffffffffc0204f24:	04f71b63          	bne	a4,a5,ffffffffc0204f7a <file_fstat+0x8c>
ffffffffc0204f28:	4c1c                	lw	a5,24(s0)
ffffffffc0204f2a:	04a79863          	bne	a5,a0,ffffffffc0204f7a <file_fstat+0x8c>
ffffffffc0204f2e:	581c                	lw	a5,48(s0)
ffffffffc0204f30:	02843903          	ld	s2,40(s0)
ffffffffc0204f34:	2785                	addiw	a5,a5,1
ffffffffc0204f36:	d81c                	sw	a5,48(s0)
ffffffffc0204f38:	04090963          	beqz	s2,ffffffffc0204f8a <file_fstat+0x9c>
ffffffffc0204f3c:	07093783          	ld	a5,112(s2)
ffffffffc0204f40:	c7a9                	beqz	a5,ffffffffc0204f8a <file_fstat+0x9c>
ffffffffc0204f42:	779c                	ld	a5,40(a5)
ffffffffc0204f44:	c3b9                	beqz	a5,ffffffffc0204f8a <file_fstat+0x9c>
ffffffffc0204f46:	84ae                	mv	s1,a1
ffffffffc0204f48:	854a                	mv	a0,s2
ffffffffc0204f4a:	00008597          	auipc	a1,0x8
ffffffffc0204f4e:	0e658593          	addi	a1,a1,230 # ffffffffc020d030 <default_pmm_manager+0xd30>
ffffffffc0204f52:	7b4020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0204f56:	07093783          	ld	a5,112(s2)
ffffffffc0204f5a:	7408                	ld	a0,40(s0)
ffffffffc0204f5c:	85a6                	mv	a1,s1
ffffffffc0204f5e:	779c                	ld	a5,40(a5)
ffffffffc0204f60:	9782                	jalr	a5
ffffffffc0204f62:	87aa                	mv	a5,a0
ffffffffc0204f64:	8522                	mv	a0,s0
ffffffffc0204f66:	843e                	mv	s0,a5
ffffffffc0204f68:	949ff0ef          	jal	ra,ffffffffc02048b0 <fd_array_release>
ffffffffc0204f6c:	60e2                	ld	ra,24(sp)
ffffffffc0204f6e:	8522                	mv	a0,s0
ffffffffc0204f70:	6442                	ld	s0,16(sp)
ffffffffc0204f72:	64a2                	ld	s1,8(sp)
ffffffffc0204f74:	6902                	ld	s2,0(sp)
ffffffffc0204f76:	6105                	addi	sp,sp,32
ffffffffc0204f78:	8082                	ret
ffffffffc0204f7a:	5475                	li	s0,-3
ffffffffc0204f7c:	60e2                	ld	ra,24(sp)
ffffffffc0204f7e:	8522                	mv	a0,s0
ffffffffc0204f80:	6442                	ld	s0,16(sp)
ffffffffc0204f82:	64a2                	ld	s1,8(sp)
ffffffffc0204f84:	6902                	ld	s2,0(sp)
ffffffffc0204f86:	6105                	addi	sp,sp,32
ffffffffc0204f88:	8082                	ret
ffffffffc0204f8a:	00008697          	auipc	a3,0x8
ffffffffc0204f8e:	05668693          	addi	a3,a3,86 # ffffffffc020cfe0 <default_pmm_manager+0xce0>
ffffffffc0204f92:	00007617          	auipc	a2,0x7
ffffffffc0204f96:	88660613          	addi	a2,a2,-1914 # ffffffffc020b818 <commands+0x210>
ffffffffc0204f9a:	12c00593          	li	a1,300
ffffffffc0204f9e:	00008517          	auipc	a0,0x8
ffffffffc0204fa2:	f0a50513          	addi	a0,a0,-246 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0204fa6:	cf8fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0204faa:	fd4ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>

ffffffffc0204fae <file_fsync>:
ffffffffc0204fae:	1101                	addi	sp,sp,-32
ffffffffc0204fb0:	ec06                	sd	ra,24(sp)
ffffffffc0204fb2:	e822                	sd	s0,16(sp)
ffffffffc0204fb4:	e426                	sd	s1,8(sp)
ffffffffc0204fb6:	04700793          	li	a5,71
ffffffffc0204fba:	06a7e863          	bltu	a5,a0,ffffffffc020502a <file_fsync+0x7c>
ffffffffc0204fbe:	00092797          	auipc	a5,0x92
ffffffffc0204fc2:	9027b783          	ld	a5,-1790(a5) # ffffffffc02968c0 <current>
ffffffffc0204fc6:	1487b783          	ld	a5,328(a5)
ffffffffc0204fca:	c7d9                	beqz	a5,ffffffffc0205058 <file_fsync+0xaa>
ffffffffc0204fcc:	4b98                	lw	a4,16(a5)
ffffffffc0204fce:	08e05563          	blez	a4,ffffffffc0205058 <file_fsync+0xaa>
ffffffffc0204fd2:	6780                	ld	s0,8(a5)
ffffffffc0204fd4:	00351793          	slli	a5,a0,0x3
ffffffffc0204fd8:	8f89                	sub	a5,a5,a0
ffffffffc0204fda:	078e                	slli	a5,a5,0x3
ffffffffc0204fdc:	943e                	add	s0,s0,a5
ffffffffc0204fde:	4018                	lw	a4,0(s0)
ffffffffc0204fe0:	4789                	li	a5,2
ffffffffc0204fe2:	04f71463          	bne	a4,a5,ffffffffc020502a <file_fsync+0x7c>
ffffffffc0204fe6:	4c1c                	lw	a5,24(s0)
ffffffffc0204fe8:	04a79163          	bne	a5,a0,ffffffffc020502a <file_fsync+0x7c>
ffffffffc0204fec:	581c                	lw	a5,48(s0)
ffffffffc0204fee:	7404                	ld	s1,40(s0)
ffffffffc0204ff0:	2785                	addiw	a5,a5,1
ffffffffc0204ff2:	d81c                	sw	a5,48(s0)
ffffffffc0204ff4:	c0b1                	beqz	s1,ffffffffc0205038 <file_fsync+0x8a>
ffffffffc0204ff6:	78bc                	ld	a5,112(s1)
ffffffffc0204ff8:	c3a1                	beqz	a5,ffffffffc0205038 <file_fsync+0x8a>
ffffffffc0204ffa:	7b9c                	ld	a5,48(a5)
ffffffffc0204ffc:	cf95                	beqz	a5,ffffffffc0205038 <file_fsync+0x8a>
ffffffffc0204ffe:	00008597          	auipc	a1,0x8
ffffffffc0205002:	19258593          	addi	a1,a1,402 # ffffffffc020d190 <default_pmm_manager+0xe90>
ffffffffc0205006:	8526                	mv	a0,s1
ffffffffc0205008:	6fe020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc020500c:	78bc                	ld	a5,112(s1)
ffffffffc020500e:	7408                	ld	a0,40(s0)
ffffffffc0205010:	7b9c                	ld	a5,48(a5)
ffffffffc0205012:	9782                	jalr	a5
ffffffffc0205014:	87aa                	mv	a5,a0
ffffffffc0205016:	8522                	mv	a0,s0
ffffffffc0205018:	843e                	mv	s0,a5
ffffffffc020501a:	897ff0ef          	jal	ra,ffffffffc02048b0 <fd_array_release>
ffffffffc020501e:	60e2                	ld	ra,24(sp)
ffffffffc0205020:	8522                	mv	a0,s0
ffffffffc0205022:	6442                	ld	s0,16(sp)
ffffffffc0205024:	64a2                	ld	s1,8(sp)
ffffffffc0205026:	6105                	addi	sp,sp,32
ffffffffc0205028:	8082                	ret
ffffffffc020502a:	5475                	li	s0,-3
ffffffffc020502c:	60e2                	ld	ra,24(sp)
ffffffffc020502e:	8522                	mv	a0,s0
ffffffffc0205030:	6442                	ld	s0,16(sp)
ffffffffc0205032:	64a2                	ld	s1,8(sp)
ffffffffc0205034:	6105                	addi	sp,sp,32
ffffffffc0205036:	8082                	ret
ffffffffc0205038:	00008697          	auipc	a3,0x8
ffffffffc020503c:	10868693          	addi	a3,a3,264 # ffffffffc020d140 <default_pmm_manager+0xe40>
ffffffffc0205040:	00006617          	auipc	a2,0x6
ffffffffc0205044:	7d860613          	addi	a2,a2,2008 # ffffffffc020b818 <commands+0x210>
ffffffffc0205048:	13a00593          	li	a1,314
ffffffffc020504c:	00008517          	auipc	a0,0x8
ffffffffc0205050:	e5c50513          	addi	a0,a0,-420 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc0205054:	c4afb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205058:	f26ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>

ffffffffc020505c <file_getdirentry>:
ffffffffc020505c:	715d                	addi	sp,sp,-80
ffffffffc020505e:	e486                	sd	ra,72(sp)
ffffffffc0205060:	e0a2                	sd	s0,64(sp)
ffffffffc0205062:	fc26                	sd	s1,56(sp)
ffffffffc0205064:	f84a                	sd	s2,48(sp)
ffffffffc0205066:	f44e                	sd	s3,40(sp)
ffffffffc0205068:	04700793          	li	a5,71
ffffffffc020506c:	0aa7e063          	bltu	a5,a0,ffffffffc020510c <file_getdirentry+0xb0>
ffffffffc0205070:	00092797          	auipc	a5,0x92
ffffffffc0205074:	8507b783          	ld	a5,-1968(a5) # ffffffffc02968c0 <current>
ffffffffc0205078:	1487b783          	ld	a5,328(a5)
ffffffffc020507c:	c3e9                	beqz	a5,ffffffffc020513e <file_getdirentry+0xe2>
ffffffffc020507e:	4b98                	lw	a4,16(a5)
ffffffffc0205080:	0ae05f63          	blez	a4,ffffffffc020513e <file_getdirentry+0xe2>
ffffffffc0205084:	6780                	ld	s0,8(a5)
ffffffffc0205086:	00351793          	slli	a5,a0,0x3
ffffffffc020508a:	8f89                	sub	a5,a5,a0
ffffffffc020508c:	078e                	slli	a5,a5,0x3
ffffffffc020508e:	943e                	add	s0,s0,a5
ffffffffc0205090:	4018                	lw	a4,0(s0)
ffffffffc0205092:	4789                	li	a5,2
ffffffffc0205094:	06f71c63          	bne	a4,a5,ffffffffc020510c <file_getdirentry+0xb0>
ffffffffc0205098:	4c1c                	lw	a5,24(s0)
ffffffffc020509a:	06a79963          	bne	a5,a0,ffffffffc020510c <file_getdirentry+0xb0>
ffffffffc020509e:	581c                	lw	a5,48(s0)
ffffffffc02050a0:	6194                	ld	a3,0(a1)
ffffffffc02050a2:	84ae                	mv	s1,a1
ffffffffc02050a4:	2785                	addiw	a5,a5,1
ffffffffc02050a6:	10000613          	li	a2,256
ffffffffc02050aa:	d81c                	sw	a5,48(s0)
ffffffffc02050ac:	05a1                	addi	a1,a1,8
ffffffffc02050ae:	850a                	mv	a0,sp
ffffffffc02050b0:	33e000ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc02050b4:	02843983          	ld	s3,40(s0)
ffffffffc02050b8:	892a                	mv	s2,a0
ffffffffc02050ba:	06098263          	beqz	s3,ffffffffc020511e <file_getdirentry+0xc2>
ffffffffc02050be:	0709b783          	ld	a5,112(s3) # 1070 <_binary_bin_swap_img_size-0x6c90>
ffffffffc02050c2:	cfb1                	beqz	a5,ffffffffc020511e <file_getdirentry+0xc2>
ffffffffc02050c4:	63bc                	ld	a5,64(a5)
ffffffffc02050c6:	cfa1                	beqz	a5,ffffffffc020511e <file_getdirentry+0xc2>
ffffffffc02050c8:	854e                	mv	a0,s3
ffffffffc02050ca:	00008597          	auipc	a1,0x8
ffffffffc02050ce:	12658593          	addi	a1,a1,294 # ffffffffc020d1f0 <default_pmm_manager+0xef0>
ffffffffc02050d2:	634020ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc02050d6:	0709b783          	ld	a5,112(s3)
ffffffffc02050da:	7408                	ld	a0,40(s0)
ffffffffc02050dc:	85ca                	mv	a1,s2
ffffffffc02050de:	63bc                	ld	a5,64(a5)
ffffffffc02050e0:	9782                	jalr	a5
ffffffffc02050e2:	89aa                	mv	s3,a0
ffffffffc02050e4:	e909                	bnez	a0,ffffffffc02050f6 <file_getdirentry+0x9a>
ffffffffc02050e6:	609c                	ld	a5,0(s1)
ffffffffc02050e8:	01093683          	ld	a3,16(s2)
ffffffffc02050ec:	01893703          	ld	a4,24(s2)
ffffffffc02050f0:	97b6                	add	a5,a5,a3
ffffffffc02050f2:	8f99                	sub	a5,a5,a4
ffffffffc02050f4:	e09c                	sd	a5,0(s1)
ffffffffc02050f6:	8522                	mv	a0,s0
ffffffffc02050f8:	fb8ff0ef          	jal	ra,ffffffffc02048b0 <fd_array_release>
ffffffffc02050fc:	60a6                	ld	ra,72(sp)
ffffffffc02050fe:	6406                	ld	s0,64(sp)
ffffffffc0205100:	74e2                	ld	s1,56(sp)
ffffffffc0205102:	7942                	ld	s2,48(sp)
ffffffffc0205104:	854e                	mv	a0,s3
ffffffffc0205106:	79a2                	ld	s3,40(sp)
ffffffffc0205108:	6161                	addi	sp,sp,80
ffffffffc020510a:	8082                	ret
ffffffffc020510c:	60a6                	ld	ra,72(sp)
ffffffffc020510e:	6406                	ld	s0,64(sp)
ffffffffc0205110:	59f5                	li	s3,-3
ffffffffc0205112:	74e2                	ld	s1,56(sp)
ffffffffc0205114:	7942                	ld	s2,48(sp)
ffffffffc0205116:	854e                	mv	a0,s3
ffffffffc0205118:	79a2                	ld	s3,40(sp)
ffffffffc020511a:	6161                	addi	sp,sp,80
ffffffffc020511c:	8082                	ret
ffffffffc020511e:	00008697          	auipc	a3,0x8
ffffffffc0205122:	07a68693          	addi	a3,a3,122 # ffffffffc020d198 <default_pmm_manager+0xe98>
ffffffffc0205126:	00006617          	auipc	a2,0x6
ffffffffc020512a:	6f260613          	addi	a2,a2,1778 # ffffffffc020b818 <commands+0x210>
ffffffffc020512e:	14a00593          	li	a1,330
ffffffffc0205132:	00008517          	auipc	a0,0x8
ffffffffc0205136:	d7650513          	addi	a0,a0,-650 # ffffffffc020cea8 <default_pmm_manager+0xba8>
ffffffffc020513a:	b64fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020513e:	e40ff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>

ffffffffc0205142 <file_dup>:
ffffffffc0205142:	04700713          	li	a4,71
ffffffffc0205146:	06a76463          	bltu	a4,a0,ffffffffc02051ae <file_dup+0x6c>
ffffffffc020514a:	00091717          	auipc	a4,0x91
ffffffffc020514e:	77673703          	ld	a4,1910(a4) # ffffffffc02968c0 <current>
ffffffffc0205152:	14873703          	ld	a4,328(a4)
ffffffffc0205156:	1101                	addi	sp,sp,-32
ffffffffc0205158:	ec06                	sd	ra,24(sp)
ffffffffc020515a:	e822                	sd	s0,16(sp)
ffffffffc020515c:	cb39                	beqz	a4,ffffffffc02051b2 <file_dup+0x70>
ffffffffc020515e:	4b14                	lw	a3,16(a4)
ffffffffc0205160:	04d05963          	blez	a3,ffffffffc02051b2 <file_dup+0x70>
ffffffffc0205164:	6700                	ld	s0,8(a4)
ffffffffc0205166:	00351713          	slli	a4,a0,0x3
ffffffffc020516a:	8f09                	sub	a4,a4,a0
ffffffffc020516c:	070e                	slli	a4,a4,0x3
ffffffffc020516e:	943a                	add	s0,s0,a4
ffffffffc0205170:	4014                	lw	a3,0(s0)
ffffffffc0205172:	4709                	li	a4,2
ffffffffc0205174:	02e69863          	bne	a3,a4,ffffffffc02051a4 <file_dup+0x62>
ffffffffc0205178:	4c18                	lw	a4,24(s0)
ffffffffc020517a:	02a71563          	bne	a4,a0,ffffffffc02051a4 <file_dup+0x62>
ffffffffc020517e:	852e                	mv	a0,a1
ffffffffc0205180:	002c                	addi	a1,sp,8
ffffffffc0205182:	e1eff0ef          	jal	ra,ffffffffc02047a0 <fd_array_alloc>
ffffffffc0205186:	c509                	beqz	a0,ffffffffc0205190 <file_dup+0x4e>
ffffffffc0205188:	60e2                	ld	ra,24(sp)
ffffffffc020518a:	6442                	ld	s0,16(sp)
ffffffffc020518c:	6105                	addi	sp,sp,32
ffffffffc020518e:	8082                	ret
ffffffffc0205190:	6522                	ld	a0,8(sp)
ffffffffc0205192:	85a2                	mv	a1,s0
ffffffffc0205194:	845ff0ef          	jal	ra,ffffffffc02049d8 <fd_array_dup>
ffffffffc0205198:	67a2                	ld	a5,8(sp)
ffffffffc020519a:	60e2                	ld	ra,24(sp)
ffffffffc020519c:	6442                	ld	s0,16(sp)
ffffffffc020519e:	4f88                	lw	a0,24(a5)
ffffffffc02051a0:	6105                	addi	sp,sp,32
ffffffffc02051a2:	8082                	ret
ffffffffc02051a4:	60e2                	ld	ra,24(sp)
ffffffffc02051a6:	6442                	ld	s0,16(sp)
ffffffffc02051a8:	5575                	li	a0,-3
ffffffffc02051aa:	6105                	addi	sp,sp,32
ffffffffc02051ac:	8082                	ret
ffffffffc02051ae:	5575                	li	a0,-3
ffffffffc02051b0:	8082                	ret
ffffffffc02051b2:	dccff0ef          	jal	ra,ffffffffc020477e <get_fd_array.part.0>

ffffffffc02051b6 <fs_init>:
ffffffffc02051b6:	1141                	addi	sp,sp,-16
ffffffffc02051b8:	e406                	sd	ra,8(sp)
ffffffffc02051ba:	76a020ef          	jal	ra,ffffffffc0207924 <vfs_init>
ffffffffc02051be:	442030ef          	jal	ra,ffffffffc0208600 <dev_init>
ffffffffc02051c2:	60a2                	ld	ra,8(sp)
ffffffffc02051c4:	0141                	addi	sp,sp,16
ffffffffc02051c6:	5930306f          	j	ffffffffc0208f58 <sfs_init>

ffffffffc02051ca <fs_cleanup>:
ffffffffc02051ca:	1ad0206f          	j	ffffffffc0207b76 <vfs_cleanup>

ffffffffc02051ce <lock_files>:
ffffffffc02051ce:	0561                	addi	a0,a0,24
ffffffffc02051d0:	ba0ff06f          	j	ffffffffc0204570 <down>

ffffffffc02051d4 <unlock_files>:
ffffffffc02051d4:	0561                	addi	a0,a0,24
ffffffffc02051d6:	b96ff06f          	j	ffffffffc020456c <up>

ffffffffc02051da <files_create>:
ffffffffc02051da:	1141                	addi	sp,sp,-16
ffffffffc02051dc:	6505                	lui	a0,0x1
ffffffffc02051de:	e022                	sd	s0,0(sp)
ffffffffc02051e0:	e406                	sd	ra,8(sp)
ffffffffc02051e2:	dadfc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02051e6:	842a                	mv	s0,a0
ffffffffc02051e8:	cd19                	beqz	a0,ffffffffc0205206 <files_create+0x2c>
ffffffffc02051ea:	03050793          	addi	a5,a0,48 # 1030 <_binary_bin_swap_img_size-0x6cd0>
ffffffffc02051ee:	00043023          	sd	zero,0(s0)
ffffffffc02051f2:	0561                	addi	a0,a0,24
ffffffffc02051f4:	e41c                	sd	a5,8(s0)
ffffffffc02051f6:	00042823          	sw	zero,16(s0)
ffffffffc02051fa:	4585                	li	a1,1
ffffffffc02051fc:	b6aff0ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc0205200:	6408                	ld	a0,8(s0)
ffffffffc0205202:	f3cff0ef          	jal	ra,ffffffffc020493e <fd_array_init>
ffffffffc0205206:	60a2                	ld	ra,8(sp)
ffffffffc0205208:	8522                	mv	a0,s0
ffffffffc020520a:	6402                	ld	s0,0(sp)
ffffffffc020520c:	0141                	addi	sp,sp,16
ffffffffc020520e:	8082                	ret

ffffffffc0205210 <files_destroy>:
ffffffffc0205210:	7179                	addi	sp,sp,-48
ffffffffc0205212:	f406                	sd	ra,40(sp)
ffffffffc0205214:	f022                	sd	s0,32(sp)
ffffffffc0205216:	ec26                	sd	s1,24(sp)
ffffffffc0205218:	e84a                	sd	s2,16(sp)
ffffffffc020521a:	e44e                	sd	s3,8(sp)
ffffffffc020521c:	c52d                	beqz	a0,ffffffffc0205286 <files_destroy+0x76>
ffffffffc020521e:	491c                	lw	a5,16(a0)
ffffffffc0205220:	89aa                	mv	s3,a0
ffffffffc0205222:	e3b5                	bnez	a5,ffffffffc0205286 <files_destroy+0x76>
ffffffffc0205224:	6108                	ld	a0,0(a0)
ffffffffc0205226:	c119                	beqz	a0,ffffffffc020522c <files_destroy+0x1c>
ffffffffc0205228:	594020ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020522c:	0089b403          	ld	s0,8(s3)
ffffffffc0205230:	6485                	lui	s1,0x1
ffffffffc0205232:	fc048493          	addi	s1,s1,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205236:	94a2                	add	s1,s1,s0
ffffffffc0205238:	4909                	li	s2,2
ffffffffc020523a:	401c                	lw	a5,0(s0)
ffffffffc020523c:	03278063          	beq	a5,s2,ffffffffc020525c <files_destroy+0x4c>
ffffffffc0205240:	e39d                	bnez	a5,ffffffffc0205266 <files_destroy+0x56>
ffffffffc0205242:	03840413          	addi	s0,s0,56
ffffffffc0205246:	fe849ae3          	bne	s1,s0,ffffffffc020523a <files_destroy+0x2a>
ffffffffc020524a:	7402                	ld	s0,32(sp)
ffffffffc020524c:	70a2                	ld	ra,40(sp)
ffffffffc020524e:	64e2                	ld	s1,24(sp)
ffffffffc0205250:	6942                	ld	s2,16(sp)
ffffffffc0205252:	854e                	mv	a0,s3
ffffffffc0205254:	69a2                	ld	s3,8(sp)
ffffffffc0205256:	6145                	addi	sp,sp,48
ffffffffc0205258:	de7fc06f          	j	ffffffffc020203e <kfree>
ffffffffc020525c:	8522                	mv	a0,s0
ffffffffc020525e:	efcff0ef          	jal	ra,ffffffffc020495a <fd_array_close>
ffffffffc0205262:	401c                	lw	a5,0(s0)
ffffffffc0205264:	bff1                	j	ffffffffc0205240 <files_destroy+0x30>
ffffffffc0205266:	00008697          	auipc	a3,0x8
ffffffffc020526a:	00a68693          	addi	a3,a3,10 # ffffffffc020d270 <CSWTCH.79+0x58>
ffffffffc020526e:	00006617          	auipc	a2,0x6
ffffffffc0205272:	5aa60613          	addi	a2,a2,1450 # ffffffffc020b818 <commands+0x210>
ffffffffc0205276:	03d00593          	li	a1,61
ffffffffc020527a:	00008517          	auipc	a0,0x8
ffffffffc020527e:	fe650513          	addi	a0,a0,-26 # ffffffffc020d260 <CSWTCH.79+0x48>
ffffffffc0205282:	a1cfb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205286:	00008697          	auipc	a3,0x8
ffffffffc020528a:	faa68693          	addi	a3,a3,-86 # ffffffffc020d230 <CSWTCH.79+0x18>
ffffffffc020528e:	00006617          	auipc	a2,0x6
ffffffffc0205292:	58a60613          	addi	a2,a2,1418 # ffffffffc020b818 <commands+0x210>
ffffffffc0205296:	03300593          	li	a1,51
ffffffffc020529a:	00008517          	auipc	a0,0x8
ffffffffc020529e:	fc650513          	addi	a0,a0,-58 # ffffffffc020d260 <CSWTCH.79+0x48>
ffffffffc02052a2:	9fcfb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02052a6 <files_closeall>:
ffffffffc02052a6:	1101                	addi	sp,sp,-32
ffffffffc02052a8:	ec06                	sd	ra,24(sp)
ffffffffc02052aa:	e822                	sd	s0,16(sp)
ffffffffc02052ac:	e426                	sd	s1,8(sp)
ffffffffc02052ae:	e04a                	sd	s2,0(sp)
ffffffffc02052b0:	c129                	beqz	a0,ffffffffc02052f2 <files_closeall+0x4c>
ffffffffc02052b2:	491c                	lw	a5,16(a0)
ffffffffc02052b4:	02f05f63          	blez	a5,ffffffffc02052f2 <files_closeall+0x4c>
ffffffffc02052b8:	6504                	ld	s1,8(a0)
ffffffffc02052ba:	6785                	lui	a5,0x1
ffffffffc02052bc:	fc078793          	addi	a5,a5,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc02052c0:	07048413          	addi	s0,s1,112
ffffffffc02052c4:	4909                	li	s2,2
ffffffffc02052c6:	94be                	add	s1,s1,a5
ffffffffc02052c8:	a029                	j	ffffffffc02052d2 <files_closeall+0x2c>
ffffffffc02052ca:	03840413          	addi	s0,s0,56
ffffffffc02052ce:	00848c63          	beq	s1,s0,ffffffffc02052e6 <files_closeall+0x40>
ffffffffc02052d2:	401c                	lw	a5,0(s0)
ffffffffc02052d4:	ff279be3          	bne	a5,s2,ffffffffc02052ca <files_closeall+0x24>
ffffffffc02052d8:	8522                	mv	a0,s0
ffffffffc02052da:	03840413          	addi	s0,s0,56
ffffffffc02052de:	e7cff0ef          	jal	ra,ffffffffc020495a <fd_array_close>
ffffffffc02052e2:	fe8498e3          	bne	s1,s0,ffffffffc02052d2 <files_closeall+0x2c>
ffffffffc02052e6:	60e2                	ld	ra,24(sp)
ffffffffc02052e8:	6442                	ld	s0,16(sp)
ffffffffc02052ea:	64a2                	ld	s1,8(sp)
ffffffffc02052ec:	6902                	ld	s2,0(sp)
ffffffffc02052ee:	6105                	addi	sp,sp,32
ffffffffc02052f0:	8082                	ret
ffffffffc02052f2:	00008697          	auipc	a3,0x8
ffffffffc02052f6:	b8668693          	addi	a3,a3,-1146 # ffffffffc020ce78 <default_pmm_manager+0xb78>
ffffffffc02052fa:	00006617          	auipc	a2,0x6
ffffffffc02052fe:	51e60613          	addi	a2,a2,1310 # ffffffffc020b818 <commands+0x210>
ffffffffc0205302:	04500593          	li	a1,69
ffffffffc0205306:	00008517          	auipc	a0,0x8
ffffffffc020530a:	f5a50513          	addi	a0,a0,-166 # ffffffffc020d260 <CSWTCH.79+0x48>
ffffffffc020530e:	990fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205312 <dup_files>:
ffffffffc0205312:	7179                	addi	sp,sp,-48
ffffffffc0205314:	f406                	sd	ra,40(sp)
ffffffffc0205316:	f022                	sd	s0,32(sp)
ffffffffc0205318:	ec26                	sd	s1,24(sp)
ffffffffc020531a:	e84a                	sd	s2,16(sp)
ffffffffc020531c:	e44e                	sd	s3,8(sp)
ffffffffc020531e:	e052                	sd	s4,0(sp)
ffffffffc0205320:	c52d                	beqz	a0,ffffffffc020538a <dup_files+0x78>
ffffffffc0205322:	842e                	mv	s0,a1
ffffffffc0205324:	c1bd                	beqz	a1,ffffffffc020538a <dup_files+0x78>
ffffffffc0205326:	491c                	lw	a5,16(a0)
ffffffffc0205328:	84aa                	mv	s1,a0
ffffffffc020532a:	e3c1                	bnez	a5,ffffffffc02053aa <dup_files+0x98>
ffffffffc020532c:	499c                	lw	a5,16(a1)
ffffffffc020532e:	06f05e63          	blez	a5,ffffffffc02053aa <dup_files+0x98>
ffffffffc0205332:	6188                	ld	a0,0(a1)
ffffffffc0205334:	e088                	sd	a0,0(s1)
ffffffffc0205336:	c119                	beqz	a0,ffffffffc020533c <dup_files+0x2a>
ffffffffc0205338:	3b6020ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc020533c:	6400                	ld	s0,8(s0)
ffffffffc020533e:	6905                	lui	s2,0x1
ffffffffc0205340:	fc090913          	addi	s2,s2,-64 # fc0 <_binary_bin_swap_img_size-0x6d40>
ffffffffc0205344:	6484                	ld	s1,8(s1)
ffffffffc0205346:	9922                	add	s2,s2,s0
ffffffffc0205348:	4989                	li	s3,2
ffffffffc020534a:	4a05                	li	s4,1
ffffffffc020534c:	a039                	j	ffffffffc020535a <dup_files+0x48>
ffffffffc020534e:	03840413          	addi	s0,s0,56
ffffffffc0205352:	03848493          	addi	s1,s1,56
ffffffffc0205356:	02890163          	beq	s2,s0,ffffffffc0205378 <dup_files+0x66>
ffffffffc020535a:	401c                	lw	a5,0(s0)
ffffffffc020535c:	ff3799e3          	bne	a5,s3,ffffffffc020534e <dup_files+0x3c>
ffffffffc0205360:	0144a023          	sw	s4,0(s1)
ffffffffc0205364:	85a2                	mv	a1,s0
ffffffffc0205366:	8526                	mv	a0,s1
ffffffffc0205368:	03840413          	addi	s0,s0,56
ffffffffc020536c:	e6cff0ef          	jal	ra,ffffffffc02049d8 <fd_array_dup>
ffffffffc0205370:	03848493          	addi	s1,s1,56
ffffffffc0205374:	fe8913e3          	bne	s2,s0,ffffffffc020535a <dup_files+0x48>
ffffffffc0205378:	70a2                	ld	ra,40(sp)
ffffffffc020537a:	7402                	ld	s0,32(sp)
ffffffffc020537c:	64e2                	ld	s1,24(sp)
ffffffffc020537e:	6942                	ld	s2,16(sp)
ffffffffc0205380:	69a2                	ld	s3,8(sp)
ffffffffc0205382:	6a02                	ld	s4,0(sp)
ffffffffc0205384:	4501                	li	a0,0
ffffffffc0205386:	6145                	addi	sp,sp,48
ffffffffc0205388:	8082                	ret
ffffffffc020538a:	00008697          	auipc	a3,0x8
ffffffffc020538e:	83e68693          	addi	a3,a3,-1986 # ffffffffc020cbc8 <default_pmm_manager+0x8c8>
ffffffffc0205392:	00006617          	auipc	a2,0x6
ffffffffc0205396:	48660613          	addi	a2,a2,1158 # ffffffffc020b818 <commands+0x210>
ffffffffc020539a:	05300593          	li	a1,83
ffffffffc020539e:	00008517          	auipc	a0,0x8
ffffffffc02053a2:	ec250513          	addi	a0,a0,-318 # ffffffffc020d260 <CSWTCH.79+0x48>
ffffffffc02053a6:	8f8fb0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02053aa:	00008697          	auipc	a3,0x8
ffffffffc02053ae:	ede68693          	addi	a3,a3,-290 # ffffffffc020d288 <CSWTCH.79+0x70>
ffffffffc02053b2:	00006617          	auipc	a2,0x6
ffffffffc02053b6:	46660613          	addi	a2,a2,1126 # ffffffffc020b818 <commands+0x210>
ffffffffc02053ba:	05400593          	li	a1,84
ffffffffc02053be:	00008517          	auipc	a0,0x8
ffffffffc02053c2:	ea250513          	addi	a0,a0,-350 # ffffffffc020d260 <CSWTCH.79+0x48>
ffffffffc02053c6:	8d8fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053ca <iobuf_skip.part.0>:
ffffffffc02053ca:	1141                	addi	sp,sp,-16
ffffffffc02053cc:	00008697          	auipc	a3,0x8
ffffffffc02053d0:	eec68693          	addi	a3,a3,-276 # ffffffffc020d2b8 <CSWTCH.79+0xa0>
ffffffffc02053d4:	00006617          	auipc	a2,0x6
ffffffffc02053d8:	44460613          	addi	a2,a2,1092 # ffffffffc020b818 <commands+0x210>
ffffffffc02053dc:	04a00593          	li	a1,74
ffffffffc02053e0:	00008517          	auipc	a0,0x8
ffffffffc02053e4:	ef050513          	addi	a0,a0,-272 # ffffffffc020d2d0 <CSWTCH.79+0xb8>
ffffffffc02053e8:	e406                	sd	ra,8(sp)
ffffffffc02053ea:	8b4fb0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02053ee <iobuf_init>:
ffffffffc02053ee:	e10c                	sd	a1,0(a0)
ffffffffc02053f0:	e514                	sd	a3,8(a0)
ffffffffc02053f2:	ed10                	sd	a2,24(a0)
ffffffffc02053f4:	e910                	sd	a2,16(a0)
ffffffffc02053f6:	8082                	ret

ffffffffc02053f8 <iobuf_move>:
ffffffffc02053f8:	7179                	addi	sp,sp,-48
ffffffffc02053fa:	ec26                	sd	s1,24(sp)
ffffffffc02053fc:	6d04                	ld	s1,24(a0)
ffffffffc02053fe:	f022                	sd	s0,32(sp)
ffffffffc0205400:	e84a                	sd	s2,16(sp)
ffffffffc0205402:	e44e                	sd	s3,8(sp)
ffffffffc0205404:	f406                	sd	ra,40(sp)
ffffffffc0205406:	842a                	mv	s0,a0
ffffffffc0205408:	8932                	mv	s2,a2
ffffffffc020540a:	852e                	mv	a0,a1
ffffffffc020540c:	89ba                	mv	s3,a4
ffffffffc020540e:	00967363          	bgeu	a2,s1,ffffffffc0205414 <iobuf_move+0x1c>
ffffffffc0205412:	84b2                	mv	s1,a2
ffffffffc0205414:	c495                	beqz	s1,ffffffffc0205440 <iobuf_move+0x48>
ffffffffc0205416:	600c                	ld	a1,0(s0)
ffffffffc0205418:	c681                	beqz	a3,ffffffffc0205420 <iobuf_move+0x28>
ffffffffc020541a:	87ae                	mv	a5,a1
ffffffffc020541c:	85aa                	mv	a1,a0
ffffffffc020541e:	853e                	mv	a0,a5
ffffffffc0205420:	8626                	mv	a2,s1
ffffffffc0205422:	727050ef          	jal	ra,ffffffffc020b348 <memmove>
ffffffffc0205426:	6c1c                	ld	a5,24(s0)
ffffffffc0205428:	0297ea63          	bltu	a5,s1,ffffffffc020545c <iobuf_move+0x64>
ffffffffc020542c:	6014                	ld	a3,0(s0)
ffffffffc020542e:	6418                	ld	a4,8(s0)
ffffffffc0205430:	8f85                	sub	a5,a5,s1
ffffffffc0205432:	96a6                	add	a3,a3,s1
ffffffffc0205434:	9726                	add	a4,a4,s1
ffffffffc0205436:	e014                	sd	a3,0(s0)
ffffffffc0205438:	e418                	sd	a4,8(s0)
ffffffffc020543a:	ec1c                	sd	a5,24(s0)
ffffffffc020543c:	40990933          	sub	s2,s2,s1
ffffffffc0205440:	00098463          	beqz	s3,ffffffffc0205448 <iobuf_move+0x50>
ffffffffc0205444:	0099b023          	sd	s1,0(s3)
ffffffffc0205448:	4501                	li	a0,0
ffffffffc020544a:	00091b63          	bnez	s2,ffffffffc0205460 <iobuf_move+0x68>
ffffffffc020544e:	70a2                	ld	ra,40(sp)
ffffffffc0205450:	7402                	ld	s0,32(sp)
ffffffffc0205452:	64e2                	ld	s1,24(sp)
ffffffffc0205454:	6942                	ld	s2,16(sp)
ffffffffc0205456:	69a2                	ld	s3,8(sp)
ffffffffc0205458:	6145                	addi	sp,sp,48
ffffffffc020545a:	8082                	ret
ffffffffc020545c:	f6fff0ef          	jal	ra,ffffffffc02053ca <iobuf_skip.part.0>
ffffffffc0205460:	5571                	li	a0,-4
ffffffffc0205462:	b7f5                	j	ffffffffc020544e <iobuf_move+0x56>

ffffffffc0205464 <iobuf_skip>:
ffffffffc0205464:	6d1c                	ld	a5,24(a0)
ffffffffc0205466:	00b7eb63          	bltu	a5,a1,ffffffffc020547c <iobuf_skip+0x18>
ffffffffc020546a:	6114                	ld	a3,0(a0)
ffffffffc020546c:	6518                	ld	a4,8(a0)
ffffffffc020546e:	8f8d                	sub	a5,a5,a1
ffffffffc0205470:	96ae                	add	a3,a3,a1
ffffffffc0205472:	95ba                	add	a1,a1,a4
ffffffffc0205474:	e114                	sd	a3,0(a0)
ffffffffc0205476:	e50c                	sd	a1,8(a0)
ffffffffc0205478:	ed1c                	sd	a5,24(a0)
ffffffffc020547a:	8082                	ret
ffffffffc020547c:	1141                	addi	sp,sp,-16
ffffffffc020547e:	e406                	sd	ra,8(sp)
ffffffffc0205480:	f4bff0ef          	jal	ra,ffffffffc02053ca <iobuf_skip.part.0>

ffffffffc0205484 <copy_path>:
ffffffffc0205484:	7139                	addi	sp,sp,-64
ffffffffc0205486:	f04a                	sd	s2,32(sp)
ffffffffc0205488:	00091917          	auipc	s2,0x91
ffffffffc020548c:	43890913          	addi	s2,s2,1080 # ffffffffc02968c0 <current>
ffffffffc0205490:	00093703          	ld	a4,0(s2)
ffffffffc0205494:	ec4e                	sd	s3,24(sp)
ffffffffc0205496:	89aa                	mv	s3,a0
ffffffffc0205498:	6505                	lui	a0,0x1
ffffffffc020549a:	f426                	sd	s1,40(sp)
ffffffffc020549c:	e852                	sd	s4,16(sp)
ffffffffc020549e:	fc06                	sd	ra,56(sp)
ffffffffc02054a0:	f822                	sd	s0,48(sp)
ffffffffc02054a2:	e456                	sd	s5,8(sp)
ffffffffc02054a4:	02873a03          	ld	s4,40(a4)
ffffffffc02054a8:	84ae                	mv	s1,a1
ffffffffc02054aa:	ae5fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02054ae:	c141                	beqz	a0,ffffffffc020552e <copy_path+0xaa>
ffffffffc02054b0:	842a                	mv	s0,a0
ffffffffc02054b2:	040a0563          	beqz	s4,ffffffffc02054fc <copy_path+0x78>
ffffffffc02054b6:	038a0a93          	addi	s5,s4,56
ffffffffc02054ba:	8556                	mv	a0,s5
ffffffffc02054bc:	8b4ff0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02054c0:	00093783          	ld	a5,0(s2)
ffffffffc02054c4:	cba1                	beqz	a5,ffffffffc0205514 <copy_path+0x90>
ffffffffc02054c6:	43dc                	lw	a5,4(a5)
ffffffffc02054c8:	6685                	lui	a3,0x1
ffffffffc02054ca:	8626                	mv	a2,s1
ffffffffc02054cc:	04fa2823          	sw	a5,80(s4)
ffffffffc02054d0:	85a2                	mv	a1,s0
ffffffffc02054d2:	8552                	mv	a0,s4
ffffffffc02054d4:	ec5fe0ef          	jal	ra,ffffffffc0204398 <copy_string>
ffffffffc02054d8:	c529                	beqz	a0,ffffffffc0205522 <copy_path+0x9e>
ffffffffc02054da:	8556                	mv	a0,s5
ffffffffc02054dc:	890ff0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc02054e0:	040a2823          	sw	zero,80(s4)
ffffffffc02054e4:	0089b023          	sd	s0,0(s3)
ffffffffc02054e8:	4501                	li	a0,0
ffffffffc02054ea:	70e2                	ld	ra,56(sp)
ffffffffc02054ec:	7442                	ld	s0,48(sp)
ffffffffc02054ee:	74a2                	ld	s1,40(sp)
ffffffffc02054f0:	7902                	ld	s2,32(sp)
ffffffffc02054f2:	69e2                	ld	s3,24(sp)
ffffffffc02054f4:	6a42                	ld	s4,16(sp)
ffffffffc02054f6:	6aa2                	ld	s5,8(sp)
ffffffffc02054f8:	6121                	addi	sp,sp,64
ffffffffc02054fa:	8082                	ret
ffffffffc02054fc:	85aa                	mv	a1,a0
ffffffffc02054fe:	6685                	lui	a3,0x1
ffffffffc0205500:	8626                	mv	a2,s1
ffffffffc0205502:	4501                	li	a0,0
ffffffffc0205504:	e95fe0ef          	jal	ra,ffffffffc0204398 <copy_string>
ffffffffc0205508:	fd71                	bnez	a0,ffffffffc02054e4 <copy_path+0x60>
ffffffffc020550a:	8522                	mv	a0,s0
ffffffffc020550c:	b33fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205510:	5575                	li	a0,-3
ffffffffc0205512:	bfe1                	j	ffffffffc02054ea <copy_path+0x66>
ffffffffc0205514:	6685                	lui	a3,0x1
ffffffffc0205516:	8626                	mv	a2,s1
ffffffffc0205518:	85a2                	mv	a1,s0
ffffffffc020551a:	8552                	mv	a0,s4
ffffffffc020551c:	e7dfe0ef          	jal	ra,ffffffffc0204398 <copy_string>
ffffffffc0205520:	fd4d                	bnez	a0,ffffffffc02054da <copy_path+0x56>
ffffffffc0205522:	8556                	mv	a0,s5
ffffffffc0205524:	848ff0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205528:	040a2823          	sw	zero,80(s4)
ffffffffc020552c:	bff9                	j	ffffffffc020550a <copy_path+0x86>
ffffffffc020552e:	5571                	li	a0,-4
ffffffffc0205530:	bf6d                	j	ffffffffc02054ea <copy_path+0x66>

ffffffffc0205532 <sysfile_open>:
ffffffffc0205532:	7179                	addi	sp,sp,-48
ffffffffc0205534:	872a                	mv	a4,a0
ffffffffc0205536:	ec26                	sd	s1,24(sp)
ffffffffc0205538:	0028                	addi	a0,sp,8
ffffffffc020553a:	84ae                	mv	s1,a1
ffffffffc020553c:	85ba                	mv	a1,a4
ffffffffc020553e:	f022                	sd	s0,32(sp)
ffffffffc0205540:	f406                	sd	ra,40(sp)
ffffffffc0205542:	f43ff0ef          	jal	ra,ffffffffc0205484 <copy_path>
ffffffffc0205546:	842a                	mv	s0,a0
ffffffffc0205548:	e909                	bnez	a0,ffffffffc020555a <sysfile_open+0x28>
ffffffffc020554a:	6522                	ld	a0,8(sp)
ffffffffc020554c:	85a6                	mv	a1,s1
ffffffffc020554e:	d60ff0ef          	jal	ra,ffffffffc0204aae <file_open>
ffffffffc0205552:	842a                	mv	s0,a0
ffffffffc0205554:	6522                	ld	a0,8(sp)
ffffffffc0205556:	ae9fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020555a:	70a2                	ld	ra,40(sp)
ffffffffc020555c:	8522                	mv	a0,s0
ffffffffc020555e:	7402                	ld	s0,32(sp)
ffffffffc0205560:	64e2                	ld	s1,24(sp)
ffffffffc0205562:	6145                	addi	sp,sp,48
ffffffffc0205564:	8082                	ret

ffffffffc0205566 <sysfile_close>:
ffffffffc0205566:	e46ff06f          	j	ffffffffc0204bac <file_close>

ffffffffc020556a <sysfile_read>:
ffffffffc020556a:	7159                	addi	sp,sp,-112
ffffffffc020556c:	f0a2                	sd	s0,96(sp)
ffffffffc020556e:	f486                	sd	ra,104(sp)
ffffffffc0205570:	eca6                	sd	s1,88(sp)
ffffffffc0205572:	e8ca                	sd	s2,80(sp)
ffffffffc0205574:	e4ce                	sd	s3,72(sp)
ffffffffc0205576:	e0d2                	sd	s4,64(sp)
ffffffffc0205578:	fc56                	sd	s5,56(sp)
ffffffffc020557a:	f85a                	sd	s6,48(sp)
ffffffffc020557c:	f45e                	sd	s7,40(sp)
ffffffffc020557e:	f062                	sd	s8,32(sp)
ffffffffc0205580:	ec66                	sd	s9,24(sp)
ffffffffc0205582:	4401                	li	s0,0
ffffffffc0205584:	ee19                	bnez	a2,ffffffffc02055a2 <sysfile_read+0x38>
ffffffffc0205586:	70a6                	ld	ra,104(sp)
ffffffffc0205588:	8522                	mv	a0,s0
ffffffffc020558a:	7406                	ld	s0,96(sp)
ffffffffc020558c:	64e6                	ld	s1,88(sp)
ffffffffc020558e:	6946                	ld	s2,80(sp)
ffffffffc0205590:	69a6                	ld	s3,72(sp)
ffffffffc0205592:	6a06                	ld	s4,64(sp)
ffffffffc0205594:	7ae2                	ld	s5,56(sp)
ffffffffc0205596:	7b42                	ld	s6,48(sp)
ffffffffc0205598:	7ba2                	ld	s7,40(sp)
ffffffffc020559a:	7c02                	ld	s8,32(sp)
ffffffffc020559c:	6ce2                	ld	s9,24(sp)
ffffffffc020559e:	6165                	addi	sp,sp,112
ffffffffc02055a0:	8082                	ret
ffffffffc02055a2:	00091c97          	auipc	s9,0x91
ffffffffc02055a6:	31ec8c93          	addi	s9,s9,798 # ffffffffc02968c0 <current>
ffffffffc02055aa:	000cb783          	ld	a5,0(s9)
ffffffffc02055ae:	84b2                	mv	s1,a2
ffffffffc02055b0:	8b2e                	mv	s6,a1
ffffffffc02055b2:	4601                	li	a2,0
ffffffffc02055b4:	4585                	li	a1,1
ffffffffc02055b6:	0287b903          	ld	s2,40(a5)
ffffffffc02055ba:	8aaa                	mv	s5,a0
ffffffffc02055bc:	c9eff0ef          	jal	ra,ffffffffc0204a5a <file_testfd>
ffffffffc02055c0:	c959                	beqz	a0,ffffffffc0205656 <sysfile_read+0xec>
ffffffffc02055c2:	6505                	lui	a0,0x1
ffffffffc02055c4:	9cbfc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02055c8:	89aa                	mv	s3,a0
ffffffffc02055ca:	c941                	beqz	a0,ffffffffc020565a <sysfile_read+0xf0>
ffffffffc02055cc:	4b81                	li	s7,0
ffffffffc02055ce:	6a05                	lui	s4,0x1
ffffffffc02055d0:	03890c13          	addi	s8,s2,56
ffffffffc02055d4:	0744ec63          	bltu	s1,s4,ffffffffc020564c <sysfile_read+0xe2>
ffffffffc02055d8:	e452                	sd	s4,8(sp)
ffffffffc02055da:	6605                	lui	a2,0x1
ffffffffc02055dc:	0034                	addi	a3,sp,8
ffffffffc02055de:	85ce                	mv	a1,s3
ffffffffc02055e0:	8556                	mv	a0,s5
ffffffffc02055e2:	e20ff0ef          	jal	ra,ffffffffc0204c02 <file_read>
ffffffffc02055e6:	66a2                	ld	a3,8(sp)
ffffffffc02055e8:	842a                	mv	s0,a0
ffffffffc02055ea:	ca9d                	beqz	a3,ffffffffc0205620 <sysfile_read+0xb6>
ffffffffc02055ec:	00090c63          	beqz	s2,ffffffffc0205604 <sysfile_read+0x9a>
ffffffffc02055f0:	8562                	mv	a0,s8
ffffffffc02055f2:	f7ffe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02055f6:	000cb783          	ld	a5,0(s9)
ffffffffc02055fa:	cfa1                	beqz	a5,ffffffffc0205652 <sysfile_read+0xe8>
ffffffffc02055fc:	43dc                	lw	a5,4(a5)
ffffffffc02055fe:	66a2                	ld	a3,8(sp)
ffffffffc0205600:	04f92823          	sw	a5,80(s2)
ffffffffc0205604:	864e                	mv	a2,s3
ffffffffc0205606:	85da                	mv	a1,s6
ffffffffc0205608:	854a                	mv	a0,s2
ffffffffc020560a:	d5dfe0ef          	jal	ra,ffffffffc0204366 <copy_to_user>
ffffffffc020560e:	c50d                	beqz	a0,ffffffffc0205638 <sysfile_read+0xce>
ffffffffc0205610:	67a2                	ld	a5,8(sp)
ffffffffc0205612:	04f4e663          	bltu	s1,a5,ffffffffc020565e <sysfile_read+0xf4>
ffffffffc0205616:	9b3e                	add	s6,s6,a5
ffffffffc0205618:	8c9d                	sub	s1,s1,a5
ffffffffc020561a:	9bbe                	add	s7,s7,a5
ffffffffc020561c:	02091263          	bnez	s2,ffffffffc0205640 <sysfile_read+0xd6>
ffffffffc0205620:	e401                	bnez	s0,ffffffffc0205628 <sysfile_read+0xbe>
ffffffffc0205622:	67a2                	ld	a5,8(sp)
ffffffffc0205624:	c391                	beqz	a5,ffffffffc0205628 <sysfile_read+0xbe>
ffffffffc0205626:	f4dd                	bnez	s1,ffffffffc02055d4 <sysfile_read+0x6a>
ffffffffc0205628:	854e                	mv	a0,s3
ffffffffc020562a:	a15fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020562e:	f40b8ce3          	beqz	s7,ffffffffc0205586 <sysfile_read+0x1c>
ffffffffc0205632:	000b841b          	sext.w	s0,s7
ffffffffc0205636:	bf81                	j	ffffffffc0205586 <sysfile_read+0x1c>
ffffffffc0205638:	e011                	bnez	s0,ffffffffc020563c <sysfile_read+0xd2>
ffffffffc020563a:	5475                	li	s0,-3
ffffffffc020563c:	fe0906e3          	beqz	s2,ffffffffc0205628 <sysfile_read+0xbe>
ffffffffc0205640:	8562                	mv	a0,s8
ffffffffc0205642:	f2bfe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205646:	04092823          	sw	zero,80(s2)
ffffffffc020564a:	bfd9                	j	ffffffffc0205620 <sysfile_read+0xb6>
ffffffffc020564c:	e426                	sd	s1,8(sp)
ffffffffc020564e:	8626                	mv	a2,s1
ffffffffc0205650:	b771                	j	ffffffffc02055dc <sysfile_read+0x72>
ffffffffc0205652:	66a2                	ld	a3,8(sp)
ffffffffc0205654:	bf45                	j	ffffffffc0205604 <sysfile_read+0x9a>
ffffffffc0205656:	5475                	li	s0,-3
ffffffffc0205658:	b73d                	j	ffffffffc0205586 <sysfile_read+0x1c>
ffffffffc020565a:	5471                	li	s0,-4
ffffffffc020565c:	b72d                	j	ffffffffc0205586 <sysfile_read+0x1c>
ffffffffc020565e:	00008697          	auipc	a3,0x8
ffffffffc0205662:	c8268693          	addi	a3,a3,-894 # ffffffffc020d2e0 <CSWTCH.79+0xc8>
ffffffffc0205666:	00006617          	auipc	a2,0x6
ffffffffc020566a:	1b260613          	addi	a2,a2,434 # ffffffffc020b818 <commands+0x210>
ffffffffc020566e:	05500593          	li	a1,85
ffffffffc0205672:	00008517          	auipc	a0,0x8
ffffffffc0205676:	c7e50513          	addi	a0,a0,-898 # ffffffffc020d2f0 <CSWTCH.79+0xd8>
ffffffffc020567a:	e25fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020567e <sysfile_write>:
ffffffffc020567e:	7159                	addi	sp,sp,-112
ffffffffc0205680:	e8ca                	sd	s2,80(sp)
ffffffffc0205682:	f486                	sd	ra,104(sp)
ffffffffc0205684:	f0a2                	sd	s0,96(sp)
ffffffffc0205686:	eca6                	sd	s1,88(sp)
ffffffffc0205688:	e4ce                	sd	s3,72(sp)
ffffffffc020568a:	e0d2                	sd	s4,64(sp)
ffffffffc020568c:	fc56                	sd	s5,56(sp)
ffffffffc020568e:	f85a                	sd	s6,48(sp)
ffffffffc0205690:	f45e                	sd	s7,40(sp)
ffffffffc0205692:	f062                	sd	s8,32(sp)
ffffffffc0205694:	ec66                	sd	s9,24(sp)
ffffffffc0205696:	4901                	li	s2,0
ffffffffc0205698:	ee19                	bnez	a2,ffffffffc02056b6 <sysfile_write+0x38>
ffffffffc020569a:	70a6                	ld	ra,104(sp)
ffffffffc020569c:	7406                	ld	s0,96(sp)
ffffffffc020569e:	64e6                	ld	s1,88(sp)
ffffffffc02056a0:	69a6                	ld	s3,72(sp)
ffffffffc02056a2:	6a06                	ld	s4,64(sp)
ffffffffc02056a4:	7ae2                	ld	s5,56(sp)
ffffffffc02056a6:	7b42                	ld	s6,48(sp)
ffffffffc02056a8:	7ba2                	ld	s7,40(sp)
ffffffffc02056aa:	7c02                	ld	s8,32(sp)
ffffffffc02056ac:	6ce2                	ld	s9,24(sp)
ffffffffc02056ae:	854a                	mv	a0,s2
ffffffffc02056b0:	6946                	ld	s2,80(sp)
ffffffffc02056b2:	6165                	addi	sp,sp,112
ffffffffc02056b4:	8082                	ret
ffffffffc02056b6:	00091c17          	auipc	s8,0x91
ffffffffc02056ba:	20ac0c13          	addi	s8,s8,522 # ffffffffc02968c0 <current>
ffffffffc02056be:	000c3783          	ld	a5,0(s8)
ffffffffc02056c2:	8432                	mv	s0,a2
ffffffffc02056c4:	89ae                	mv	s3,a1
ffffffffc02056c6:	4605                	li	a2,1
ffffffffc02056c8:	4581                	li	a1,0
ffffffffc02056ca:	7784                	ld	s1,40(a5)
ffffffffc02056cc:	8baa                	mv	s7,a0
ffffffffc02056ce:	b8cff0ef          	jal	ra,ffffffffc0204a5a <file_testfd>
ffffffffc02056d2:	cd59                	beqz	a0,ffffffffc0205770 <sysfile_write+0xf2>
ffffffffc02056d4:	6505                	lui	a0,0x1
ffffffffc02056d6:	8b9fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02056da:	8a2a                	mv	s4,a0
ffffffffc02056dc:	cd41                	beqz	a0,ffffffffc0205774 <sysfile_write+0xf6>
ffffffffc02056de:	4c81                	li	s9,0
ffffffffc02056e0:	6a85                	lui	s5,0x1
ffffffffc02056e2:	03848b13          	addi	s6,s1,56
ffffffffc02056e6:	05546a63          	bltu	s0,s5,ffffffffc020573a <sysfile_write+0xbc>
ffffffffc02056ea:	e456                	sd	s5,8(sp)
ffffffffc02056ec:	c8a9                	beqz	s1,ffffffffc020573e <sysfile_write+0xc0>
ffffffffc02056ee:	855a                	mv	a0,s6
ffffffffc02056f0:	e81fe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02056f4:	000c3783          	ld	a5,0(s8)
ffffffffc02056f8:	c399                	beqz	a5,ffffffffc02056fe <sysfile_write+0x80>
ffffffffc02056fa:	43dc                	lw	a5,4(a5)
ffffffffc02056fc:	c8bc                	sw	a5,80(s1)
ffffffffc02056fe:	66a2                	ld	a3,8(sp)
ffffffffc0205700:	4701                	li	a4,0
ffffffffc0205702:	864e                	mv	a2,s3
ffffffffc0205704:	85d2                	mv	a1,s4
ffffffffc0205706:	8526                	mv	a0,s1
ffffffffc0205708:	c2bfe0ef          	jal	ra,ffffffffc0204332 <copy_from_user>
ffffffffc020570c:	c139                	beqz	a0,ffffffffc0205752 <sysfile_write+0xd4>
ffffffffc020570e:	855a                	mv	a0,s6
ffffffffc0205710:	e5dfe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205714:	0404a823          	sw	zero,80(s1)
ffffffffc0205718:	6622                	ld	a2,8(sp)
ffffffffc020571a:	0034                	addi	a3,sp,8
ffffffffc020571c:	85d2                	mv	a1,s4
ffffffffc020571e:	855e                	mv	a0,s7
ffffffffc0205720:	dc8ff0ef          	jal	ra,ffffffffc0204ce8 <file_write>
ffffffffc0205724:	67a2                	ld	a5,8(sp)
ffffffffc0205726:	892a                	mv	s2,a0
ffffffffc0205728:	ef85                	bnez	a5,ffffffffc0205760 <sysfile_write+0xe2>
ffffffffc020572a:	8552                	mv	a0,s4
ffffffffc020572c:	913fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205730:	f60c85e3          	beqz	s9,ffffffffc020569a <sysfile_write+0x1c>
ffffffffc0205734:	000c891b          	sext.w	s2,s9
ffffffffc0205738:	b78d                	j	ffffffffc020569a <sysfile_write+0x1c>
ffffffffc020573a:	e422                	sd	s0,8(sp)
ffffffffc020573c:	f8cd                	bnez	s1,ffffffffc02056ee <sysfile_write+0x70>
ffffffffc020573e:	66a2                	ld	a3,8(sp)
ffffffffc0205740:	4701                	li	a4,0
ffffffffc0205742:	864e                	mv	a2,s3
ffffffffc0205744:	85d2                	mv	a1,s4
ffffffffc0205746:	4501                	li	a0,0
ffffffffc0205748:	bebfe0ef          	jal	ra,ffffffffc0204332 <copy_from_user>
ffffffffc020574c:	f571                	bnez	a0,ffffffffc0205718 <sysfile_write+0x9a>
ffffffffc020574e:	5975                	li	s2,-3
ffffffffc0205750:	bfe9                	j	ffffffffc020572a <sysfile_write+0xac>
ffffffffc0205752:	855a                	mv	a0,s6
ffffffffc0205754:	e19fe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205758:	5975                	li	s2,-3
ffffffffc020575a:	0404a823          	sw	zero,80(s1)
ffffffffc020575e:	b7f1                	j	ffffffffc020572a <sysfile_write+0xac>
ffffffffc0205760:	00f46c63          	bltu	s0,a5,ffffffffc0205778 <sysfile_write+0xfa>
ffffffffc0205764:	99be                	add	s3,s3,a5
ffffffffc0205766:	8c1d                	sub	s0,s0,a5
ffffffffc0205768:	9cbe                	add	s9,s9,a5
ffffffffc020576a:	f161                	bnez	a0,ffffffffc020572a <sysfile_write+0xac>
ffffffffc020576c:	fc2d                	bnez	s0,ffffffffc02056e6 <sysfile_write+0x68>
ffffffffc020576e:	bf75                	j	ffffffffc020572a <sysfile_write+0xac>
ffffffffc0205770:	5975                	li	s2,-3
ffffffffc0205772:	b725                	j	ffffffffc020569a <sysfile_write+0x1c>
ffffffffc0205774:	5971                	li	s2,-4
ffffffffc0205776:	b715                	j	ffffffffc020569a <sysfile_write+0x1c>
ffffffffc0205778:	00008697          	auipc	a3,0x8
ffffffffc020577c:	b6868693          	addi	a3,a3,-1176 # ffffffffc020d2e0 <CSWTCH.79+0xc8>
ffffffffc0205780:	00006617          	auipc	a2,0x6
ffffffffc0205784:	09860613          	addi	a2,a2,152 # ffffffffc020b818 <commands+0x210>
ffffffffc0205788:	08a00593          	li	a1,138
ffffffffc020578c:	00008517          	auipc	a0,0x8
ffffffffc0205790:	b6450513          	addi	a0,a0,-1180 # ffffffffc020d2f0 <CSWTCH.79+0xd8>
ffffffffc0205794:	d0bfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205798 <sysfile_seek>:
ffffffffc0205798:	e36ff06f          	j	ffffffffc0204dce <file_seek>

ffffffffc020579c <sysfile_fstat>:
ffffffffc020579c:	715d                	addi	sp,sp,-80
ffffffffc020579e:	f44e                	sd	s3,40(sp)
ffffffffc02057a0:	00091997          	auipc	s3,0x91
ffffffffc02057a4:	12098993          	addi	s3,s3,288 # ffffffffc02968c0 <current>
ffffffffc02057a8:	0009b703          	ld	a4,0(s3)
ffffffffc02057ac:	fc26                	sd	s1,56(sp)
ffffffffc02057ae:	84ae                	mv	s1,a1
ffffffffc02057b0:	858a                	mv	a1,sp
ffffffffc02057b2:	e0a2                	sd	s0,64(sp)
ffffffffc02057b4:	f84a                	sd	s2,48(sp)
ffffffffc02057b6:	e486                	sd	ra,72(sp)
ffffffffc02057b8:	02873903          	ld	s2,40(a4)
ffffffffc02057bc:	f052                	sd	s4,32(sp)
ffffffffc02057be:	f30ff0ef          	jal	ra,ffffffffc0204eee <file_fstat>
ffffffffc02057c2:	842a                	mv	s0,a0
ffffffffc02057c4:	e91d                	bnez	a0,ffffffffc02057fa <sysfile_fstat+0x5e>
ffffffffc02057c6:	04090363          	beqz	s2,ffffffffc020580c <sysfile_fstat+0x70>
ffffffffc02057ca:	03890a13          	addi	s4,s2,56
ffffffffc02057ce:	8552                	mv	a0,s4
ffffffffc02057d0:	da1fe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02057d4:	0009b783          	ld	a5,0(s3)
ffffffffc02057d8:	c3b9                	beqz	a5,ffffffffc020581e <sysfile_fstat+0x82>
ffffffffc02057da:	43dc                	lw	a5,4(a5)
ffffffffc02057dc:	02000693          	li	a3,32
ffffffffc02057e0:	860a                	mv	a2,sp
ffffffffc02057e2:	04f92823          	sw	a5,80(s2)
ffffffffc02057e6:	85a6                	mv	a1,s1
ffffffffc02057e8:	854a                	mv	a0,s2
ffffffffc02057ea:	b7dfe0ef          	jal	ra,ffffffffc0204366 <copy_to_user>
ffffffffc02057ee:	c121                	beqz	a0,ffffffffc020582e <sysfile_fstat+0x92>
ffffffffc02057f0:	8552                	mv	a0,s4
ffffffffc02057f2:	d7bfe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc02057f6:	04092823          	sw	zero,80(s2)
ffffffffc02057fa:	60a6                	ld	ra,72(sp)
ffffffffc02057fc:	8522                	mv	a0,s0
ffffffffc02057fe:	6406                	ld	s0,64(sp)
ffffffffc0205800:	74e2                	ld	s1,56(sp)
ffffffffc0205802:	7942                	ld	s2,48(sp)
ffffffffc0205804:	79a2                	ld	s3,40(sp)
ffffffffc0205806:	7a02                	ld	s4,32(sp)
ffffffffc0205808:	6161                	addi	sp,sp,80
ffffffffc020580a:	8082                	ret
ffffffffc020580c:	02000693          	li	a3,32
ffffffffc0205810:	860a                	mv	a2,sp
ffffffffc0205812:	85a6                	mv	a1,s1
ffffffffc0205814:	b53fe0ef          	jal	ra,ffffffffc0204366 <copy_to_user>
ffffffffc0205818:	f16d                	bnez	a0,ffffffffc02057fa <sysfile_fstat+0x5e>
ffffffffc020581a:	5475                	li	s0,-3
ffffffffc020581c:	bff9                	j	ffffffffc02057fa <sysfile_fstat+0x5e>
ffffffffc020581e:	02000693          	li	a3,32
ffffffffc0205822:	860a                	mv	a2,sp
ffffffffc0205824:	85a6                	mv	a1,s1
ffffffffc0205826:	854a                	mv	a0,s2
ffffffffc0205828:	b3ffe0ef          	jal	ra,ffffffffc0204366 <copy_to_user>
ffffffffc020582c:	f171                	bnez	a0,ffffffffc02057f0 <sysfile_fstat+0x54>
ffffffffc020582e:	8552                	mv	a0,s4
ffffffffc0205830:	d3dfe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205834:	5475                	li	s0,-3
ffffffffc0205836:	04092823          	sw	zero,80(s2)
ffffffffc020583a:	b7c1                	j	ffffffffc02057fa <sysfile_fstat+0x5e>

ffffffffc020583c <sysfile_fsync>:
ffffffffc020583c:	f72ff06f          	j	ffffffffc0204fae <file_fsync>

ffffffffc0205840 <sysfile_getcwd>:
ffffffffc0205840:	715d                	addi	sp,sp,-80
ffffffffc0205842:	f44e                	sd	s3,40(sp)
ffffffffc0205844:	00091997          	auipc	s3,0x91
ffffffffc0205848:	07c98993          	addi	s3,s3,124 # ffffffffc02968c0 <current>
ffffffffc020584c:	0009b783          	ld	a5,0(s3)
ffffffffc0205850:	f84a                	sd	s2,48(sp)
ffffffffc0205852:	e486                	sd	ra,72(sp)
ffffffffc0205854:	e0a2                	sd	s0,64(sp)
ffffffffc0205856:	fc26                	sd	s1,56(sp)
ffffffffc0205858:	f052                	sd	s4,32(sp)
ffffffffc020585a:	0287b903          	ld	s2,40(a5)
ffffffffc020585e:	cda9                	beqz	a1,ffffffffc02058b8 <sysfile_getcwd+0x78>
ffffffffc0205860:	842e                	mv	s0,a1
ffffffffc0205862:	84aa                	mv	s1,a0
ffffffffc0205864:	04090363          	beqz	s2,ffffffffc02058aa <sysfile_getcwd+0x6a>
ffffffffc0205868:	03890a13          	addi	s4,s2,56
ffffffffc020586c:	8552                	mv	a0,s4
ffffffffc020586e:	d03fe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0205872:	0009b783          	ld	a5,0(s3)
ffffffffc0205876:	c781                	beqz	a5,ffffffffc020587e <sysfile_getcwd+0x3e>
ffffffffc0205878:	43dc                	lw	a5,4(a5)
ffffffffc020587a:	04f92823          	sw	a5,80(s2)
ffffffffc020587e:	4685                	li	a3,1
ffffffffc0205880:	8622                	mv	a2,s0
ffffffffc0205882:	85a6                	mv	a1,s1
ffffffffc0205884:	854a                	mv	a0,s2
ffffffffc0205886:	a19fe0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc020588a:	e90d                	bnez	a0,ffffffffc02058bc <sysfile_getcwd+0x7c>
ffffffffc020588c:	5475                	li	s0,-3
ffffffffc020588e:	8552                	mv	a0,s4
ffffffffc0205890:	cddfe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205894:	04092823          	sw	zero,80(s2)
ffffffffc0205898:	60a6                	ld	ra,72(sp)
ffffffffc020589a:	8522                	mv	a0,s0
ffffffffc020589c:	6406                	ld	s0,64(sp)
ffffffffc020589e:	74e2                	ld	s1,56(sp)
ffffffffc02058a0:	7942                	ld	s2,48(sp)
ffffffffc02058a2:	79a2                	ld	s3,40(sp)
ffffffffc02058a4:	7a02                	ld	s4,32(sp)
ffffffffc02058a6:	6161                	addi	sp,sp,80
ffffffffc02058a8:	8082                	ret
ffffffffc02058aa:	862e                	mv	a2,a1
ffffffffc02058ac:	4685                	li	a3,1
ffffffffc02058ae:	85aa                	mv	a1,a0
ffffffffc02058b0:	4501                	li	a0,0
ffffffffc02058b2:	9edfe0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc02058b6:	ed09                	bnez	a0,ffffffffc02058d0 <sysfile_getcwd+0x90>
ffffffffc02058b8:	5475                	li	s0,-3
ffffffffc02058ba:	bff9                	j	ffffffffc0205898 <sysfile_getcwd+0x58>
ffffffffc02058bc:	8622                	mv	a2,s0
ffffffffc02058be:	4681                	li	a3,0
ffffffffc02058c0:	85a6                	mv	a1,s1
ffffffffc02058c2:	850a                	mv	a0,sp
ffffffffc02058c4:	b2bff0ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc02058c8:	1e5020ef          	jal	ra,ffffffffc02082ac <vfs_getcwd>
ffffffffc02058cc:	842a                	mv	s0,a0
ffffffffc02058ce:	b7c1                	j	ffffffffc020588e <sysfile_getcwd+0x4e>
ffffffffc02058d0:	8622                	mv	a2,s0
ffffffffc02058d2:	4681                	li	a3,0
ffffffffc02058d4:	85a6                	mv	a1,s1
ffffffffc02058d6:	850a                	mv	a0,sp
ffffffffc02058d8:	b17ff0ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc02058dc:	1d1020ef          	jal	ra,ffffffffc02082ac <vfs_getcwd>
ffffffffc02058e0:	842a                	mv	s0,a0
ffffffffc02058e2:	bf5d                	j	ffffffffc0205898 <sysfile_getcwd+0x58>

ffffffffc02058e4 <sysfile_getdirentry>:
ffffffffc02058e4:	7139                	addi	sp,sp,-64
ffffffffc02058e6:	e852                	sd	s4,16(sp)
ffffffffc02058e8:	00091a17          	auipc	s4,0x91
ffffffffc02058ec:	fd8a0a13          	addi	s4,s4,-40 # ffffffffc02968c0 <current>
ffffffffc02058f0:	000a3703          	ld	a4,0(s4)
ffffffffc02058f4:	ec4e                	sd	s3,24(sp)
ffffffffc02058f6:	89aa                	mv	s3,a0
ffffffffc02058f8:	10800513          	li	a0,264
ffffffffc02058fc:	f426                	sd	s1,40(sp)
ffffffffc02058fe:	f04a                	sd	s2,32(sp)
ffffffffc0205900:	fc06                	sd	ra,56(sp)
ffffffffc0205902:	f822                	sd	s0,48(sp)
ffffffffc0205904:	e456                	sd	s5,8(sp)
ffffffffc0205906:	7704                	ld	s1,40(a4)
ffffffffc0205908:	892e                	mv	s2,a1
ffffffffc020590a:	e84fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020590e:	c169                	beqz	a0,ffffffffc02059d0 <sysfile_getdirentry+0xec>
ffffffffc0205910:	842a                	mv	s0,a0
ffffffffc0205912:	c8c1                	beqz	s1,ffffffffc02059a2 <sysfile_getdirentry+0xbe>
ffffffffc0205914:	03848a93          	addi	s5,s1,56
ffffffffc0205918:	8556                	mv	a0,s5
ffffffffc020591a:	c57fe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020591e:	000a3783          	ld	a5,0(s4)
ffffffffc0205922:	c399                	beqz	a5,ffffffffc0205928 <sysfile_getdirentry+0x44>
ffffffffc0205924:	43dc                	lw	a5,4(a5)
ffffffffc0205926:	c8bc                	sw	a5,80(s1)
ffffffffc0205928:	4705                	li	a4,1
ffffffffc020592a:	46a1                	li	a3,8
ffffffffc020592c:	864a                	mv	a2,s2
ffffffffc020592e:	85a2                	mv	a1,s0
ffffffffc0205930:	8526                	mv	a0,s1
ffffffffc0205932:	a01fe0ef          	jal	ra,ffffffffc0204332 <copy_from_user>
ffffffffc0205936:	e505                	bnez	a0,ffffffffc020595e <sysfile_getdirentry+0x7a>
ffffffffc0205938:	8556                	mv	a0,s5
ffffffffc020593a:	c33fe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020593e:	59f5                	li	s3,-3
ffffffffc0205940:	0404a823          	sw	zero,80(s1)
ffffffffc0205944:	8522                	mv	a0,s0
ffffffffc0205946:	ef8fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020594a:	70e2                	ld	ra,56(sp)
ffffffffc020594c:	7442                	ld	s0,48(sp)
ffffffffc020594e:	74a2                	ld	s1,40(sp)
ffffffffc0205950:	7902                	ld	s2,32(sp)
ffffffffc0205952:	6a42                	ld	s4,16(sp)
ffffffffc0205954:	6aa2                	ld	s5,8(sp)
ffffffffc0205956:	854e                	mv	a0,s3
ffffffffc0205958:	69e2                	ld	s3,24(sp)
ffffffffc020595a:	6121                	addi	sp,sp,64
ffffffffc020595c:	8082                	ret
ffffffffc020595e:	8556                	mv	a0,s5
ffffffffc0205960:	c0dfe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205964:	854e                	mv	a0,s3
ffffffffc0205966:	85a2                	mv	a1,s0
ffffffffc0205968:	0404a823          	sw	zero,80(s1)
ffffffffc020596c:	ef0ff0ef          	jal	ra,ffffffffc020505c <file_getdirentry>
ffffffffc0205970:	89aa                	mv	s3,a0
ffffffffc0205972:	f969                	bnez	a0,ffffffffc0205944 <sysfile_getdirentry+0x60>
ffffffffc0205974:	8556                	mv	a0,s5
ffffffffc0205976:	bfbfe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020597a:	000a3783          	ld	a5,0(s4)
ffffffffc020597e:	c399                	beqz	a5,ffffffffc0205984 <sysfile_getdirentry+0xa0>
ffffffffc0205980:	43dc                	lw	a5,4(a5)
ffffffffc0205982:	c8bc                	sw	a5,80(s1)
ffffffffc0205984:	10800693          	li	a3,264
ffffffffc0205988:	8622                	mv	a2,s0
ffffffffc020598a:	85ca                	mv	a1,s2
ffffffffc020598c:	8526                	mv	a0,s1
ffffffffc020598e:	9d9fe0ef          	jal	ra,ffffffffc0204366 <copy_to_user>
ffffffffc0205992:	e111                	bnez	a0,ffffffffc0205996 <sysfile_getdirentry+0xb2>
ffffffffc0205994:	59f5                	li	s3,-3
ffffffffc0205996:	8556                	mv	a0,s5
ffffffffc0205998:	bd5fe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020599c:	0404a823          	sw	zero,80(s1)
ffffffffc02059a0:	b755                	j	ffffffffc0205944 <sysfile_getdirentry+0x60>
ffffffffc02059a2:	85aa                	mv	a1,a0
ffffffffc02059a4:	4705                	li	a4,1
ffffffffc02059a6:	46a1                	li	a3,8
ffffffffc02059a8:	864a                	mv	a2,s2
ffffffffc02059aa:	4501                	li	a0,0
ffffffffc02059ac:	987fe0ef          	jal	ra,ffffffffc0204332 <copy_from_user>
ffffffffc02059b0:	cd11                	beqz	a0,ffffffffc02059cc <sysfile_getdirentry+0xe8>
ffffffffc02059b2:	854e                	mv	a0,s3
ffffffffc02059b4:	85a2                	mv	a1,s0
ffffffffc02059b6:	ea6ff0ef          	jal	ra,ffffffffc020505c <file_getdirentry>
ffffffffc02059ba:	89aa                	mv	s3,a0
ffffffffc02059bc:	f541                	bnez	a0,ffffffffc0205944 <sysfile_getdirentry+0x60>
ffffffffc02059be:	10800693          	li	a3,264
ffffffffc02059c2:	8622                	mv	a2,s0
ffffffffc02059c4:	85ca                	mv	a1,s2
ffffffffc02059c6:	9a1fe0ef          	jal	ra,ffffffffc0204366 <copy_to_user>
ffffffffc02059ca:	fd2d                	bnez	a0,ffffffffc0205944 <sysfile_getdirentry+0x60>
ffffffffc02059cc:	59f5                	li	s3,-3
ffffffffc02059ce:	bf9d                	j	ffffffffc0205944 <sysfile_getdirentry+0x60>
ffffffffc02059d0:	59f1                	li	s3,-4
ffffffffc02059d2:	bfa5                	j	ffffffffc020594a <sysfile_getdirentry+0x66>

ffffffffc02059d4 <sysfile_dup>:
ffffffffc02059d4:	f6eff06f          	j	ffffffffc0205142 <file_dup>

ffffffffc02059d8 <kernel_thread_entry>:
ffffffffc02059d8:	8526                	mv	a0,s1
ffffffffc02059da:	9402                	jalr	s0
ffffffffc02059dc:	626000ef          	jal	ra,ffffffffc0206002 <do_exit>

ffffffffc02059e0 <alloc_proc>:
ffffffffc02059e0:	1141                	addi	sp,sp,-16
ffffffffc02059e2:	15000513          	li	a0,336
ffffffffc02059e6:	e022                	sd	s0,0(sp)
ffffffffc02059e8:	e406                	sd	ra,8(sp)
ffffffffc02059ea:	da4fc0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02059ee:	842a                	mv	s0,a0
ffffffffc02059f0:	c141                	beqz	a0,ffffffffc0205a70 <alloc_proc+0x90>
ffffffffc02059f2:	57fd                	li	a5,-1
ffffffffc02059f4:	1782                	slli	a5,a5,0x20
ffffffffc02059f6:	e11c                	sd	a5,0(a0)
ffffffffc02059f8:	07000613          	li	a2,112
ffffffffc02059fc:	4581                	li	a1,0
ffffffffc02059fe:	00052423          	sw	zero,8(a0)
ffffffffc0205a02:	00053823          	sd	zero,16(a0)
ffffffffc0205a06:	00053c23          	sd	zero,24(a0)
ffffffffc0205a0a:	02053023          	sd	zero,32(a0)
ffffffffc0205a0e:	02053423          	sd	zero,40(a0)
ffffffffc0205a12:	03050513          	addi	a0,a0,48
ffffffffc0205a16:	121050ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0205a1a:	00091797          	auipc	a5,0x91
ffffffffc0205a1e:	e767b783          	ld	a5,-394(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0205a22:	f45c                	sd	a5,168(s0)
ffffffffc0205a24:	0a043023          	sd	zero,160(s0)
ffffffffc0205a28:	0a042823          	sw	zero,176(s0)
ffffffffc0205a2c:	463d                	li	a2,15
ffffffffc0205a2e:	4581                	li	a1,0
ffffffffc0205a30:	0b440513          	addi	a0,s0,180
ffffffffc0205a34:	103050ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0205a38:	11040793          	addi	a5,s0,272
ffffffffc0205a3c:	0e042623          	sw	zero,236(s0)
ffffffffc0205a40:	0e043c23          	sd	zero,248(s0)
ffffffffc0205a44:	10043023          	sd	zero,256(s0)
ffffffffc0205a48:	0e043823          	sd	zero,240(s0)
ffffffffc0205a4c:	10043423          	sd	zero,264(s0)
ffffffffc0205a50:	10f43c23          	sd	a5,280(s0)
ffffffffc0205a54:	10f43823          	sd	a5,272(s0)
ffffffffc0205a58:	12042023          	sw	zero,288(s0)
ffffffffc0205a5c:	12043423          	sd	zero,296(s0)
ffffffffc0205a60:	12043823          	sd	zero,304(s0)
ffffffffc0205a64:	12043c23          	sd	zero,312(s0)
ffffffffc0205a68:	14043023          	sd	zero,320(s0)
ffffffffc0205a6c:	14043423          	sd	zero,328(s0)
ffffffffc0205a70:	60a2                	ld	ra,8(sp)
ffffffffc0205a72:	8522                	mv	a0,s0
ffffffffc0205a74:	6402                	ld	s0,0(sp)
ffffffffc0205a76:	0141                	addi	sp,sp,16
ffffffffc0205a78:	8082                	ret

ffffffffc0205a7a <forkret>:
ffffffffc0205a7a:	00091797          	auipc	a5,0x91
ffffffffc0205a7e:	e467b783          	ld	a5,-442(a5) # ffffffffc02968c0 <current>
ffffffffc0205a82:	73c8                	ld	a0,160(a5)
ffffffffc0205a84:	827fb06f          	j	ffffffffc02012aa <forkrets>

ffffffffc0205a88 <put_pgdir.isra.0>:
ffffffffc0205a88:	1141                	addi	sp,sp,-16
ffffffffc0205a8a:	e406                	sd	ra,8(sp)
ffffffffc0205a8c:	c02007b7          	lui	a5,0xc0200
ffffffffc0205a90:	02f56e63          	bltu	a0,a5,ffffffffc0205acc <put_pgdir.isra.0+0x44>
ffffffffc0205a94:	00091697          	auipc	a3,0x91
ffffffffc0205a98:	e246b683          	ld	a3,-476(a3) # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205a9c:	8d15                	sub	a0,a0,a3
ffffffffc0205a9e:	8131                	srli	a0,a0,0xc
ffffffffc0205aa0:	00091797          	auipc	a5,0x91
ffffffffc0205aa4:	e007b783          	ld	a5,-512(a5) # ffffffffc02968a0 <npage>
ffffffffc0205aa8:	02f57f63          	bgeu	a0,a5,ffffffffc0205ae6 <put_pgdir.isra.0+0x5e>
ffffffffc0205aac:	0000a697          	auipc	a3,0xa
ffffffffc0205ab0:	a546b683          	ld	a3,-1452(a3) # ffffffffc020f500 <nbase>
ffffffffc0205ab4:	60a2                	ld	ra,8(sp)
ffffffffc0205ab6:	8d15                	sub	a0,a0,a3
ffffffffc0205ab8:	00091797          	auipc	a5,0x91
ffffffffc0205abc:	df07b783          	ld	a5,-528(a5) # ffffffffc02968a8 <pages>
ffffffffc0205ac0:	051a                	slli	a0,a0,0x6
ffffffffc0205ac2:	4585                	li	a1,1
ffffffffc0205ac4:	953e                	add	a0,a0,a5
ffffffffc0205ac6:	0141                	addi	sp,sp,16
ffffffffc0205ac8:	ee2fc06f          	j	ffffffffc02021aa <free_pages>
ffffffffc0205acc:	86aa                	mv	a3,a0
ffffffffc0205ace:	00007617          	auipc	a2,0x7
ffffffffc0205ad2:	91260613          	addi	a2,a2,-1774 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0205ad6:	07700593          	li	a1,119
ffffffffc0205ada:	00007517          	auipc	a0,0x7
ffffffffc0205ade:	88650513          	addi	a0,a0,-1914 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0205ae2:	9bdfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205ae6:	00007617          	auipc	a2,0x7
ffffffffc0205aea:	92260613          	addi	a2,a2,-1758 # ffffffffc020c408 <default_pmm_manager+0x108>
ffffffffc0205aee:	06900593          	li	a1,105
ffffffffc0205af2:	00007517          	auipc	a0,0x7
ffffffffc0205af6:	86e50513          	addi	a0,a0,-1938 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0205afa:	9a5fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205afe <proc_run>:
ffffffffc0205afe:	7179                	addi	sp,sp,-48
ffffffffc0205b00:	ec4a                	sd	s2,24(sp)
ffffffffc0205b02:	00091917          	auipc	s2,0x91
ffffffffc0205b06:	dbe90913          	addi	s2,s2,-578 # ffffffffc02968c0 <current>
ffffffffc0205b0a:	f026                	sd	s1,32(sp)
ffffffffc0205b0c:	00093483          	ld	s1,0(s2)
ffffffffc0205b10:	f406                	sd	ra,40(sp)
ffffffffc0205b12:	e84e                	sd	s3,16(sp)
ffffffffc0205b14:	02a48a63          	beq	s1,a0,ffffffffc0205b48 <proc_run+0x4a>
ffffffffc0205b18:	100027f3          	csrr	a5,sstatus
ffffffffc0205b1c:	8b89                	andi	a5,a5,2
ffffffffc0205b1e:	4981                	li	s3,0
ffffffffc0205b20:	e3a9                	bnez	a5,ffffffffc0205b62 <proc_run+0x64>
ffffffffc0205b22:	00a93023          	sd	a0,0(s2)
ffffffffc0205b26:	12000073          	sfence.vma
ffffffffc0205b2a:	755c                	ld	a5,168(a0)
ffffffffc0205b2c:	577d                	li	a4,-1
ffffffffc0205b2e:	177e                	slli	a4,a4,0x3f
ffffffffc0205b30:	83b1                	srli	a5,a5,0xc
ffffffffc0205b32:	8fd9                	or	a5,a5,a4
ffffffffc0205b34:	18079073          	csrw	satp,a5
ffffffffc0205b38:	03050593          	addi	a1,a0,48
ffffffffc0205b3c:	03048513          	addi	a0,s1,48
ffffffffc0205b40:	436010ef          	jal	ra,ffffffffc0206f76 <switch_to>
ffffffffc0205b44:	00099863          	bnez	s3,ffffffffc0205b54 <proc_run+0x56>
ffffffffc0205b48:	70a2                	ld	ra,40(sp)
ffffffffc0205b4a:	7482                	ld	s1,32(sp)
ffffffffc0205b4c:	6962                	ld	s2,24(sp)
ffffffffc0205b4e:	69c2                	ld	s3,16(sp)
ffffffffc0205b50:	6145                	addi	sp,sp,48
ffffffffc0205b52:	8082                	ret
ffffffffc0205b54:	70a2                	ld	ra,40(sp)
ffffffffc0205b56:	7482                	ld	s1,32(sp)
ffffffffc0205b58:	6962                	ld	s2,24(sp)
ffffffffc0205b5a:	69c2                	ld	s3,16(sp)
ffffffffc0205b5c:	6145                	addi	sp,sp,48
ffffffffc0205b5e:	90efb06f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0205b62:	e42a                	sd	a0,8(sp)
ffffffffc0205b64:	90efb0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205b68:	6522                	ld	a0,8(sp)
ffffffffc0205b6a:	4985                	li	s3,1
ffffffffc0205b6c:	bf5d                	j	ffffffffc0205b22 <proc_run+0x24>

ffffffffc0205b6e <do_fork>:
ffffffffc0205b6e:	7119                	addi	sp,sp,-128
ffffffffc0205b70:	e8d2                	sd	s4,80(sp)
ffffffffc0205b72:	00091a17          	auipc	s4,0x91
ffffffffc0205b76:	d66a0a13          	addi	s4,s4,-666 # ffffffffc02968d8 <nr_process>
ffffffffc0205b7a:	000a2703          	lw	a4,0(s4)
ffffffffc0205b7e:	fc86                	sd	ra,120(sp)
ffffffffc0205b80:	f8a2                	sd	s0,112(sp)
ffffffffc0205b82:	f4a6                	sd	s1,104(sp)
ffffffffc0205b84:	f0ca                	sd	s2,96(sp)
ffffffffc0205b86:	ecce                	sd	s3,88(sp)
ffffffffc0205b88:	e4d6                	sd	s5,72(sp)
ffffffffc0205b8a:	e0da                	sd	s6,64(sp)
ffffffffc0205b8c:	fc5e                	sd	s7,56(sp)
ffffffffc0205b8e:	f862                	sd	s8,48(sp)
ffffffffc0205b90:	f466                	sd	s9,40(sp)
ffffffffc0205b92:	f06a                	sd	s10,32(sp)
ffffffffc0205b94:	ec6e                	sd	s11,24(sp)
ffffffffc0205b96:	6785                	lui	a5,0x1
ffffffffc0205b98:	36f75063          	bge	a4,a5,ffffffffc0205ef8 <do_fork+0x38a>
ffffffffc0205b9c:	00091997          	auipc	s3,0x91
ffffffffc0205ba0:	d2498993          	addi	s3,s3,-732 # ffffffffc02968c0 <current>
ffffffffc0205ba4:	0009b783          	ld	a5,0(s3)
ffffffffc0205ba8:	0ec7a783          	lw	a5,236(a5) # 10ec <_binary_bin_swap_img_size-0x6c14>
ffffffffc0205bac:	3c079b63          	bnez	a5,ffffffffc0205f82 <do_fork+0x414>
ffffffffc0205bb0:	892a                	mv	s2,a0
ffffffffc0205bb2:	8cae                	mv	s9,a1
ffffffffc0205bb4:	8432                	mv	s0,a2
ffffffffc0205bb6:	e2bff0ef          	jal	ra,ffffffffc02059e0 <alloc_proc>
ffffffffc0205bba:	84aa                	mv	s1,a0
ffffffffc0205bbc:	28050b63          	beqz	a0,ffffffffc0205e52 <do_fork+0x2e4>
ffffffffc0205bc0:	0009b783          	ld	a5,0(s3)
ffffffffc0205bc4:	4509                	li	a0,2
ffffffffc0205bc6:	f09c                	sd	a5,32(s1)
ffffffffc0205bc8:	da4fc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205bcc:	28050063          	beqz	a0,ffffffffc0205e4c <do_fork+0x2de>
ffffffffc0205bd0:	00091b97          	auipc	s7,0x91
ffffffffc0205bd4:	cd8b8b93          	addi	s7,s7,-808 # ffffffffc02968a8 <pages>
ffffffffc0205bd8:	000bb683          	ld	a3,0(s7)
ffffffffc0205bdc:	00091c17          	auipc	s8,0x91
ffffffffc0205be0:	cc4c0c13          	addi	s8,s8,-828 # ffffffffc02968a0 <npage>
ffffffffc0205be4:	0000ab17          	auipc	s6,0xa
ffffffffc0205be8:	91cb3b03          	ld	s6,-1764(s6) # ffffffffc020f500 <nbase>
ffffffffc0205bec:	40d506b3          	sub	a3,a0,a3
ffffffffc0205bf0:	8699                	srai	a3,a3,0x6
ffffffffc0205bf2:	5d7d                	li	s10,-1
ffffffffc0205bf4:	000c3783          	ld	a5,0(s8)
ffffffffc0205bf8:	96da                	add	a3,a3,s6
ffffffffc0205bfa:	00cd5d13          	srli	s10,s10,0xc
ffffffffc0205bfe:	01a6f733          	and	a4,a3,s10
ffffffffc0205c02:	06b2                	slli	a3,a3,0xc
ffffffffc0205c04:	38f77b63          	bgeu	a4,a5,ffffffffc0205f9a <do_fork+0x42c>
ffffffffc0205c08:	0009b783          	ld	a5,0(s3)
ffffffffc0205c0c:	00091a97          	auipc	s5,0x91
ffffffffc0205c10:	caca8a93          	addi	s5,s5,-852 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0205c14:	000ab703          	ld	a4,0(s5)
ffffffffc0205c18:	0287bd83          	ld	s11,40(a5)
ffffffffc0205c1c:	96ba                	add	a3,a3,a4
ffffffffc0205c1e:	e894                	sd	a3,16(s1)
ffffffffc0205c20:	020d8863          	beqz	s11,ffffffffc0205c50 <do_fork+0xe2>
ffffffffc0205c24:	10097713          	andi	a4,s2,256
ffffffffc0205c28:	22070763          	beqz	a4,ffffffffc0205e56 <do_fork+0x2e8>
ffffffffc0205c2c:	030da683          	lw	a3,48(s11)
ffffffffc0205c30:	018db703          	ld	a4,24(s11)
ffffffffc0205c34:	c0200637          	lui	a2,0xc0200
ffffffffc0205c38:	2685                	addiw	a3,a3,1
ffffffffc0205c3a:	02dda823          	sw	a3,48(s11)
ffffffffc0205c3e:	03b4b423          	sd	s11,40(s1)
ffffffffc0205c42:	2cc76b63          	bltu	a4,a2,ffffffffc0205f18 <do_fork+0x3aa>
ffffffffc0205c46:	000ab783          	ld	a5,0(s5)
ffffffffc0205c4a:	6894                	ld	a3,16(s1)
ffffffffc0205c4c:	8f1d                	sub	a4,a4,a5
ffffffffc0205c4e:	f4d8                	sd	a4,168(s1)
ffffffffc0205c50:	6789                	lui	a5,0x2
ffffffffc0205c52:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0205c56:	96be                	add	a3,a3,a5
ffffffffc0205c58:	f0d4                	sd	a3,160(s1)
ffffffffc0205c5a:	87b6                	mv	a5,a3
ffffffffc0205c5c:	12040813          	addi	a6,s0,288
ffffffffc0205c60:	6008                	ld	a0,0(s0)
ffffffffc0205c62:	640c                	ld	a1,8(s0)
ffffffffc0205c64:	6810                	ld	a2,16(s0)
ffffffffc0205c66:	6c18                	ld	a4,24(s0)
ffffffffc0205c68:	e388                	sd	a0,0(a5)
ffffffffc0205c6a:	e78c                	sd	a1,8(a5)
ffffffffc0205c6c:	eb90                	sd	a2,16(a5)
ffffffffc0205c6e:	ef98                	sd	a4,24(a5)
ffffffffc0205c70:	02040413          	addi	s0,s0,32
ffffffffc0205c74:	02078793          	addi	a5,a5,32
ffffffffc0205c78:	ff0414e3          	bne	s0,a6,ffffffffc0205c60 <do_fork+0xf2>
ffffffffc0205c7c:	0406b823          	sd	zero,80(a3)
ffffffffc0205c80:	160c8063          	beqz	s9,ffffffffc0205de0 <do_fork+0x272>
ffffffffc0205c84:	0196b823          	sd	s9,16(a3)
ffffffffc0205c88:	00000797          	auipc	a5,0x0
ffffffffc0205c8c:	df278793          	addi	a5,a5,-526 # ffffffffc0205a7a <forkret>
ffffffffc0205c90:	f89c                	sd	a5,48(s1)
ffffffffc0205c92:	fc94                	sd	a3,56(s1)
ffffffffc0205c94:	100027f3          	csrr	a5,sstatus
ffffffffc0205c98:	8b89                	andi	a5,a5,2
ffffffffc0205c9a:	4c81                	li	s9,0
ffffffffc0205c9c:	16079163          	bnez	a5,ffffffffc0205dfe <do_fork+0x290>
ffffffffc0205ca0:	0008b817          	auipc	a6,0x8b
ffffffffc0205ca4:	3b880813          	addi	a6,a6,952 # ffffffffc0291058 <last_pid.1>
ffffffffc0205ca8:	00082783          	lw	a5,0(a6)
ffffffffc0205cac:	6709                	lui	a4,0x2
ffffffffc0205cae:	0017851b          	addiw	a0,a5,1
ffffffffc0205cb2:	00a82023          	sw	a0,0(a6)
ffffffffc0205cb6:	0ae55e63          	bge	a0,a4,ffffffffc0205d72 <do_fork+0x204>
ffffffffc0205cba:	0008b317          	auipc	t1,0x8b
ffffffffc0205cbe:	3a230313          	addi	t1,t1,930 # ffffffffc029105c <next_safe.0>
ffffffffc0205cc2:	00032783          	lw	a5,0(t1)
ffffffffc0205cc6:	00090417          	auipc	s0,0x90
ffffffffc0205cca:	afa40413          	addi	s0,s0,-1286 # ffffffffc02957c0 <proc_list>
ffffffffc0205cce:	0af55a63          	bge	a0,a5,ffffffffc0205d82 <do_fork+0x214>
ffffffffc0205cd2:	c0c8                	sw	a0,4(s1)
ffffffffc0205cd4:	45a9                	li	a1,10
ffffffffc0205cd6:	2501                	sext.w	a0,a0
ffffffffc0205cd8:	12a050ef          	jal	ra,ffffffffc020ae02 <hash32>
ffffffffc0205cdc:	02051793          	slli	a5,a0,0x20
ffffffffc0205ce0:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0205ce4:	0008c797          	auipc	a5,0x8c
ffffffffc0205ce8:	adc78793          	addi	a5,a5,-1316 # ffffffffc02917c0 <hash_list>
ffffffffc0205cec:	953e                	add	a0,a0,a5
ffffffffc0205cee:	650c                	ld	a1,8(a0)
ffffffffc0205cf0:	7094                	ld	a3,32(s1)
ffffffffc0205cf2:	0d848793          	addi	a5,s1,216
ffffffffc0205cf6:	e19c                	sd	a5,0(a1)
ffffffffc0205cf8:	6410                	ld	a2,8(s0)
ffffffffc0205cfa:	e51c                	sd	a5,8(a0)
ffffffffc0205cfc:	7af8                	ld	a4,240(a3)
ffffffffc0205cfe:	0c848793          	addi	a5,s1,200
ffffffffc0205d02:	f0ec                	sd	a1,224(s1)
ffffffffc0205d04:	ece8                	sd	a0,216(s1)
ffffffffc0205d06:	e21c                	sd	a5,0(a2)
ffffffffc0205d08:	e41c                	sd	a5,8(s0)
ffffffffc0205d0a:	e8f0                	sd	a2,208(s1)
ffffffffc0205d0c:	e4e0                	sd	s0,200(s1)
ffffffffc0205d0e:	0e04bc23          	sd	zero,248(s1)
ffffffffc0205d12:	10e4b023          	sd	a4,256(s1)
ffffffffc0205d16:	c311                	beqz	a4,ffffffffc0205d1a <do_fork+0x1ac>
ffffffffc0205d18:	ff64                	sd	s1,248(a4)
ffffffffc0205d1a:	000a2783          	lw	a5,0(s4)
ffffffffc0205d1e:	fae4                	sd	s1,240(a3)
ffffffffc0205d20:	2785                	addiw	a5,a5,1
ffffffffc0205d22:	00fa2023          	sw	a5,0(s4)
ffffffffc0205d26:	1a0c9863          	bnez	s9,ffffffffc0205ed6 <do_fork+0x368>
ffffffffc0205d2a:	0009b783          	ld	a5,0(s3)
ffffffffc0205d2e:	1487b403          	ld	s0,328(a5)
ffffffffc0205d32:	20040063          	beqz	s0,ffffffffc0205f32 <do_fork+0x3c4>
ffffffffc0205d36:	00b95913          	srli	s2,s2,0xb
ffffffffc0205d3a:	00197913          	andi	s2,s2,1
ffffffffc0205d3e:	0c090463          	beqz	s2,ffffffffc0205e06 <do_fork+0x298>
ffffffffc0205d42:	481c                	lw	a5,16(s0)
ffffffffc0205d44:	8526                	mv	a0,s1
ffffffffc0205d46:	2785                	addiw	a5,a5,1
ffffffffc0205d48:	c81c                	sw	a5,16(s0)
ffffffffc0205d4a:	1484b423          	sd	s0,328(s1)
ffffffffc0205d4e:	3cc010ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc0205d52:	40c8                	lw	a0,4(s1)
ffffffffc0205d54:	70e6                	ld	ra,120(sp)
ffffffffc0205d56:	7446                	ld	s0,112(sp)
ffffffffc0205d58:	74a6                	ld	s1,104(sp)
ffffffffc0205d5a:	7906                	ld	s2,96(sp)
ffffffffc0205d5c:	69e6                	ld	s3,88(sp)
ffffffffc0205d5e:	6a46                	ld	s4,80(sp)
ffffffffc0205d60:	6aa6                	ld	s5,72(sp)
ffffffffc0205d62:	6b06                	ld	s6,64(sp)
ffffffffc0205d64:	7be2                	ld	s7,56(sp)
ffffffffc0205d66:	7c42                	ld	s8,48(sp)
ffffffffc0205d68:	7ca2                	ld	s9,40(sp)
ffffffffc0205d6a:	7d02                	ld	s10,32(sp)
ffffffffc0205d6c:	6de2                	ld	s11,24(sp)
ffffffffc0205d6e:	6109                	addi	sp,sp,128
ffffffffc0205d70:	8082                	ret
ffffffffc0205d72:	4785                	li	a5,1
ffffffffc0205d74:	00f82023          	sw	a5,0(a6)
ffffffffc0205d78:	4505                	li	a0,1
ffffffffc0205d7a:	0008b317          	auipc	t1,0x8b
ffffffffc0205d7e:	2e230313          	addi	t1,t1,738 # ffffffffc029105c <next_safe.0>
ffffffffc0205d82:	00090417          	auipc	s0,0x90
ffffffffc0205d86:	a3e40413          	addi	s0,s0,-1474 # ffffffffc02957c0 <proc_list>
ffffffffc0205d8a:	00843e03          	ld	t3,8(s0)
ffffffffc0205d8e:	6789                	lui	a5,0x2
ffffffffc0205d90:	00f32023          	sw	a5,0(t1)
ffffffffc0205d94:	86aa                	mv	a3,a0
ffffffffc0205d96:	4581                	li	a1,0
ffffffffc0205d98:	6e89                	lui	t4,0x2
ffffffffc0205d9a:	148e0a63          	beq	t3,s0,ffffffffc0205eee <do_fork+0x380>
ffffffffc0205d9e:	88ae                	mv	a7,a1
ffffffffc0205da0:	87f2                	mv	a5,t3
ffffffffc0205da2:	6609                	lui	a2,0x2
ffffffffc0205da4:	a811                	j	ffffffffc0205db8 <do_fork+0x24a>
ffffffffc0205da6:	00e6d663          	bge	a3,a4,ffffffffc0205db2 <do_fork+0x244>
ffffffffc0205daa:	00c75463          	bge	a4,a2,ffffffffc0205db2 <do_fork+0x244>
ffffffffc0205dae:	863a                	mv	a2,a4
ffffffffc0205db0:	4885                	li	a7,1
ffffffffc0205db2:	679c                	ld	a5,8(a5)
ffffffffc0205db4:	00878d63          	beq	a5,s0,ffffffffc0205dce <do_fork+0x260>
ffffffffc0205db8:	f3c7a703          	lw	a4,-196(a5) # 1f3c <_binary_bin_swap_img_size-0x5dc4>
ffffffffc0205dbc:	fed715e3          	bne	a4,a3,ffffffffc0205da6 <do_fork+0x238>
ffffffffc0205dc0:	2685                	addiw	a3,a3,1
ffffffffc0205dc2:	10c6dd63          	bge	a3,a2,ffffffffc0205edc <do_fork+0x36e>
ffffffffc0205dc6:	679c                	ld	a5,8(a5)
ffffffffc0205dc8:	4585                	li	a1,1
ffffffffc0205dca:	fe8797e3          	bne	a5,s0,ffffffffc0205db8 <do_fork+0x24a>
ffffffffc0205dce:	c581                	beqz	a1,ffffffffc0205dd6 <do_fork+0x268>
ffffffffc0205dd0:	00d82023          	sw	a3,0(a6)
ffffffffc0205dd4:	8536                	mv	a0,a3
ffffffffc0205dd6:	ee088ee3          	beqz	a7,ffffffffc0205cd2 <do_fork+0x164>
ffffffffc0205dda:	00c32023          	sw	a2,0(t1)
ffffffffc0205dde:	bdd5                	j	ffffffffc0205cd2 <do_fork+0x164>
ffffffffc0205de0:	8cb6                	mv	s9,a3
ffffffffc0205de2:	0196b823          	sd	s9,16(a3)
ffffffffc0205de6:	00000797          	auipc	a5,0x0
ffffffffc0205dea:	c9478793          	addi	a5,a5,-876 # ffffffffc0205a7a <forkret>
ffffffffc0205dee:	f89c                	sd	a5,48(s1)
ffffffffc0205df0:	fc94                	sd	a3,56(s1)
ffffffffc0205df2:	100027f3          	csrr	a5,sstatus
ffffffffc0205df6:	8b89                	andi	a5,a5,2
ffffffffc0205df8:	4c81                	li	s9,0
ffffffffc0205dfa:	ea0783e3          	beqz	a5,ffffffffc0205ca0 <do_fork+0x132>
ffffffffc0205dfe:	e75fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0205e02:	4c85                	li	s9,1
ffffffffc0205e04:	bd71                	j	ffffffffc0205ca0 <do_fork+0x132>
ffffffffc0205e06:	bd4ff0ef          	jal	ra,ffffffffc02051da <files_create>
ffffffffc0205e0a:	892a                	mv	s2,a0
ffffffffc0205e0c:	c909                	beqz	a0,ffffffffc0205e1e <do_fork+0x2b0>
ffffffffc0205e0e:	85a2                	mv	a1,s0
ffffffffc0205e10:	d02ff0ef          	jal	ra,ffffffffc0205312 <dup_files>
ffffffffc0205e14:	844a                	mv	s0,s2
ffffffffc0205e16:	d515                	beqz	a0,ffffffffc0205d42 <do_fork+0x1d4>
ffffffffc0205e18:	854a                	mv	a0,s2
ffffffffc0205e1a:	bf6ff0ef          	jal	ra,ffffffffc0205210 <files_destroy>
ffffffffc0205e1e:	6894                	ld	a3,16(s1)
ffffffffc0205e20:	c02007b7          	lui	a5,0xc0200
ffffffffc0205e24:	14f6e363          	bltu	a3,a5,ffffffffc0205f6a <do_fork+0x3fc>
ffffffffc0205e28:	000ab783          	ld	a5,0(s5)
ffffffffc0205e2c:	000c3703          	ld	a4,0(s8)
ffffffffc0205e30:	40f687b3          	sub	a5,a3,a5
ffffffffc0205e34:	83b1                	srli	a5,a5,0xc
ffffffffc0205e36:	10e7fe63          	bgeu	a5,a4,ffffffffc0205f52 <do_fork+0x3e4>
ffffffffc0205e3a:	000bb503          	ld	a0,0(s7)
ffffffffc0205e3e:	416787b3          	sub	a5,a5,s6
ffffffffc0205e42:	079a                	slli	a5,a5,0x6
ffffffffc0205e44:	4589                	li	a1,2
ffffffffc0205e46:	953e                	add	a0,a0,a5
ffffffffc0205e48:	b62fc0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc0205e4c:	8526                	mv	a0,s1
ffffffffc0205e4e:	9f0fc0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0205e52:	5571                	li	a0,-4
ffffffffc0205e54:	b701                	j	ffffffffc0205d54 <do_fork+0x1e6>
ffffffffc0205e56:	dbffd0ef          	jal	ra,ffffffffc0203c14 <mm_create>
ffffffffc0205e5a:	e02a                	sd	a0,0(sp)
ffffffffc0205e5c:	d169                	beqz	a0,ffffffffc0205e1e <do_fork+0x2b0>
ffffffffc0205e5e:	4505                	li	a0,1
ffffffffc0205e60:	b0cfc0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc0205e64:	c149                	beqz	a0,ffffffffc0205ee6 <do_fork+0x378>
ffffffffc0205e66:	000bb683          	ld	a3,0(s7)
ffffffffc0205e6a:	000c3703          	ld	a4,0(s8)
ffffffffc0205e6e:	40d506b3          	sub	a3,a0,a3
ffffffffc0205e72:	8699                	srai	a3,a3,0x6
ffffffffc0205e74:	96da                	add	a3,a3,s6
ffffffffc0205e76:	01a6fd33          	and	s10,a3,s10
ffffffffc0205e7a:	06b2                	slli	a3,a3,0xc
ffffffffc0205e7c:	10ed7f63          	bgeu	s10,a4,ffffffffc0205f9a <do_fork+0x42c>
ffffffffc0205e80:	000abd03          	ld	s10,0(s5)
ffffffffc0205e84:	6605                	lui	a2,0x1
ffffffffc0205e86:	00091597          	auipc	a1,0x91
ffffffffc0205e8a:	a125b583          	ld	a1,-1518(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0205e8e:	9d36                	add	s10,s10,a3
ffffffffc0205e90:	856a                	mv	a0,s10
ffffffffc0205e92:	4f6050ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0205e96:	6782                	ld	a5,0(sp)
ffffffffc0205e98:	038d8713          	addi	a4,s11,56
ffffffffc0205e9c:	853a                	mv	a0,a4
ffffffffc0205e9e:	01a7bc23          	sd	s10,24(a5) # ffffffffc0200018 <kern_entry+0x18>
ffffffffc0205ea2:	e43a                	sd	a4,8(sp)
ffffffffc0205ea4:	eccfe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0205ea8:	0009b683          	ld	a3,0(s3)
ffffffffc0205eac:	6722                	ld	a4,8(sp)
ffffffffc0205eae:	c681                	beqz	a3,ffffffffc0205eb6 <do_fork+0x348>
ffffffffc0205eb0:	42d4                	lw	a3,4(a3)
ffffffffc0205eb2:	04dda823          	sw	a3,80(s11)
ffffffffc0205eb6:	6502                	ld	a0,0(sp)
ffffffffc0205eb8:	85ee                	mv	a1,s11
ffffffffc0205eba:	e43a                	sd	a4,8(sp)
ffffffffc0205ebc:	fa9fd0ef          	jal	ra,ffffffffc0203e64 <dup_mmap>
ffffffffc0205ec0:	6722                	ld	a4,8(sp)
ffffffffc0205ec2:	8d2a                	mv	s10,a0
ffffffffc0205ec4:	853a                	mv	a0,a4
ffffffffc0205ec6:	ea6fe0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0205eca:	040da823          	sw	zero,80(s11)
ffffffffc0205ece:	020d1a63          	bnez	s10,ffffffffc0205f02 <do_fork+0x394>
ffffffffc0205ed2:	6d82                	ld	s11,0(sp)
ffffffffc0205ed4:	bba1                	j	ffffffffc0205c2c <do_fork+0xbe>
ffffffffc0205ed6:	d97fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0205eda:	bd81                	j	ffffffffc0205d2a <do_fork+0x1bc>
ffffffffc0205edc:	01d6c363          	blt	a3,t4,ffffffffc0205ee2 <do_fork+0x374>
ffffffffc0205ee0:	4685                	li	a3,1
ffffffffc0205ee2:	4585                	li	a1,1
ffffffffc0205ee4:	bd5d                	j	ffffffffc0205d9a <do_fork+0x22c>
ffffffffc0205ee6:	6502                	ld	a0,0(sp)
ffffffffc0205ee8:	e7bfd0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc0205eec:	bf0d                	j	ffffffffc0205e1e <do_fork+0x2b0>
ffffffffc0205eee:	c599                	beqz	a1,ffffffffc0205efc <do_fork+0x38e>
ffffffffc0205ef0:	00d82023          	sw	a3,0(a6)
ffffffffc0205ef4:	8536                	mv	a0,a3
ffffffffc0205ef6:	bbf1                	j	ffffffffc0205cd2 <do_fork+0x164>
ffffffffc0205ef8:	556d                	li	a0,-5
ffffffffc0205efa:	bda9                	j	ffffffffc0205d54 <do_fork+0x1e6>
ffffffffc0205efc:	00082503          	lw	a0,0(a6)
ffffffffc0205f00:	bbc9                	j	ffffffffc0205cd2 <do_fork+0x164>
ffffffffc0205f02:	6402                	ld	s0,0(sp)
ffffffffc0205f04:	8522                	mv	a0,s0
ffffffffc0205f06:	ff9fd0ef          	jal	ra,ffffffffc0203efe <exit_mmap>
ffffffffc0205f0a:	6c08                	ld	a0,24(s0)
ffffffffc0205f0c:	b7dff0ef          	jal	ra,ffffffffc0205a88 <put_pgdir.isra.0>
ffffffffc0205f10:	8522                	mv	a0,s0
ffffffffc0205f12:	e51fd0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc0205f16:	b721                	j	ffffffffc0205e1e <do_fork+0x2b0>
ffffffffc0205f18:	86ba                	mv	a3,a4
ffffffffc0205f1a:	00006617          	auipc	a2,0x6
ffffffffc0205f1e:	4c660613          	addi	a2,a2,1222 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0205f22:	1b300593          	li	a1,435
ffffffffc0205f26:	00007517          	auipc	a0,0x7
ffffffffc0205f2a:	41250513          	addi	a0,a0,1042 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0205f2e:	d70fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f32:	00007697          	auipc	a3,0x7
ffffffffc0205f36:	41e68693          	addi	a3,a3,1054 # ffffffffc020d350 <CSWTCH.79+0x138>
ffffffffc0205f3a:	00006617          	auipc	a2,0x6
ffffffffc0205f3e:	8de60613          	addi	a2,a2,-1826 # ffffffffc020b818 <commands+0x210>
ffffffffc0205f42:	1d300593          	li	a1,467
ffffffffc0205f46:	00007517          	auipc	a0,0x7
ffffffffc0205f4a:	3f250513          	addi	a0,a0,1010 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0205f4e:	d50fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f52:	00006617          	auipc	a2,0x6
ffffffffc0205f56:	4b660613          	addi	a2,a2,1206 # ffffffffc020c408 <default_pmm_manager+0x108>
ffffffffc0205f5a:	06900593          	li	a1,105
ffffffffc0205f5e:	00006517          	auipc	a0,0x6
ffffffffc0205f62:	40250513          	addi	a0,a0,1026 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0205f66:	d38fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f6a:	00006617          	auipc	a2,0x6
ffffffffc0205f6e:	47660613          	addi	a2,a2,1142 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0205f72:	07700593          	li	a1,119
ffffffffc0205f76:	00006517          	auipc	a0,0x6
ffffffffc0205f7a:	3ea50513          	addi	a0,a0,1002 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0205f7e:	d20fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f82:	00007617          	auipc	a2,0x7
ffffffffc0205f86:	38660613          	addi	a2,a2,902 # ffffffffc020d308 <CSWTCH.79+0xf0>
ffffffffc0205f8a:	23000593          	li	a1,560
ffffffffc0205f8e:	00007517          	auipc	a0,0x7
ffffffffc0205f92:	3aa50513          	addi	a0,a0,938 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0205f96:	d08fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0205f9a:	00006617          	auipc	a2,0x6
ffffffffc0205f9e:	39e60613          	addi	a2,a2,926 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0205fa2:	07100593          	li	a1,113
ffffffffc0205fa6:	00006517          	auipc	a0,0x6
ffffffffc0205faa:	3ba50513          	addi	a0,a0,954 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0205fae:	cf0fa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0205fb2 <kernel_thread>:
ffffffffc0205fb2:	7129                	addi	sp,sp,-320
ffffffffc0205fb4:	fa22                	sd	s0,304(sp)
ffffffffc0205fb6:	f626                	sd	s1,296(sp)
ffffffffc0205fb8:	f24a                	sd	s2,288(sp)
ffffffffc0205fba:	84ae                	mv	s1,a1
ffffffffc0205fbc:	892a                	mv	s2,a0
ffffffffc0205fbe:	8432                	mv	s0,a2
ffffffffc0205fc0:	4581                	li	a1,0
ffffffffc0205fc2:	12000613          	li	a2,288
ffffffffc0205fc6:	850a                	mv	a0,sp
ffffffffc0205fc8:	fe06                	sd	ra,312(sp)
ffffffffc0205fca:	36c050ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0205fce:	e0ca                	sd	s2,64(sp)
ffffffffc0205fd0:	e4a6                	sd	s1,72(sp)
ffffffffc0205fd2:	100027f3          	csrr	a5,sstatus
ffffffffc0205fd6:	edd7f793          	andi	a5,a5,-291
ffffffffc0205fda:	1207e793          	ori	a5,a5,288
ffffffffc0205fde:	e23e                	sd	a5,256(sp)
ffffffffc0205fe0:	860a                	mv	a2,sp
ffffffffc0205fe2:	10046513          	ori	a0,s0,256
ffffffffc0205fe6:	00000797          	auipc	a5,0x0
ffffffffc0205fea:	9f278793          	addi	a5,a5,-1550 # ffffffffc02059d8 <kernel_thread_entry>
ffffffffc0205fee:	4581                	li	a1,0
ffffffffc0205ff0:	e63e                	sd	a5,264(sp)
ffffffffc0205ff2:	b7dff0ef          	jal	ra,ffffffffc0205b6e <do_fork>
ffffffffc0205ff6:	70f2                	ld	ra,312(sp)
ffffffffc0205ff8:	7452                	ld	s0,304(sp)
ffffffffc0205ffa:	74b2                	ld	s1,296(sp)
ffffffffc0205ffc:	7912                	ld	s2,288(sp)
ffffffffc0205ffe:	6131                	addi	sp,sp,320
ffffffffc0206000:	8082                	ret

ffffffffc0206002 <do_exit>:
ffffffffc0206002:	7179                	addi	sp,sp,-48
ffffffffc0206004:	f022                	sd	s0,32(sp)
ffffffffc0206006:	00091417          	auipc	s0,0x91
ffffffffc020600a:	8ba40413          	addi	s0,s0,-1862 # ffffffffc02968c0 <current>
ffffffffc020600e:	601c                	ld	a5,0(s0)
ffffffffc0206010:	f406                	sd	ra,40(sp)
ffffffffc0206012:	ec26                	sd	s1,24(sp)
ffffffffc0206014:	e84a                	sd	s2,16(sp)
ffffffffc0206016:	e44e                	sd	s3,8(sp)
ffffffffc0206018:	e052                	sd	s4,0(sp)
ffffffffc020601a:	00091717          	auipc	a4,0x91
ffffffffc020601e:	8ae73703          	ld	a4,-1874(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0206022:	0ee78763          	beq	a5,a4,ffffffffc0206110 <do_exit+0x10e>
ffffffffc0206026:	00091497          	auipc	s1,0x91
ffffffffc020602a:	8aa48493          	addi	s1,s1,-1878 # ffffffffc02968d0 <initproc>
ffffffffc020602e:	6098                	ld	a4,0(s1)
ffffffffc0206030:	10e78763          	beq	a5,a4,ffffffffc020613e <do_exit+0x13c>
ffffffffc0206034:	0287b983          	ld	s3,40(a5)
ffffffffc0206038:	892a                	mv	s2,a0
ffffffffc020603a:	02098e63          	beqz	s3,ffffffffc0206076 <do_exit+0x74>
ffffffffc020603e:	00091797          	auipc	a5,0x91
ffffffffc0206042:	8527b783          	ld	a5,-1966(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc0206046:	577d                	li	a4,-1
ffffffffc0206048:	177e                	slli	a4,a4,0x3f
ffffffffc020604a:	83b1                	srli	a5,a5,0xc
ffffffffc020604c:	8fd9                	or	a5,a5,a4
ffffffffc020604e:	18079073          	csrw	satp,a5
ffffffffc0206052:	0309a783          	lw	a5,48(s3)
ffffffffc0206056:	fff7871b          	addiw	a4,a5,-1
ffffffffc020605a:	02e9a823          	sw	a4,48(s3)
ffffffffc020605e:	c769                	beqz	a4,ffffffffc0206128 <do_exit+0x126>
ffffffffc0206060:	601c                	ld	a5,0(s0)
ffffffffc0206062:	1487b503          	ld	a0,328(a5)
ffffffffc0206066:	0207b423          	sd	zero,40(a5)
ffffffffc020606a:	c511                	beqz	a0,ffffffffc0206076 <do_exit+0x74>
ffffffffc020606c:	491c                	lw	a5,16(a0)
ffffffffc020606e:	fff7871b          	addiw	a4,a5,-1
ffffffffc0206072:	c918                	sw	a4,16(a0)
ffffffffc0206074:	cb59                	beqz	a4,ffffffffc020610a <do_exit+0x108>
ffffffffc0206076:	601c                	ld	a5,0(s0)
ffffffffc0206078:	470d                	li	a4,3
ffffffffc020607a:	c398                	sw	a4,0(a5)
ffffffffc020607c:	0f27a423          	sw	s2,232(a5)
ffffffffc0206080:	100027f3          	csrr	a5,sstatus
ffffffffc0206084:	8b89                	andi	a5,a5,2
ffffffffc0206086:	4a01                	li	s4,0
ffffffffc0206088:	e7f9                	bnez	a5,ffffffffc0206156 <do_exit+0x154>
ffffffffc020608a:	6018                	ld	a4,0(s0)
ffffffffc020608c:	800007b7          	lui	a5,0x80000
ffffffffc0206090:	0785                	addi	a5,a5,1
ffffffffc0206092:	7308                	ld	a0,32(a4)
ffffffffc0206094:	0ec52703          	lw	a4,236(a0)
ffffffffc0206098:	0cf70363          	beq	a4,a5,ffffffffc020615e <do_exit+0x15c>
ffffffffc020609c:	6018                	ld	a4,0(s0)
ffffffffc020609e:	7b7c                	ld	a5,240(a4)
ffffffffc02060a0:	c3a1                	beqz	a5,ffffffffc02060e0 <do_exit+0xde>
ffffffffc02060a2:	800009b7          	lui	s3,0x80000
ffffffffc02060a6:	490d                	li	s2,3
ffffffffc02060a8:	0985                	addi	s3,s3,1
ffffffffc02060aa:	a021                	j	ffffffffc02060b2 <do_exit+0xb0>
ffffffffc02060ac:	6018                	ld	a4,0(s0)
ffffffffc02060ae:	7b7c                	ld	a5,240(a4)
ffffffffc02060b0:	cb85                	beqz	a5,ffffffffc02060e0 <do_exit+0xde>
ffffffffc02060b2:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <_binary_bin_sfs_img_size+0xffffffff7ff8ae00>
ffffffffc02060b6:	6088                	ld	a0,0(s1)
ffffffffc02060b8:	fb74                	sd	a3,240(a4)
ffffffffc02060ba:	7978                	ld	a4,240(a0)
ffffffffc02060bc:	0e07bc23          	sd	zero,248(a5)
ffffffffc02060c0:	10e7b023          	sd	a4,256(a5)
ffffffffc02060c4:	c311                	beqz	a4,ffffffffc02060c8 <do_exit+0xc6>
ffffffffc02060c6:	ff7c                	sd	a5,248(a4)
ffffffffc02060c8:	4398                	lw	a4,0(a5)
ffffffffc02060ca:	f388                	sd	a0,32(a5)
ffffffffc02060cc:	f97c                	sd	a5,240(a0)
ffffffffc02060ce:	fd271fe3          	bne	a4,s2,ffffffffc02060ac <do_exit+0xaa>
ffffffffc02060d2:	0ec52783          	lw	a5,236(a0)
ffffffffc02060d6:	fd379be3          	bne	a5,s3,ffffffffc02060ac <do_exit+0xaa>
ffffffffc02060da:	040010ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc02060de:	b7f9                	j	ffffffffc02060ac <do_exit+0xaa>
ffffffffc02060e0:	020a1263          	bnez	s4,ffffffffc0206104 <do_exit+0x102>
ffffffffc02060e4:	0e8010ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc02060e8:	601c                	ld	a5,0(s0)
ffffffffc02060ea:	00007617          	auipc	a2,0x7
ffffffffc02060ee:	29e60613          	addi	a2,a2,670 # ffffffffc020d388 <CSWTCH.79+0x170>
ffffffffc02060f2:	29b00593          	li	a1,667
ffffffffc02060f6:	43d4                	lw	a3,4(a5)
ffffffffc02060f8:	00007517          	auipc	a0,0x7
ffffffffc02060fc:	24050513          	addi	a0,a0,576 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206100:	b9efa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206104:	b69fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0206108:	bff1                	j	ffffffffc02060e4 <do_exit+0xe2>
ffffffffc020610a:	906ff0ef          	jal	ra,ffffffffc0205210 <files_destroy>
ffffffffc020610e:	b7a5                	j	ffffffffc0206076 <do_exit+0x74>
ffffffffc0206110:	00007617          	auipc	a2,0x7
ffffffffc0206114:	25860613          	addi	a2,a2,600 # ffffffffc020d368 <CSWTCH.79+0x150>
ffffffffc0206118:	26600593          	li	a1,614
ffffffffc020611c:	00007517          	auipc	a0,0x7
ffffffffc0206120:	21c50513          	addi	a0,a0,540 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206124:	b7afa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206128:	854e                	mv	a0,s3
ffffffffc020612a:	dd5fd0ef          	jal	ra,ffffffffc0203efe <exit_mmap>
ffffffffc020612e:	0189b503          	ld	a0,24(s3) # ffffffff80000018 <_binary_bin_sfs_img_size+0xffffffff7ff8ad18>
ffffffffc0206132:	957ff0ef          	jal	ra,ffffffffc0205a88 <put_pgdir.isra.0>
ffffffffc0206136:	854e                	mv	a0,s3
ffffffffc0206138:	c2bfd0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc020613c:	b715                	j	ffffffffc0206060 <do_exit+0x5e>
ffffffffc020613e:	00007617          	auipc	a2,0x7
ffffffffc0206142:	23a60613          	addi	a2,a2,570 # ffffffffc020d378 <CSWTCH.79+0x160>
ffffffffc0206146:	26a00593          	li	a1,618
ffffffffc020614a:	00007517          	auipc	a0,0x7
ffffffffc020614e:	1ee50513          	addi	a0,a0,494 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206152:	b4cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206156:	b1dfa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc020615a:	4a05                	li	s4,1
ffffffffc020615c:	b73d                	j	ffffffffc020608a <do_exit+0x88>
ffffffffc020615e:	7bd000ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc0206162:	bf2d                	j	ffffffffc020609c <do_exit+0x9a>

ffffffffc0206164 <do_wait.part.0>:
ffffffffc0206164:	715d                	addi	sp,sp,-80
ffffffffc0206166:	f84a                	sd	s2,48(sp)
ffffffffc0206168:	f44e                	sd	s3,40(sp)
ffffffffc020616a:	80000937          	lui	s2,0x80000
ffffffffc020616e:	6989                	lui	s3,0x2
ffffffffc0206170:	fc26                	sd	s1,56(sp)
ffffffffc0206172:	f052                	sd	s4,32(sp)
ffffffffc0206174:	ec56                	sd	s5,24(sp)
ffffffffc0206176:	e85a                	sd	s6,16(sp)
ffffffffc0206178:	e45e                	sd	s7,8(sp)
ffffffffc020617a:	e486                	sd	ra,72(sp)
ffffffffc020617c:	e0a2                	sd	s0,64(sp)
ffffffffc020617e:	84aa                	mv	s1,a0
ffffffffc0206180:	8a2e                	mv	s4,a1
ffffffffc0206182:	00090b97          	auipc	s7,0x90
ffffffffc0206186:	73eb8b93          	addi	s7,s7,1854 # ffffffffc02968c0 <current>
ffffffffc020618a:	00050b1b          	sext.w	s6,a0
ffffffffc020618e:	fff50a9b          	addiw	s5,a0,-1
ffffffffc0206192:	19f9                	addi	s3,s3,-2
ffffffffc0206194:	0905                	addi	s2,s2,1
ffffffffc0206196:	ccbd                	beqz	s1,ffffffffc0206214 <do_wait.part.0+0xb0>
ffffffffc0206198:	0359e863          	bltu	s3,s5,ffffffffc02061c8 <do_wait.part.0+0x64>
ffffffffc020619c:	45a9                	li	a1,10
ffffffffc020619e:	855a                	mv	a0,s6
ffffffffc02061a0:	463040ef          	jal	ra,ffffffffc020ae02 <hash32>
ffffffffc02061a4:	02051793          	slli	a5,a0,0x20
ffffffffc02061a8:	01c7d513          	srli	a0,a5,0x1c
ffffffffc02061ac:	0008b797          	auipc	a5,0x8b
ffffffffc02061b0:	61478793          	addi	a5,a5,1556 # ffffffffc02917c0 <hash_list>
ffffffffc02061b4:	953e                	add	a0,a0,a5
ffffffffc02061b6:	842a                	mv	s0,a0
ffffffffc02061b8:	a029                	j	ffffffffc02061c2 <do_wait.part.0+0x5e>
ffffffffc02061ba:	f2c42783          	lw	a5,-212(s0)
ffffffffc02061be:	02978163          	beq	a5,s1,ffffffffc02061e0 <do_wait.part.0+0x7c>
ffffffffc02061c2:	6400                	ld	s0,8(s0)
ffffffffc02061c4:	fe851be3          	bne	a0,s0,ffffffffc02061ba <do_wait.part.0+0x56>
ffffffffc02061c8:	5579                	li	a0,-2
ffffffffc02061ca:	60a6                	ld	ra,72(sp)
ffffffffc02061cc:	6406                	ld	s0,64(sp)
ffffffffc02061ce:	74e2                	ld	s1,56(sp)
ffffffffc02061d0:	7942                	ld	s2,48(sp)
ffffffffc02061d2:	79a2                	ld	s3,40(sp)
ffffffffc02061d4:	7a02                	ld	s4,32(sp)
ffffffffc02061d6:	6ae2                	ld	s5,24(sp)
ffffffffc02061d8:	6b42                	ld	s6,16(sp)
ffffffffc02061da:	6ba2                	ld	s7,8(sp)
ffffffffc02061dc:	6161                	addi	sp,sp,80
ffffffffc02061de:	8082                	ret
ffffffffc02061e0:	000bb683          	ld	a3,0(s7)
ffffffffc02061e4:	f4843783          	ld	a5,-184(s0)
ffffffffc02061e8:	fed790e3          	bne	a5,a3,ffffffffc02061c8 <do_wait.part.0+0x64>
ffffffffc02061ec:	f2842703          	lw	a4,-216(s0)
ffffffffc02061f0:	478d                	li	a5,3
ffffffffc02061f2:	0ef70b63          	beq	a4,a5,ffffffffc02062e8 <do_wait.part.0+0x184>
ffffffffc02061f6:	4785                	li	a5,1
ffffffffc02061f8:	c29c                	sw	a5,0(a3)
ffffffffc02061fa:	0f26a623          	sw	s2,236(a3)
ffffffffc02061fe:	7cf000ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc0206202:	000bb783          	ld	a5,0(s7)
ffffffffc0206206:	0b07a783          	lw	a5,176(a5)
ffffffffc020620a:	8b85                	andi	a5,a5,1
ffffffffc020620c:	d7c9                	beqz	a5,ffffffffc0206196 <do_wait.part.0+0x32>
ffffffffc020620e:	555d                	li	a0,-9
ffffffffc0206210:	df3ff0ef          	jal	ra,ffffffffc0206002 <do_exit>
ffffffffc0206214:	000bb683          	ld	a3,0(s7)
ffffffffc0206218:	7ae0                	ld	s0,240(a3)
ffffffffc020621a:	d45d                	beqz	s0,ffffffffc02061c8 <do_wait.part.0+0x64>
ffffffffc020621c:	470d                	li	a4,3
ffffffffc020621e:	a021                	j	ffffffffc0206226 <do_wait.part.0+0xc2>
ffffffffc0206220:	10043403          	ld	s0,256(s0)
ffffffffc0206224:	d869                	beqz	s0,ffffffffc02061f6 <do_wait.part.0+0x92>
ffffffffc0206226:	401c                	lw	a5,0(s0)
ffffffffc0206228:	fee79ce3          	bne	a5,a4,ffffffffc0206220 <do_wait.part.0+0xbc>
ffffffffc020622c:	00090797          	auipc	a5,0x90
ffffffffc0206230:	69c7b783          	ld	a5,1692(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0206234:	0c878963          	beq	a5,s0,ffffffffc0206306 <do_wait.part.0+0x1a2>
ffffffffc0206238:	00090797          	auipc	a5,0x90
ffffffffc020623c:	6987b783          	ld	a5,1688(a5) # ffffffffc02968d0 <initproc>
ffffffffc0206240:	0cf40363          	beq	s0,a5,ffffffffc0206306 <do_wait.part.0+0x1a2>
ffffffffc0206244:	000a0663          	beqz	s4,ffffffffc0206250 <do_wait.part.0+0xec>
ffffffffc0206248:	0e842783          	lw	a5,232(s0)
ffffffffc020624c:	00fa2023          	sw	a5,0(s4)
ffffffffc0206250:	100027f3          	csrr	a5,sstatus
ffffffffc0206254:	8b89                	andi	a5,a5,2
ffffffffc0206256:	4581                	li	a1,0
ffffffffc0206258:	e7c1                	bnez	a5,ffffffffc02062e0 <do_wait.part.0+0x17c>
ffffffffc020625a:	6c70                	ld	a2,216(s0)
ffffffffc020625c:	7074                	ld	a3,224(s0)
ffffffffc020625e:	10043703          	ld	a4,256(s0)
ffffffffc0206262:	7c7c                	ld	a5,248(s0)
ffffffffc0206264:	e614                	sd	a3,8(a2)
ffffffffc0206266:	e290                	sd	a2,0(a3)
ffffffffc0206268:	6470                	ld	a2,200(s0)
ffffffffc020626a:	6874                	ld	a3,208(s0)
ffffffffc020626c:	e614                	sd	a3,8(a2)
ffffffffc020626e:	e290                	sd	a2,0(a3)
ffffffffc0206270:	c319                	beqz	a4,ffffffffc0206276 <do_wait.part.0+0x112>
ffffffffc0206272:	ff7c                	sd	a5,248(a4)
ffffffffc0206274:	7c7c                	ld	a5,248(s0)
ffffffffc0206276:	c3b5                	beqz	a5,ffffffffc02062da <do_wait.part.0+0x176>
ffffffffc0206278:	10e7b023          	sd	a4,256(a5)
ffffffffc020627c:	00090717          	auipc	a4,0x90
ffffffffc0206280:	65c70713          	addi	a4,a4,1628 # ffffffffc02968d8 <nr_process>
ffffffffc0206284:	431c                	lw	a5,0(a4)
ffffffffc0206286:	37fd                	addiw	a5,a5,-1
ffffffffc0206288:	c31c                	sw	a5,0(a4)
ffffffffc020628a:	e5a9                	bnez	a1,ffffffffc02062d4 <do_wait.part.0+0x170>
ffffffffc020628c:	6814                	ld	a3,16(s0)
ffffffffc020628e:	c02007b7          	lui	a5,0xc0200
ffffffffc0206292:	04f6ee63          	bltu	a3,a5,ffffffffc02062ee <do_wait.part.0+0x18a>
ffffffffc0206296:	00090797          	auipc	a5,0x90
ffffffffc020629a:	6227b783          	ld	a5,1570(a5) # ffffffffc02968b8 <va_pa_offset>
ffffffffc020629e:	8e9d                	sub	a3,a3,a5
ffffffffc02062a0:	82b1                	srli	a3,a3,0xc
ffffffffc02062a2:	00090797          	auipc	a5,0x90
ffffffffc02062a6:	5fe7b783          	ld	a5,1534(a5) # ffffffffc02968a0 <npage>
ffffffffc02062aa:	06f6fa63          	bgeu	a3,a5,ffffffffc020631e <do_wait.part.0+0x1ba>
ffffffffc02062ae:	00009517          	auipc	a0,0x9
ffffffffc02062b2:	25253503          	ld	a0,594(a0) # ffffffffc020f500 <nbase>
ffffffffc02062b6:	8e89                	sub	a3,a3,a0
ffffffffc02062b8:	069a                	slli	a3,a3,0x6
ffffffffc02062ba:	00090517          	auipc	a0,0x90
ffffffffc02062be:	5ee53503          	ld	a0,1518(a0) # ffffffffc02968a8 <pages>
ffffffffc02062c2:	9536                	add	a0,a0,a3
ffffffffc02062c4:	4589                	li	a1,2
ffffffffc02062c6:	ee5fb0ef          	jal	ra,ffffffffc02021aa <free_pages>
ffffffffc02062ca:	8522                	mv	a0,s0
ffffffffc02062cc:	d73fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02062d0:	4501                	li	a0,0
ffffffffc02062d2:	bde5                	j	ffffffffc02061ca <do_wait.part.0+0x66>
ffffffffc02062d4:	999fa0ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02062d8:	bf55                	j	ffffffffc020628c <do_wait.part.0+0x128>
ffffffffc02062da:	701c                	ld	a5,32(s0)
ffffffffc02062dc:	fbf8                	sd	a4,240(a5)
ffffffffc02062de:	bf79                	j	ffffffffc020627c <do_wait.part.0+0x118>
ffffffffc02062e0:	993fa0ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02062e4:	4585                	li	a1,1
ffffffffc02062e6:	bf95                	j	ffffffffc020625a <do_wait.part.0+0xf6>
ffffffffc02062e8:	f2840413          	addi	s0,s0,-216
ffffffffc02062ec:	b781                	j	ffffffffc020622c <do_wait.part.0+0xc8>
ffffffffc02062ee:	00006617          	auipc	a2,0x6
ffffffffc02062f2:	0f260613          	addi	a2,a2,242 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc02062f6:	07700593          	li	a1,119
ffffffffc02062fa:	00006517          	auipc	a0,0x6
ffffffffc02062fe:	06650513          	addi	a0,a0,102 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0206302:	99cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206306:	00007617          	auipc	a2,0x7
ffffffffc020630a:	0a260613          	addi	a2,a2,162 # ffffffffc020d3a8 <CSWTCH.79+0x190>
ffffffffc020630e:	42600593          	li	a1,1062
ffffffffc0206312:	00007517          	auipc	a0,0x7
ffffffffc0206316:	02650513          	addi	a0,a0,38 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc020631a:	984fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020631e:	00006617          	auipc	a2,0x6
ffffffffc0206322:	0ea60613          	addi	a2,a2,234 # ffffffffc020c408 <default_pmm_manager+0x108>
ffffffffc0206326:	06900593          	li	a1,105
ffffffffc020632a:	00006517          	auipc	a0,0x6
ffffffffc020632e:	03650513          	addi	a0,a0,54 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0206332:	96cfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206336 <init_main>:
ffffffffc0206336:	1141                	addi	sp,sp,-16
ffffffffc0206338:	00007517          	auipc	a0,0x7
ffffffffc020633c:	09050513          	addi	a0,a0,144 # ffffffffc020d3c8 <CSWTCH.79+0x1b0>
ffffffffc0206340:	e406                	sd	ra,8(sp)
ffffffffc0206342:	5fa010ef          	jal	ra,ffffffffc020793c <vfs_set_bootfs>
ffffffffc0206346:	e179                	bnez	a0,ffffffffc020640c <init_main+0xd6>
ffffffffc0206348:	ea3fb0ef          	jal	ra,ffffffffc02021ea <nr_free_pages>
ffffffffc020634c:	c3ffb0ef          	jal	ra,ffffffffc0201f8a <kallocated>
ffffffffc0206350:	4601                	li	a2,0
ffffffffc0206352:	4581                	li	a1,0
ffffffffc0206354:	00001517          	auipc	a0,0x1
ffffffffc0206358:	82050513          	addi	a0,a0,-2016 # ffffffffc0206b74 <user_main>
ffffffffc020635c:	c57ff0ef          	jal	ra,ffffffffc0205fb2 <kernel_thread>
ffffffffc0206360:	00a04563          	bgtz	a0,ffffffffc020636a <init_main+0x34>
ffffffffc0206364:	a841                	j	ffffffffc02063f4 <init_main+0xbe>
ffffffffc0206366:	667000ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc020636a:	4581                	li	a1,0
ffffffffc020636c:	4501                	li	a0,0
ffffffffc020636e:	df7ff0ef          	jal	ra,ffffffffc0206164 <do_wait.part.0>
ffffffffc0206372:	d975                	beqz	a0,ffffffffc0206366 <init_main+0x30>
ffffffffc0206374:	e57fe0ef          	jal	ra,ffffffffc02051ca <fs_cleanup>
ffffffffc0206378:	00007517          	auipc	a0,0x7
ffffffffc020637c:	09850513          	addi	a0,a0,152 # ffffffffc020d410 <CSWTCH.79+0x1f8>
ffffffffc0206380:	e27f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206384:	00090797          	auipc	a5,0x90
ffffffffc0206388:	54c7b783          	ld	a5,1356(a5) # ffffffffc02968d0 <initproc>
ffffffffc020638c:	7bf8                	ld	a4,240(a5)
ffffffffc020638e:	e339                	bnez	a4,ffffffffc02063d4 <init_main+0x9e>
ffffffffc0206390:	7ff8                	ld	a4,248(a5)
ffffffffc0206392:	e329                	bnez	a4,ffffffffc02063d4 <init_main+0x9e>
ffffffffc0206394:	1007b703          	ld	a4,256(a5)
ffffffffc0206398:	ef15                	bnez	a4,ffffffffc02063d4 <init_main+0x9e>
ffffffffc020639a:	00090697          	auipc	a3,0x90
ffffffffc020639e:	53e6a683          	lw	a3,1342(a3) # ffffffffc02968d8 <nr_process>
ffffffffc02063a2:	4709                	li	a4,2
ffffffffc02063a4:	0ce69163          	bne	a3,a4,ffffffffc0206466 <init_main+0x130>
ffffffffc02063a8:	0008f717          	auipc	a4,0x8f
ffffffffc02063ac:	41870713          	addi	a4,a4,1048 # ffffffffc02957c0 <proc_list>
ffffffffc02063b0:	6714                	ld	a3,8(a4)
ffffffffc02063b2:	0c878793          	addi	a5,a5,200
ffffffffc02063b6:	08d79863          	bne	a5,a3,ffffffffc0206446 <init_main+0x110>
ffffffffc02063ba:	6318                	ld	a4,0(a4)
ffffffffc02063bc:	06e79563          	bne	a5,a4,ffffffffc0206426 <init_main+0xf0>
ffffffffc02063c0:	00007517          	auipc	a0,0x7
ffffffffc02063c4:	13850513          	addi	a0,a0,312 # ffffffffc020d4f8 <CSWTCH.79+0x2e0>
ffffffffc02063c8:	ddff90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02063cc:	60a2                	ld	ra,8(sp)
ffffffffc02063ce:	4501                	li	a0,0
ffffffffc02063d0:	0141                	addi	sp,sp,16
ffffffffc02063d2:	8082                	ret
ffffffffc02063d4:	00007697          	auipc	a3,0x7
ffffffffc02063d8:	06468693          	addi	a3,a3,100 # ffffffffc020d438 <CSWTCH.79+0x220>
ffffffffc02063dc:	00005617          	auipc	a2,0x5
ffffffffc02063e0:	43c60613          	addi	a2,a2,1084 # ffffffffc020b818 <commands+0x210>
ffffffffc02063e4:	49c00593          	li	a1,1180
ffffffffc02063e8:	00007517          	auipc	a0,0x7
ffffffffc02063ec:	f5050513          	addi	a0,a0,-176 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc02063f0:	8aefa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02063f4:	00007617          	auipc	a2,0x7
ffffffffc02063f8:	ffc60613          	addi	a2,a2,-4 # ffffffffc020d3f0 <CSWTCH.79+0x1d8>
ffffffffc02063fc:	48f00593          	li	a1,1167
ffffffffc0206400:	00007517          	auipc	a0,0x7
ffffffffc0206404:	f3850513          	addi	a0,a0,-200 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206408:	896fa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020640c:	86aa                	mv	a3,a0
ffffffffc020640e:	00007617          	auipc	a2,0x7
ffffffffc0206412:	fc260613          	addi	a2,a2,-62 # ffffffffc020d3d0 <CSWTCH.79+0x1b8>
ffffffffc0206416:	48700593          	li	a1,1159
ffffffffc020641a:	00007517          	auipc	a0,0x7
ffffffffc020641e:	f1e50513          	addi	a0,a0,-226 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206422:	87cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206426:	00007697          	auipc	a3,0x7
ffffffffc020642a:	0a268693          	addi	a3,a3,162 # ffffffffc020d4c8 <CSWTCH.79+0x2b0>
ffffffffc020642e:	00005617          	auipc	a2,0x5
ffffffffc0206432:	3ea60613          	addi	a2,a2,1002 # ffffffffc020b818 <commands+0x210>
ffffffffc0206436:	49f00593          	li	a1,1183
ffffffffc020643a:	00007517          	auipc	a0,0x7
ffffffffc020643e:	efe50513          	addi	a0,a0,-258 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206442:	85cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206446:	00007697          	auipc	a3,0x7
ffffffffc020644a:	05268693          	addi	a3,a3,82 # ffffffffc020d498 <CSWTCH.79+0x280>
ffffffffc020644e:	00005617          	auipc	a2,0x5
ffffffffc0206452:	3ca60613          	addi	a2,a2,970 # ffffffffc020b818 <commands+0x210>
ffffffffc0206456:	49e00593          	li	a1,1182
ffffffffc020645a:	00007517          	auipc	a0,0x7
ffffffffc020645e:	ede50513          	addi	a0,a0,-290 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206462:	83cfa0ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206466:	00007697          	auipc	a3,0x7
ffffffffc020646a:	02268693          	addi	a3,a3,34 # ffffffffc020d488 <CSWTCH.79+0x270>
ffffffffc020646e:	00005617          	auipc	a2,0x5
ffffffffc0206472:	3aa60613          	addi	a2,a2,938 # ffffffffc020b818 <commands+0x210>
ffffffffc0206476:	49d00593          	li	a1,1181
ffffffffc020647a:	00007517          	auipc	a0,0x7
ffffffffc020647e:	ebe50513          	addi	a0,a0,-322 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206482:	81cfa0ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206486 <do_execve>:
ffffffffc0206486:	ca010113          	addi	sp,sp,-864
ffffffffc020648a:	33413823          	sd	s4,816(sp)
ffffffffc020648e:	00090a17          	auipc	s4,0x90
ffffffffc0206492:	432a0a13          	addi	s4,s4,1074 # ffffffffc02968c0 <current>
ffffffffc0206496:	000a3683          	ld	a3,0(s4)
ffffffffc020649a:	33513423          	sd	s5,808(sp)
ffffffffc020649e:	fff58a9b          	addiw	s5,a1,-1
ffffffffc02064a2:	31713c23          	sd	s7,792(sp)
ffffffffc02064a6:	34113c23          	sd	ra,856(sp)
ffffffffc02064aa:	34813823          	sd	s0,848(sp)
ffffffffc02064ae:	34913423          	sd	s1,840(sp)
ffffffffc02064b2:	35213023          	sd	s2,832(sp)
ffffffffc02064b6:	33313c23          	sd	s3,824(sp)
ffffffffc02064ba:	33613023          	sd	s6,800(sp)
ffffffffc02064be:	31813823          	sd	s8,784(sp)
ffffffffc02064c2:	31913423          	sd	s9,776(sp)
ffffffffc02064c6:	31a13023          	sd	s10,768(sp)
ffffffffc02064ca:	2fb13c23          	sd	s11,760(sp)
ffffffffc02064ce:	000a871b          	sext.w	a4,s5
ffffffffc02064d2:	47fd                	li	a5,31
ffffffffc02064d4:	0286bb83          	ld	s7,40(a3)
ffffffffc02064d8:	62e7e663          	bltu	a5,a4,ffffffffc0206b04 <do_execve+0x67e>
ffffffffc02064dc:	842e                	mv	s0,a1
ffffffffc02064de:	84aa                	mv	s1,a0
ffffffffc02064e0:	8c32                	mv	s8,a2
ffffffffc02064e2:	4581                	li	a1,0
ffffffffc02064e4:	4641                	li	a2,16
ffffffffc02064e6:	10a8                	addi	a0,sp,104
ffffffffc02064e8:	64f040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc02064ec:	000b8c63          	beqz	s7,ffffffffc0206504 <do_execve+0x7e>
ffffffffc02064f0:	038b8513          	addi	a0,s7,56
ffffffffc02064f4:	87cfe0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02064f8:	000a3783          	ld	a5,0(s4)
ffffffffc02064fc:	c781                	beqz	a5,ffffffffc0206504 <do_execve+0x7e>
ffffffffc02064fe:	43dc                	lw	a5,4(a5)
ffffffffc0206500:	04fba823          	sw	a5,80(s7)
ffffffffc0206504:	2a048463          	beqz	s1,ffffffffc02067ac <do_execve+0x326>
ffffffffc0206508:	46c1                	li	a3,16
ffffffffc020650a:	8626                	mv	a2,s1
ffffffffc020650c:	10ac                	addi	a1,sp,104
ffffffffc020650e:	855e                	mv	a0,s7
ffffffffc0206510:	e89fd0ef          	jal	ra,ffffffffc0204398 <copy_string>
ffffffffc0206514:	5e050e63          	beqz	a0,ffffffffc0206b10 <do_execve+0x68a>
ffffffffc0206518:	00341793          	slli	a5,s0,0x3
ffffffffc020651c:	4681                	li	a3,0
ffffffffc020651e:	863e                	mv	a2,a5
ffffffffc0206520:	85e2                	mv	a1,s8
ffffffffc0206522:	855e                	mv	a0,s7
ffffffffc0206524:	f43e                	sd	a5,40(sp)
ffffffffc0206526:	d79fd0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc020652a:	89e2                	mv	s3,s8
ffffffffc020652c:	5c050e63          	beqz	a0,ffffffffc0206b08 <do_execve+0x682>
ffffffffc0206530:	0f010b13          	addi	s6,sp,240
ffffffffc0206534:	4481                	li	s1,0
ffffffffc0206536:	a011                	j	ffffffffc020653a <do_execve+0xb4>
ffffffffc0206538:	84be                	mv	s1,a5
ffffffffc020653a:	6505                	lui	a0,0x1
ffffffffc020653c:	a53fb0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0206540:	892a                	mv	s2,a0
ffffffffc0206542:	1e050263          	beqz	a0,ffffffffc0206726 <do_execve+0x2a0>
ffffffffc0206546:	0009b603          	ld	a2,0(s3) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020654a:	85aa                	mv	a1,a0
ffffffffc020654c:	6685                	lui	a3,0x1
ffffffffc020654e:	855e                	mv	a0,s7
ffffffffc0206550:	e49fd0ef          	jal	ra,ffffffffc0204398 <copy_string>
ffffffffc0206554:	24050763          	beqz	a0,ffffffffc02067a2 <do_execve+0x31c>
ffffffffc0206558:	012b3023          	sd	s2,0(s6)
ffffffffc020655c:	0014879b          	addiw	a5,s1,1
ffffffffc0206560:	0b21                	addi	s6,s6,8
ffffffffc0206562:	09a1                	addi	s3,s3,8
ffffffffc0206564:	fcf41ae3          	bne	s0,a5,ffffffffc0206538 <do_execve+0xb2>
ffffffffc0206568:	000c3903          	ld	s2,0(s8)
ffffffffc020656c:	140b8663          	beqz	s7,ffffffffc02066b8 <do_execve+0x232>
ffffffffc0206570:	038b8513          	addi	a0,s7,56
ffffffffc0206574:	ff9fd0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0206578:	000a3783          	ld	a5,0(s4)
ffffffffc020657c:	040ba823          	sw	zero,80(s7)
ffffffffc0206580:	1487b503          	ld	a0,328(a5)
ffffffffc0206584:	d23fe0ef          	jal	ra,ffffffffc02052a6 <files_closeall>
ffffffffc0206588:	4581                	li	a1,0
ffffffffc020658a:	854a                	mv	a0,s2
ffffffffc020658c:	fa7fe0ef          	jal	ra,ffffffffc0205532 <sysfile_open>
ffffffffc0206590:	89aa                	mv	s3,a0
ffffffffc0206592:	14054063          	bltz	a0,ffffffffc02066d2 <do_execve+0x24c>
ffffffffc0206596:	00090797          	auipc	a5,0x90
ffffffffc020659a:	2fa7b783          	ld	a5,762(a5) # ffffffffc0296890 <boot_pgdir_pa>
ffffffffc020659e:	577d                	li	a4,-1
ffffffffc02065a0:	177e                	slli	a4,a4,0x3f
ffffffffc02065a2:	83b1                	srli	a5,a5,0xc
ffffffffc02065a4:	8fd9                	or	a5,a5,a4
ffffffffc02065a6:	18079073          	csrw	satp,a5
ffffffffc02065aa:	030ba783          	lw	a5,48(s7)
ffffffffc02065ae:	fff7871b          	addiw	a4,a5,-1
ffffffffc02065b2:	02eba823          	sw	a4,48(s7)
ffffffffc02065b6:	44070363          	beqz	a4,ffffffffc02069fc <do_execve+0x576>
ffffffffc02065ba:	000a3783          	ld	a5,0(s4)
ffffffffc02065be:	0207b423          	sd	zero,40(a5)
ffffffffc02065c2:	e52fd0ef          	jal	ra,ffffffffc0203c14 <mm_create>
ffffffffc02065c6:	8daa                	mv	s11,a0
ffffffffc02065c8:	20050163          	beqz	a0,ffffffffc02067ca <do_execve+0x344>
ffffffffc02065cc:	4505                	li	a0,1
ffffffffc02065ce:	b9ffb0ef          	jal	ra,ffffffffc020216c <alloc_pages>
ffffffffc02065d2:	1e050963          	beqz	a0,ffffffffc02067c4 <do_execve+0x33e>
ffffffffc02065d6:	00090d17          	auipc	s10,0x90
ffffffffc02065da:	2d2d0d13          	addi	s10,s10,722 # ffffffffc02968a8 <pages>
ffffffffc02065de:	000d3683          	ld	a3,0(s10)
ffffffffc02065e2:	00009717          	auipc	a4,0x9
ffffffffc02065e6:	f1e73703          	ld	a4,-226(a4) # ffffffffc020f500 <nbase>
ffffffffc02065ea:	00090c97          	auipc	s9,0x90
ffffffffc02065ee:	2b6c8c93          	addi	s9,s9,694 # ffffffffc02968a0 <npage>
ffffffffc02065f2:	40d506b3          	sub	a3,a0,a3
ffffffffc02065f6:	8699                	srai	a3,a3,0x6
ffffffffc02065f8:	96ba                	add	a3,a3,a4
ffffffffc02065fa:	e43a                	sd	a4,8(sp)
ffffffffc02065fc:	000cb783          	ld	a5,0(s9)
ffffffffc0206600:	577d                	li	a4,-1
ffffffffc0206602:	8331                	srli	a4,a4,0xc
ffffffffc0206604:	e83a                	sd	a4,16(sp)
ffffffffc0206606:	8f75                	and	a4,a4,a3
ffffffffc0206608:	06b2                	slli	a3,a3,0xc
ffffffffc020660a:	52f77d63          	bgeu	a4,a5,ffffffffc0206b44 <do_execve+0x6be>
ffffffffc020660e:	00090b97          	auipc	s7,0x90
ffffffffc0206612:	2aab8b93          	addi	s7,s7,682 # ffffffffc02968b8 <va_pa_offset>
ffffffffc0206616:	000bb903          	ld	s2,0(s7)
ffffffffc020661a:	6605                	lui	a2,0x1
ffffffffc020661c:	00090597          	auipc	a1,0x90
ffffffffc0206620:	27c5b583          	ld	a1,636(a1) # ffffffffc0296898 <boot_pgdir_va>
ffffffffc0206624:	9936                	add	s2,s2,a3
ffffffffc0206626:	854a                	mv	a0,s2
ffffffffc0206628:	561040ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020662c:	4601                	li	a2,0
ffffffffc020662e:	012dbc23          	sd	s2,24(s11)
ffffffffc0206632:	4581                	li	a1,0
ffffffffc0206634:	854e                	mv	a0,s3
ffffffffc0206636:	962ff0ef          	jal	ra,ffffffffc0205798 <sysfile_seek>
ffffffffc020663a:	ec2a                	sd	a0,24(sp)
ffffffffc020663c:	e561                	bnez	a0,ffffffffc0206704 <do_execve+0x27e>
ffffffffc020663e:	04000613          	li	a2,64
ffffffffc0206642:	190c                	addi	a1,sp,176
ffffffffc0206644:	854e                	mv	a0,s3
ffffffffc0206646:	f25fe0ef          	jal	ra,ffffffffc020556a <sysfile_read>
ffffffffc020664a:	04000793          	li	a5,64
ffffffffc020664e:	18f51363          	bne	a0,a5,ffffffffc02067d4 <do_execve+0x34e>
ffffffffc0206652:	574a                	lw	a4,176(sp)
ffffffffc0206654:	464c47b7          	lui	a5,0x464c4
ffffffffc0206658:	57f78793          	addi	a5,a5,1407 # 464c457f <_binary_bin_sfs_img_size+0x4644f27f>
ffffffffc020665c:	0af71263          	bne	a4,a5,ffffffffc0206700 <do_execve+0x27a>
ffffffffc0206660:	0e815783          	lhu	a5,232(sp)
ffffffffc0206664:	f002                	sd	zero,32(sp)
ffffffffc0206666:	1a078663          	beqz	a5,ffffffffc0206812 <do_execve+0x38c>
ffffffffc020666a:	eca6                	sd	s1,88(sp)
ffffffffc020666c:	f822                	sd	s0,48(sp)
ffffffffc020666e:	de56                	sw	s5,60(sp)
ffffffffc0206670:	65ce                	ld	a1,208(sp)
ffffffffc0206672:	7782                	ld	a5,32(sp)
ffffffffc0206674:	4601                	li	a2,0
ffffffffc0206676:	854e                	mv	a0,s3
ffffffffc0206678:	95be                	add	a1,a1,a5
ffffffffc020667a:	91eff0ef          	jal	ra,ffffffffc0205798 <sysfile_seek>
ffffffffc020667e:	36051663          	bnez	a0,ffffffffc02069ea <do_execve+0x564>
ffffffffc0206682:	03800613          	li	a2,56
ffffffffc0206686:	18ac                	addi	a1,sp,120
ffffffffc0206688:	854e                	mv	a0,s3
ffffffffc020668a:	ee1fe0ef          	jal	ra,ffffffffc020556a <sysfile_read>
ffffffffc020668e:	03800793          	li	a5,56
ffffffffc0206692:	14f50863          	beq	a0,a5,ffffffffc02067e2 <do_execve+0x35c>
ffffffffc0206696:	7442                	ld	s0,48(sp)
ffffffffc0206698:	5af2                	lw	s5,60(sp)
ffffffffc020669a:	0005091b          	sext.w	s2,a0
ffffffffc020669e:	00054363          	bltz	a0,ffffffffc02066a4 <do_execve+0x21e>
ffffffffc02066a2:	597d                	li	s2,-1
ffffffffc02066a4:	1a82                	slli	s5,s5,0x20
ffffffffc02066a6:	0e010c93          	addi	s9,sp,224
ffffffffc02066aa:	020ada93          	srli	s5,s5,0x20
ffffffffc02066ae:	856e                	mv	a0,s11
ffffffffc02066b0:	84ffd0ef          	jal	ra,ffffffffc0203efe <exit_mmap>
ffffffffc02066b4:	ec4a                	sd	s2,24(sp)
ffffffffc02066b6:	a8a1                	j	ffffffffc020670e <do_execve+0x288>
ffffffffc02066b8:	000a3783          	ld	a5,0(s4)
ffffffffc02066bc:	1487b503          	ld	a0,328(a5)
ffffffffc02066c0:	be7fe0ef          	jal	ra,ffffffffc02052a6 <files_closeall>
ffffffffc02066c4:	4581                	li	a1,0
ffffffffc02066c6:	854a                	mv	a0,s2
ffffffffc02066c8:	e6bfe0ef          	jal	ra,ffffffffc0205532 <sysfile_open>
ffffffffc02066cc:	89aa                	mv	s3,a0
ffffffffc02066ce:	ee055ae3          	bgez	a0,ffffffffc02065c2 <do_execve+0x13c>
ffffffffc02066d2:	1a82                	slli	s5,s5,0x20
ffffffffc02066d4:	0e010c93          	addi	s9,sp,224
ffffffffc02066d8:	020ada93          	srli	s5,s5,0x20
ffffffffc02066dc:	77a2                	ld	a5,40(sp)
ffffffffc02066de:	147d                	addi	s0,s0,-1
ffffffffc02066e0:	040e                	slli	s0,s0,0x3
ffffffffc02066e2:	97e6                	add	a5,a5,s9
ffffffffc02066e4:	0a8e                	slli	s5,s5,0x3
ffffffffc02066e6:	1998                	addi	a4,sp,240
ffffffffc02066e8:	943a                	add	s0,s0,a4
ffffffffc02066ea:	41578ab3          	sub	s5,a5,s5
ffffffffc02066ee:	6008                	ld	a0,0(s0)
ffffffffc02066f0:	1461                	addi	s0,s0,-8
ffffffffc02066f2:	94dfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02066f6:	ff541ce3          	bne	s0,s5,ffffffffc02066ee <do_execve+0x268>
ffffffffc02066fa:	854e                	mv	a0,s3
ffffffffc02066fc:	907ff0ef          	jal	ra,ffffffffc0206002 <do_exit>
ffffffffc0206700:	57e1                	li	a5,-8
ffffffffc0206702:	ec3e                	sd	a5,24(sp)
ffffffffc0206704:	1a82                	slli	s5,s5,0x20
ffffffffc0206706:	0e010c93          	addi	s9,sp,224
ffffffffc020670a:	020ada93          	srli	s5,s5,0x20
ffffffffc020670e:	018db503          	ld	a0,24(s11)
ffffffffc0206712:	b76ff0ef          	jal	ra,ffffffffc0205a88 <put_pgdir.isra.0>
ffffffffc0206716:	856e                	mv	a0,s11
ffffffffc0206718:	e4afd0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc020671c:	854e                	mv	a0,s3
ffffffffc020671e:	e49fe0ef          	jal	ra,ffffffffc0205566 <sysfile_close>
ffffffffc0206722:	69e2                	ld	s3,24(sp)
ffffffffc0206724:	bf65                	j	ffffffffc02066dc <do_execve+0x256>
ffffffffc0206726:	5971                	li	s2,-4
ffffffffc0206728:	c49d                	beqz	s1,ffffffffc0206756 <do_execve+0x2d0>
ffffffffc020672a:	00349713          	slli	a4,s1,0x3
ffffffffc020672e:	fff48413          	addi	s0,s1,-1
ffffffffc0206732:	119c                	addi	a5,sp,224
ffffffffc0206734:	34fd                	addiw	s1,s1,-1
ffffffffc0206736:	97ba                	add	a5,a5,a4
ffffffffc0206738:	02049713          	slli	a4,s1,0x20
ffffffffc020673c:	01d75493          	srli	s1,a4,0x1d
ffffffffc0206740:	040e                	slli	s0,s0,0x3
ffffffffc0206742:	1998                	addi	a4,sp,240
ffffffffc0206744:	943a                	add	s0,s0,a4
ffffffffc0206746:	409784b3          	sub	s1,a5,s1
ffffffffc020674a:	6008                	ld	a0,0(s0)
ffffffffc020674c:	1461                	addi	s0,s0,-8
ffffffffc020674e:	8f1fb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0206752:	fe849ce3          	bne	s1,s0,ffffffffc020674a <do_execve+0x2c4>
ffffffffc0206756:	000b8863          	beqz	s7,ffffffffc0206766 <do_execve+0x2e0>
ffffffffc020675a:	038b8513          	addi	a0,s7,56
ffffffffc020675e:	e0ffd0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0206762:	040ba823          	sw	zero,80(s7)
ffffffffc0206766:	35813083          	ld	ra,856(sp)
ffffffffc020676a:	35013403          	ld	s0,848(sp)
ffffffffc020676e:	34813483          	ld	s1,840(sp)
ffffffffc0206772:	33813983          	ld	s3,824(sp)
ffffffffc0206776:	33013a03          	ld	s4,816(sp)
ffffffffc020677a:	32813a83          	ld	s5,808(sp)
ffffffffc020677e:	32013b03          	ld	s6,800(sp)
ffffffffc0206782:	31813b83          	ld	s7,792(sp)
ffffffffc0206786:	31013c03          	ld	s8,784(sp)
ffffffffc020678a:	30813c83          	ld	s9,776(sp)
ffffffffc020678e:	30013d03          	ld	s10,768(sp)
ffffffffc0206792:	2f813d83          	ld	s11,760(sp)
ffffffffc0206796:	854a                	mv	a0,s2
ffffffffc0206798:	34013903          	ld	s2,832(sp)
ffffffffc020679c:	36010113          	addi	sp,sp,864
ffffffffc02067a0:	8082                	ret
ffffffffc02067a2:	854a                	mv	a0,s2
ffffffffc02067a4:	89bfb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02067a8:	5975                	li	s2,-3
ffffffffc02067aa:	bfbd                	j	ffffffffc0206728 <do_execve+0x2a2>
ffffffffc02067ac:	000a3783          	ld	a5,0(s4)
ffffffffc02067b0:	00007617          	auipc	a2,0x7
ffffffffc02067b4:	d6860613          	addi	a2,a2,-664 # ffffffffc020d518 <CSWTCH.79+0x300>
ffffffffc02067b8:	45c1                	li	a1,16
ffffffffc02067ba:	43d4                	lw	a3,4(a5)
ffffffffc02067bc:	10a8                	addi	a0,sp,104
ffffffffc02067be:	289040ef          	jal	ra,ffffffffc020b246 <snprintf>
ffffffffc02067c2:	bb99                	j	ffffffffc0206518 <do_execve+0x92>
ffffffffc02067c4:	856e                	mv	a0,s11
ffffffffc02067c6:	d9cfd0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc02067ca:	854e                	mv	a0,s3
ffffffffc02067cc:	d9bfe0ef          	jal	ra,ffffffffc0205566 <sysfile_close>
ffffffffc02067d0:	59f1                	li	s3,-4
ffffffffc02067d2:	b701                	j	ffffffffc02066d2 <do_execve+0x24c>
ffffffffc02067d4:	0005079b          	sext.w	a5,a0
ffffffffc02067d8:	f20545e3          	bltz	a0,ffffffffc0206702 <do_execve+0x27c>
ffffffffc02067dc:	57fd                	li	a5,-1
ffffffffc02067de:	ec3e                	sd	a5,24(sp)
ffffffffc02067e0:	b715                	j	ffffffffc0206704 <do_execve+0x27e>
ffffffffc02067e2:	57e6                	lw	a5,120(sp)
ffffffffc02067e4:	4705                	li	a4,1
ffffffffc02067e6:	00e79863          	bne	a5,a4,ffffffffc02067f6 <do_execve+0x370>
ffffffffc02067ea:	760a                	ld	a2,160(sp)
ffffffffc02067ec:	67ea                	ld	a5,152(sp)
ffffffffc02067ee:	32f66b63          	bltu	a2,a5,ffffffffc0206b24 <do_execve+0x69e>
ffffffffc02067f2:	22061063          	bnez	a2,ffffffffc0206a12 <do_execve+0x58c>
ffffffffc02067f6:	6762                	ld	a4,24(sp)
ffffffffc02067f8:	7682                	ld	a3,32(sp)
ffffffffc02067fa:	0e815783          	lhu	a5,232(sp)
ffffffffc02067fe:	2705                	addiw	a4,a4,1
ffffffffc0206800:	03868693          	addi	a3,a3,56 # 1038 <_binary_bin_swap_img_size-0x6cc8>
ffffffffc0206804:	ec3a                	sd	a4,24(sp)
ffffffffc0206806:	f036                	sd	a3,32(sp)
ffffffffc0206808:	e6f744e3          	blt	a4,a5,ffffffffc0206670 <do_execve+0x1ea>
ffffffffc020680c:	64e6                	ld	s1,88(sp)
ffffffffc020680e:	7442                	ld	s0,48(sp)
ffffffffc0206810:	5af2                	lw	s5,60(sp)
ffffffffc0206812:	4701                	li	a4,0
ffffffffc0206814:	46ad                	li	a3,11
ffffffffc0206816:	00100637          	lui	a2,0x100
ffffffffc020681a:	7ff005b7          	lui	a1,0x7ff00
ffffffffc020681e:	856e                	mv	a0,s11
ffffffffc0206820:	d94fd0ef          	jal	ra,ffffffffc0203db4 <mm_map>
ffffffffc0206824:	892a                	mv	s2,a0
ffffffffc0206826:	e6051fe3          	bnez	a0,ffffffffc02066a4 <do_execve+0x21e>
ffffffffc020682a:	018db503          	ld	a0,24(s11)
ffffffffc020682e:	4659                	li	a2,22
ffffffffc0206830:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc0206834:	afafd0ef          	jal	ra,ffffffffc0203b2e <pgdir_alloc_page>
ffffffffc0206838:	8b2a                	mv	s6,a0
ffffffffc020683a:	2e050d63          	beqz	a0,ffffffffc0206b34 <do_execve+0x6ae>
ffffffffc020683e:	000d3683          	ld	a3,0(s10)
ffffffffc0206842:	6722                	ld	a4,8(sp)
ffffffffc0206844:	5c7d                	li	s8,-1
ffffffffc0206846:	40d506b3          	sub	a3,a0,a3
ffffffffc020684a:	8699                	srai	a3,a3,0x6
ffffffffc020684c:	000cb783          	ld	a5,0(s9)
ffffffffc0206850:	96ba                	add	a3,a3,a4
ffffffffc0206852:	00cc5c13          	srli	s8,s8,0xc
ffffffffc0206856:	0186f733          	and	a4,a3,s8
ffffffffc020685a:	06b2                	slli	a3,a3,0xc
ffffffffc020685c:	2ef77463          	bgeu	a4,a5,ffffffffc0206b44 <do_execve+0x6be>
ffffffffc0206860:	000bb503          	ld	a0,0(s7)
ffffffffc0206864:	6605                	lui	a2,0x1
ffffffffc0206866:	4581                	li	a1,0
ffffffffc0206868:	9536                	add	a0,a0,a3
ffffffffc020686a:	2cd040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc020686e:	000d3683          	ld	a3,0(s10)
ffffffffc0206872:	6722                	ld	a4,8(sp)
ffffffffc0206874:	000cb783          	ld	a5,0(s9)
ffffffffc0206878:	40db06b3          	sub	a3,s6,a3
ffffffffc020687c:	8699                	srai	a3,a3,0x6
ffffffffc020687e:	96ba                	add	a3,a3,a4
ffffffffc0206880:	0186fc33          	and	s8,a3,s8
ffffffffc0206884:	06b2                	slli	a3,a3,0xc
ffffffffc0206886:	2afc7f63          	bgeu	s8,a5,ffffffffc0206b44 <do_execve+0x6be>
ffffffffc020688a:	000bb783          	ld	a5,0(s7)
ffffffffc020688e:	7722                	ld	a4,40(sp)
ffffffffc0206890:	0e010c93          	addi	s9,sp,224
ffffffffc0206894:	97b6                	add	a5,a5,a3
ffffffffc0206896:	ff870c13          	addi	s8,a4,-8
ffffffffc020689a:	e43e                	sd	a5,8(sp)
ffffffffc020689c:	199c                	addi	a5,sp,240
ffffffffc020689e:	01878d33          	add	s10,a5,s8
ffffffffc02068a2:	1a82                	slli	s5,s5,0x20
ffffffffc02068a4:	1b9c                	addi	a5,sp,496
ffffffffc02068a6:	020ada93          	srli	s5,s5,0x20
ffffffffc02068aa:	00ec8b33          	add	s6,s9,a4
ffffffffc02068ae:	01878733          	add	a4,a5,s8
ffffffffc02068b2:	4785                	li	a5,1
ffffffffc02068b4:	003a9613          	slli	a2,s5,0x3
ffffffffc02068b8:	01f79c13          	slli	s8,a5,0x1f
ffffffffc02068bc:	e826                	sd	s1,16(sp)
ffffffffc02068be:	40cb0b33          	sub	s6,s6,a2
ffffffffc02068c2:	84ea                	mv	s1,s10
ffffffffc02068c4:	ec4a                	sd	s2,24(sp)
ffffffffc02068c6:	8d62                	mv	s10,s8
ffffffffc02068c8:	8c56                	mv	s8,s5
ffffffffc02068ca:	8aa2                	mv	s5,s0
ffffffffc02068cc:	843a                	mv	s0,a4
ffffffffc02068ce:	0004b903          	ld	s2,0(s1)
ffffffffc02068d2:	854a                	mv	a0,s2
ffffffffc02068d4:	1c1040ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc02068d8:	00150613          	addi	a2,a0,1 # 1001 <_binary_bin_swap_img_size-0x6cff>
ffffffffc02068dc:	40cd0d33          	sub	s10,s10,a2
ffffffffc02068e0:	7ffff7b7          	lui	a5,0x7ffff
ffffffffc02068e4:	24fd6463          	bltu	s10,a5,ffffffffc0206b2c <do_execve+0x6a6>
ffffffffc02068e8:	40fd0533          	sub	a0,s10,a5
ffffffffc02068ec:	67a2                	ld	a5,8(sp)
ffffffffc02068ee:	85ca                	mv	a1,s2
ffffffffc02068f0:	14e1                	addi	s1,s1,-8
ffffffffc02068f2:	953e                	add	a0,a0,a5
ffffffffc02068f4:	295040ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc02068f8:	01a43023          	sd	s10,0(s0)
ffffffffc02068fc:	1461                	addi	s0,s0,-8
ffffffffc02068fe:	fd6498e3          	bne	s1,s6,ffffffffc02068ce <do_execve+0x448>
ffffffffc0206902:	77a2                	ld	a5,40(sp)
ffffffffc0206904:	8456                	mv	s0,s5
ffffffffc0206906:	8ae2                	mv	s5,s8
ffffffffc0206908:	00878713          	addi	a4,a5,8 # 7ffff008 <_binary_bin_sfs_img_size+0x7ff89d08>
ffffffffc020690c:	ff8d7c13          	andi	s8,s10,-8
ffffffffc0206910:	40ec0c33          	sub	s8,s8,a4
ffffffffc0206914:	7ffff7b7          	lui	a5,0x7ffff
ffffffffc0206918:	64c2                	ld	s1,16(sp)
ffffffffc020691a:	6962                	ld	s2,24(sp)
ffffffffc020691c:	1efc6263          	bltu	s8,a5,ffffffffc0206b00 <do_execve+0x67a>
ffffffffc0206920:	40fc0d33          	sub	s10,s8,a5
ffffffffc0206924:	67a2                	ld	a5,8(sp)
ffffffffc0206926:	4701                	li	a4,0
ffffffffc0206928:	01a78cb3          	add	s9,a5,s10
ffffffffc020692c:	86e6                	mv	a3,s9
ffffffffc020692e:	1b9c                	addi	a5,sp,496
ffffffffc0206930:	638c                	ld	a1,0(a5)
ffffffffc0206932:	863a                	mv	a2,a4
ffffffffc0206934:	07a1                	addi	a5,a5,8
ffffffffc0206936:	e28c                	sd	a1,0(a3)
ffffffffc0206938:	2705                	addiw	a4,a4,1
ffffffffc020693a:	06a1                	addi	a3,a3,8
ffffffffc020693c:	fe964ae3          	blt	a2,s1,ffffffffc0206930 <do_execve+0x4aa>
ffffffffc0206940:	76a2                	ld	a3,40(sp)
ffffffffc0206942:	030da703          	lw	a4,48(s11)
ffffffffc0206946:	000a3783          	ld	a5,0(s4)
ffffffffc020694a:	9cb6                	add	s9,s9,a3
ffffffffc020694c:	000cb023          	sd	zero,0(s9)
ffffffffc0206950:	2705                	addiw	a4,a4,1
ffffffffc0206952:	018db683          	ld	a3,24(s11)
ffffffffc0206956:	02eda823          	sw	a4,48(s11)
ffffffffc020695a:	03b7b423          	sd	s11,40(a5) # 7ffff028 <_binary_bin_sfs_img_size+0x7ff89d28>
ffffffffc020695e:	c0200737          	lui	a4,0xc0200
ffffffffc0206962:	1ee6ed63          	bltu	a3,a4,ffffffffc0206b5c <do_execve+0x6d6>
ffffffffc0206966:	000bb703          	ld	a4,0(s7)
ffffffffc020696a:	73c4                	ld	s1,160(a5)
ffffffffc020696c:	12000613          	li	a2,288
ffffffffc0206970:	8e99                	sub	a3,a3,a4
ffffffffc0206972:	f7d4                	sd	a3,168(a5)
ffffffffc0206974:	4581                	li	a1,0
ffffffffc0206976:	8526                	mv	a0,s1
ffffffffc0206978:	1bf040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc020697c:	67ae                	ld	a5,200(sp)
ffffffffc020697e:	e8a0                	sd	s0,80(s1)
ffffffffc0206980:	0184b823          	sd	s8,16(s1)
ffffffffc0206984:	10f4b423          	sd	a5,264(s1)
ffffffffc0206988:	0584bc23          	sd	s8,88(s1)
ffffffffc020698c:	10002773          	csrr	a4,sstatus
ffffffffc0206990:	000a3783          	ld	a5,0(s4)
ffffffffc0206994:	edd77713          	andi	a4,a4,-291
ffffffffc0206998:	02076713          	ori	a4,a4,32
ffffffffc020699c:	77dc                	ld	a5,168(a5)
ffffffffc020699e:	10e4b023          	sd	a4,256(s1)
ffffffffc02069a2:	577d                	li	a4,-1
ffffffffc02069a4:	177e                	slli	a4,a4,0x3f
ffffffffc02069a6:	83b1                	srli	a5,a5,0xc
ffffffffc02069a8:	8fd9                	or	a5,a5,a4
ffffffffc02069aa:	18079073          	csrw	satp,a5
ffffffffc02069ae:	12000073          	sfence.vma
ffffffffc02069b2:	854e                	mv	a0,s3
ffffffffc02069b4:	bb3fe0ef          	jal	ra,ffffffffc0205566 <sysfile_close>
ffffffffc02069b8:	147d                	addi	s0,s0,-1
ffffffffc02069ba:	040e                	slli	s0,s0,0x3
ffffffffc02069bc:	199c                	addi	a5,sp,240
ffffffffc02069be:	943e                	add	s0,s0,a5
ffffffffc02069c0:	6008                	ld	a0,0(s0)
ffffffffc02069c2:	1461                	addi	s0,s0,-8
ffffffffc02069c4:	e7afb0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02069c8:	ff641ce3          	bne	s0,s6,ffffffffc02069c0 <do_execve+0x53a>
ffffffffc02069cc:	000a3403          	ld	s0,0(s4)
ffffffffc02069d0:	4641                	li	a2,16
ffffffffc02069d2:	4581                	li	a1,0
ffffffffc02069d4:	0b440413          	addi	s0,s0,180
ffffffffc02069d8:	8522                	mv	a0,s0
ffffffffc02069da:	15d040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc02069de:	463d                	li	a2,15
ffffffffc02069e0:	10ac                	addi	a1,sp,104
ffffffffc02069e2:	8522                	mv	a0,s0
ffffffffc02069e4:	1a5040ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc02069e8:	bbbd                	j	ffffffffc0206766 <do_execve+0x2e0>
ffffffffc02069ea:	5af2                	lw	s5,60(sp)
ffffffffc02069ec:	7442                	ld	s0,48(sp)
ffffffffc02069ee:	892a                	mv	s2,a0
ffffffffc02069f0:	1a82                	slli	s5,s5,0x20
ffffffffc02069f2:	0e010c93          	addi	s9,sp,224
ffffffffc02069f6:	020ada93          	srli	s5,s5,0x20
ffffffffc02069fa:	b955                	j	ffffffffc02066ae <do_execve+0x228>
ffffffffc02069fc:	855e                	mv	a0,s7
ffffffffc02069fe:	d00fd0ef          	jal	ra,ffffffffc0203efe <exit_mmap>
ffffffffc0206a02:	018bb503          	ld	a0,24(s7)
ffffffffc0206a06:	882ff0ef          	jal	ra,ffffffffc0205a88 <put_pgdir.isra.0>
ffffffffc0206a0a:	855e                	mv	a0,s7
ffffffffc0206a0c:	b56fd0ef          	jal	ra,ffffffffc0203d62 <mm_destroy>
ffffffffc0206a10:	b66d                	j	ffffffffc02065ba <do_execve+0x134>
ffffffffc0206a12:	57f6                	lw	a5,124(sp)
ffffffffc0206a14:	4941                	li	s2,16
ffffffffc0206a16:	0017f693          	andi	a3,a5,1
ffffffffc0206a1a:	c299                	beqz	a3,ffffffffc0206a20 <do_execve+0x59a>
ffffffffc0206a1c:	4961                	li	s2,24
ffffffffc0206a1e:	4691                	li	a3,4
ffffffffc0206a20:	0027f713          	andi	a4,a5,2
ffffffffc0206a24:	c709                	beqz	a4,ffffffffc0206a2e <do_execve+0x5a8>
ffffffffc0206a26:	0026e693          	ori	a3,a3,2
ffffffffc0206a2a:	00496913          	ori	s2,s2,4
ffffffffc0206a2e:	8b91                	andi	a5,a5,4
ffffffffc0206a30:	efc5                	bnez	a5,ffffffffc0206ae8 <do_execve+0x662>
ffffffffc0206a32:	65aa                	ld	a1,136(sp)
ffffffffc0206a34:	4701                	li	a4,0
ffffffffc0206a36:	856e                	mv	a0,s11
ffffffffc0206a38:	b7cfd0ef          	jal	ra,ffffffffc0203db4 <mm_map>
ffffffffc0206a3c:	f55d                	bnez	a0,ffffffffc02069ea <do_execve+0x564>
ffffffffc0206a3e:	64aa                	ld	s1,136(sp)
ffffffffc0206a40:	7c0a                	ld	s8,160(sp)
ffffffffc0206a42:	6b6a                	ld	s6,152(sp)
ffffffffc0206a44:	77fd                	lui	a5,0xfffff
ffffffffc0206a46:	00f4fab3          	and	s5,s1,a5
ffffffffc0206a4a:	9c26                	add	s8,s8,s1
ffffffffc0206a4c:	9b26                	add	s6,s6,s1
ffffffffc0206a4e:	8456                	mv	s0,s5
ffffffffc0206a50:	db8af3e3          	bgeu	s5,s8,ffffffffc02067f6 <do_execve+0x370>
ffffffffc0206a54:	018db503          	ld	a0,24(s11)
ffffffffc0206a58:	864a                	mv	a2,s2
ffffffffc0206a5a:	85a2                	mv	a1,s0
ffffffffc0206a5c:	8d2fd0ef          	jal	ra,ffffffffc0203b2e <pgdir_alloc_page>
ffffffffc0206a60:	c949                	beqz	a0,ffffffffc0206af2 <do_execve+0x66c>
ffffffffc0206a62:	000d3683          	ld	a3,0(s10)
ffffffffc0206a66:	6722                	ld	a4,8(sp)
ffffffffc0206a68:	000cb783          	ld	a5,0(s9)
ffffffffc0206a6c:	8d15                	sub	a0,a0,a3
ffffffffc0206a6e:	8519                	srai	a0,a0,0x6
ffffffffc0206a70:	953a                	add	a0,a0,a4
ffffffffc0206a72:	6742                	ld	a4,16(sp)
ffffffffc0206a74:	00e576b3          	and	a3,a0,a4
ffffffffc0206a78:	0532                	slli	a0,a0,0xc
ffffffffc0206a7a:	0cf6f463          	bgeu	a3,a5,ffffffffc0206b42 <do_execve+0x6bc>
ffffffffc0206a7e:	000bba83          	ld	s5,0(s7)
ffffffffc0206a82:	6605                	lui	a2,0x1
ffffffffc0206a84:	4581                	li	a1,0
ffffffffc0206a86:	9aaa                	add	s5,s5,a0
ffffffffc0206a88:	8556                	mv	a0,s5
ffffffffc0206a8a:	0ad040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0206a8e:	6785                	lui	a5,0x1
ffffffffc0206a90:	97a2                	add	a5,a5,s0
ffffffffc0206a92:	86a6                	mv	a3,s1
ffffffffc0206a94:	0084f363          	bgeu	s1,s0,ffffffffc0206a9a <do_execve+0x614>
ffffffffc0206a98:	86a2                	mv	a3,s0
ffffffffc0206a9a:	885a                	mv	a6,s6
ffffffffc0206a9c:	0167f363          	bgeu	a5,s6,ffffffffc0206aa2 <do_execve+0x61c>
ffffffffc0206aa0:	883e                	mv	a6,a5
ffffffffc0206aa2:	0106e663          	bltu	a3,a6,ffffffffc0206aae <do_execve+0x628>
ffffffffc0206aa6:	d587f8e3          	bgeu	a5,s8,ffffffffc02067f6 <do_execve+0x370>
ffffffffc0206aaa:	843e                	mv	s0,a5
ffffffffc0206aac:	b765                	j	ffffffffc0206a54 <do_execve+0x5ce>
ffffffffc0206aae:	658a                	ld	a1,128(sp)
ffffffffc0206ab0:	4601                	li	a2,0
ffffffffc0206ab2:	854e                	mv	a0,s3
ffffffffc0206ab4:	8d85                	sub	a1,a1,s1
ffffffffc0206ab6:	95b6                	add	a1,a1,a3
ffffffffc0206ab8:	e8c2                	sd	a6,80(sp)
ffffffffc0206aba:	e4be                	sd	a5,72(sp)
ffffffffc0206abc:	e0b6                	sd	a3,64(sp)
ffffffffc0206abe:	cdbfe0ef          	jal	ra,ffffffffc0205798 <sysfile_seek>
ffffffffc0206ac2:	6686                	ld	a3,64(sp)
ffffffffc0206ac4:	67a6                	ld	a5,72(sp)
ffffffffc0206ac6:	6846                	ld	a6,80(sp)
ffffffffc0206ac8:	f10d                	bnez	a0,ffffffffc02069ea <do_execve+0x564>
ffffffffc0206aca:	408685b3          	sub	a1,a3,s0
ffffffffc0206ace:	40d80633          	sub	a2,a6,a3
ffffffffc0206ad2:	95d6                	add	a1,a1,s5
ffffffffc0206ad4:	854e                	mv	a0,s3
ffffffffc0206ad6:	e4be                	sd	a5,72(sp)
ffffffffc0206ad8:	e0b2                	sd	a2,64(sp)
ffffffffc0206ada:	a91fe0ef          	jal	ra,ffffffffc020556a <sysfile_read>
ffffffffc0206ade:	6606                	ld	a2,64(sp)
ffffffffc0206ae0:	67a6                	ld	a5,72(sp)
ffffffffc0206ae2:	fca602e3          	beq	a2,a0,ffffffffc0206aa6 <do_execve+0x620>
ffffffffc0206ae6:	be45                	j	ffffffffc0206696 <do_execve+0x210>
ffffffffc0206ae8:	0016e693          	ori	a3,a3,1
ffffffffc0206aec:	00296913          	ori	s2,s2,2
ffffffffc0206af0:	b789                	j	ffffffffc0206a32 <do_execve+0x5ac>
ffffffffc0206af2:	5af2                	lw	s5,60(sp)
ffffffffc0206af4:	7442                	ld	s0,48(sp)
ffffffffc0206af6:	0e010c93          	addi	s9,sp,224
ffffffffc0206afa:	1a82                	slli	s5,s5,0x20
ffffffffc0206afc:	020ada93          	srli	s5,s5,0x20
ffffffffc0206b00:	5971                	li	s2,-4
ffffffffc0206b02:	b675                	j	ffffffffc02066ae <do_execve+0x228>
ffffffffc0206b04:	5975                	li	s2,-3
ffffffffc0206b06:	b185                	j	ffffffffc0206766 <do_execve+0x2e0>
ffffffffc0206b08:	5975                	li	s2,-3
ffffffffc0206b0a:	c40b98e3          	bnez	s7,ffffffffc020675a <do_execve+0x2d4>
ffffffffc0206b0e:	b9a1                	j	ffffffffc0206766 <do_execve+0x2e0>
ffffffffc0206b10:	fe0b8ae3          	beqz	s7,ffffffffc0206b04 <do_execve+0x67e>
ffffffffc0206b14:	038b8513          	addi	a0,s7,56
ffffffffc0206b18:	a55fd0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0206b1c:	5975                	li	s2,-3
ffffffffc0206b1e:	040ba823          	sw	zero,80(s7)
ffffffffc0206b22:	b191                	j	ffffffffc0206766 <do_execve+0x2e0>
ffffffffc0206b24:	7442                	ld	s0,48(sp)
ffffffffc0206b26:	5af2                	lw	s5,60(sp)
ffffffffc0206b28:	5961                	li	s2,-8
ffffffffc0206b2a:	bead                	j	ffffffffc02066a4 <do_execve+0x21e>
ffffffffc0206b2c:	8456                	mv	s0,s5
ffffffffc0206b2e:	5971                	li	s2,-4
ffffffffc0206b30:	8ae2                	mv	s5,s8
ffffffffc0206b32:	beb5                	j	ffffffffc02066ae <do_execve+0x228>
ffffffffc0206b34:	1a82                	slli	s5,s5,0x20
ffffffffc0206b36:	0e010c93          	addi	s9,sp,224
ffffffffc0206b3a:	020ada93          	srli	s5,s5,0x20
ffffffffc0206b3e:	5971                	li	s2,-4
ffffffffc0206b40:	b6bd                	j	ffffffffc02066ae <do_execve+0x228>
ffffffffc0206b42:	86aa                	mv	a3,a0
ffffffffc0206b44:	00005617          	auipc	a2,0x5
ffffffffc0206b48:	7f460613          	addi	a2,a2,2036 # ffffffffc020c338 <default_pmm_manager+0x38>
ffffffffc0206b4c:	07100593          	li	a1,113
ffffffffc0206b50:	00006517          	auipc	a0,0x6
ffffffffc0206b54:	81050513          	addi	a0,a0,-2032 # ffffffffc020c360 <default_pmm_manager+0x60>
ffffffffc0206b58:	947f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206b5c:	00006617          	auipc	a2,0x6
ffffffffc0206b60:	88460613          	addi	a2,a2,-1916 # ffffffffc020c3e0 <default_pmm_manager+0xe0>
ffffffffc0206b64:	35800593          	li	a1,856
ffffffffc0206b68:	00006517          	auipc	a0,0x6
ffffffffc0206b6c:	7d050513          	addi	a0,a0,2000 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206b70:	92ff90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206b74 <user_main>:
ffffffffc0206b74:	7179                	addi	sp,sp,-48
ffffffffc0206b76:	e84a                	sd	s2,16(sp)
ffffffffc0206b78:	00090917          	auipc	s2,0x90
ffffffffc0206b7c:	d4890913          	addi	s2,s2,-696 # ffffffffc02968c0 <current>
ffffffffc0206b80:	00093783          	ld	a5,0(s2)
ffffffffc0206b84:	00007617          	auipc	a2,0x7
ffffffffc0206b88:	9a460613          	addi	a2,a2,-1628 # ffffffffc020d528 <CSWTCH.79+0x310>
ffffffffc0206b8c:	00007517          	auipc	a0,0x7
ffffffffc0206b90:	9a450513          	addi	a0,a0,-1628 # ffffffffc020d530 <CSWTCH.79+0x318>
ffffffffc0206b94:	43cc                	lw	a1,4(a5)
ffffffffc0206b96:	f406                	sd	ra,40(sp)
ffffffffc0206b98:	f022                	sd	s0,32(sp)
ffffffffc0206b9a:	ec26                	sd	s1,24(sp)
ffffffffc0206b9c:	e032                	sd	a2,0(sp)
ffffffffc0206b9e:	e402                	sd	zero,8(sp)
ffffffffc0206ba0:	e06f90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206ba4:	6782                	ld	a5,0(sp)
ffffffffc0206ba6:	cfb9                	beqz	a5,ffffffffc0206c04 <user_main+0x90>
ffffffffc0206ba8:	003c                	addi	a5,sp,8
ffffffffc0206baa:	4401                	li	s0,0
ffffffffc0206bac:	6398                	ld	a4,0(a5)
ffffffffc0206bae:	0405                	addi	s0,s0,1
ffffffffc0206bb0:	07a1                	addi	a5,a5,8
ffffffffc0206bb2:	ff6d                	bnez	a4,ffffffffc0206bac <user_main+0x38>
ffffffffc0206bb4:	00093783          	ld	a5,0(s2)
ffffffffc0206bb8:	12000613          	li	a2,288
ffffffffc0206bbc:	6b84                	ld	s1,16(a5)
ffffffffc0206bbe:	73cc                	ld	a1,160(a5)
ffffffffc0206bc0:	6789                	lui	a5,0x2
ffffffffc0206bc2:	ee078793          	addi	a5,a5,-288 # 1ee0 <_binary_bin_swap_img_size-0x5e20>
ffffffffc0206bc6:	94be                	add	s1,s1,a5
ffffffffc0206bc8:	8526                	mv	a0,s1
ffffffffc0206bca:	7be040ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0206bce:	00093783          	ld	a5,0(s2)
ffffffffc0206bd2:	860a                	mv	a2,sp
ffffffffc0206bd4:	0004059b          	sext.w	a1,s0
ffffffffc0206bd8:	f3c4                	sd	s1,160(a5)
ffffffffc0206bda:	00007517          	auipc	a0,0x7
ffffffffc0206bde:	94e50513          	addi	a0,a0,-1714 # ffffffffc020d528 <CSWTCH.79+0x310>
ffffffffc0206be2:	8a5ff0ef          	jal	ra,ffffffffc0206486 <do_execve>
ffffffffc0206be6:	8126                	mv	sp,s1
ffffffffc0206be8:	e68fa06f          	j	ffffffffc0201250 <__trapret>
ffffffffc0206bec:	00007617          	auipc	a2,0x7
ffffffffc0206bf0:	96c60613          	addi	a2,a2,-1684 # ffffffffc020d558 <CSWTCH.79+0x340>
ffffffffc0206bf4:	47d00593          	li	a1,1149
ffffffffc0206bf8:	00006517          	auipc	a0,0x6
ffffffffc0206bfc:	74050513          	addi	a0,a0,1856 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206c00:	89ff90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206c04:	4401                	li	s0,0
ffffffffc0206c06:	b77d                	j	ffffffffc0206bb4 <user_main+0x40>

ffffffffc0206c08 <do_yield>:
ffffffffc0206c08:	00090797          	auipc	a5,0x90
ffffffffc0206c0c:	cb87b783          	ld	a5,-840(a5) # ffffffffc02968c0 <current>
ffffffffc0206c10:	4705                	li	a4,1
ffffffffc0206c12:	ef98                	sd	a4,24(a5)
ffffffffc0206c14:	4501                	li	a0,0
ffffffffc0206c16:	8082                	ret

ffffffffc0206c18 <do_wait>:
ffffffffc0206c18:	1101                	addi	sp,sp,-32
ffffffffc0206c1a:	e822                	sd	s0,16(sp)
ffffffffc0206c1c:	e426                	sd	s1,8(sp)
ffffffffc0206c1e:	ec06                	sd	ra,24(sp)
ffffffffc0206c20:	842e                	mv	s0,a1
ffffffffc0206c22:	84aa                	mv	s1,a0
ffffffffc0206c24:	c999                	beqz	a1,ffffffffc0206c3a <do_wait+0x22>
ffffffffc0206c26:	00090797          	auipc	a5,0x90
ffffffffc0206c2a:	c9a7b783          	ld	a5,-870(a5) # ffffffffc02968c0 <current>
ffffffffc0206c2e:	7788                	ld	a0,40(a5)
ffffffffc0206c30:	4685                	li	a3,1
ffffffffc0206c32:	4611                	li	a2,4
ffffffffc0206c34:	e6afd0ef          	jal	ra,ffffffffc020429e <user_mem_check>
ffffffffc0206c38:	c909                	beqz	a0,ffffffffc0206c4a <do_wait+0x32>
ffffffffc0206c3a:	85a2                	mv	a1,s0
ffffffffc0206c3c:	6442                	ld	s0,16(sp)
ffffffffc0206c3e:	60e2                	ld	ra,24(sp)
ffffffffc0206c40:	8526                	mv	a0,s1
ffffffffc0206c42:	64a2                	ld	s1,8(sp)
ffffffffc0206c44:	6105                	addi	sp,sp,32
ffffffffc0206c46:	d1eff06f          	j	ffffffffc0206164 <do_wait.part.0>
ffffffffc0206c4a:	60e2                	ld	ra,24(sp)
ffffffffc0206c4c:	6442                	ld	s0,16(sp)
ffffffffc0206c4e:	64a2                	ld	s1,8(sp)
ffffffffc0206c50:	5575                	li	a0,-3
ffffffffc0206c52:	6105                	addi	sp,sp,32
ffffffffc0206c54:	8082                	ret

ffffffffc0206c56 <do_kill>:
ffffffffc0206c56:	1141                	addi	sp,sp,-16
ffffffffc0206c58:	6789                	lui	a5,0x2
ffffffffc0206c5a:	e406                	sd	ra,8(sp)
ffffffffc0206c5c:	e022                	sd	s0,0(sp)
ffffffffc0206c5e:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206c62:	17f9                	addi	a5,a5,-2
ffffffffc0206c64:	02e7e963          	bltu	a5,a4,ffffffffc0206c96 <do_kill+0x40>
ffffffffc0206c68:	842a                	mv	s0,a0
ffffffffc0206c6a:	45a9                	li	a1,10
ffffffffc0206c6c:	2501                	sext.w	a0,a0
ffffffffc0206c6e:	194040ef          	jal	ra,ffffffffc020ae02 <hash32>
ffffffffc0206c72:	02051793          	slli	a5,a0,0x20
ffffffffc0206c76:	01c7d513          	srli	a0,a5,0x1c
ffffffffc0206c7a:	0008b797          	auipc	a5,0x8b
ffffffffc0206c7e:	b4678793          	addi	a5,a5,-1210 # ffffffffc02917c0 <hash_list>
ffffffffc0206c82:	953e                	add	a0,a0,a5
ffffffffc0206c84:	87aa                	mv	a5,a0
ffffffffc0206c86:	a029                	j	ffffffffc0206c90 <do_kill+0x3a>
ffffffffc0206c88:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0206c8c:	00870b63          	beq	a4,s0,ffffffffc0206ca2 <do_kill+0x4c>
ffffffffc0206c90:	679c                	ld	a5,8(a5)
ffffffffc0206c92:	fef51be3          	bne	a0,a5,ffffffffc0206c88 <do_kill+0x32>
ffffffffc0206c96:	5475                	li	s0,-3
ffffffffc0206c98:	60a2                	ld	ra,8(sp)
ffffffffc0206c9a:	8522                	mv	a0,s0
ffffffffc0206c9c:	6402                	ld	s0,0(sp)
ffffffffc0206c9e:	0141                	addi	sp,sp,16
ffffffffc0206ca0:	8082                	ret
ffffffffc0206ca2:	fd87a703          	lw	a4,-40(a5)
ffffffffc0206ca6:	00177693          	andi	a3,a4,1
ffffffffc0206caa:	e295                	bnez	a3,ffffffffc0206cce <do_kill+0x78>
ffffffffc0206cac:	4bd4                	lw	a3,20(a5)
ffffffffc0206cae:	00176713          	ori	a4,a4,1
ffffffffc0206cb2:	fce7ac23          	sw	a4,-40(a5)
ffffffffc0206cb6:	4401                	li	s0,0
ffffffffc0206cb8:	fe06d0e3          	bgez	a3,ffffffffc0206c98 <do_kill+0x42>
ffffffffc0206cbc:	f2878513          	addi	a0,a5,-216
ffffffffc0206cc0:	45a000ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc0206cc4:	60a2                	ld	ra,8(sp)
ffffffffc0206cc6:	8522                	mv	a0,s0
ffffffffc0206cc8:	6402                	ld	s0,0(sp)
ffffffffc0206cca:	0141                	addi	sp,sp,16
ffffffffc0206ccc:	8082                	ret
ffffffffc0206cce:	545d                	li	s0,-9
ffffffffc0206cd0:	b7e1                	j	ffffffffc0206c98 <do_kill+0x42>

ffffffffc0206cd2 <proc_init>:
ffffffffc0206cd2:	1101                	addi	sp,sp,-32
ffffffffc0206cd4:	e426                	sd	s1,8(sp)
ffffffffc0206cd6:	0008f797          	auipc	a5,0x8f
ffffffffc0206cda:	aea78793          	addi	a5,a5,-1302 # ffffffffc02957c0 <proc_list>
ffffffffc0206cde:	ec06                	sd	ra,24(sp)
ffffffffc0206ce0:	e822                	sd	s0,16(sp)
ffffffffc0206ce2:	e04a                	sd	s2,0(sp)
ffffffffc0206ce4:	0008b497          	auipc	s1,0x8b
ffffffffc0206ce8:	adc48493          	addi	s1,s1,-1316 # ffffffffc02917c0 <hash_list>
ffffffffc0206cec:	e79c                	sd	a5,8(a5)
ffffffffc0206cee:	e39c                	sd	a5,0(a5)
ffffffffc0206cf0:	0008f717          	auipc	a4,0x8f
ffffffffc0206cf4:	ad070713          	addi	a4,a4,-1328 # ffffffffc02957c0 <proc_list>
ffffffffc0206cf8:	87a6                	mv	a5,s1
ffffffffc0206cfa:	e79c                	sd	a5,8(a5)
ffffffffc0206cfc:	e39c                	sd	a5,0(a5)
ffffffffc0206cfe:	07c1                	addi	a5,a5,16
ffffffffc0206d00:	fef71de3          	bne	a4,a5,ffffffffc0206cfa <proc_init+0x28>
ffffffffc0206d04:	cddfe0ef          	jal	ra,ffffffffc02059e0 <alloc_proc>
ffffffffc0206d08:	00090917          	auipc	s2,0x90
ffffffffc0206d0c:	bc090913          	addi	s2,s2,-1088 # ffffffffc02968c8 <idleproc>
ffffffffc0206d10:	00a93023          	sd	a0,0(s2)
ffffffffc0206d14:	842a                	mv	s0,a0
ffffffffc0206d16:	12050863          	beqz	a0,ffffffffc0206e46 <proc_init+0x174>
ffffffffc0206d1a:	4789                	li	a5,2
ffffffffc0206d1c:	e11c                	sd	a5,0(a0)
ffffffffc0206d1e:	0000a797          	auipc	a5,0xa
ffffffffc0206d22:	2e278793          	addi	a5,a5,738 # ffffffffc0211000 <bootstack>
ffffffffc0206d26:	e91c                	sd	a5,16(a0)
ffffffffc0206d28:	4785                	li	a5,1
ffffffffc0206d2a:	ed1c                	sd	a5,24(a0)
ffffffffc0206d2c:	caefe0ef          	jal	ra,ffffffffc02051da <files_create>
ffffffffc0206d30:	14a43423          	sd	a0,328(s0)
ffffffffc0206d34:	0e050d63          	beqz	a0,ffffffffc0206e2e <proc_init+0x15c>
ffffffffc0206d38:	00093403          	ld	s0,0(s2)
ffffffffc0206d3c:	4641                	li	a2,16
ffffffffc0206d3e:	4581                	li	a1,0
ffffffffc0206d40:	14843703          	ld	a4,328(s0)
ffffffffc0206d44:	0b440413          	addi	s0,s0,180
ffffffffc0206d48:	8522                	mv	a0,s0
ffffffffc0206d4a:	4b1c                	lw	a5,16(a4)
ffffffffc0206d4c:	2785                	addiw	a5,a5,1
ffffffffc0206d4e:	cb1c                	sw	a5,16(a4)
ffffffffc0206d50:	5e6040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0206d54:	463d                	li	a2,15
ffffffffc0206d56:	00007597          	auipc	a1,0x7
ffffffffc0206d5a:	86258593          	addi	a1,a1,-1950 # ffffffffc020d5b8 <CSWTCH.79+0x3a0>
ffffffffc0206d5e:	8522                	mv	a0,s0
ffffffffc0206d60:	628040ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0206d64:	00090717          	auipc	a4,0x90
ffffffffc0206d68:	b7470713          	addi	a4,a4,-1164 # ffffffffc02968d8 <nr_process>
ffffffffc0206d6c:	431c                	lw	a5,0(a4)
ffffffffc0206d6e:	00093683          	ld	a3,0(s2)
ffffffffc0206d72:	4601                	li	a2,0
ffffffffc0206d74:	2785                	addiw	a5,a5,1
ffffffffc0206d76:	4581                	li	a1,0
ffffffffc0206d78:	fffff517          	auipc	a0,0xfffff
ffffffffc0206d7c:	5be50513          	addi	a0,a0,1470 # ffffffffc0206336 <init_main>
ffffffffc0206d80:	c31c                	sw	a5,0(a4)
ffffffffc0206d82:	00090797          	auipc	a5,0x90
ffffffffc0206d86:	b2d7bf23          	sd	a3,-1218(a5) # ffffffffc02968c0 <current>
ffffffffc0206d8a:	a28ff0ef          	jal	ra,ffffffffc0205fb2 <kernel_thread>
ffffffffc0206d8e:	842a                	mv	s0,a0
ffffffffc0206d90:	08a05363          	blez	a0,ffffffffc0206e16 <proc_init+0x144>
ffffffffc0206d94:	6789                	lui	a5,0x2
ffffffffc0206d96:	fff5071b          	addiw	a4,a0,-1
ffffffffc0206d9a:	17f9                	addi	a5,a5,-2
ffffffffc0206d9c:	2501                	sext.w	a0,a0
ffffffffc0206d9e:	02e7e363          	bltu	a5,a4,ffffffffc0206dc4 <proc_init+0xf2>
ffffffffc0206da2:	45a9                	li	a1,10
ffffffffc0206da4:	05e040ef          	jal	ra,ffffffffc020ae02 <hash32>
ffffffffc0206da8:	02051793          	slli	a5,a0,0x20
ffffffffc0206dac:	01c7d693          	srli	a3,a5,0x1c
ffffffffc0206db0:	96a6                	add	a3,a3,s1
ffffffffc0206db2:	87b6                	mv	a5,a3
ffffffffc0206db4:	a029                	j	ffffffffc0206dbe <proc_init+0xec>
ffffffffc0206db6:	f2c7a703          	lw	a4,-212(a5) # 1f2c <_binary_bin_swap_img_size-0x5dd4>
ffffffffc0206dba:	04870b63          	beq	a4,s0,ffffffffc0206e10 <proc_init+0x13e>
ffffffffc0206dbe:	679c                	ld	a5,8(a5)
ffffffffc0206dc0:	fef69be3          	bne	a3,a5,ffffffffc0206db6 <proc_init+0xe4>
ffffffffc0206dc4:	4781                	li	a5,0
ffffffffc0206dc6:	0b478493          	addi	s1,a5,180
ffffffffc0206dca:	4641                	li	a2,16
ffffffffc0206dcc:	4581                	li	a1,0
ffffffffc0206dce:	00090417          	auipc	s0,0x90
ffffffffc0206dd2:	b0240413          	addi	s0,s0,-1278 # ffffffffc02968d0 <initproc>
ffffffffc0206dd6:	8526                	mv	a0,s1
ffffffffc0206dd8:	e01c                	sd	a5,0(s0)
ffffffffc0206dda:	55c040ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0206dde:	463d                	li	a2,15
ffffffffc0206de0:	00007597          	auipc	a1,0x7
ffffffffc0206de4:	80058593          	addi	a1,a1,-2048 # ffffffffc020d5e0 <CSWTCH.79+0x3c8>
ffffffffc0206de8:	8526                	mv	a0,s1
ffffffffc0206dea:	59e040ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc0206dee:	00093783          	ld	a5,0(s2)
ffffffffc0206df2:	c7d1                	beqz	a5,ffffffffc0206e7e <proc_init+0x1ac>
ffffffffc0206df4:	43dc                	lw	a5,4(a5)
ffffffffc0206df6:	e7c1                	bnez	a5,ffffffffc0206e7e <proc_init+0x1ac>
ffffffffc0206df8:	601c                	ld	a5,0(s0)
ffffffffc0206dfa:	c3b5                	beqz	a5,ffffffffc0206e5e <proc_init+0x18c>
ffffffffc0206dfc:	43d8                	lw	a4,4(a5)
ffffffffc0206dfe:	4785                	li	a5,1
ffffffffc0206e00:	04f71f63          	bne	a4,a5,ffffffffc0206e5e <proc_init+0x18c>
ffffffffc0206e04:	60e2                	ld	ra,24(sp)
ffffffffc0206e06:	6442                	ld	s0,16(sp)
ffffffffc0206e08:	64a2                	ld	s1,8(sp)
ffffffffc0206e0a:	6902                	ld	s2,0(sp)
ffffffffc0206e0c:	6105                	addi	sp,sp,32
ffffffffc0206e0e:	8082                	ret
ffffffffc0206e10:	f2878793          	addi	a5,a5,-216
ffffffffc0206e14:	bf4d                	j	ffffffffc0206dc6 <proc_init+0xf4>
ffffffffc0206e16:	00006617          	auipc	a2,0x6
ffffffffc0206e1a:	7aa60613          	addi	a2,a2,1962 # ffffffffc020d5c0 <CSWTCH.79+0x3a8>
ffffffffc0206e1e:	4c900593          	li	a1,1225
ffffffffc0206e22:	00006517          	auipc	a0,0x6
ffffffffc0206e26:	51650513          	addi	a0,a0,1302 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206e2a:	e74f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206e2e:	00006617          	auipc	a2,0x6
ffffffffc0206e32:	76260613          	addi	a2,a2,1890 # ffffffffc020d590 <CSWTCH.79+0x378>
ffffffffc0206e36:	4bd00593          	li	a1,1213
ffffffffc0206e3a:	00006517          	auipc	a0,0x6
ffffffffc0206e3e:	4fe50513          	addi	a0,a0,1278 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206e42:	e5cf90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206e46:	00006617          	auipc	a2,0x6
ffffffffc0206e4a:	73260613          	addi	a2,a2,1842 # ffffffffc020d578 <CSWTCH.79+0x360>
ffffffffc0206e4e:	4b300593          	li	a1,1203
ffffffffc0206e52:	00006517          	auipc	a0,0x6
ffffffffc0206e56:	4e650513          	addi	a0,a0,1254 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206e5a:	e44f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206e5e:	00006697          	auipc	a3,0x6
ffffffffc0206e62:	7b268693          	addi	a3,a3,1970 # ffffffffc020d610 <CSWTCH.79+0x3f8>
ffffffffc0206e66:	00005617          	auipc	a2,0x5
ffffffffc0206e6a:	9b260613          	addi	a2,a2,-1614 # ffffffffc020b818 <commands+0x210>
ffffffffc0206e6e:	4d000593          	li	a1,1232
ffffffffc0206e72:	00006517          	auipc	a0,0x6
ffffffffc0206e76:	4c650513          	addi	a0,a0,1222 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206e7a:	e24f90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0206e7e:	00006697          	auipc	a3,0x6
ffffffffc0206e82:	76a68693          	addi	a3,a3,1898 # ffffffffc020d5e8 <CSWTCH.79+0x3d0>
ffffffffc0206e86:	00005617          	auipc	a2,0x5
ffffffffc0206e8a:	99260613          	addi	a2,a2,-1646 # ffffffffc020b818 <commands+0x210>
ffffffffc0206e8e:	4cf00593          	li	a1,1231
ffffffffc0206e92:	00006517          	auipc	a0,0x6
ffffffffc0206e96:	4a650513          	addi	a0,a0,1190 # ffffffffc020d338 <CSWTCH.79+0x120>
ffffffffc0206e9a:	e04f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0206e9e <cpu_idle>:
ffffffffc0206e9e:	1141                	addi	sp,sp,-16
ffffffffc0206ea0:	e022                	sd	s0,0(sp)
ffffffffc0206ea2:	e406                	sd	ra,8(sp)
ffffffffc0206ea4:	00090417          	auipc	s0,0x90
ffffffffc0206ea8:	a1c40413          	addi	s0,s0,-1508 # ffffffffc02968c0 <current>
ffffffffc0206eac:	6018                	ld	a4,0(s0)
ffffffffc0206eae:	6f1c                	ld	a5,24(a4)
ffffffffc0206eb0:	dffd                	beqz	a5,ffffffffc0206eae <cpu_idle+0x10>
ffffffffc0206eb2:	31a000ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc0206eb6:	bfdd                	j	ffffffffc0206eac <cpu_idle+0xe>

ffffffffc0206eb8 <lab6_set_priority>:
ffffffffc0206eb8:	1141                	addi	sp,sp,-16
ffffffffc0206eba:	e022                	sd	s0,0(sp)
ffffffffc0206ebc:	85aa                	mv	a1,a0
ffffffffc0206ebe:	842a                	mv	s0,a0
ffffffffc0206ec0:	00006517          	auipc	a0,0x6
ffffffffc0206ec4:	77850513          	addi	a0,a0,1912 # ffffffffc020d638 <CSWTCH.79+0x420>
ffffffffc0206ec8:	e406                	sd	ra,8(sp)
ffffffffc0206eca:	adcf90ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0206ece:	00090797          	auipc	a5,0x90
ffffffffc0206ed2:	9f27b783          	ld	a5,-1550(a5) # ffffffffc02968c0 <current>
ffffffffc0206ed6:	e801                	bnez	s0,ffffffffc0206ee6 <lab6_set_priority+0x2e>
ffffffffc0206ed8:	60a2                	ld	ra,8(sp)
ffffffffc0206eda:	6402                	ld	s0,0(sp)
ffffffffc0206edc:	4705                	li	a4,1
ffffffffc0206ede:	14e7a223          	sw	a4,324(a5)
ffffffffc0206ee2:	0141                	addi	sp,sp,16
ffffffffc0206ee4:	8082                	ret
ffffffffc0206ee6:	60a2                	ld	ra,8(sp)
ffffffffc0206ee8:	1487a223          	sw	s0,324(a5)
ffffffffc0206eec:	6402                	ld	s0,0(sp)
ffffffffc0206eee:	0141                	addi	sp,sp,16
ffffffffc0206ef0:	8082                	ret

ffffffffc0206ef2 <do_sleep>:
ffffffffc0206ef2:	c539                	beqz	a0,ffffffffc0206f40 <do_sleep+0x4e>
ffffffffc0206ef4:	7179                	addi	sp,sp,-48
ffffffffc0206ef6:	f022                	sd	s0,32(sp)
ffffffffc0206ef8:	f406                	sd	ra,40(sp)
ffffffffc0206efa:	842a                	mv	s0,a0
ffffffffc0206efc:	100027f3          	csrr	a5,sstatus
ffffffffc0206f00:	8b89                	andi	a5,a5,2
ffffffffc0206f02:	e3a9                	bnez	a5,ffffffffc0206f44 <do_sleep+0x52>
ffffffffc0206f04:	00090797          	auipc	a5,0x90
ffffffffc0206f08:	9bc7b783          	ld	a5,-1604(a5) # ffffffffc02968c0 <current>
ffffffffc0206f0c:	0818                	addi	a4,sp,16
ffffffffc0206f0e:	c02a                	sw	a0,0(sp)
ffffffffc0206f10:	ec3a                	sd	a4,24(sp)
ffffffffc0206f12:	e83a                	sd	a4,16(sp)
ffffffffc0206f14:	e43e                	sd	a5,8(sp)
ffffffffc0206f16:	4705                	li	a4,1
ffffffffc0206f18:	c398                	sw	a4,0(a5)
ffffffffc0206f1a:	80000737          	lui	a4,0x80000
ffffffffc0206f1e:	840a                	mv	s0,sp
ffffffffc0206f20:	0709                	addi	a4,a4,2
ffffffffc0206f22:	0ee7a623          	sw	a4,236(a5)
ffffffffc0206f26:	8522                	mv	a0,s0
ffffffffc0206f28:	364000ef          	jal	ra,ffffffffc020728c <add_timer>
ffffffffc0206f2c:	2a0000ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc0206f30:	8522                	mv	a0,s0
ffffffffc0206f32:	422000ef          	jal	ra,ffffffffc0207354 <del_timer>
ffffffffc0206f36:	70a2                	ld	ra,40(sp)
ffffffffc0206f38:	7402                	ld	s0,32(sp)
ffffffffc0206f3a:	4501                	li	a0,0
ffffffffc0206f3c:	6145                	addi	sp,sp,48
ffffffffc0206f3e:	8082                	ret
ffffffffc0206f40:	4501                	li	a0,0
ffffffffc0206f42:	8082                	ret
ffffffffc0206f44:	d2ff90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0206f48:	00090797          	auipc	a5,0x90
ffffffffc0206f4c:	9787b783          	ld	a5,-1672(a5) # ffffffffc02968c0 <current>
ffffffffc0206f50:	0818                	addi	a4,sp,16
ffffffffc0206f52:	c022                	sw	s0,0(sp)
ffffffffc0206f54:	e43e                	sd	a5,8(sp)
ffffffffc0206f56:	ec3a                	sd	a4,24(sp)
ffffffffc0206f58:	e83a                	sd	a4,16(sp)
ffffffffc0206f5a:	4705                	li	a4,1
ffffffffc0206f5c:	c398                	sw	a4,0(a5)
ffffffffc0206f5e:	80000737          	lui	a4,0x80000
ffffffffc0206f62:	0709                	addi	a4,a4,2
ffffffffc0206f64:	840a                	mv	s0,sp
ffffffffc0206f66:	8522                	mv	a0,s0
ffffffffc0206f68:	0ee7a623          	sw	a4,236(a5)
ffffffffc0206f6c:	320000ef          	jal	ra,ffffffffc020728c <add_timer>
ffffffffc0206f70:	cfdf90ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0206f74:	bf65                	j	ffffffffc0206f2c <do_sleep+0x3a>

ffffffffc0206f76 <switch_to>:
ffffffffc0206f76:	00153023          	sd	ra,0(a0)
ffffffffc0206f7a:	00253423          	sd	sp,8(a0)
ffffffffc0206f7e:	e900                	sd	s0,16(a0)
ffffffffc0206f80:	ed04                	sd	s1,24(a0)
ffffffffc0206f82:	03253023          	sd	s2,32(a0)
ffffffffc0206f86:	03353423          	sd	s3,40(a0)
ffffffffc0206f8a:	03453823          	sd	s4,48(a0)
ffffffffc0206f8e:	03553c23          	sd	s5,56(a0)
ffffffffc0206f92:	05653023          	sd	s6,64(a0)
ffffffffc0206f96:	05753423          	sd	s7,72(a0)
ffffffffc0206f9a:	05853823          	sd	s8,80(a0)
ffffffffc0206f9e:	05953c23          	sd	s9,88(a0)
ffffffffc0206fa2:	07a53023          	sd	s10,96(a0)
ffffffffc0206fa6:	07b53423          	sd	s11,104(a0)
ffffffffc0206faa:	0005b083          	ld	ra,0(a1)
ffffffffc0206fae:	0085b103          	ld	sp,8(a1)
ffffffffc0206fb2:	6980                	ld	s0,16(a1)
ffffffffc0206fb4:	6d84                	ld	s1,24(a1)
ffffffffc0206fb6:	0205b903          	ld	s2,32(a1)
ffffffffc0206fba:	0285b983          	ld	s3,40(a1)
ffffffffc0206fbe:	0305ba03          	ld	s4,48(a1)
ffffffffc0206fc2:	0385ba83          	ld	s5,56(a1)
ffffffffc0206fc6:	0405bb03          	ld	s6,64(a1)
ffffffffc0206fca:	0485bb83          	ld	s7,72(a1)
ffffffffc0206fce:	0505bc03          	ld	s8,80(a1)
ffffffffc0206fd2:	0585bc83          	ld	s9,88(a1)
ffffffffc0206fd6:	0605bd03          	ld	s10,96(a1)
ffffffffc0206fda:	0685bd83          	ld	s11,104(a1)
ffffffffc0206fde:	8082                	ret

ffffffffc0206fe0 <RR_init>:
ffffffffc0206fe0:	e508                	sd	a0,8(a0)
ffffffffc0206fe2:	e108                	sd	a0,0(a0)
ffffffffc0206fe4:	00052823          	sw	zero,16(a0)
ffffffffc0206fe8:	8082                	ret

ffffffffc0206fea <RR_pick_next>:
ffffffffc0206fea:	651c                	ld	a5,8(a0)
ffffffffc0206fec:	00f50563          	beq	a0,a5,ffffffffc0206ff6 <RR_pick_next+0xc>
ffffffffc0206ff0:	ef078513          	addi	a0,a5,-272
ffffffffc0206ff4:	8082                	ret
ffffffffc0206ff6:	4501                	li	a0,0
ffffffffc0206ff8:	8082                	ret

ffffffffc0206ffa <RR_proc_tick>:
ffffffffc0206ffa:	1205a783          	lw	a5,288(a1)
ffffffffc0206ffe:	00f05563          	blez	a5,ffffffffc0207008 <RR_proc_tick+0xe>
ffffffffc0207002:	37fd                	addiw	a5,a5,-1
ffffffffc0207004:	12f5a023          	sw	a5,288(a1)
ffffffffc0207008:	e399                	bnez	a5,ffffffffc020700e <RR_proc_tick+0x14>
ffffffffc020700a:	4785                	li	a5,1
ffffffffc020700c:	ed9c                	sd	a5,24(a1)
ffffffffc020700e:	8082                	ret

ffffffffc0207010 <RR_dequeue>:
ffffffffc0207010:	1185b703          	ld	a4,280(a1)
ffffffffc0207014:	11058793          	addi	a5,a1,272
ffffffffc0207018:	02e78363          	beq	a5,a4,ffffffffc020703e <RR_dequeue+0x2e>
ffffffffc020701c:	1085b683          	ld	a3,264(a1)
ffffffffc0207020:	00a69f63          	bne	a3,a0,ffffffffc020703e <RR_dequeue+0x2e>
ffffffffc0207024:	1105b503          	ld	a0,272(a1)
ffffffffc0207028:	4a90                	lw	a2,16(a3)
ffffffffc020702a:	e518                	sd	a4,8(a0)
ffffffffc020702c:	e308                	sd	a0,0(a4)
ffffffffc020702e:	10f5bc23          	sd	a5,280(a1)
ffffffffc0207032:	10f5b823          	sd	a5,272(a1)
ffffffffc0207036:	fff6079b          	addiw	a5,a2,-1
ffffffffc020703a:	ca9c                	sw	a5,16(a3)
ffffffffc020703c:	8082                	ret
ffffffffc020703e:	1141                	addi	sp,sp,-16
ffffffffc0207040:	00006697          	auipc	a3,0x6
ffffffffc0207044:	61068693          	addi	a3,a3,1552 # ffffffffc020d650 <CSWTCH.79+0x438>
ffffffffc0207048:	00004617          	auipc	a2,0x4
ffffffffc020704c:	7d060613          	addi	a2,a2,2000 # ffffffffc020b818 <commands+0x210>
ffffffffc0207050:	03c00593          	li	a1,60
ffffffffc0207054:	00006517          	auipc	a0,0x6
ffffffffc0207058:	63450513          	addi	a0,a0,1588 # ffffffffc020d688 <CSWTCH.79+0x470>
ffffffffc020705c:	e406                	sd	ra,8(sp)
ffffffffc020705e:	c40f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207062 <RR_enqueue>:
ffffffffc0207062:	1185b703          	ld	a4,280(a1)
ffffffffc0207066:	11058793          	addi	a5,a1,272
ffffffffc020706a:	02e79d63          	bne	a5,a4,ffffffffc02070a4 <RR_enqueue+0x42>
ffffffffc020706e:	6118                	ld	a4,0(a0)
ffffffffc0207070:	1205a683          	lw	a3,288(a1)
ffffffffc0207074:	e11c                	sd	a5,0(a0)
ffffffffc0207076:	e71c                	sd	a5,8(a4)
ffffffffc0207078:	10a5bc23          	sd	a0,280(a1)
ffffffffc020707c:	10e5b823          	sd	a4,272(a1)
ffffffffc0207080:	495c                	lw	a5,20(a0)
ffffffffc0207082:	ea89                	bnez	a3,ffffffffc0207094 <RR_enqueue+0x32>
ffffffffc0207084:	12f5a023          	sw	a5,288(a1)
ffffffffc0207088:	491c                	lw	a5,16(a0)
ffffffffc020708a:	10a5b423          	sd	a0,264(a1)
ffffffffc020708e:	2785                	addiw	a5,a5,1
ffffffffc0207090:	c91c                	sw	a5,16(a0)
ffffffffc0207092:	8082                	ret
ffffffffc0207094:	fed7c8e3          	blt	a5,a3,ffffffffc0207084 <RR_enqueue+0x22>
ffffffffc0207098:	491c                	lw	a5,16(a0)
ffffffffc020709a:	10a5b423          	sd	a0,264(a1)
ffffffffc020709e:	2785                	addiw	a5,a5,1
ffffffffc02070a0:	c91c                	sw	a5,16(a0)
ffffffffc02070a2:	8082                	ret
ffffffffc02070a4:	1141                	addi	sp,sp,-16
ffffffffc02070a6:	00006697          	auipc	a3,0x6
ffffffffc02070aa:	60268693          	addi	a3,a3,1538 # ffffffffc020d6a8 <CSWTCH.79+0x490>
ffffffffc02070ae:	00004617          	auipc	a2,0x4
ffffffffc02070b2:	76a60613          	addi	a2,a2,1898 # ffffffffc020b818 <commands+0x210>
ffffffffc02070b6:	02800593          	li	a1,40
ffffffffc02070ba:	00006517          	auipc	a0,0x6
ffffffffc02070be:	5ce50513          	addi	a0,a0,1486 # ffffffffc020d688 <CSWTCH.79+0x470>
ffffffffc02070c2:	e406                	sd	ra,8(sp)
ffffffffc02070c4:	bdaf90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02070c8 <sched_init>:
ffffffffc02070c8:	1141                	addi	sp,sp,-16
ffffffffc02070ca:	0008a717          	auipc	a4,0x8a
ffffffffc02070ce:	f5670713          	addi	a4,a4,-170 # ffffffffc0291020 <default_sched_class>
ffffffffc02070d2:	e022                	sd	s0,0(sp)
ffffffffc02070d4:	e406                	sd	ra,8(sp)
ffffffffc02070d6:	0008e797          	auipc	a5,0x8e
ffffffffc02070da:	71a78793          	addi	a5,a5,1818 # ffffffffc02957f0 <timer_list>
ffffffffc02070de:	6714                	ld	a3,8(a4)
ffffffffc02070e0:	0008e517          	auipc	a0,0x8e
ffffffffc02070e4:	6f050513          	addi	a0,a0,1776 # ffffffffc02957d0 <__rq>
ffffffffc02070e8:	e79c                	sd	a5,8(a5)
ffffffffc02070ea:	e39c                	sd	a5,0(a5)
ffffffffc02070ec:	4795                	li	a5,5
ffffffffc02070ee:	c95c                	sw	a5,20(a0)
ffffffffc02070f0:	0008f417          	auipc	s0,0x8f
ffffffffc02070f4:	7f840413          	addi	s0,s0,2040 # ffffffffc02968e8 <sched_class>
ffffffffc02070f8:	0008f797          	auipc	a5,0x8f
ffffffffc02070fc:	7ea7b423          	sd	a0,2024(a5) # ffffffffc02968e0 <rq>
ffffffffc0207100:	e018                	sd	a4,0(s0)
ffffffffc0207102:	9682                	jalr	a3
ffffffffc0207104:	601c                	ld	a5,0(s0)
ffffffffc0207106:	6402                	ld	s0,0(sp)
ffffffffc0207108:	60a2                	ld	ra,8(sp)
ffffffffc020710a:	638c                	ld	a1,0(a5)
ffffffffc020710c:	00006517          	auipc	a0,0x6
ffffffffc0207110:	5cc50513          	addi	a0,a0,1484 # ffffffffc020d6d8 <CSWTCH.79+0x4c0>
ffffffffc0207114:	0141                	addi	sp,sp,16
ffffffffc0207116:	890f906f          	j	ffffffffc02001a6 <cprintf>

ffffffffc020711a <wakeup_proc>:
ffffffffc020711a:	4118                	lw	a4,0(a0)
ffffffffc020711c:	1101                	addi	sp,sp,-32
ffffffffc020711e:	ec06                	sd	ra,24(sp)
ffffffffc0207120:	e822                	sd	s0,16(sp)
ffffffffc0207122:	e426                	sd	s1,8(sp)
ffffffffc0207124:	478d                	li	a5,3
ffffffffc0207126:	08f70363          	beq	a4,a5,ffffffffc02071ac <wakeup_proc+0x92>
ffffffffc020712a:	842a                	mv	s0,a0
ffffffffc020712c:	100027f3          	csrr	a5,sstatus
ffffffffc0207130:	8b89                	andi	a5,a5,2
ffffffffc0207132:	4481                	li	s1,0
ffffffffc0207134:	e7bd                	bnez	a5,ffffffffc02071a2 <wakeup_proc+0x88>
ffffffffc0207136:	4789                	li	a5,2
ffffffffc0207138:	04f70863          	beq	a4,a5,ffffffffc0207188 <wakeup_proc+0x6e>
ffffffffc020713c:	c01c                	sw	a5,0(s0)
ffffffffc020713e:	0e042623          	sw	zero,236(s0)
ffffffffc0207142:	0008f797          	auipc	a5,0x8f
ffffffffc0207146:	77e7b783          	ld	a5,1918(a5) # ffffffffc02968c0 <current>
ffffffffc020714a:	02878363          	beq	a5,s0,ffffffffc0207170 <wakeup_proc+0x56>
ffffffffc020714e:	0008f797          	auipc	a5,0x8f
ffffffffc0207152:	77a7b783          	ld	a5,1914(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207156:	00f40d63          	beq	s0,a5,ffffffffc0207170 <wakeup_proc+0x56>
ffffffffc020715a:	0008f797          	auipc	a5,0x8f
ffffffffc020715e:	78e7b783          	ld	a5,1934(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207162:	6b9c                	ld	a5,16(a5)
ffffffffc0207164:	85a2                	mv	a1,s0
ffffffffc0207166:	0008f517          	auipc	a0,0x8f
ffffffffc020716a:	77a53503          	ld	a0,1914(a0) # ffffffffc02968e0 <rq>
ffffffffc020716e:	9782                	jalr	a5
ffffffffc0207170:	e491                	bnez	s1,ffffffffc020717c <wakeup_proc+0x62>
ffffffffc0207172:	60e2                	ld	ra,24(sp)
ffffffffc0207174:	6442                	ld	s0,16(sp)
ffffffffc0207176:	64a2                	ld	s1,8(sp)
ffffffffc0207178:	6105                	addi	sp,sp,32
ffffffffc020717a:	8082                	ret
ffffffffc020717c:	6442                	ld	s0,16(sp)
ffffffffc020717e:	60e2                	ld	ra,24(sp)
ffffffffc0207180:	64a2                	ld	s1,8(sp)
ffffffffc0207182:	6105                	addi	sp,sp,32
ffffffffc0207184:	ae9f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207188:	00006617          	auipc	a2,0x6
ffffffffc020718c:	5a060613          	addi	a2,a2,1440 # ffffffffc020d728 <CSWTCH.79+0x510>
ffffffffc0207190:	05200593          	li	a1,82
ffffffffc0207194:	00006517          	auipc	a0,0x6
ffffffffc0207198:	57c50513          	addi	a0,a0,1404 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc020719c:	b6af90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc02071a0:	bfc1                	j	ffffffffc0207170 <wakeup_proc+0x56>
ffffffffc02071a2:	ad1f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02071a6:	4018                	lw	a4,0(s0)
ffffffffc02071a8:	4485                	li	s1,1
ffffffffc02071aa:	b771                	j	ffffffffc0207136 <wakeup_proc+0x1c>
ffffffffc02071ac:	00006697          	auipc	a3,0x6
ffffffffc02071b0:	54468693          	addi	a3,a3,1348 # ffffffffc020d6f0 <CSWTCH.79+0x4d8>
ffffffffc02071b4:	00004617          	auipc	a2,0x4
ffffffffc02071b8:	66460613          	addi	a2,a2,1636 # ffffffffc020b818 <commands+0x210>
ffffffffc02071bc:	04300593          	li	a1,67
ffffffffc02071c0:	00006517          	auipc	a0,0x6
ffffffffc02071c4:	55050513          	addi	a0,a0,1360 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc02071c8:	ad6f90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02071cc <schedule>:
ffffffffc02071cc:	7179                	addi	sp,sp,-48
ffffffffc02071ce:	f406                	sd	ra,40(sp)
ffffffffc02071d0:	f022                	sd	s0,32(sp)
ffffffffc02071d2:	ec26                	sd	s1,24(sp)
ffffffffc02071d4:	e84a                	sd	s2,16(sp)
ffffffffc02071d6:	e44e                	sd	s3,8(sp)
ffffffffc02071d8:	e052                	sd	s4,0(sp)
ffffffffc02071da:	100027f3          	csrr	a5,sstatus
ffffffffc02071de:	8b89                	andi	a5,a5,2
ffffffffc02071e0:	4a01                	li	s4,0
ffffffffc02071e2:	e3cd                	bnez	a5,ffffffffc0207284 <schedule+0xb8>
ffffffffc02071e4:	0008f497          	auipc	s1,0x8f
ffffffffc02071e8:	6dc48493          	addi	s1,s1,1756 # ffffffffc02968c0 <current>
ffffffffc02071ec:	608c                	ld	a1,0(s1)
ffffffffc02071ee:	0008f997          	auipc	s3,0x8f
ffffffffc02071f2:	6fa98993          	addi	s3,s3,1786 # ffffffffc02968e8 <sched_class>
ffffffffc02071f6:	0008f917          	auipc	s2,0x8f
ffffffffc02071fa:	6ea90913          	addi	s2,s2,1770 # ffffffffc02968e0 <rq>
ffffffffc02071fe:	4194                	lw	a3,0(a1)
ffffffffc0207200:	0005bc23          	sd	zero,24(a1)
ffffffffc0207204:	4709                	li	a4,2
ffffffffc0207206:	0009b783          	ld	a5,0(s3)
ffffffffc020720a:	00093503          	ld	a0,0(s2)
ffffffffc020720e:	04e68e63          	beq	a3,a4,ffffffffc020726a <schedule+0x9e>
ffffffffc0207212:	739c                	ld	a5,32(a5)
ffffffffc0207214:	9782                	jalr	a5
ffffffffc0207216:	842a                	mv	s0,a0
ffffffffc0207218:	c521                	beqz	a0,ffffffffc0207260 <schedule+0x94>
ffffffffc020721a:	0009b783          	ld	a5,0(s3)
ffffffffc020721e:	00093503          	ld	a0,0(s2)
ffffffffc0207222:	85a2                	mv	a1,s0
ffffffffc0207224:	6f9c                	ld	a5,24(a5)
ffffffffc0207226:	9782                	jalr	a5
ffffffffc0207228:	441c                	lw	a5,8(s0)
ffffffffc020722a:	6098                	ld	a4,0(s1)
ffffffffc020722c:	2785                	addiw	a5,a5,1
ffffffffc020722e:	c41c                	sw	a5,8(s0)
ffffffffc0207230:	00870563          	beq	a4,s0,ffffffffc020723a <schedule+0x6e>
ffffffffc0207234:	8522                	mv	a0,s0
ffffffffc0207236:	8c9fe0ef          	jal	ra,ffffffffc0205afe <proc_run>
ffffffffc020723a:	000a1a63          	bnez	s4,ffffffffc020724e <schedule+0x82>
ffffffffc020723e:	70a2                	ld	ra,40(sp)
ffffffffc0207240:	7402                	ld	s0,32(sp)
ffffffffc0207242:	64e2                	ld	s1,24(sp)
ffffffffc0207244:	6942                	ld	s2,16(sp)
ffffffffc0207246:	69a2                	ld	s3,8(sp)
ffffffffc0207248:	6a02                	ld	s4,0(sp)
ffffffffc020724a:	6145                	addi	sp,sp,48
ffffffffc020724c:	8082                	ret
ffffffffc020724e:	7402                	ld	s0,32(sp)
ffffffffc0207250:	70a2                	ld	ra,40(sp)
ffffffffc0207252:	64e2                	ld	s1,24(sp)
ffffffffc0207254:	6942                	ld	s2,16(sp)
ffffffffc0207256:	69a2                	ld	s3,8(sp)
ffffffffc0207258:	6a02                	ld	s4,0(sp)
ffffffffc020725a:	6145                	addi	sp,sp,48
ffffffffc020725c:	a11f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0207260:	0008f417          	auipc	s0,0x8f
ffffffffc0207264:	66843403          	ld	s0,1640(s0) # ffffffffc02968c8 <idleproc>
ffffffffc0207268:	b7c1                	j	ffffffffc0207228 <schedule+0x5c>
ffffffffc020726a:	0008f717          	auipc	a4,0x8f
ffffffffc020726e:	65e73703          	ld	a4,1630(a4) # ffffffffc02968c8 <idleproc>
ffffffffc0207272:	fae580e3          	beq	a1,a4,ffffffffc0207212 <schedule+0x46>
ffffffffc0207276:	6b9c                	ld	a5,16(a5)
ffffffffc0207278:	9782                	jalr	a5
ffffffffc020727a:	0009b783          	ld	a5,0(s3)
ffffffffc020727e:	00093503          	ld	a0,0(s2)
ffffffffc0207282:	bf41                	j	ffffffffc0207212 <schedule+0x46>
ffffffffc0207284:	9eff90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207288:	4a05                	li	s4,1
ffffffffc020728a:	bfa9                	j	ffffffffc02071e4 <schedule+0x18>

ffffffffc020728c <add_timer>:
ffffffffc020728c:	1141                	addi	sp,sp,-16
ffffffffc020728e:	e022                	sd	s0,0(sp)
ffffffffc0207290:	e406                	sd	ra,8(sp)
ffffffffc0207292:	842a                	mv	s0,a0
ffffffffc0207294:	100027f3          	csrr	a5,sstatus
ffffffffc0207298:	8b89                	andi	a5,a5,2
ffffffffc020729a:	4501                	li	a0,0
ffffffffc020729c:	eba5                	bnez	a5,ffffffffc020730c <add_timer+0x80>
ffffffffc020729e:	401c                	lw	a5,0(s0)
ffffffffc02072a0:	cbb5                	beqz	a5,ffffffffc0207314 <add_timer+0x88>
ffffffffc02072a2:	6418                	ld	a4,8(s0)
ffffffffc02072a4:	cb25                	beqz	a4,ffffffffc0207314 <add_timer+0x88>
ffffffffc02072a6:	6c18                	ld	a4,24(s0)
ffffffffc02072a8:	01040593          	addi	a1,s0,16
ffffffffc02072ac:	08e59463          	bne	a1,a4,ffffffffc0207334 <add_timer+0xa8>
ffffffffc02072b0:	0008e617          	auipc	a2,0x8e
ffffffffc02072b4:	54060613          	addi	a2,a2,1344 # ffffffffc02957f0 <timer_list>
ffffffffc02072b8:	6618                	ld	a4,8(a2)
ffffffffc02072ba:	00c71863          	bne	a4,a2,ffffffffc02072ca <add_timer+0x3e>
ffffffffc02072be:	a80d                	j	ffffffffc02072f0 <add_timer+0x64>
ffffffffc02072c0:	6718                	ld	a4,8(a4)
ffffffffc02072c2:	9f95                	subw	a5,a5,a3
ffffffffc02072c4:	c01c                	sw	a5,0(s0)
ffffffffc02072c6:	02c70563          	beq	a4,a2,ffffffffc02072f0 <add_timer+0x64>
ffffffffc02072ca:	ff072683          	lw	a3,-16(a4)
ffffffffc02072ce:	fed7f9e3          	bgeu	a5,a3,ffffffffc02072c0 <add_timer+0x34>
ffffffffc02072d2:	40f687bb          	subw	a5,a3,a5
ffffffffc02072d6:	fef72823          	sw	a5,-16(a4)
ffffffffc02072da:	631c                	ld	a5,0(a4)
ffffffffc02072dc:	e30c                	sd	a1,0(a4)
ffffffffc02072de:	e78c                	sd	a1,8(a5)
ffffffffc02072e0:	ec18                	sd	a4,24(s0)
ffffffffc02072e2:	e81c                	sd	a5,16(s0)
ffffffffc02072e4:	c105                	beqz	a0,ffffffffc0207304 <add_timer+0x78>
ffffffffc02072e6:	6402                	ld	s0,0(sp)
ffffffffc02072e8:	60a2                	ld	ra,8(sp)
ffffffffc02072ea:	0141                	addi	sp,sp,16
ffffffffc02072ec:	981f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02072f0:	0008e717          	auipc	a4,0x8e
ffffffffc02072f4:	50070713          	addi	a4,a4,1280 # ffffffffc02957f0 <timer_list>
ffffffffc02072f8:	631c                	ld	a5,0(a4)
ffffffffc02072fa:	e30c                	sd	a1,0(a4)
ffffffffc02072fc:	e78c                	sd	a1,8(a5)
ffffffffc02072fe:	ec18                	sd	a4,24(s0)
ffffffffc0207300:	e81c                	sd	a5,16(s0)
ffffffffc0207302:	f175                	bnez	a0,ffffffffc02072e6 <add_timer+0x5a>
ffffffffc0207304:	60a2                	ld	ra,8(sp)
ffffffffc0207306:	6402                	ld	s0,0(sp)
ffffffffc0207308:	0141                	addi	sp,sp,16
ffffffffc020730a:	8082                	ret
ffffffffc020730c:	967f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0207310:	4505                	li	a0,1
ffffffffc0207312:	b771                	j	ffffffffc020729e <add_timer+0x12>
ffffffffc0207314:	00006697          	auipc	a3,0x6
ffffffffc0207318:	43468693          	addi	a3,a3,1076 # ffffffffc020d748 <CSWTCH.79+0x530>
ffffffffc020731c:	00004617          	auipc	a2,0x4
ffffffffc0207320:	4fc60613          	addi	a2,a2,1276 # ffffffffc020b818 <commands+0x210>
ffffffffc0207324:	07a00593          	li	a1,122
ffffffffc0207328:	00006517          	auipc	a0,0x6
ffffffffc020732c:	3e850513          	addi	a0,a0,1000 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc0207330:	96ef90ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207334:	00006697          	auipc	a3,0x6
ffffffffc0207338:	44468693          	addi	a3,a3,1092 # ffffffffc020d778 <CSWTCH.79+0x560>
ffffffffc020733c:	00004617          	auipc	a2,0x4
ffffffffc0207340:	4dc60613          	addi	a2,a2,1244 # ffffffffc020b818 <commands+0x210>
ffffffffc0207344:	07b00593          	li	a1,123
ffffffffc0207348:	00006517          	auipc	a0,0x6
ffffffffc020734c:	3c850513          	addi	a0,a0,968 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc0207350:	94ef90ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207354 <del_timer>:
ffffffffc0207354:	1101                	addi	sp,sp,-32
ffffffffc0207356:	e822                	sd	s0,16(sp)
ffffffffc0207358:	ec06                	sd	ra,24(sp)
ffffffffc020735a:	e426                	sd	s1,8(sp)
ffffffffc020735c:	842a                	mv	s0,a0
ffffffffc020735e:	100027f3          	csrr	a5,sstatus
ffffffffc0207362:	8b89                	andi	a5,a5,2
ffffffffc0207364:	01050493          	addi	s1,a0,16
ffffffffc0207368:	eb9d                	bnez	a5,ffffffffc020739e <del_timer+0x4a>
ffffffffc020736a:	6d1c                	ld	a5,24(a0)
ffffffffc020736c:	02978463          	beq	a5,s1,ffffffffc0207394 <del_timer+0x40>
ffffffffc0207370:	4114                	lw	a3,0(a0)
ffffffffc0207372:	6918                	ld	a4,16(a0)
ffffffffc0207374:	ce81                	beqz	a3,ffffffffc020738c <del_timer+0x38>
ffffffffc0207376:	0008e617          	auipc	a2,0x8e
ffffffffc020737a:	47a60613          	addi	a2,a2,1146 # ffffffffc02957f0 <timer_list>
ffffffffc020737e:	00c78763          	beq	a5,a2,ffffffffc020738c <del_timer+0x38>
ffffffffc0207382:	ff07a603          	lw	a2,-16(a5)
ffffffffc0207386:	9eb1                	addw	a3,a3,a2
ffffffffc0207388:	fed7a823          	sw	a3,-16(a5)
ffffffffc020738c:	e71c                	sd	a5,8(a4)
ffffffffc020738e:	e398                	sd	a4,0(a5)
ffffffffc0207390:	ec04                	sd	s1,24(s0)
ffffffffc0207392:	e804                	sd	s1,16(s0)
ffffffffc0207394:	60e2                	ld	ra,24(sp)
ffffffffc0207396:	6442                	ld	s0,16(sp)
ffffffffc0207398:	64a2                	ld	s1,8(sp)
ffffffffc020739a:	6105                	addi	sp,sp,32
ffffffffc020739c:	8082                	ret
ffffffffc020739e:	8d5f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02073a2:	6c1c                	ld	a5,24(s0)
ffffffffc02073a4:	02978463          	beq	a5,s1,ffffffffc02073cc <del_timer+0x78>
ffffffffc02073a8:	4014                	lw	a3,0(s0)
ffffffffc02073aa:	6818                	ld	a4,16(s0)
ffffffffc02073ac:	ce81                	beqz	a3,ffffffffc02073c4 <del_timer+0x70>
ffffffffc02073ae:	0008e617          	auipc	a2,0x8e
ffffffffc02073b2:	44260613          	addi	a2,a2,1090 # ffffffffc02957f0 <timer_list>
ffffffffc02073b6:	00c78763          	beq	a5,a2,ffffffffc02073c4 <del_timer+0x70>
ffffffffc02073ba:	ff07a603          	lw	a2,-16(a5)
ffffffffc02073be:	9eb1                	addw	a3,a3,a2
ffffffffc02073c0:	fed7a823          	sw	a3,-16(a5)
ffffffffc02073c4:	e71c                	sd	a5,8(a4)
ffffffffc02073c6:	e398                	sd	a4,0(a5)
ffffffffc02073c8:	ec04                	sd	s1,24(s0)
ffffffffc02073ca:	e804                	sd	s1,16(s0)
ffffffffc02073cc:	6442                	ld	s0,16(sp)
ffffffffc02073ce:	60e2                	ld	ra,24(sp)
ffffffffc02073d0:	64a2                	ld	s1,8(sp)
ffffffffc02073d2:	6105                	addi	sp,sp,32
ffffffffc02073d4:	899f906f          	j	ffffffffc0200c6c <intr_enable>

ffffffffc02073d8 <run_timer_list>:
ffffffffc02073d8:	7139                	addi	sp,sp,-64
ffffffffc02073da:	fc06                	sd	ra,56(sp)
ffffffffc02073dc:	f822                	sd	s0,48(sp)
ffffffffc02073de:	f426                	sd	s1,40(sp)
ffffffffc02073e0:	f04a                	sd	s2,32(sp)
ffffffffc02073e2:	ec4e                	sd	s3,24(sp)
ffffffffc02073e4:	e852                	sd	s4,16(sp)
ffffffffc02073e6:	e456                	sd	s5,8(sp)
ffffffffc02073e8:	e05a                	sd	s6,0(sp)
ffffffffc02073ea:	100027f3          	csrr	a5,sstatus
ffffffffc02073ee:	8b89                	andi	a5,a5,2
ffffffffc02073f0:	4b01                	li	s6,0
ffffffffc02073f2:	efe9                	bnez	a5,ffffffffc02074cc <run_timer_list+0xf4>
ffffffffc02073f4:	0008e997          	auipc	s3,0x8e
ffffffffc02073f8:	3fc98993          	addi	s3,s3,1020 # ffffffffc02957f0 <timer_list>
ffffffffc02073fc:	0089b403          	ld	s0,8(s3)
ffffffffc0207400:	07340a63          	beq	s0,s3,ffffffffc0207474 <run_timer_list+0x9c>
ffffffffc0207404:	ff042783          	lw	a5,-16(s0)
ffffffffc0207408:	ff040913          	addi	s2,s0,-16
ffffffffc020740c:	0e078763          	beqz	a5,ffffffffc02074fa <run_timer_list+0x122>
ffffffffc0207410:	fff7871b          	addiw	a4,a5,-1
ffffffffc0207414:	fee42823          	sw	a4,-16(s0)
ffffffffc0207418:	ef31                	bnez	a4,ffffffffc0207474 <run_timer_list+0x9c>
ffffffffc020741a:	00006a97          	auipc	s5,0x6
ffffffffc020741e:	3c6a8a93          	addi	s5,s5,966 # ffffffffc020d7e0 <CSWTCH.79+0x5c8>
ffffffffc0207422:	00006a17          	auipc	s4,0x6
ffffffffc0207426:	2eea0a13          	addi	s4,s4,750 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc020742a:	a005                	j	ffffffffc020744a <run_timer_list+0x72>
ffffffffc020742c:	0a07d763          	bgez	a5,ffffffffc02074da <run_timer_list+0x102>
ffffffffc0207430:	8526                	mv	a0,s1
ffffffffc0207432:	ce9ff0ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc0207436:	854a                	mv	a0,s2
ffffffffc0207438:	f1dff0ef          	jal	ra,ffffffffc0207354 <del_timer>
ffffffffc020743c:	03340c63          	beq	s0,s3,ffffffffc0207474 <run_timer_list+0x9c>
ffffffffc0207440:	ff042783          	lw	a5,-16(s0)
ffffffffc0207444:	ff040913          	addi	s2,s0,-16
ffffffffc0207448:	e795                	bnez	a5,ffffffffc0207474 <run_timer_list+0x9c>
ffffffffc020744a:	00893483          	ld	s1,8(s2)
ffffffffc020744e:	6400                	ld	s0,8(s0)
ffffffffc0207450:	0ec4a783          	lw	a5,236(s1)
ffffffffc0207454:	ffe1                	bnez	a5,ffffffffc020742c <run_timer_list+0x54>
ffffffffc0207456:	40d4                	lw	a3,4(s1)
ffffffffc0207458:	8656                	mv	a2,s5
ffffffffc020745a:	0ba00593          	li	a1,186
ffffffffc020745e:	8552                	mv	a0,s4
ffffffffc0207460:	8a6f90ef          	jal	ra,ffffffffc0200506 <__warn>
ffffffffc0207464:	8526                	mv	a0,s1
ffffffffc0207466:	cb5ff0ef          	jal	ra,ffffffffc020711a <wakeup_proc>
ffffffffc020746a:	854a                	mv	a0,s2
ffffffffc020746c:	ee9ff0ef          	jal	ra,ffffffffc0207354 <del_timer>
ffffffffc0207470:	fd3418e3          	bne	s0,s3,ffffffffc0207440 <run_timer_list+0x68>
ffffffffc0207474:	0008f597          	auipc	a1,0x8f
ffffffffc0207478:	44c5b583          	ld	a1,1100(a1) # ffffffffc02968c0 <current>
ffffffffc020747c:	c18d                	beqz	a1,ffffffffc020749e <run_timer_list+0xc6>
ffffffffc020747e:	0008f797          	auipc	a5,0x8f
ffffffffc0207482:	44a7b783          	ld	a5,1098(a5) # ffffffffc02968c8 <idleproc>
ffffffffc0207486:	04f58763          	beq	a1,a5,ffffffffc02074d4 <run_timer_list+0xfc>
ffffffffc020748a:	0008f797          	auipc	a5,0x8f
ffffffffc020748e:	45e7b783          	ld	a5,1118(a5) # ffffffffc02968e8 <sched_class>
ffffffffc0207492:	779c                	ld	a5,40(a5)
ffffffffc0207494:	0008f517          	auipc	a0,0x8f
ffffffffc0207498:	44c53503          	ld	a0,1100(a0) # ffffffffc02968e0 <rq>
ffffffffc020749c:	9782                	jalr	a5
ffffffffc020749e:	000b1c63          	bnez	s6,ffffffffc02074b6 <run_timer_list+0xde>
ffffffffc02074a2:	70e2                	ld	ra,56(sp)
ffffffffc02074a4:	7442                	ld	s0,48(sp)
ffffffffc02074a6:	74a2                	ld	s1,40(sp)
ffffffffc02074a8:	7902                	ld	s2,32(sp)
ffffffffc02074aa:	69e2                	ld	s3,24(sp)
ffffffffc02074ac:	6a42                	ld	s4,16(sp)
ffffffffc02074ae:	6aa2                	ld	s5,8(sp)
ffffffffc02074b0:	6b02                	ld	s6,0(sp)
ffffffffc02074b2:	6121                	addi	sp,sp,64
ffffffffc02074b4:	8082                	ret
ffffffffc02074b6:	7442                	ld	s0,48(sp)
ffffffffc02074b8:	70e2                	ld	ra,56(sp)
ffffffffc02074ba:	74a2                	ld	s1,40(sp)
ffffffffc02074bc:	7902                	ld	s2,32(sp)
ffffffffc02074be:	69e2                	ld	s3,24(sp)
ffffffffc02074c0:	6a42                	ld	s4,16(sp)
ffffffffc02074c2:	6aa2                	ld	s5,8(sp)
ffffffffc02074c4:	6b02                	ld	s6,0(sp)
ffffffffc02074c6:	6121                	addi	sp,sp,64
ffffffffc02074c8:	fa4f906f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc02074cc:	fa6f90ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc02074d0:	4b05                	li	s6,1
ffffffffc02074d2:	b70d                	j	ffffffffc02073f4 <run_timer_list+0x1c>
ffffffffc02074d4:	4785                	li	a5,1
ffffffffc02074d6:	ed9c                	sd	a5,24(a1)
ffffffffc02074d8:	b7d9                	j	ffffffffc020749e <run_timer_list+0xc6>
ffffffffc02074da:	00006697          	auipc	a3,0x6
ffffffffc02074de:	2de68693          	addi	a3,a3,734 # ffffffffc020d7b8 <CSWTCH.79+0x5a0>
ffffffffc02074e2:	00004617          	auipc	a2,0x4
ffffffffc02074e6:	33660613          	addi	a2,a2,822 # ffffffffc020b818 <commands+0x210>
ffffffffc02074ea:	0b600593          	li	a1,182
ffffffffc02074ee:	00006517          	auipc	a0,0x6
ffffffffc02074f2:	22250513          	addi	a0,a0,546 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc02074f6:	fa9f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02074fa:	00006697          	auipc	a3,0x6
ffffffffc02074fe:	2a668693          	addi	a3,a3,678 # ffffffffc020d7a0 <CSWTCH.79+0x588>
ffffffffc0207502:	00004617          	auipc	a2,0x4
ffffffffc0207506:	31660613          	addi	a2,a2,790 # ffffffffc020b818 <commands+0x210>
ffffffffc020750a:	0ae00593          	li	a1,174
ffffffffc020750e:	00006517          	auipc	a0,0x6
ffffffffc0207512:	20250513          	addi	a0,a0,514 # ffffffffc020d710 <CSWTCH.79+0x4f8>
ffffffffc0207516:	f89f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020751a <sys_getpid>:
ffffffffc020751a:	0008f797          	auipc	a5,0x8f
ffffffffc020751e:	3a67b783          	ld	a5,934(a5) # ffffffffc02968c0 <current>
ffffffffc0207522:	43c8                	lw	a0,4(a5)
ffffffffc0207524:	8082                	ret

ffffffffc0207526 <sys_pgdir>:
ffffffffc0207526:	4501                	li	a0,0
ffffffffc0207528:	8082                	ret

ffffffffc020752a <sys_gettime>:
ffffffffc020752a:	0008f797          	auipc	a5,0x8f
ffffffffc020752e:	3467b783          	ld	a5,838(a5) # ffffffffc0296870 <ticks>
ffffffffc0207532:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207536:	9d3d                	addw	a0,a0,a5
ffffffffc0207538:	0015151b          	slliw	a0,a0,0x1
ffffffffc020753c:	8082                	ret

ffffffffc020753e <sys_lab6_set_priority>:
ffffffffc020753e:	4108                	lw	a0,0(a0)
ffffffffc0207540:	1141                	addi	sp,sp,-16
ffffffffc0207542:	e406                	sd	ra,8(sp)
ffffffffc0207544:	975ff0ef          	jal	ra,ffffffffc0206eb8 <lab6_set_priority>
ffffffffc0207548:	60a2                	ld	ra,8(sp)
ffffffffc020754a:	4501                	li	a0,0
ffffffffc020754c:	0141                	addi	sp,sp,16
ffffffffc020754e:	8082                	ret

ffffffffc0207550 <sys_dup>:
ffffffffc0207550:	450c                	lw	a1,8(a0)
ffffffffc0207552:	4108                	lw	a0,0(a0)
ffffffffc0207554:	c80fe06f          	j	ffffffffc02059d4 <sysfile_dup>

ffffffffc0207558 <sys_getdirentry>:
ffffffffc0207558:	650c                	ld	a1,8(a0)
ffffffffc020755a:	4108                	lw	a0,0(a0)
ffffffffc020755c:	b88fe06f          	j	ffffffffc02058e4 <sysfile_getdirentry>

ffffffffc0207560 <sys_getcwd>:
ffffffffc0207560:	650c                	ld	a1,8(a0)
ffffffffc0207562:	6108                	ld	a0,0(a0)
ffffffffc0207564:	adcfe06f          	j	ffffffffc0205840 <sysfile_getcwd>

ffffffffc0207568 <sys_fsync>:
ffffffffc0207568:	4108                	lw	a0,0(a0)
ffffffffc020756a:	ad2fe06f          	j	ffffffffc020583c <sysfile_fsync>

ffffffffc020756e <sys_fstat>:
ffffffffc020756e:	650c                	ld	a1,8(a0)
ffffffffc0207570:	4108                	lw	a0,0(a0)
ffffffffc0207572:	a2afe06f          	j	ffffffffc020579c <sysfile_fstat>

ffffffffc0207576 <sys_seek>:
ffffffffc0207576:	4910                	lw	a2,16(a0)
ffffffffc0207578:	650c                	ld	a1,8(a0)
ffffffffc020757a:	4108                	lw	a0,0(a0)
ffffffffc020757c:	a1cfe06f          	j	ffffffffc0205798 <sysfile_seek>

ffffffffc0207580 <sys_write>:
ffffffffc0207580:	6910                	ld	a2,16(a0)
ffffffffc0207582:	650c                	ld	a1,8(a0)
ffffffffc0207584:	4108                	lw	a0,0(a0)
ffffffffc0207586:	8f8fe06f          	j	ffffffffc020567e <sysfile_write>

ffffffffc020758a <sys_read>:
ffffffffc020758a:	6910                	ld	a2,16(a0)
ffffffffc020758c:	650c                	ld	a1,8(a0)
ffffffffc020758e:	4108                	lw	a0,0(a0)
ffffffffc0207590:	fdbfd06f          	j	ffffffffc020556a <sysfile_read>

ffffffffc0207594 <sys_close>:
ffffffffc0207594:	4108                	lw	a0,0(a0)
ffffffffc0207596:	fd1fd06f          	j	ffffffffc0205566 <sysfile_close>

ffffffffc020759a <sys_open>:
ffffffffc020759a:	450c                	lw	a1,8(a0)
ffffffffc020759c:	6108                	ld	a0,0(a0)
ffffffffc020759e:	f95fd06f          	j	ffffffffc0205532 <sysfile_open>

ffffffffc02075a2 <sys_putc>:
ffffffffc02075a2:	4108                	lw	a0,0(a0)
ffffffffc02075a4:	1141                	addi	sp,sp,-16
ffffffffc02075a6:	e406                	sd	ra,8(sp)
ffffffffc02075a8:	c3bf80ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc02075ac:	60a2                	ld	ra,8(sp)
ffffffffc02075ae:	4501                	li	a0,0
ffffffffc02075b0:	0141                	addi	sp,sp,16
ffffffffc02075b2:	8082                	ret

ffffffffc02075b4 <sys_kill>:
ffffffffc02075b4:	4108                	lw	a0,0(a0)
ffffffffc02075b6:	ea0ff06f          	j	ffffffffc0206c56 <do_kill>

ffffffffc02075ba <sys_sleep>:
ffffffffc02075ba:	4108                	lw	a0,0(a0)
ffffffffc02075bc:	937ff06f          	j	ffffffffc0206ef2 <do_sleep>

ffffffffc02075c0 <sys_yield>:
ffffffffc02075c0:	e48ff06f          	j	ffffffffc0206c08 <do_yield>

ffffffffc02075c4 <sys_exec>:
ffffffffc02075c4:	6910                	ld	a2,16(a0)
ffffffffc02075c6:	450c                	lw	a1,8(a0)
ffffffffc02075c8:	6108                	ld	a0,0(a0)
ffffffffc02075ca:	ebdfe06f          	j	ffffffffc0206486 <do_execve>

ffffffffc02075ce <sys_wait>:
ffffffffc02075ce:	650c                	ld	a1,8(a0)
ffffffffc02075d0:	4108                	lw	a0,0(a0)
ffffffffc02075d2:	e46ff06f          	j	ffffffffc0206c18 <do_wait>

ffffffffc02075d6 <sys_fork>:
ffffffffc02075d6:	0008f797          	auipc	a5,0x8f
ffffffffc02075da:	2ea7b783          	ld	a5,746(a5) # ffffffffc02968c0 <current>
ffffffffc02075de:	73d0                	ld	a2,160(a5)
ffffffffc02075e0:	4501                	li	a0,0
ffffffffc02075e2:	6a0c                	ld	a1,16(a2)
ffffffffc02075e4:	d8afe06f          	j	ffffffffc0205b6e <do_fork>

ffffffffc02075e8 <sys_exit>:
ffffffffc02075e8:	4108                	lw	a0,0(a0)
ffffffffc02075ea:	a19fe06f          	j	ffffffffc0206002 <do_exit>

ffffffffc02075ee <syscall>:
ffffffffc02075ee:	715d                	addi	sp,sp,-80
ffffffffc02075f0:	fc26                	sd	s1,56(sp)
ffffffffc02075f2:	0008f497          	auipc	s1,0x8f
ffffffffc02075f6:	2ce48493          	addi	s1,s1,718 # ffffffffc02968c0 <current>
ffffffffc02075fa:	6098                	ld	a4,0(s1)
ffffffffc02075fc:	e0a2                	sd	s0,64(sp)
ffffffffc02075fe:	f84a                	sd	s2,48(sp)
ffffffffc0207600:	7340                	ld	s0,160(a4)
ffffffffc0207602:	e486                	sd	ra,72(sp)
ffffffffc0207604:	0ff00793          	li	a5,255
ffffffffc0207608:	05042903          	lw	s2,80(s0)
ffffffffc020760c:	0327ee63          	bltu	a5,s2,ffffffffc0207648 <syscall+0x5a>
ffffffffc0207610:	00391713          	slli	a4,s2,0x3
ffffffffc0207614:	00006797          	auipc	a5,0x6
ffffffffc0207618:	23478793          	addi	a5,a5,564 # ffffffffc020d848 <syscalls>
ffffffffc020761c:	97ba                	add	a5,a5,a4
ffffffffc020761e:	639c                	ld	a5,0(a5)
ffffffffc0207620:	c785                	beqz	a5,ffffffffc0207648 <syscall+0x5a>
ffffffffc0207622:	6c28                	ld	a0,88(s0)
ffffffffc0207624:	702c                	ld	a1,96(s0)
ffffffffc0207626:	7430                	ld	a2,104(s0)
ffffffffc0207628:	7834                	ld	a3,112(s0)
ffffffffc020762a:	7c38                	ld	a4,120(s0)
ffffffffc020762c:	e42a                	sd	a0,8(sp)
ffffffffc020762e:	e82e                	sd	a1,16(sp)
ffffffffc0207630:	ec32                	sd	a2,24(sp)
ffffffffc0207632:	f036                	sd	a3,32(sp)
ffffffffc0207634:	f43a                	sd	a4,40(sp)
ffffffffc0207636:	0028                	addi	a0,sp,8
ffffffffc0207638:	9782                	jalr	a5
ffffffffc020763a:	60a6                	ld	ra,72(sp)
ffffffffc020763c:	e828                	sd	a0,80(s0)
ffffffffc020763e:	6406                	ld	s0,64(sp)
ffffffffc0207640:	74e2                	ld	s1,56(sp)
ffffffffc0207642:	7942                	ld	s2,48(sp)
ffffffffc0207644:	6161                	addi	sp,sp,80
ffffffffc0207646:	8082                	ret
ffffffffc0207648:	8522                	mv	a0,s0
ffffffffc020764a:	941f90ef          	jal	ra,ffffffffc0200f8a <print_trapframe>
ffffffffc020764e:	609c                	ld	a5,0(s1)
ffffffffc0207650:	86ca                	mv	a3,s2
ffffffffc0207652:	00006617          	auipc	a2,0x6
ffffffffc0207656:	1ae60613          	addi	a2,a2,430 # ffffffffc020d800 <CSWTCH.79+0x5e8>
ffffffffc020765a:	43d8                	lw	a4,4(a5)
ffffffffc020765c:	0d800593          	li	a1,216
ffffffffc0207660:	0b478793          	addi	a5,a5,180
ffffffffc0207664:	00006517          	auipc	a0,0x6
ffffffffc0207668:	1cc50513          	addi	a0,a0,460 # ffffffffc020d830 <CSWTCH.79+0x618>
ffffffffc020766c:	e33f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207670 <__alloc_inode>:
ffffffffc0207670:	1141                	addi	sp,sp,-16
ffffffffc0207672:	e022                	sd	s0,0(sp)
ffffffffc0207674:	842a                	mv	s0,a0
ffffffffc0207676:	07800513          	li	a0,120
ffffffffc020767a:	e406                	sd	ra,8(sp)
ffffffffc020767c:	913fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207680:	c111                	beqz	a0,ffffffffc0207684 <__alloc_inode+0x14>
ffffffffc0207682:	cd20                	sw	s0,88(a0)
ffffffffc0207684:	60a2                	ld	ra,8(sp)
ffffffffc0207686:	6402                	ld	s0,0(sp)
ffffffffc0207688:	0141                	addi	sp,sp,16
ffffffffc020768a:	8082                	ret

ffffffffc020768c <inode_init>:
ffffffffc020768c:	4785                	li	a5,1
ffffffffc020768e:	06052023          	sw	zero,96(a0)
ffffffffc0207692:	f92c                	sd	a1,112(a0)
ffffffffc0207694:	f530                	sd	a2,104(a0)
ffffffffc0207696:	cd7c                	sw	a5,92(a0)
ffffffffc0207698:	8082                	ret

ffffffffc020769a <inode_kill>:
ffffffffc020769a:	4d78                	lw	a4,92(a0)
ffffffffc020769c:	1141                	addi	sp,sp,-16
ffffffffc020769e:	e406                	sd	ra,8(sp)
ffffffffc02076a0:	e719                	bnez	a4,ffffffffc02076ae <inode_kill+0x14>
ffffffffc02076a2:	513c                	lw	a5,96(a0)
ffffffffc02076a4:	e78d                	bnez	a5,ffffffffc02076ce <inode_kill+0x34>
ffffffffc02076a6:	60a2                	ld	ra,8(sp)
ffffffffc02076a8:	0141                	addi	sp,sp,16
ffffffffc02076aa:	995fa06f          	j	ffffffffc020203e <kfree>
ffffffffc02076ae:	00007697          	auipc	a3,0x7
ffffffffc02076b2:	99a68693          	addi	a3,a3,-1638 # ffffffffc020e048 <syscalls+0x800>
ffffffffc02076b6:	00004617          	auipc	a2,0x4
ffffffffc02076ba:	16260613          	addi	a2,a2,354 # ffffffffc020b818 <commands+0x210>
ffffffffc02076be:	02900593          	li	a1,41
ffffffffc02076c2:	00007517          	auipc	a0,0x7
ffffffffc02076c6:	9a650513          	addi	a0,a0,-1626 # ffffffffc020e068 <syscalls+0x820>
ffffffffc02076ca:	dd5f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02076ce:	00007697          	auipc	a3,0x7
ffffffffc02076d2:	9b268693          	addi	a3,a3,-1614 # ffffffffc020e080 <syscalls+0x838>
ffffffffc02076d6:	00004617          	auipc	a2,0x4
ffffffffc02076da:	14260613          	addi	a2,a2,322 # ffffffffc020b818 <commands+0x210>
ffffffffc02076de:	02a00593          	li	a1,42
ffffffffc02076e2:	00007517          	auipc	a0,0x7
ffffffffc02076e6:	98650513          	addi	a0,a0,-1658 # ffffffffc020e068 <syscalls+0x820>
ffffffffc02076ea:	db5f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02076ee <inode_ref_inc>:
ffffffffc02076ee:	4d7c                	lw	a5,92(a0)
ffffffffc02076f0:	2785                	addiw	a5,a5,1
ffffffffc02076f2:	cd7c                	sw	a5,92(a0)
ffffffffc02076f4:	0007851b          	sext.w	a0,a5
ffffffffc02076f8:	8082                	ret

ffffffffc02076fa <inode_open_inc>:
ffffffffc02076fa:	513c                	lw	a5,96(a0)
ffffffffc02076fc:	2785                	addiw	a5,a5,1
ffffffffc02076fe:	d13c                	sw	a5,96(a0)
ffffffffc0207700:	0007851b          	sext.w	a0,a5
ffffffffc0207704:	8082                	ret

ffffffffc0207706 <inode_check>:
ffffffffc0207706:	1141                	addi	sp,sp,-16
ffffffffc0207708:	e406                	sd	ra,8(sp)
ffffffffc020770a:	c90d                	beqz	a0,ffffffffc020773c <inode_check+0x36>
ffffffffc020770c:	793c                	ld	a5,112(a0)
ffffffffc020770e:	c79d                	beqz	a5,ffffffffc020773c <inode_check+0x36>
ffffffffc0207710:	6398                	ld	a4,0(a5)
ffffffffc0207712:	4625d7b7          	lui	a5,0x4625d
ffffffffc0207716:	0786                	slli	a5,a5,0x1
ffffffffc0207718:	47678793          	addi	a5,a5,1142 # 4625d476 <_binary_bin_sfs_img_size+0x461e8176>
ffffffffc020771c:	08f71063          	bne	a4,a5,ffffffffc020779c <inode_check+0x96>
ffffffffc0207720:	4d78                	lw	a4,92(a0)
ffffffffc0207722:	513c                	lw	a5,96(a0)
ffffffffc0207724:	04f74c63          	blt	a4,a5,ffffffffc020777c <inode_check+0x76>
ffffffffc0207728:	0407ca63          	bltz	a5,ffffffffc020777c <inode_check+0x76>
ffffffffc020772c:	66c1                	lui	a3,0x10
ffffffffc020772e:	02d75763          	bge	a4,a3,ffffffffc020775c <inode_check+0x56>
ffffffffc0207732:	02d7d563          	bge	a5,a3,ffffffffc020775c <inode_check+0x56>
ffffffffc0207736:	60a2                	ld	ra,8(sp)
ffffffffc0207738:	0141                	addi	sp,sp,16
ffffffffc020773a:	8082                	ret
ffffffffc020773c:	00007697          	auipc	a3,0x7
ffffffffc0207740:	96468693          	addi	a3,a3,-1692 # ffffffffc020e0a0 <syscalls+0x858>
ffffffffc0207744:	00004617          	auipc	a2,0x4
ffffffffc0207748:	0d460613          	addi	a2,a2,212 # ffffffffc020b818 <commands+0x210>
ffffffffc020774c:	06e00593          	li	a1,110
ffffffffc0207750:	00007517          	auipc	a0,0x7
ffffffffc0207754:	91850513          	addi	a0,a0,-1768 # ffffffffc020e068 <syscalls+0x820>
ffffffffc0207758:	d47f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020775c:	00007697          	auipc	a3,0x7
ffffffffc0207760:	9c468693          	addi	a3,a3,-1596 # ffffffffc020e120 <syscalls+0x8d8>
ffffffffc0207764:	00004617          	auipc	a2,0x4
ffffffffc0207768:	0b460613          	addi	a2,a2,180 # ffffffffc020b818 <commands+0x210>
ffffffffc020776c:	07200593          	li	a1,114
ffffffffc0207770:	00007517          	auipc	a0,0x7
ffffffffc0207774:	8f850513          	addi	a0,a0,-1800 # ffffffffc020e068 <syscalls+0x820>
ffffffffc0207778:	d27f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020777c:	00007697          	auipc	a3,0x7
ffffffffc0207780:	97468693          	addi	a3,a3,-1676 # ffffffffc020e0f0 <syscalls+0x8a8>
ffffffffc0207784:	00004617          	auipc	a2,0x4
ffffffffc0207788:	09460613          	addi	a2,a2,148 # ffffffffc020b818 <commands+0x210>
ffffffffc020778c:	07100593          	li	a1,113
ffffffffc0207790:	00007517          	auipc	a0,0x7
ffffffffc0207794:	8d850513          	addi	a0,a0,-1832 # ffffffffc020e068 <syscalls+0x820>
ffffffffc0207798:	d07f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020779c:	00007697          	auipc	a3,0x7
ffffffffc02077a0:	92c68693          	addi	a3,a3,-1748 # ffffffffc020e0c8 <syscalls+0x880>
ffffffffc02077a4:	00004617          	auipc	a2,0x4
ffffffffc02077a8:	07460613          	addi	a2,a2,116 # ffffffffc020b818 <commands+0x210>
ffffffffc02077ac:	06f00593          	li	a1,111
ffffffffc02077b0:	00007517          	auipc	a0,0x7
ffffffffc02077b4:	8b850513          	addi	a0,a0,-1864 # ffffffffc020e068 <syscalls+0x820>
ffffffffc02077b8:	ce7f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02077bc <inode_ref_dec>:
ffffffffc02077bc:	4d7c                	lw	a5,92(a0)
ffffffffc02077be:	1101                	addi	sp,sp,-32
ffffffffc02077c0:	ec06                	sd	ra,24(sp)
ffffffffc02077c2:	e822                	sd	s0,16(sp)
ffffffffc02077c4:	e426                	sd	s1,8(sp)
ffffffffc02077c6:	e04a                	sd	s2,0(sp)
ffffffffc02077c8:	06f05e63          	blez	a5,ffffffffc0207844 <inode_ref_dec+0x88>
ffffffffc02077cc:	fff7849b          	addiw	s1,a5,-1
ffffffffc02077d0:	cd64                	sw	s1,92(a0)
ffffffffc02077d2:	842a                	mv	s0,a0
ffffffffc02077d4:	e09d                	bnez	s1,ffffffffc02077fa <inode_ref_dec+0x3e>
ffffffffc02077d6:	793c                	ld	a5,112(a0)
ffffffffc02077d8:	c7b1                	beqz	a5,ffffffffc0207824 <inode_ref_dec+0x68>
ffffffffc02077da:	0487b903          	ld	s2,72(a5)
ffffffffc02077de:	04090363          	beqz	s2,ffffffffc0207824 <inode_ref_dec+0x68>
ffffffffc02077e2:	00007597          	auipc	a1,0x7
ffffffffc02077e6:	9ee58593          	addi	a1,a1,-1554 # ffffffffc020e1d0 <syscalls+0x988>
ffffffffc02077ea:	f1dff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc02077ee:	8522                	mv	a0,s0
ffffffffc02077f0:	9902                	jalr	s2
ffffffffc02077f2:	c501                	beqz	a0,ffffffffc02077fa <inode_ref_dec+0x3e>
ffffffffc02077f4:	57c5                	li	a5,-15
ffffffffc02077f6:	00f51963          	bne	a0,a5,ffffffffc0207808 <inode_ref_dec+0x4c>
ffffffffc02077fa:	60e2                	ld	ra,24(sp)
ffffffffc02077fc:	6442                	ld	s0,16(sp)
ffffffffc02077fe:	6902                	ld	s2,0(sp)
ffffffffc0207800:	8526                	mv	a0,s1
ffffffffc0207802:	64a2                	ld	s1,8(sp)
ffffffffc0207804:	6105                	addi	sp,sp,32
ffffffffc0207806:	8082                	ret
ffffffffc0207808:	85aa                	mv	a1,a0
ffffffffc020780a:	00007517          	auipc	a0,0x7
ffffffffc020780e:	9ce50513          	addi	a0,a0,-1586 # ffffffffc020e1d8 <syscalls+0x990>
ffffffffc0207812:	995f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207816:	60e2                	ld	ra,24(sp)
ffffffffc0207818:	6442                	ld	s0,16(sp)
ffffffffc020781a:	6902                	ld	s2,0(sp)
ffffffffc020781c:	8526                	mv	a0,s1
ffffffffc020781e:	64a2                	ld	s1,8(sp)
ffffffffc0207820:	6105                	addi	sp,sp,32
ffffffffc0207822:	8082                	ret
ffffffffc0207824:	00007697          	auipc	a3,0x7
ffffffffc0207828:	95c68693          	addi	a3,a3,-1700 # ffffffffc020e180 <syscalls+0x938>
ffffffffc020782c:	00004617          	auipc	a2,0x4
ffffffffc0207830:	fec60613          	addi	a2,a2,-20 # ffffffffc020b818 <commands+0x210>
ffffffffc0207834:	04400593          	li	a1,68
ffffffffc0207838:	00007517          	auipc	a0,0x7
ffffffffc020783c:	83050513          	addi	a0,a0,-2000 # ffffffffc020e068 <syscalls+0x820>
ffffffffc0207840:	c5ff80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207844:	00007697          	auipc	a3,0x7
ffffffffc0207848:	91c68693          	addi	a3,a3,-1764 # ffffffffc020e160 <syscalls+0x918>
ffffffffc020784c:	00004617          	auipc	a2,0x4
ffffffffc0207850:	fcc60613          	addi	a2,a2,-52 # ffffffffc020b818 <commands+0x210>
ffffffffc0207854:	03f00593          	li	a1,63
ffffffffc0207858:	00007517          	auipc	a0,0x7
ffffffffc020785c:	81050513          	addi	a0,a0,-2032 # ffffffffc020e068 <syscalls+0x820>
ffffffffc0207860:	c3ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207864 <inode_open_dec>:
ffffffffc0207864:	513c                	lw	a5,96(a0)
ffffffffc0207866:	1101                	addi	sp,sp,-32
ffffffffc0207868:	ec06                	sd	ra,24(sp)
ffffffffc020786a:	e822                	sd	s0,16(sp)
ffffffffc020786c:	e426                	sd	s1,8(sp)
ffffffffc020786e:	e04a                	sd	s2,0(sp)
ffffffffc0207870:	06f05b63          	blez	a5,ffffffffc02078e6 <inode_open_dec+0x82>
ffffffffc0207874:	fff7849b          	addiw	s1,a5,-1
ffffffffc0207878:	d124                	sw	s1,96(a0)
ffffffffc020787a:	842a                	mv	s0,a0
ffffffffc020787c:	e085                	bnez	s1,ffffffffc020789c <inode_open_dec+0x38>
ffffffffc020787e:	793c                	ld	a5,112(a0)
ffffffffc0207880:	c3b9                	beqz	a5,ffffffffc02078c6 <inode_open_dec+0x62>
ffffffffc0207882:	0107b903          	ld	s2,16(a5)
ffffffffc0207886:	04090063          	beqz	s2,ffffffffc02078c6 <inode_open_dec+0x62>
ffffffffc020788a:	00007597          	auipc	a1,0x7
ffffffffc020788e:	9de58593          	addi	a1,a1,-1570 # ffffffffc020e268 <syscalls+0xa20>
ffffffffc0207892:	e75ff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0207896:	8522                	mv	a0,s0
ffffffffc0207898:	9902                	jalr	s2
ffffffffc020789a:	e901                	bnez	a0,ffffffffc02078aa <inode_open_dec+0x46>
ffffffffc020789c:	60e2                	ld	ra,24(sp)
ffffffffc020789e:	6442                	ld	s0,16(sp)
ffffffffc02078a0:	6902                	ld	s2,0(sp)
ffffffffc02078a2:	8526                	mv	a0,s1
ffffffffc02078a4:	64a2                	ld	s1,8(sp)
ffffffffc02078a6:	6105                	addi	sp,sp,32
ffffffffc02078a8:	8082                	ret
ffffffffc02078aa:	85aa                	mv	a1,a0
ffffffffc02078ac:	00007517          	auipc	a0,0x7
ffffffffc02078b0:	9c450513          	addi	a0,a0,-1596 # ffffffffc020e270 <syscalls+0xa28>
ffffffffc02078b4:	8f3f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02078b8:	60e2                	ld	ra,24(sp)
ffffffffc02078ba:	6442                	ld	s0,16(sp)
ffffffffc02078bc:	6902                	ld	s2,0(sp)
ffffffffc02078be:	8526                	mv	a0,s1
ffffffffc02078c0:	64a2                	ld	s1,8(sp)
ffffffffc02078c2:	6105                	addi	sp,sp,32
ffffffffc02078c4:	8082                	ret
ffffffffc02078c6:	00007697          	auipc	a3,0x7
ffffffffc02078ca:	95268693          	addi	a3,a3,-1710 # ffffffffc020e218 <syscalls+0x9d0>
ffffffffc02078ce:	00004617          	auipc	a2,0x4
ffffffffc02078d2:	f4a60613          	addi	a2,a2,-182 # ffffffffc020b818 <commands+0x210>
ffffffffc02078d6:	06100593          	li	a1,97
ffffffffc02078da:	00006517          	auipc	a0,0x6
ffffffffc02078de:	78e50513          	addi	a0,a0,1934 # ffffffffc020e068 <syscalls+0x820>
ffffffffc02078e2:	bbdf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02078e6:	00007697          	auipc	a3,0x7
ffffffffc02078ea:	91268693          	addi	a3,a3,-1774 # ffffffffc020e1f8 <syscalls+0x9b0>
ffffffffc02078ee:	00004617          	auipc	a2,0x4
ffffffffc02078f2:	f2a60613          	addi	a2,a2,-214 # ffffffffc020b818 <commands+0x210>
ffffffffc02078f6:	05c00593          	li	a1,92
ffffffffc02078fa:	00006517          	auipc	a0,0x6
ffffffffc02078fe:	76e50513          	addi	a0,a0,1902 # ffffffffc020e068 <syscalls+0x820>
ffffffffc0207902:	b9df80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207906 <__alloc_fs>:
ffffffffc0207906:	1141                	addi	sp,sp,-16
ffffffffc0207908:	e022                	sd	s0,0(sp)
ffffffffc020790a:	842a                	mv	s0,a0
ffffffffc020790c:	0d800513          	li	a0,216
ffffffffc0207910:	e406                	sd	ra,8(sp)
ffffffffc0207912:	e7cfa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207916:	c119                	beqz	a0,ffffffffc020791c <__alloc_fs+0x16>
ffffffffc0207918:	0a852823          	sw	s0,176(a0)
ffffffffc020791c:	60a2                	ld	ra,8(sp)
ffffffffc020791e:	6402                	ld	s0,0(sp)
ffffffffc0207920:	0141                	addi	sp,sp,16
ffffffffc0207922:	8082                	ret

ffffffffc0207924 <vfs_init>:
ffffffffc0207924:	1141                	addi	sp,sp,-16
ffffffffc0207926:	4585                	li	a1,1
ffffffffc0207928:	0008e517          	auipc	a0,0x8e
ffffffffc020792c:	ed850513          	addi	a0,a0,-296 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207930:	e406                	sd	ra,8(sp)
ffffffffc0207932:	c35fc0ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc0207936:	60a2                	ld	ra,8(sp)
ffffffffc0207938:	0141                	addi	sp,sp,16
ffffffffc020793a:	a40d                	j	ffffffffc0207b5c <vfs_devlist_init>

ffffffffc020793c <vfs_set_bootfs>:
ffffffffc020793c:	7179                	addi	sp,sp,-48
ffffffffc020793e:	f022                	sd	s0,32(sp)
ffffffffc0207940:	f406                	sd	ra,40(sp)
ffffffffc0207942:	ec26                	sd	s1,24(sp)
ffffffffc0207944:	e402                	sd	zero,8(sp)
ffffffffc0207946:	842a                	mv	s0,a0
ffffffffc0207948:	c915                	beqz	a0,ffffffffc020797c <vfs_set_bootfs+0x40>
ffffffffc020794a:	03a00593          	li	a1,58
ffffffffc020794e:	1d3030ef          	jal	ra,ffffffffc020b320 <strchr>
ffffffffc0207952:	c135                	beqz	a0,ffffffffc02079b6 <vfs_set_bootfs+0x7a>
ffffffffc0207954:	00154783          	lbu	a5,1(a0)
ffffffffc0207958:	efb9                	bnez	a5,ffffffffc02079b6 <vfs_set_bootfs+0x7a>
ffffffffc020795a:	8522                	mv	a0,s0
ffffffffc020795c:	11f000ef          	jal	ra,ffffffffc020827a <vfs_chdir>
ffffffffc0207960:	842a                	mv	s0,a0
ffffffffc0207962:	c519                	beqz	a0,ffffffffc0207970 <vfs_set_bootfs+0x34>
ffffffffc0207964:	70a2                	ld	ra,40(sp)
ffffffffc0207966:	8522                	mv	a0,s0
ffffffffc0207968:	7402                	ld	s0,32(sp)
ffffffffc020796a:	64e2                	ld	s1,24(sp)
ffffffffc020796c:	6145                	addi	sp,sp,48
ffffffffc020796e:	8082                	ret
ffffffffc0207970:	0028                	addi	a0,sp,8
ffffffffc0207972:	013000ef          	jal	ra,ffffffffc0208184 <vfs_get_curdir>
ffffffffc0207976:	842a                	mv	s0,a0
ffffffffc0207978:	f575                	bnez	a0,ffffffffc0207964 <vfs_set_bootfs+0x28>
ffffffffc020797a:	6422                	ld	s0,8(sp)
ffffffffc020797c:	0008e517          	auipc	a0,0x8e
ffffffffc0207980:	e8450513          	addi	a0,a0,-380 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207984:	bedfc0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0207988:	0008f797          	auipc	a5,0x8f
ffffffffc020798c:	f6878793          	addi	a5,a5,-152 # ffffffffc02968f0 <bootfs_node>
ffffffffc0207990:	6384                	ld	s1,0(a5)
ffffffffc0207992:	0008e517          	auipc	a0,0x8e
ffffffffc0207996:	e6e50513          	addi	a0,a0,-402 # ffffffffc0295800 <bootfs_sem>
ffffffffc020799a:	e380                	sd	s0,0(a5)
ffffffffc020799c:	4401                	li	s0,0
ffffffffc020799e:	bcffc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc02079a2:	d0e9                	beqz	s1,ffffffffc0207964 <vfs_set_bootfs+0x28>
ffffffffc02079a4:	8526                	mv	a0,s1
ffffffffc02079a6:	e17ff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc02079aa:	70a2                	ld	ra,40(sp)
ffffffffc02079ac:	8522                	mv	a0,s0
ffffffffc02079ae:	7402                	ld	s0,32(sp)
ffffffffc02079b0:	64e2                	ld	s1,24(sp)
ffffffffc02079b2:	6145                	addi	sp,sp,48
ffffffffc02079b4:	8082                	ret
ffffffffc02079b6:	5475                	li	s0,-3
ffffffffc02079b8:	b775                	j	ffffffffc0207964 <vfs_set_bootfs+0x28>

ffffffffc02079ba <vfs_get_bootfs>:
ffffffffc02079ba:	1101                	addi	sp,sp,-32
ffffffffc02079bc:	e426                	sd	s1,8(sp)
ffffffffc02079be:	0008f497          	auipc	s1,0x8f
ffffffffc02079c2:	f3248493          	addi	s1,s1,-206 # ffffffffc02968f0 <bootfs_node>
ffffffffc02079c6:	609c                	ld	a5,0(s1)
ffffffffc02079c8:	ec06                	sd	ra,24(sp)
ffffffffc02079ca:	e822                	sd	s0,16(sp)
ffffffffc02079cc:	c3a1                	beqz	a5,ffffffffc0207a0c <vfs_get_bootfs+0x52>
ffffffffc02079ce:	842a                	mv	s0,a0
ffffffffc02079d0:	0008e517          	auipc	a0,0x8e
ffffffffc02079d4:	e3050513          	addi	a0,a0,-464 # ffffffffc0295800 <bootfs_sem>
ffffffffc02079d8:	b99fc0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02079dc:	6084                	ld	s1,0(s1)
ffffffffc02079de:	c08d                	beqz	s1,ffffffffc0207a00 <vfs_get_bootfs+0x46>
ffffffffc02079e0:	8526                	mv	a0,s1
ffffffffc02079e2:	d0dff0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc02079e6:	0008e517          	auipc	a0,0x8e
ffffffffc02079ea:	e1a50513          	addi	a0,a0,-486 # ffffffffc0295800 <bootfs_sem>
ffffffffc02079ee:	b7ffc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc02079f2:	4501                	li	a0,0
ffffffffc02079f4:	e004                	sd	s1,0(s0)
ffffffffc02079f6:	60e2                	ld	ra,24(sp)
ffffffffc02079f8:	6442                	ld	s0,16(sp)
ffffffffc02079fa:	64a2                	ld	s1,8(sp)
ffffffffc02079fc:	6105                	addi	sp,sp,32
ffffffffc02079fe:	8082                	ret
ffffffffc0207a00:	0008e517          	auipc	a0,0x8e
ffffffffc0207a04:	e0050513          	addi	a0,a0,-512 # ffffffffc0295800 <bootfs_sem>
ffffffffc0207a08:	b65fc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0207a0c:	5541                	li	a0,-16
ffffffffc0207a0e:	b7e5                	j	ffffffffc02079f6 <vfs_get_bootfs+0x3c>

ffffffffc0207a10 <vfs_do_add>:
ffffffffc0207a10:	7139                	addi	sp,sp,-64
ffffffffc0207a12:	fc06                	sd	ra,56(sp)
ffffffffc0207a14:	f822                	sd	s0,48(sp)
ffffffffc0207a16:	f426                	sd	s1,40(sp)
ffffffffc0207a18:	f04a                	sd	s2,32(sp)
ffffffffc0207a1a:	ec4e                	sd	s3,24(sp)
ffffffffc0207a1c:	e852                	sd	s4,16(sp)
ffffffffc0207a1e:	e456                	sd	s5,8(sp)
ffffffffc0207a20:	e05a                	sd	s6,0(sp)
ffffffffc0207a22:	0e050b63          	beqz	a0,ffffffffc0207b18 <vfs_do_add+0x108>
ffffffffc0207a26:	842a                	mv	s0,a0
ffffffffc0207a28:	8a2e                	mv	s4,a1
ffffffffc0207a2a:	8b32                	mv	s6,a2
ffffffffc0207a2c:	8ab6                	mv	s5,a3
ffffffffc0207a2e:	c5cd                	beqz	a1,ffffffffc0207ad8 <vfs_do_add+0xc8>
ffffffffc0207a30:	4db8                	lw	a4,88(a1)
ffffffffc0207a32:	6785                	lui	a5,0x1
ffffffffc0207a34:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207a38:	0af71163          	bne	a4,a5,ffffffffc0207ada <vfs_do_add+0xca>
ffffffffc0207a3c:	8522                	mv	a0,s0
ffffffffc0207a3e:	057030ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc0207a42:	47fd                	li	a5,31
ffffffffc0207a44:	0ca7e663          	bltu	a5,a0,ffffffffc0207b10 <vfs_do_add+0x100>
ffffffffc0207a48:	8522                	mv	a0,s0
ffffffffc0207a4a:	faaf80ef          	jal	ra,ffffffffc02001f4 <strdup>
ffffffffc0207a4e:	84aa                	mv	s1,a0
ffffffffc0207a50:	c171                	beqz	a0,ffffffffc0207b14 <vfs_do_add+0x104>
ffffffffc0207a52:	03000513          	li	a0,48
ffffffffc0207a56:	d38fa0ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0207a5a:	89aa                	mv	s3,a0
ffffffffc0207a5c:	c92d                	beqz	a0,ffffffffc0207ace <vfs_do_add+0xbe>
ffffffffc0207a5e:	0008e517          	auipc	a0,0x8e
ffffffffc0207a62:	dca50513          	addi	a0,a0,-566 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207a66:	0008e917          	auipc	s2,0x8e
ffffffffc0207a6a:	db290913          	addi	s2,s2,-590 # ffffffffc0295818 <vdev_list>
ffffffffc0207a6e:	b03fc0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0207a72:	844a                	mv	s0,s2
ffffffffc0207a74:	a039                	j	ffffffffc0207a82 <vfs_do_add+0x72>
ffffffffc0207a76:	fe043503          	ld	a0,-32(s0)
ffffffffc0207a7a:	85a6                	mv	a1,s1
ffffffffc0207a7c:	061030ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc0207a80:	cd2d                	beqz	a0,ffffffffc0207afa <vfs_do_add+0xea>
ffffffffc0207a82:	6400                	ld	s0,8(s0)
ffffffffc0207a84:	ff2419e3          	bne	s0,s2,ffffffffc0207a76 <vfs_do_add+0x66>
ffffffffc0207a88:	6418                	ld	a4,8(s0)
ffffffffc0207a8a:	02098793          	addi	a5,s3,32
ffffffffc0207a8e:	0099b023          	sd	s1,0(s3)
ffffffffc0207a92:	0149b423          	sd	s4,8(s3)
ffffffffc0207a96:	0159bc23          	sd	s5,24(s3)
ffffffffc0207a9a:	0169b823          	sd	s6,16(s3)
ffffffffc0207a9e:	e31c                	sd	a5,0(a4)
ffffffffc0207aa0:	0289b023          	sd	s0,32(s3)
ffffffffc0207aa4:	02e9b423          	sd	a4,40(s3)
ffffffffc0207aa8:	0008e517          	auipc	a0,0x8e
ffffffffc0207aac:	d8050513          	addi	a0,a0,-640 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207ab0:	e41c                	sd	a5,8(s0)
ffffffffc0207ab2:	4401                	li	s0,0
ffffffffc0207ab4:	ab9fc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0207ab8:	70e2                	ld	ra,56(sp)
ffffffffc0207aba:	8522                	mv	a0,s0
ffffffffc0207abc:	7442                	ld	s0,48(sp)
ffffffffc0207abe:	74a2                	ld	s1,40(sp)
ffffffffc0207ac0:	7902                	ld	s2,32(sp)
ffffffffc0207ac2:	69e2                	ld	s3,24(sp)
ffffffffc0207ac4:	6a42                	ld	s4,16(sp)
ffffffffc0207ac6:	6aa2                	ld	s5,8(sp)
ffffffffc0207ac8:	6b02                	ld	s6,0(sp)
ffffffffc0207aca:	6121                	addi	sp,sp,64
ffffffffc0207acc:	8082                	ret
ffffffffc0207ace:	5471                	li	s0,-4
ffffffffc0207ad0:	8526                	mv	a0,s1
ffffffffc0207ad2:	d6cfa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207ad6:	b7cd                	j	ffffffffc0207ab8 <vfs_do_add+0xa8>
ffffffffc0207ad8:	d2b5                	beqz	a3,ffffffffc0207a3c <vfs_do_add+0x2c>
ffffffffc0207ada:	00006697          	auipc	a3,0x6
ffffffffc0207ade:	7de68693          	addi	a3,a3,2014 # ffffffffc020e2b8 <syscalls+0xa70>
ffffffffc0207ae2:	00004617          	auipc	a2,0x4
ffffffffc0207ae6:	d3660613          	addi	a2,a2,-714 # ffffffffc020b818 <commands+0x210>
ffffffffc0207aea:	08f00593          	li	a1,143
ffffffffc0207aee:	00006517          	auipc	a0,0x6
ffffffffc0207af2:	7b250513          	addi	a0,a0,1970 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207af6:	9a9f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207afa:	0008e517          	auipc	a0,0x8e
ffffffffc0207afe:	d2e50513          	addi	a0,a0,-722 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b02:	a6bfc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0207b06:	854e                	mv	a0,s3
ffffffffc0207b08:	d36fa0ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0207b0c:	5425                	li	s0,-23
ffffffffc0207b0e:	b7c9                	j	ffffffffc0207ad0 <vfs_do_add+0xc0>
ffffffffc0207b10:	5451                	li	s0,-12
ffffffffc0207b12:	b75d                	j	ffffffffc0207ab8 <vfs_do_add+0xa8>
ffffffffc0207b14:	5471                	li	s0,-4
ffffffffc0207b16:	b74d                	j	ffffffffc0207ab8 <vfs_do_add+0xa8>
ffffffffc0207b18:	00006697          	auipc	a3,0x6
ffffffffc0207b1c:	77868693          	addi	a3,a3,1912 # ffffffffc020e290 <syscalls+0xa48>
ffffffffc0207b20:	00004617          	auipc	a2,0x4
ffffffffc0207b24:	cf860613          	addi	a2,a2,-776 # ffffffffc020b818 <commands+0x210>
ffffffffc0207b28:	08e00593          	li	a1,142
ffffffffc0207b2c:	00006517          	auipc	a0,0x6
ffffffffc0207b30:	77450513          	addi	a0,a0,1908 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207b34:	96bf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207b38 <find_mount.part.0>:
ffffffffc0207b38:	1141                	addi	sp,sp,-16
ffffffffc0207b3a:	00006697          	auipc	a3,0x6
ffffffffc0207b3e:	75668693          	addi	a3,a3,1878 # ffffffffc020e290 <syscalls+0xa48>
ffffffffc0207b42:	00004617          	auipc	a2,0x4
ffffffffc0207b46:	cd660613          	addi	a2,a2,-810 # ffffffffc020b818 <commands+0x210>
ffffffffc0207b4a:	0cd00593          	li	a1,205
ffffffffc0207b4e:	00006517          	auipc	a0,0x6
ffffffffc0207b52:	75250513          	addi	a0,a0,1874 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207b56:	e406                	sd	ra,8(sp)
ffffffffc0207b58:	947f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207b5c <vfs_devlist_init>:
ffffffffc0207b5c:	0008e797          	auipc	a5,0x8e
ffffffffc0207b60:	cbc78793          	addi	a5,a5,-836 # ffffffffc0295818 <vdev_list>
ffffffffc0207b64:	4585                	li	a1,1
ffffffffc0207b66:	0008e517          	auipc	a0,0x8e
ffffffffc0207b6a:	cc250513          	addi	a0,a0,-830 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b6e:	e79c                	sd	a5,8(a5)
ffffffffc0207b70:	e39c                	sd	a5,0(a5)
ffffffffc0207b72:	9f5fc06f          	j	ffffffffc0204566 <sem_init>

ffffffffc0207b76 <vfs_cleanup>:
ffffffffc0207b76:	1101                	addi	sp,sp,-32
ffffffffc0207b78:	e426                	sd	s1,8(sp)
ffffffffc0207b7a:	0008e497          	auipc	s1,0x8e
ffffffffc0207b7e:	c9e48493          	addi	s1,s1,-866 # ffffffffc0295818 <vdev_list>
ffffffffc0207b82:	649c                	ld	a5,8(s1)
ffffffffc0207b84:	ec06                	sd	ra,24(sp)
ffffffffc0207b86:	e822                	sd	s0,16(sp)
ffffffffc0207b88:	02978e63          	beq	a5,s1,ffffffffc0207bc4 <vfs_cleanup+0x4e>
ffffffffc0207b8c:	0008e517          	auipc	a0,0x8e
ffffffffc0207b90:	c9c50513          	addi	a0,a0,-868 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207b94:	9ddfc0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0207b98:	6480                	ld	s0,8(s1)
ffffffffc0207b9a:	00940b63          	beq	s0,s1,ffffffffc0207bb0 <vfs_cleanup+0x3a>
ffffffffc0207b9e:	ff043783          	ld	a5,-16(s0)
ffffffffc0207ba2:	853e                	mv	a0,a5
ffffffffc0207ba4:	c399                	beqz	a5,ffffffffc0207baa <vfs_cleanup+0x34>
ffffffffc0207ba6:	6bfc                	ld	a5,208(a5)
ffffffffc0207ba8:	9782                	jalr	a5
ffffffffc0207baa:	6400                	ld	s0,8(s0)
ffffffffc0207bac:	fe9419e3          	bne	s0,s1,ffffffffc0207b9e <vfs_cleanup+0x28>
ffffffffc0207bb0:	6442                	ld	s0,16(sp)
ffffffffc0207bb2:	60e2                	ld	ra,24(sp)
ffffffffc0207bb4:	64a2                	ld	s1,8(sp)
ffffffffc0207bb6:	0008e517          	auipc	a0,0x8e
ffffffffc0207bba:	c7250513          	addi	a0,a0,-910 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207bbe:	6105                	addi	sp,sp,32
ffffffffc0207bc0:	9adfc06f          	j	ffffffffc020456c <up>
ffffffffc0207bc4:	60e2                	ld	ra,24(sp)
ffffffffc0207bc6:	6442                	ld	s0,16(sp)
ffffffffc0207bc8:	64a2                	ld	s1,8(sp)
ffffffffc0207bca:	6105                	addi	sp,sp,32
ffffffffc0207bcc:	8082                	ret

ffffffffc0207bce <vfs_get_root>:
ffffffffc0207bce:	7179                	addi	sp,sp,-48
ffffffffc0207bd0:	f406                	sd	ra,40(sp)
ffffffffc0207bd2:	f022                	sd	s0,32(sp)
ffffffffc0207bd4:	ec26                	sd	s1,24(sp)
ffffffffc0207bd6:	e84a                	sd	s2,16(sp)
ffffffffc0207bd8:	e44e                	sd	s3,8(sp)
ffffffffc0207bda:	e052                	sd	s4,0(sp)
ffffffffc0207bdc:	c541                	beqz	a0,ffffffffc0207c64 <vfs_get_root+0x96>
ffffffffc0207bde:	0008e917          	auipc	s2,0x8e
ffffffffc0207be2:	c3a90913          	addi	s2,s2,-966 # ffffffffc0295818 <vdev_list>
ffffffffc0207be6:	00893783          	ld	a5,8(s2)
ffffffffc0207bea:	07278b63          	beq	a5,s2,ffffffffc0207c60 <vfs_get_root+0x92>
ffffffffc0207bee:	89aa                	mv	s3,a0
ffffffffc0207bf0:	0008e517          	auipc	a0,0x8e
ffffffffc0207bf4:	c3850513          	addi	a0,a0,-968 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207bf8:	8a2e                	mv	s4,a1
ffffffffc0207bfa:	844a                	mv	s0,s2
ffffffffc0207bfc:	975fc0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0207c00:	a801                	j	ffffffffc0207c10 <vfs_get_root+0x42>
ffffffffc0207c02:	fe043583          	ld	a1,-32(s0)
ffffffffc0207c06:	854e                	mv	a0,s3
ffffffffc0207c08:	6d4030ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc0207c0c:	84aa                	mv	s1,a0
ffffffffc0207c0e:	c505                	beqz	a0,ffffffffc0207c36 <vfs_get_root+0x68>
ffffffffc0207c10:	6400                	ld	s0,8(s0)
ffffffffc0207c12:	ff2418e3          	bne	s0,s2,ffffffffc0207c02 <vfs_get_root+0x34>
ffffffffc0207c16:	54cd                	li	s1,-13
ffffffffc0207c18:	0008e517          	auipc	a0,0x8e
ffffffffc0207c1c:	c1050513          	addi	a0,a0,-1008 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207c20:	94dfc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0207c24:	70a2                	ld	ra,40(sp)
ffffffffc0207c26:	7402                	ld	s0,32(sp)
ffffffffc0207c28:	6942                	ld	s2,16(sp)
ffffffffc0207c2a:	69a2                	ld	s3,8(sp)
ffffffffc0207c2c:	6a02                	ld	s4,0(sp)
ffffffffc0207c2e:	8526                	mv	a0,s1
ffffffffc0207c30:	64e2                	ld	s1,24(sp)
ffffffffc0207c32:	6145                	addi	sp,sp,48
ffffffffc0207c34:	8082                	ret
ffffffffc0207c36:	ff043503          	ld	a0,-16(s0)
ffffffffc0207c3a:	c519                	beqz	a0,ffffffffc0207c48 <vfs_get_root+0x7a>
ffffffffc0207c3c:	617c                	ld	a5,192(a0)
ffffffffc0207c3e:	9782                	jalr	a5
ffffffffc0207c40:	c519                	beqz	a0,ffffffffc0207c4e <vfs_get_root+0x80>
ffffffffc0207c42:	00aa3023          	sd	a0,0(s4)
ffffffffc0207c46:	bfc9                	j	ffffffffc0207c18 <vfs_get_root+0x4a>
ffffffffc0207c48:	ff843783          	ld	a5,-8(s0)
ffffffffc0207c4c:	c399                	beqz	a5,ffffffffc0207c52 <vfs_get_root+0x84>
ffffffffc0207c4e:	54c9                	li	s1,-14
ffffffffc0207c50:	b7e1                	j	ffffffffc0207c18 <vfs_get_root+0x4a>
ffffffffc0207c52:	fe843503          	ld	a0,-24(s0)
ffffffffc0207c56:	a99ff0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc0207c5a:	fe843503          	ld	a0,-24(s0)
ffffffffc0207c5e:	b7cd                	j	ffffffffc0207c40 <vfs_get_root+0x72>
ffffffffc0207c60:	54cd                	li	s1,-13
ffffffffc0207c62:	b7c9                	j	ffffffffc0207c24 <vfs_get_root+0x56>
ffffffffc0207c64:	00006697          	auipc	a3,0x6
ffffffffc0207c68:	62c68693          	addi	a3,a3,1580 # ffffffffc020e290 <syscalls+0xa48>
ffffffffc0207c6c:	00004617          	auipc	a2,0x4
ffffffffc0207c70:	bac60613          	addi	a2,a2,-1108 # ffffffffc020b818 <commands+0x210>
ffffffffc0207c74:	04500593          	li	a1,69
ffffffffc0207c78:	00006517          	auipc	a0,0x6
ffffffffc0207c7c:	62850513          	addi	a0,a0,1576 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207c80:	81ff80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207c84 <vfs_get_devname>:
ffffffffc0207c84:	0008e697          	auipc	a3,0x8e
ffffffffc0207c88:	b9468693          	addi	a3,a3,-1132 # ffffffffc0295818 <vdev_list>
ffffffffc0207c8c:	87b6                	mv	a5,a3
ffffffffc0207c8e:	e511                	bnez	a0,ffffffffc0207c9a <vfs_get_devname+0x16>
ffffffffc0207c90:	a829                	j	ffffffffc0207caa <vfs_get_devname+0x26>
ffffffffc0207c92:	ff07b703          	ld	a4,-16(a5)
ffffffffc0207c96:	00a70763          	beq	a4,a0,ffffffffc0207ca4 <vfs_get_devname+0x20>
ffffffffc0207c9a:	679c                	ld	a5,8(a5)
ffffffffc0207c9c:	fed79be3          	bne	a5,a3,ffffffffc0207c92 <vfs_get_devname+0xe>
ffffffffc0207ca0:	4501                	li	a0,0
ffffffffc0207ca2:	8082                	ret
ffffffffc0207ca4:	fe07b503          	ld	a0,-32(a5)
ffffffffc0207ca8:	8082                	ret
ffffffffc0207caa:	1141                	addi	sp,sp,-16
ffffffffc0207cac:	00006697          	auipc	a3,0x6
ffffffffc0207cb0:	66c68693          	addi	a3,a3,1644 # ffffffffc020e318 <syscalls+0xad0>
ffffffffc0207cb4:	00004617          	auipc	a2,0x4
ffffffffc0207cb8:	b6460613          	addi	a2,a2,-1180 # ffffffffc020b818 <commands+0x210>
ffffffffc0207cbc:	06a00593          	li	a1,106
ffffffffc0207cc0:	00006517          	auipc	a0,0x6
ffffffffc0207cc4:	5e050513          	addi	a0,a0,1504 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207cc8:	e406                	sd	ra,8(sp)
ffffffffc0207cca:	fd4f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207cce <vfs_add_dev>:
ffffffffc0207cce:	86b2                	mv	a3,a2
ffffffffc0207cd0:	4601                	li	a2,0
ffffffffc0207cd2:	d3fff06f          	j	ffffffffc0207a10 <vfs_do_add>

ffffffffc0207cd6 <vfs_mount>:
ffffffffc0207cd6:	7179                	addi	sp,sp,-48
ffffffffc0207cd8:	e84a                	sd	s2,16(sp)
ffffffffc0207cda:	892a                	mv	s2,a0
ffffffffc0207cdc:	0008e517          	auipc	a0,0x8e
ffffffffc0207ce0:	b4c50513          	addi	a0,a0,-1204 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207ce4:	e44e                	sd	s3,8(sp)
ffffffffc0207ce6:	f406                	sd	ra,40(sp)
ffffffffc0207ce8:	f022                	sd	s0,32(sp)
ffffffffc0207cea:	ec26                	sd	s1,24(sp)
ffffffffc0207cec:	89ae                	mv	s3,a1
ffffffffc0207cee:	883fc0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0207cf2:	08090a63          	beqz	s2,ffffffffc0207d86 <vfs_mount+0xb0>
ffffffffc0207cf6:	0008e497          	auipc	s1,0x8e
ffffffffc0207cfa:	b2248493          	addi	s1,s1,-1246 # ffffffffc0295818 <vdev_list>
ffffffffc0207cfe:	6480                	ld	s0,8(s1)
ffffffffc0207d00:	00941663          	bne	s0,s1,ffffffffc0207d0c <vfs_mount+0x36>
ffffffffc0207d04:	a8ad                	j	ffffffffc0207d7e <vfs_mount+0xa8>
ffffffffc0207d06:	6400                	ld	s0,8(s0)
ffffffffc0207d08:	06940b63          	beq	s0,s1,ffffffffc0207d7e <vfs_mount+0xa8>
ffffffffc0207d0c:	ff843783          	ld	a5,-8(s0)
ffffffffc0207d10:	dbfd                	beqz	a5,ffffffffc0207d06 <vfs_mount+0x30>
ffffffffc0207d12:	fe043503          	ld	a0,-32(s0)
ffffffffc0207d16:	85ca                	mv	a1,s2
ffffffffc0207d18:	5c4030ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc0207d1c:	f56d                	bnez	a0,ffffffffc0207d06 <vfs_mount+0x30>
ffffffffc0207d1e:	ff043783          	ld	a5,-16(s0)
ffffffffc0207d22:	e3a5                	bnez	a5,ffffffffc0207d82 <vfs_mount+0xac>
ffffffffc0207d24:	fe043783          	ld	a5,-32(s0)
ffffffffc0207d28:	c3c9                	beqz	a5,ffffffffc0207daa <vfs_mount+0xd4>
ffffffffc0207d2a:	ff843783          	ld	a5,-8(s0)
ffffffffc0207d2e:	cfb5                	beqz	a5,ffffffffc0207daa <vfs_mount+0xd4>
ffffffffc0207d30:	fe843503          	ld	a0,-24(s0)
ffffffffc0207d34:	c939                	beqz	a0,ffffffffc0207d8a <vfs_mount+0xb4>
ffffffffc0207d36:	4d38                	lw	a4,88(a0)
ffffffffc0207d38:	6785                	lui	a5,0x1
ffffffffc0207d3a:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0207d3e:	04f71663          	bne	a4,a5,ffffffffc0207d8a <vfs_mount+0xb4>
ffffffffc0207d42:	ff040593          	addi	a1,s0,-16
ffffffffc0207d46:	9982                	jalr	s3
ffffffffc0207d48:	84aa                	mv	s1,a0
ffffffffc0207d4a:	ed01                	bnez	a0,ffffffffc0207d62 <vfs_mount+0x8c>
ffffffffc0207d4c:	ff043783          	ld	a5,-16(s0)
ffffffffc0207d50:	cfad                	beqz	a5,ffffffffc0207dca <vfs_mount+0xf4>
ffffffffc0207d52:	fe043583          	ld	a1,-32(s0)
ffffffffc0207d56:	00006517          	auipc	a0,0x6
ffffffffc0207d5a:	65250513          	addi	a0,a0,1618 # ffffffffc020e3a8 <syscalls+0xb60>
ffffffffc0207d5e:	c48f80ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0207d62:	0008e517          	auipc	a0,0x8e
ffffffffc0207d66:	ac650513          	addi	a0,a0,-1338 # ffffffffc0295828 <vdev_list_sem>
ffffffffc0207d6a:	803fc0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0207d6e:	70a2                	ld	ra,40(sp)
ffffffffc0207d70:	7402                	ld	s0,32(sp)
ffffffffc0207d72:	6942                	ld	s2,16(sp)
ffffffffc0207d74:	69a2                	ld	s3,8(sp)
ffffffffc0207d76:	8526                	mv	a0,s1
ffffffffc0207d78:	64e2                	ld	s1,24(sp)
ffffffffc0207d7a:	6145                	addi	sp,sp,48
ffffffffc0207d7c:	8082                	ret
ffffffffc0207d7e:	54cd                	li	s1,-13
ffffffffc0207d80:	b7cd                	j	ffffffffc0207d62 <vfs_mount+0x8c>
ffffffffc0207d82:	54c5                	li	s1,-15
ffffffffc0207d84:	bff9                	j	ffffffffc0207d62 <vfs_mount+0x8c>
ffffffffc0207d86:	db3ff0ef          	jal	ra,ffffffffc0207b38 <find_mount.part.0>
ffffffffc0207d8a:	00006697          	auipc	a3,0x6
ffffffffc0207d8e:	5ce68693          	addi	a3,a3,1486 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc0207d92:	00004617          	auipc	a2,0x4
ffffffffc0207d96:	a8660613          	addi	a2,a2,-1402 # ffffffffc020b818 <commands+0x210>
ffffffffc0207d9a:	0ed00593          	li	a1,237
ffffffffc0207d9e:	00006517          	auipc	a0,0x6
ffffffffc0207da2:	50250513          	addi	a0,a0,1282 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207da6:	ef8f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207daa:	00006697          	auipc	a3,0x6
ffffffffc0207dae:	57e68693          	addi	a3,a3,1406 # ffffffffc020e328 <syscalls+0xae0>
ffffffffc0207db2:	00004617          	auipc	a2,0x4
ffffffffc0207db6:	a6660613          	addi	a2,a2,-1434 # ffffffffc020b818 <commands+0x210>
ffffffffc0207dba:	0eb00593          	li	a1,235
ffffffffc0207dbe:	00006517          	auipc	a0,0x6
ffffffffc0207dc2:	4e250513          	addi	a0,a0,1250 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207dc6:	ed8f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207dca:	00006697          	auipc	a3,0x6
ffffffffc0207dce:	5c668693          	addi	a3,a3,1478 # ffffffffc020e390 <syscalls+0xb48>
ffffffffc0207dd2:	00004617          	auipc	a2,0x4
ffffffffc0207dd6:	a4660613          	addi	a2,a2,-1466 # ffffffffc020b818 <commands+0x210>
ffffffffc0207dda:	0ef00593          	li	a1,239
ffffffffc0207dde:	00006517          	auipc	a0,0x6
ffffffffc0207de2:	4c250513          	addi	a0,a0,1218 # ffffffffc020e2a0 <syscalls+0xa58>
ffffffffc0207de6:	eb8f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207dea <vfs_open>:
ffffffffc0207dea:	711d                	addi	sp,sp,-96
ffffffffc0207dec:	e4a6                	sd	s1,72(sp)
ffffffffc0207dee:	e0ca                	sd	s2,64(sp)
ffffffffc0207df0:	fc4e                	sd	s3,56(sp)
ffffffffc0207df2:	ec86                	sd	ra,88(sp)
ffffffffc0207df4:	e8a2                	sd	s0,80(sp)
ffffffffc0207df6:	f852                	sd	s4,48(sp)
ffffffffc0207df8:	f456                	sd	s5,40(sp)
ffffffffc0207dfa:	0035f793          	andi	a5,a1,3
ffffffffc0207dfe:	84ae                	mv	s1,a1
ffffffffc0207e00:	892a                	mv	s2,a0
ffffffffc0207e02:	89b2                	mv	s3,a2
ffffffffc0207e04:	0e078663          	beqz	a5,ffffffffc0207ef0 <vfs_open+0x106>
ffffffffc0207e08:	470d                	li	a4,3
ffffffffc0207e0a:	0105fa93          	andi	s5,a1,16
ffffffffc0207e0e:	0ce78f63          	beq	a5,a4,ffffffffc0207eec <vfs_open+0x102>
ffffffffc0207e12:	002c                	addi	a1,sp,8
ffffffffc0207e14:	854a                	mv	a0,s2
ffffffffc0207e16:	2ae000ef          	jal	ra,ffffffffc02080c4 <vfs_lookup>
ffffffffc0207e1a:	842a                	mv	s0,a0
ffffffffc0207e1c:	0044fa13          	andi	s4,s1,4
ffffffffc0207e20:	e159                	bnez	a0,ffffffffc0207ea6 <vfs_open+0xbc>
ffffffffc0207e22:	00c4f793          	andi	a5,s1,12
ffffffffc0207e26:	4731                	li	a4,12
ffffffffc0207e28:	0ee78263          	beq	a5,a4,ffffffffc0207f0c <vfs_open+0x122>
ffffffffc0207e2c:	6422                	ld	s0,8(sp)
ffffffffc0207e2e:	12040163          	beqz	s0,ffffffffc0207f50 <vfs_open+0x166>
ffffffffc0207e32:	783c                	ld	a5,112(s0)
ffffffffc0207e34:	cff1                	beqz	a5,ffffffffc0207f10 <vfs_open+0x126>
ffffffffc0207e36:	679c                	ld	a5,8(a5)
ffffffffc0207e38:	cfe1                	beqz	a5,ffffffffc0207f10 <vfs_open+0x126>
ffffffffc0207e3a:	8522                	mv	a0,s0
ffffffffc0207e3c:	00006597          	auipc	a1,0x6
ffffffffc0207e40:	64c58593          	addi	a1,a1,1612 # ffffffffc020e488 <syscalls+0xc40>
ffffffffc0207e44:	8c3ff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0207e48:	783c                	ld	a5,112(s0)
ffffffffc0207e4a:	6522                	ld	a0,8(sp)
ffffffffc0207e4c:	85a6                	mv	a1,s1
ffffffffc0207e4e:	679c                	ld	a5,8(a5)
ffffffffc0207e50:	9782                	jalr	a5
ffffffffc0207e52:	842a                	mv	s0,a0
ffffffffc0207e54:	6522                	ld	a0,8(sp)
ffffffffc0207e56:	e845                	bnez	s0,ffffffffc0207f06 <vfs_open+0x11c>
ffffffffc0207e58:	015a6a33          	or	s4,s4,s5
ffffffffc0207e5c:	89fff0ef          	jal	ra,ffffffffc02076fa <inode_open_inc>
ffffffffc0207e60:	020a0663          	beqz	s4,ffffffffc0207e8c <vfs_open+0xa2>
ffffffffc0207e64:	64a2                	ld	s1,8(sp)
ffffffffc0207e66:	c4e9                	beqz	s1,ffffffffc0207f30 <vfs_open+0x146>
ffffffffc0207e68:	78bc                	ld	a5,112(s1)
ffffffffc0207e6a:	c3f9                	beqz	a5,ffffffffc0207f30 <vfs_open+0x146>
ffffffffc0207e6c:	73bc                	ld	a5,96(a5)
ffffffffc0207e6e:	c3e9                	beqz	a5,ffffffffc0207f30 <vfs_open+0x146>
ffffffffc0207e70:	00006597          	auipc	a1,0x6
ffffffffc0207e74:	67858593          	addi	a1,a1,1656 # ffffffffc020e4e8 <syscalls+0xca0>
ffffffffc0207e78:	8526                	mv	a0,s1
ffffffffc0207e7a:	88dff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0207e7e:	78bc                	ld	a5,112(s1)
ffffffffc0207e80:	6522                	ld	a0,8(sp)
ffffffffc0207e82:	4581                	li	a1,0
ffffffffc0207e84:	73bc                	ld	a5,96(a5)
ffffffffc0207e86:	9782                	jalr	a5
ffffffffc0207e88:	87aa                	mv	a5,a0
ffffffffc0207e8a:	e92d                	bnez	a0,ffffffffc0207efc <vfs_open+0x112>
ffffffffc0207e8c:	67a2                	ld	a5,8(sp)
ffffffffc0207e8e:	00f9b023          	sd	a5,0(s3)
ffffffffc0207e92:	60e6                	ld	ra,88(sp)
ffffffffc0207e94:	8522                	mv	a0,s0
ffffffffc0207e96:	6446                	ld	s0,80(sp)
ffffffffc0207e98:	64a6                	ld	s1,72(sp)
ffffffffc0207e9a:	6906                	ld	s2,64(sp)
ffffffffc0207e9c:	79e2                	ld	s3,56(sp)
ffffffffc0207e9e:	7a42                	ld	s4,48(sp)
ffffffffc0207ea0:	7aa2                	ld	s5,40(sp)
ffffffffc0207ea2:	6125                	addi	sp,sp,96
ffffffffc0207ea4:	8082                	ret
ffffffffc0207ea6:	57c1                	li	a5,-16
ffffffffc0207ea8:	fef515e3          	bne	a0,a5,ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207eac:	fe0a03e3          	beqz	s4,ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207eb0:	0810                	addi	a2,sp,16
ffffffffc0207eb2:	082c                	addi	a1,sp,24
ffffffffc0207eb4:	854a                	mv	a0,s2
ffffffffc0207eb6:	2a4000ef          	jal	ra,ffffffffc020815a <vfs_lookup_parent>
ffffffffc0207eba:	842a                	mv	s0,a0
ffffffffc0207ebc:	f979                	bnez	a0,ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207ebe:	6462                	ld	s0,24(sp)
ffffffffc0207ec0:	c845                	beqz	s0,ffffffffc0207f70 <vfs_open+0x186>
ffffffffc0207ec2:	783c                	ld	a5,112(s0)
ffffffffc0207ec4:	c7d5                	beqz	a5,ffffffffc0207f70 <vfs_open+0x186>
ffffffffc0207ec6:	77bc                	ld	a5,104(a5)
ffffffffc0207ec8:	c7c5                	beqz	a5,ffffffffc0207f70 <vfs_open+0x186>
ffffffffc0207eca:	8522                	mv	a0,s0
ffffffffc0207ecc:	00006597          	auipc	a1,0x6
ffffffffc0207ed0:	55458593          	addi	a1,a1,1364 # ffffffffc020e420 <syscalls+0xbd8>
ffffffffc0207ed4:	833ff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0207ed8:	783c                	ld	a5,112(s0)
ffffffffc0207eda:	65c2                	ld	a1,16(sp)
ffffffffc0207edc:	6562                	ld	a0,24(sp)
ffffffffc0207ede:	77bc                	ld	a5,104(a5)
ffffffffc0207ee0:	4034d613          	srai	a2,s1,0x3
ffffffffc0207ee4:	0034                	addi	a3,sp,8
ffffffffc0207ee6:	8a05                	andi	a2,a2,1
ffffffffc0207ee8:	9782                	jalr	a5
ffffffffc0207eea:	b789                	j	ffffffffc0207e2c <vfs_open+0x42>
ffffffffc0207eec:	5475                	li	s0,-3
ffffffffc0207eee:	b755                	j	ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207ef0:	0105fa93          	andi	s5,a1,16
ffffffffc0207ef4:	5475                	li	s0,-3
ffffffffc0207ef6:	f80a9ee3          	bnez	s5,ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207efa:	bf21                	j	ffffffffc0207e12 <vfs_open+0x28>
ffffffffc0207efc:	6522                	ld	a0,8(sp)
ffffffffc0207efe:	843e                	mv	s0,a5
ffffffffc0207f00:	965ff0ef          	jal	ra,ffffffffc0207864 <inode_open_dec>
ffffffffc0207f04:	6522                	ld	a0,8(sp)
ffffffffc0207f06:	8b7ff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc0207f0a:	b761                	j	ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207f0c:	5425                	li	s0,-23
ffffffffc0207f0e:	b751                	j	ffffffffc0207e92 <vfs_open+0xa8>
ffffffffc0207f10:	00006697          	auipc	a3,0x6
ffffffffc0207f14:	52868693          	addi	a3,a3,1320 # ffffffffc020e438 <syscalls+0xbf0>
ffffffffc0207f18:	00004617          	auipc	a2,0x4
ffffffffc0207f1c:	90060613          	addi	a2,a2,-1792 # ffffffffc020b818 <commands+0x210>
ffffffffc0207f20:	03300593          	li	a1,51
ffffffffc0207f24:	00006517          	auipc	a0,0x6
ffffffffc0207f28:	4e450513          	addi	a0,a0,1252 # ffffffffc020e408 <syscalls+0xbc0>
ffffffffc0207f2c:	d72f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f30:	00006697          	auipc	a3,0x6
ffffffffc0207f34:	56068693          	addi	a3,a3,1376 # ffffffffc020e490 <syscalls+0xc48>
ffffffffc0207f38:	00004617          	auipc	a2,0x4
ffffffffc0207f3c:	8e060613          	addi	a2,a2,-1824 # ffffffffc020b818 <commands+0x210>
ffffffffc0207f40:	03a00593          	li	a1,58
ffffffffc0207f44:	00006517          	auipc	a0,0x6
ffffffffc0207f48:	4c450513          	addi	a0,a0,1220 # ffffffffc020e408 <syscalls+0xbc0>
ffffffffc0207f4c:	d52f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f50:	00006697          	auipc	a3,0x6
ffffffffc0207f54:	4d868693          	addi	a3,a3,1240 # ffffffffc020e428 <syscalls+0xbe0>
ffffffffc0207f58:	00004617          	auipc	a2,0x4
ffffffffc0207f5c:	8c060613          	addi	a2,a2,-1856 # ffffffffc020b818 <commands+0x210>
ffffffffc0207f60:	03100593          	li	a1,49
ffffffffc0207f64:	00006517          	auipc	a0,0x6
ffffffffc0207f68:	4a450513          	addi	a0,a0,1188 # ffffffffc020e408 <syscalls+0xbc0>
ffffffffc0207f6c:	d32f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0207f70:	00006697          	auipc	a3,0x6
ffffffffc0207f74:	44868693          	addi	a3,a3,1096 # ffffffffc020e3b8 <syscalls+0xb70>
ffffffffc0207f78:	00004617          	auipc	a2,0x4
ffffffffc0207f7c:	8a060613          	addi	a2,a2,-1888 # ffffffffc020b818 <commands+0x210>
ffffffffc0207f80:	02c00593          	li	a1,44
ffffffffc0207f84:	00006517          	auipc	a0,0x6
ffffffffc0207f88:	48450513          	addi	a0,a0,1156 # ffffffffc020e408 <syscalls+0xbc0>
ffffffffc0207f8c:	d12f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0207f90 <vfs_close>:
ffffffffc0207f90:	1141                	addi	sp,sp,-16
ffffffffc0207f92:	e406                	sd	ra,8(sp)
ffffffffc0207f94:	e022                	sd	s0,0(sp)
ffffffffc0207f96:	842a                	mv	s0,a0
ffffffffc0207f98:	8cdff0ef          	jal	ra,ffffffffc0207864 <inode_open_dec>
ffffffffc0207f9c:	8522                	mv	a0,s0
ffffffffc0207f9e:	81fff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc0207fa2:	60a2                	ld	ra,8(sp)
ffffffffc0207fa4:	6402                	ld	s0,0(sp)
ffffffffc0207fa6:	4501                	li	a0,0
ffffffffc0207fa8:	0141                	addi	sp,sp,16
ffffffffc0207faa:	8082                	ret

ffffffffc0207fac <get_device>:
ffffffffc0207fac:	7179                	addi	sp,sp,-48
ffffffffc0207fae:	ec26                	sd	s1,24(sp)
ffffffffc0207fb0:	e84a                	sd	s2,16(sp)
ffffffffc0207fb2:	f406                	sd	ra,40(sp)
ffffffffc0207fb4:	f022                	sd	s0,32(sp)
ffffffffc0207fb6:	00054303          	lbu	t1,0(a0)
ffffffffc0207fba:	892e                	mv	s2,a1
ffffffffc0207fbc:	84b2                	mv	s1,a2
ffffffffc0207fbe:	02030463          	beqz	t1,ffffffffc0207fe6 <get_device+0x3a>
ffffffffc0207fc2:	00150413          	addi	s0,a0,1
ffffffffc0207fc6:	86a2                	mv	a3,s0
ffffffffc0207fc8:	879a                	mv	a5,t1
ffffffffc0207fca:	4701                	li	a4,0
ffffffffc0207fcc:	03a00813          	li	a6,58
ffffffffc0207fd0:	02f00893          	li	a7,47
ffffffffc0207fd4:	03078263          	beq	a5,a6,ffffffffc0207ff8 <get_device+0x4c>
ffffffffc0207fd8:	05178963          	beq	a5,a7,ffffffffc020802a <get_device+0x7e>
ffffffffc0207fdc:	0006c783          	lbu	a5,0(a3)
ffffffffc0207fe0:	2705                	addiw	a4,a4,1
ffffffffc0207fe2:	0685                	addi	a3,a3,1
ffffffffc0207fe4:	fbe5                	bnez	a5,ffffffffc0207fd4 <get_device+0x28>
ffffffffc0207fe6:	7402                	ld	s0,32(sp)
ffffffffc0207fe8:	00a93023          	sd	a0,0(s2)
ffffffffc0207fec:	70a2                	ld	ra,40(sp)
ffffffffc0207fee:	6942                	ld	s2,16(sp)
ffffffffc0207ff0:	8526                	mv	a0,s1
ffffffffc0207ff2:	64e2                	ld	s1,24(sp)
ffffffffc0207ff4:	6145                	addi	sp,sp,48
ffffffffc0207ff6:	a279                	j	ffffffffc0208184 <vfs_get_curdir>
ffffffffc0207ff8:	cb15                	beqz	a4,ffffffffc020802c <get_device+0x80>
ffffffffc0207ffa:	00e507b3          	add	a5,a0,a4
ffffffffc0207ffe:	0705                	addi	a4,a4,1
ffffffffc0208000:	00078023          	sb	zero,0(a5)
ffffffffc0208004:	972a                	add	a4,a4,a0
ffffffffc0208006:	02f00613          	li	a2,47
ffffffffc020800a:	00074783          	lbu	a5,0(a4)
ffffffffc020800e:	86ba                	mv	a3,a4
ffffffffc0208010:	0705                	addi	a4,a4,1
ffffffffc0208012:	fec78ce3          	beq	a5,a2,ffffffffc020800a <get_device+0x5e>
ffffffffc0208016:	7402                	ld	s0,32(sp)
ffffffffc0208018:	70a2                	ld	ra,40(sp)
ffffffffc020801a:	00d93023          	sd	a3,0(s2)
ffffffffc020801e:	85a6                	mv	a1,s1
ffffffffc0208020:	6942                	ld	s2,16(sp)
ffffffffc0208022:	64e2                	ld	s1,24(sp)
ffffffffc0208024:	6145                	addi	sp,sp,48
ffffffffc0208026:	ba9ff06f          	j	ffffffffc0207bce <vfs_get_root>
ffffffffc020802a:	ff55                	bnez	a4,ffffffffc0207fe6 <get_device+0x3a>
ffffffffc020802c:	02f00793          	li	a5,47
ffffffffc0208030:	04f30563          	beq	t1,a5,ffffffffc020807a <get_device+0xce>
ffffffffc0208034:	03a00793          	li	a5,58
ffffffffc0208038:	06f31663          	bne	t1,a5,ffffffffc02080a4 <get_device+0xf8>
ffffffffc020803c:	0028                	addi	a0,sp,8
ffffffffc020803e:	146000ef          	jal	ra,ffffffffc0208184 <vfs_get_curdir>
ffffffffc0208042:	e515                	bnez	a0,ffffffffc020806e <get_device+0xc2>
ffffffffc0208044:	67a2                	ld	a5,8(sp)
ffffffffc0208046:	77a8                	ld	a0,104(a5)
ffffffffc0208048:	cd15                	beqz	a0,ffffffffc0208084 <get_device+0xd8>
ffffffffc020804a:	617c                	ld	a5,192(a0)
ffffffffc020804c:	9782                	jalr	a5
ffffffffc020804e:	87aa                	mv	a5,a0
ffffffffc0208050:	6522                	ld	a0,8(sp)
ffffffffc0208052:	e09c                	sd	a5,0(s1)
ffffffffc0208054:	f68ff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc0208058:	02f00713          	li	a4,47
ffffffffc020805c:	a011                	j	ffffffffc0208060 <get_device+0xb4>
ffffffffc020805e:	0405                	addi	s0,s0,1
ffffffffc0208060:	00044783          	lbu	a5,0(s0)
ffffffffc0208064:	fee78de3          	beq	a5,a4,ffffffffc020805e <get_device+0xb2>
ffffffffc0208068:	00893023          	sd	s0,0(s2)
ffffffffc020806c:	4501                	li	a0,0
ffffffffc020806e:	70a2                	ld	ra,40(sp)
ffffffffc0208070:	7402                	ld	s0,32(sp)
ffffffffc0208072:	64e2                	ld	s1,24(sp)
ffffffffc0208074:	6942                	ld	s2,16(sp)
ffffffffc0208076:	6145                	addi	sp,sp,48
ffffffffc0208078:	8082                	ret
ffffffffc020807a:	8526                	mv	a0,s1
ffffffffc020807c:	93fff0ef          	jal	ra,ffffffffc02079ba <vfs_get_bootfs>
ffffffffc0208080:	dd61                	beqz	a0,ffffffffc0208058 <get_device+0xac>
ffffffffc0208082:	b7f5                	j	ffffffffc020806e <get_device+0xc2>
ffffffffc0208084:	00006697          	auipc	a3,0x6
ffffffffc0208088:	49c68693          	addi	a3,a3,1180 # ffffffffc020e520 <syscalls+0xcd8>
ffffffffc020808c:	00003617          	auipc	a2,0x3
ffffffffc0208090:	78c60613          	addi	a2,a2,1932 # ffffffffc020b818 <commands+0x210>
ffffffffc0208094:	03900593          	li	a1,57
ffffffffc0208098:	00006517          	auipc	a0,0x6
ffffffffc020809c:	47050513          	addi	a0,a0,1136 # ffffffffc020e508 <syscalls+0xcc0>
ffffffffc02080a0:	bfef80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02080a4:	00006697          	auipc	a3,0x6
ffffffffc02080a8:	45468693          	addi	a3,a3,1108 # ffffffffc020e4f8 <syscalls+0xcb0>
ffffffffc02080ac:	00003617          	auipc	a2,0x3
ffffffffc02080b0:	76c60613          	addi	a2,a2,1900 # ffffffffc020b818 <commands+0x210>
ffffffffc02080b4:	03300593          	li	a1,51
ffffffffc02080b8:	00006517          	auipc	a0,0x6
ffffffffc02080bc:	45050513          	addi	a0,a0,1104 # ffffffffc020e508 <syscalls+0xcc0>
ffffffffc02080c0:	bdef80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02080c4 <vfs_lookup>:
ffffffffc02080c4:	7139                	addi	sp,sp,-64
ffffffffc02080c6:	f426                	sd	s1,40(sp)
ffffffffc02080c8:	0830                	addi	a2,sp,24
ffffffffc02080ca:	84ae                	mv	s1,a1
ffffffffc02080cc:	002c                	addi	a1,sp,8
ffffffffc02080ce:	f822                	sd	s0,48(sp)
ffffffffc02080d0:	fc06                	sd	ra,56(sp)
ffffffffc02080d2:	f04a                	sd	s2,32(sp)
ffffffffc02080d4:	e42a                	sd	a0,8(sp)
ffffffffc02080d6:	ed7ff0ef          	jal	ra,ffffffffc0207fac <get_device>
ffffffffc02080da:	842a                	mv	s0,a0
ffffffffc02080dc:	ed1d                	bnez	a0,ffffffffc020811a <vfs_lookup+0x56>
ffffffffc02080de:	67a2                	ld	a5,8(sp)
ffffffffc02080e0:	6962                	ld	s2,24(sp)
ffffffffc02080e2:	0007c783          	lbu	a5,0(a5)
ffffffffc02080e6:	c3a9                	beqz	a5,ffffffffc0208128 <vfs_lookup+0x64>
ffffffffc02080e8:	04090963          	beqz	s2,ffffffffc020813a <vfs_lookup+0x76>
ffffffffc02080ec:	07093783          	ld	a5,112(s2)
ffffffffc02080f0:	c7a9                	beqz	a5,ffffffffc020813a <vfs_lookup+0x76>
ffffffffc02080f2:	7bbc                	ld	a5,112(a5)
ffffffffc02080f4:	c3b9                	beqz	a5,ffffffffc020813a <vfs_lookup+0x76>
ffffffffc02080f6:	854a                	mv	a0,s2
ffffffffc02080f8:	00006597          	auipc	a1,0x6
ffffffffc02080fc:	49058593          	addi	a1,a1,1168 # ffffffffc020e588 <syscalls+0xd40>
ffffffffc0208100:	e06ff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0208104:	07093783          	ld	a5,112(s2)
ffffffffc0208108:	65a2                	ld	a1,8(sp)
ffffffffc020810a:	6562                	ld	a0,24(sp)
ffffffffc020810c:	7bbc                	ld	a5,112(a5)
ffffffffc020810e:	8626                	mv	a2,s1
ffffffffc0208110:	9782                	jalr	a5
ffffffffc0208112:	842a                	mv	s0,a0
ffffffffc0208114:	6562                	ld	a0,24(sp)
ffffffffc0208116:	ea6ff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020811a:	70e2                	ld	ra,56(sp)
ffffffffc020811c:	8522                	mv	a0,s0
ffffffffc020811e:	7442                	ld	s0,48(sp)
ffffffffc0208120:	74a2                	ld	s1,40(sp)
ffffffffc0208122:	7902                	ld	s2,32(sp)
ffffffffc0208124:	6121                	addi	sp,sp,64
ffffffffc0208126:	8082                	ret
ffffffffc0208128:	70e2                	ld	ra,56(sp)
ffffffffc020812a:	8522                	mv	a0,s0
ffffffffc020812c:	7442                	ld	s0,48(sp)
ffffffffc020812e:	0124b023          	sd	s2,0(s1)
ffffffffc0208132:	74a2                	ld	s1,40(sp)
ffffffffc0208134:	7902                	ld	s2,32(sp)
ffffffffc0208136:	6121                	addi	sp,sp,64
ffffffffc0208138:	8082                	ret
ffffffffc020813a:	00006697          	auipc	a3,0x6
ffffffffc020813e:	3fe68693          	addi	a3,a3,1022 # ffffffffc020e538 <syscalls+0xcf0>
ffffffffc0208142:	00003617          	auipc	a2,0x3
ffffffffc0208146:	6d660613          	addi	a2,a2,1750 # ffffffffc020b818 <commands+0x210>
ffffffffc020814a:	04f00593          	li	a1,79
ffffffffc020814e:	00006517          	auipc	a0,0x6
ffffffffc0208152:	3ba50513          	addi	a0,a0,954 # ffffffffc020e508 <syscalls+0xcc0>
ffffffffc0208156:	b48f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020815a <vfs_lookup_parent>:
ffffffffc020815a:	7139                	addi	sp,sp,-64
ffffffffc020815c:	f822                	sd	s0,48(sp)
ffffffffc020815e:	f426                	sd	s1,40(sp)
ffffffffc0208160:	842e                	mv	s0,a1
ffffffffc0208162:	84b2                	mv	s1,a2
ffffffffc0208164:	002c                	addi	a1,sp,8
ffffffffc0208166:	0830                	addi	a2,sp,24
ffffffffc0208168:	fc06                	sd	ra,56(sp)
ffffffffc020816a:	e42a                	sd	a0,8(sp)
ffffffffc020816c:	e41ff0ef          	jal	ra,ffffffffc0207fac <get_device>
ffffffffc0208170:	e509                	bnez	a0,ffffffffc020817a <vfs_lookup_parent+0x20>
ffffffffc0208172:	67a2                	ld	a5,8(sp)
ffffffffc0208174:	e09c                	sd	a5,0(s1)
ffffffffc0208176:	67e2                	ld	a5,24(sp)
ffffffffc0208178:	e01c                	sd	a5,0(s0)
ffffffffc020817a:	70e2                	ld	ra,56(sp)
ffffffffc020817c:	7442                	ld	s0,48(sp)
ffffffffc020817e:	74a2                	ld	s1,40(sp)
ffffffffc0208180:	6121                	addi	sp,sp,64
ffffffffc0208182:	8082                	ret

ffffffffc0208184 <vfs_get_curdir>:
ffffffffc0208184:	0008e797          	auipc	a5,0x8e
ffffffffc0208188:	73c7b783          	ld	a5,1852(a5) # ffffffffc02968c0 <current>
ffffffffc020818c:	1487b783          	ld	a5,328(a5)
ffffffffc0208190:	1101                	addi	sp,sp,-32
ffffffffc0208192:	e426                	sd	s1,8(sp)
ffffffffc0208194:	6384                	ld	s1,0(a5)
ffffffffc0208196:	ec06                	sd	ra,24(sp)
ffffffffc0208198:	e822                	sd	s0,16(sp)
ffffffffc020819a:	cc81                	beqz	s1,ffffffffc02081b2 <vfs_get_curdir+0x2e>
ffffffffc020819c:	842a                	mv	s0,a0
ffffffffc020819e:	8526                	mv	a0,s1
ffffffffc02081a0:	d4eff0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc02081a4:	4501                	li	a0,0
ffffffffc02081a6:	e004                	sd	s1,0(s0)
ffffffffc02081a8:	60e2                	ld	ra,24(sp)
ffffffffc02081aa:	6442                	ld	s0,16(sp)
ffffffffc02081ac:	64a2                	ld	s1,8(sp)
ffffffffc02081ae:	6105                	addi	sp,sp,32
ffffffffc02081b0:	8082                	ret
ffffffffc02081b2:	5541                	li	a0,-16
ffffffffc02081b4:	bfd5                	j	ffffffffc02081a8 <vfs_get_curdir+0x24>

ffffffffc02081b6 <vfs_set_curdir>:
ffffffffc02081b6:	7139                	addi	sp,sp,-64
ffffffffc02081b8:	f04a                	sd	s2,32(sp)
ffffffffc02081ba:	0008e917          	auipc	s2,0x8e
ffffffffc02081be:	70690913          	addi	s2,s2,1798 # ffffffffc02968c0 <current>
ffffffffc02081c2:	00093783          	ld	a5,0(s2)
ffffffffc02081c6:	f822                	sd	s0,48(sp)
ffffffffc02081c8:	842a                	mv	s0,a0
ffffffffc02081ca:	1487b503          	ld	a0,328(a5)
ffffffffc02081ce:	ec4e                	sd	s3,24(sp)
ffffffffc02081d0:	fc06                	sd	ra,56(sp)
ffffffffc02081d2:	f426                	sd	s1,40(sp)
ffffffffc02081d4:	ffbfc0ef          	jal	ra,ffffffffc02051ce <lock_files>
ffffffffc02081d8:	00093783          	ld	a5,0(s2)
ffffffffc02081dc:	1487b503          	ld	a0,328(a5)
ffffffffc02081e0:	00053983          	ld	s3,0(a0)
ffffffffc02081e4:	07340963          	beq	s0,s3,ffffffffc0208256 <vfs_set_curdir+0xa0>
ffffffffc02081e8:	cc39                	beqz	s0,ffffffffc0208246 <vfs_set_curdir+0x90>
ffffffffc02081ea:	783c                	ld	a5,112(s0)
ffffffffc02081ec:	c7bd                	beqz	a5,ffffffffc020825a <vfs_set_curdir+0xa4>
ffffffffc02081ee:	6bbc                	ld	a5,80(a5)
ffffffffc02081f0:	c7ad                	beqz	a5,ffffffffc020825a <vfs_set_curdir+0xa4>
ffffffffc02081f2:	00006597          	auipc	a1,0x6
ffffffffc02081f6:	40658593          	addi	a1,a1,1030 # ffffffffc020e5f8 <syscalls+0xdb0>
ffffffffc02081fa:	8522                	mv	a0,s0
ffffffffc02081fc:	d0aff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0208200:	783c                	ld	a5,112(s0)
ffffffffc0208202:	006c                	addi	a1,sp,12
ffffffffc0208204:	8522                	mv	a0,s0
ffffffffc0208206:	6bbc                	ld	a5,80(a5)
ffffffffc0208208:	9782                	jalr	a5
ffffffffc020820a:	84aa                	mv	s1,a0
ffffffffc020820c:	e901                	bnez	a0,ffffffffc020821c <vfs_set_curdir+0x66>
ffffffffc020820e:	47b2                	lw	a5,12(sp)
ffffffffc0208210:	669d                	lui	a3,0x7
ffffffffc0208212:	6709                	lui	a4,0x2
ffffffffc0208214:	8ff5                	and	a5,a5,a3
ffffffffc0208216:	54b9                	li	s1,-18
ffffffffc0208218:	02e78063          	beq	a5,a4,ffffffffc0208238 <vfs_set_curdir+0x82>
ffffffffc020821c:	00093783          	ld	a5,0(s2)
ffffffffc0208220:	1487b503          	ld	a0,328(a5)
ffffffffc0208224:	fb1fc0ef          	jal	ra,ffffffffc02051d4 <unlock_files>
ffffffffc0208228:	70e2                	ld	ra,56(sp)
ffffffffc020822a:	7442                	ld	s0,48(sp)
ffffffffc020822c:	7902                	ld	s2,32(sp)
ffffffffc020822e:	69e2                	ld	s3,24(sp)
ffffffffc0208230:	8526                	mv	a0,s1
ffffffffc0208232:	74a2                	ld	s1,40(sp)
ffffffffc0208234:	6121                	addi	sp,sp,64
ffffffffc0208236:	8082                	ret
ffffffffc0208238:	8522                	mv	a0,s0
ffffffffc020823a:	cb4ff0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc020823e:	00093783          	ld	a5,0(s2)
ffffffffc0208242:	1487b503          	ld	a0,328(a5)
ffffffffc0208246:	e100                	sd	s0,0(a0)
ffffffffc0208248:	4481                	li	s1,0
ffffffffc020824a:	fc098de3          	beqz	s3,ffffffffc0208224 <vfs_set_curdir+0x6e>
ffffffffc020824e:	854e                	mv	a0,s3
ffffffffc0208250:	d6cff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc0208254:	b7e1                	j	ffffffffc020821c <vfs_set_curdir+0x66>
ffffffffc0208256:	4481                	li	s1,0
ffffffffc0208258:	b7f1                	j	ffffffffc0208224 <vfs_set_curdir+0x6e>
ffffffffc020825a:	00006697          	auipc	a3,0x6
ffffffffc020825e:	33668693          	addi	a3,a3,822 # ffffffffc020e590 <syscalls+0xd48>
ffffffffc0208262:	00003617          	auipc	a2,0x3
ffffffffc0208266:	5b660613          	addi	a2,a2,1462 # ffffffffc020b818 <commands+0x210>
ffffffffc020826a:	04300593          	li	a1,67
ffffffffc020826e:	00006517          	auipc	a0,0x6
ffffffffc0208272:	37250513          	addi	a0,a0,882 # ffffffffc020e5e0 <syscalls+0xd98>
ffffffffc0208276:	a28f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020827a <vfs_chdir>:
ffffffffc020827a:	1101                	addi	sp,sp,-32
ffffffffc020827c:	002c                	addi	a1,sp,8
ffffffffc020827e:	e822                	sd	s0,16(sp)
ffffffffc0208280:	ec06                	sd	ra,24(sp)
ffffffffc0208282:	e43ff0ef          	jal	ra,ffffffffc02080c4 <vfs_lookup>
ffffffffc0208286:	842a                	mv	s0,a0
ffffffffc0208288:	c511                	beqz	a0,ffffffffc0208294 <vfs_chdir+0x1a>
ffffffffc020828a:	60e2                	ld	ra,24(sp)
ffffffffc020828c:	8522                	mv	a0,s0
ffffffffc020828e:	6442                	ld	s0,16(sp)
ffffffffc0208290:	6105                	addi	sp,sp,32
ffffffffc0208292:	8082                	ret
ffffffffc0208294:	6522                	ld	a0,8(sp)
ffffffffc0208296:	f21ff0ef          	jal	ra,ffffffffc02081b6 <vfs_set_curdir>
ffffffffc020829a:	842a                	mv	s0,a0
ffffffffc020829c:	6522                	ld	a0,8(sp)
ffffffffc020829e:	d1eff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc02082a2:	60e2                	ld	ra,24(sp)
ffffffffc02082a4:	8522                	mv	a0,s0
ffffffffc02082a6:	6442                	ld	s0,16(sp)
ffffffffc02082a8:	6105                	addi	sp,sp,32
ffffffffc02082aa:	8082                	ret

ffffffffc02082ac <vfs_getcwd>:
ffffffffc02082ac:	0008e797          	auipc	a5,0x8e
ffffffffc02082b0:	6147b783          	ld	a5,1556(a5) # ffffffffc02968c0 <current>
ffffffffc02082b4:	1487b783          	ld	a5,328(a5)
ffffffffc02082b8:	7179                	addi	sp,sp,-48
ffffffffc02082ba:	ec26                	sd	s1,24(sp)
ffffffffc02082bc:	6384                	ld	s1,0(a5)
ffffffffc02082be:	f406                	sd	ra,40(sp)
ffffffffc02082c0:	f022                	sd	s0,32(sp)
ffffffffc02082c2:	e84a                	sd	s2,16(sp)
ffffffffc02082c4:	ccbd                	beqz	s1,ffffffffc0208342 <vfs_getcwd+0x96>
ffffffffc02082c6:	892a                	mv	s2,a0
ffffffffc02082c8:	8526                	mv	a0,s1
ffffffffc02082ca:	c24ff0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc02082ce:	74a8                	ld	a0,104(s1)
ffffffffc02082d0:	c93d                	beqz	a0,ffffffffc0208346 <vfs_getcwd+0x9a>
ffffffffc02082d2:	9b3ff0ef          	jal	ra,ffffffffc0207c84 <vfs_get_devname>
ffffffffc02082d6:	842a                	mv	s0,a0
ffffffffc02082d8:	7bd020ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc02082dc:	862a                	mv	a2,a0
ffffffffc02082de:	85a2                	mv	a1,s0
ffffffffc02082e0:	4701                	li	a4,0
ffffffffc02082e2:	4685                	li	a3,1
ffffffffc02082e4:	854a                	mv	a0,s2
ffffffffc02082e6:	912fd0ef          	jal	ra,ffffffffc02053f8 <iobuf_move>
ffffffffc02082ea:	842a                	mv	s0,a0
ffffffffc02082ec:	c919                	beqz	a0,ffffffffc0208302 <vfs_getcwd+0x56>
ffffffffc02082ee:	8526                	mv	a0,s1
ffffffffc02082f0:	cccff0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc02082f4:	70a2                	ld	ra,40(sp)
ffffffffc02082f6:	8522                	mv	a0,s0
ffffffffc02082f8:	7402                	ld	s0,32(sp)
ffffffffc02082fa:	64e2                	ld	s1,24(sp)
ffffffffc02082fc:	6942                	ld	s2,16(sp)
ffffffffc02082fe:	6145                	addi	sp,sp,48
ffffffffc0208300:	8082                	ret
ffffffffc0208302:	03a00793          	li	a5,58
ffffffffc0208306:	4701                	li	a4,0
ffffffffc0208308:	4685                	li	a3,1
ffffffffc020830a:	4605                	li	a2,1
ffffffffc020830c:	00f10593          	addi	a1,sp,15
ffffffffc0208310:	854a                	mv	a0,s2
ffffffffc0208312:	00f107a3          	sb	a5,15(sp)
ffffffffc0208316:	8e2fd0ef          	jal	ra,ffffffffc02053f8 <iobuf_move>
ffffffffc020831a:	842a                	mv	s0,a0
ffffffffc020831c:	f969                	bnez	a0,ffffffffc02082ee <vfs_getcwd+0x42>
ffffffffc020831e:	78bc                	ld	a5,112(s1)
ffffffffc0208320:	c3b9                	beqz	a5,ffffffffc0208366 <vfs_getcwd+0xba>
ffffffffc0208322:	7f9c                	ld	a5,56(a5)
ffffffffc0208324:	c3a9                	beqz	a5,ffffffffc0208366 <vfs_getcwd+0xba>
ffffffffc0208326:	00006597          	auipc	a1,0x6
ffffffffc020832a:	33258593          	addi	a1,a1,818 # ffffffffc020e658 <syscalls+0xe10>
ffffffffc020832e:	8526                	mv	a0,s1
ffffffffc0208330:	bd6ff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0208334:	78bc                	ld	a5,112(s1)
ffffffffc0208336:	85ca                	mv	a1,s2
ffffffffc0208338:	8526                	mv	a0,s1
ffffffffc020833a:	7f9c                	ld	a5,56(a5)
ffffffffc020833c:	9782                	jalr	a5
ffffffffc020833e:	842a                	mv	s0,a0
ffffffffc0208340:	b77d                	j	ffffffffc02082ee <vfs_getcwd+0x42>
ffffffffc0208342:	5441                	li	s0,-16
ffffffffc0208344:	bf45                	j	ffffffffc02082f4 <vfs_getcwd+0x48>
ffffffffc0208346:	00006697          	auipc	a3,0x6
ffffffffc020834a:	1da68693          	addi	a3,a3,474 # ffffffffc020e520 <syscalls+0xcd8>
ffffffffc020834e:	00003617          	auipc	a2,0x3
ffffffffc0208352:	4ca60613          	addi	a2,a2,1226 # ffffffffc020b818 <commands+0x210>
ffffffffc0208356:	06e00593          	li	a1,110
ffffffffc020835a:	00006517          	auipc	a0,0x6
ffffffffc020835e:	28650513          	addi	a0,a0,646 # ffffffffc020e5e0 <syscalls+0xd98>
ffffffffc0208362:	93cf80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208366:	00006697          	auipc	a3,0x6
ffffffffc020836a:	29a68693          	addi	a3,a3,666 # ffffffffc020e600 <syscalls+0xdb8>
ffffffffc020836e:	00003617          	auipc	a2,0x3
ffffffffc0208372:	4aa60613          	addi	a2,a2,1194 # ffffffffc020b818 <commands+0x210>
ffffffffc0208376:	07800593          	li	a1,120
ffffffffc020837a:	00006517          	auipc	a0,0x6
ffffffffc020837e:	26650513          	addi	a0,a0,614 # ffffffffc020e5e0 <syscalls+0xd98>
ffffffffc0208382:	91cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208386 <dev_lookup>:
ffffffffc0208386:	0005c783          	lbu	a5,0(a1)
ffffffffc020838a:	e385                	bnez	a5,ffffffffc02083aa <dev_lookup+0x24>
ffffffffc020838c:	1101                	addi	sp,sp,-32
ffffffffc020838e:	e822                	sd	s0,16(sp)
ffffffffc0208390:	e426                	sd	s1,8(sp)
ffffffffc0208392:	ec06                	sd	ra,24(sp)
ffffffffc0208394:	84aa                	mv	s1,a0
ffffffffc0208396:	8432                	mv	s0,a2
ffffffffc0208398:	b56ff0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc020839c:	60e2                	ld	ra,24(sp)
ffffffffc020839e:	e004                	sd	s1,0(s0)
ffffffffc02083a0:	6442                	ld	s0,16(sp)
ffffffffc02083a2:	64a2                	ld	s1,8(sp)
ffffffffc02083a4:	4501                	li	a0,0
ffffffffc02083a6:	6105                	addi	sp,sp,32
ffffffffc02083a8:	8082                	ret
ffffffffc02083aa:	5541                	li	a0,-16
ffffffffc02083ac:	8082                	ret

ffffffffc02083ae <dev_fstat>:
ffffffffc02083ae:	1101                	addi	sp,sp,-32
ffffffffc02083b0:	e426                	sd	s1,8(sp)
ffffffffc02083b2:	84ae                	mv	s1,a1
ffffffffc02083b4:	e822                	sd	s0,16(sp)
ffffffffc02083b6:	02000613          	li	a2,32
ffffffffc02083ba:	842a                	mv	s0,a0
ffffffffc02083bc:	4581                	li	a1,0
ffffffffc02083be:	8526                	mv	a0,s1
ffffffffc02083c0:	ec06                	sd	ra,24(sp)
ffffffffc02083c2:	775020ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc02083c6:	c429                	beqz	s0,ffffffffc0208410 <dev_fstat+0x62>
ffffffffc02083c8:	783c                	ld	a5,112(s0)
ffffffffc02083ca:	c3b9                	beqz	a5,ffffffffc0208410 <dev_fstat+0x62>
ffffffffc02083cc:	6bbc                	ld	a5,80(a5)
ffffffffc02083ce:	c3a9                	beqz	a5,ffffffffc0208410 <dev_fstat+0x62>
ffffffffc02083d0:	00006597          	auipc	a1,0x6
ffffffffc02083d4:	22858593          	addi	a1,a1,552 # ffffffffc020e5f8 <syscalls+0xdb0>
ffffffffc02083d8:	8522                	mv	a0,s0
ffffffffc02083da:	b2cff0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc02083de:	783c                	ld	a5,112(s0)
ffffffffc02083e0:	85a6                	mv	a1,s1
ffffffffc02083e2:	8522                	mv	a0,s0
ffffffffc02083e4:	6bbc                	ld	a5,80(a5)
ffffffffc02083e6:	9782                	jalr	a5
ffffffffc02083e8:	ed19                	bnez	a0,ffffffffc0208406 <dev_fstat+0x58>
ffffffffc02083ea:	4c38                	lw	a4,88(s0)
ffffffffc02083ec:	6785                	lui	a5,0x1
ffffffffc02083ee:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02083f2:	02f71f63          	bne	a4,a5,ffffffffc0208430 <dev_fstat+0x82>
ffffffffc02083f6:	6018                	ld	a4,0(s0)
ffffffffc02083f8:	641c                	ld	a5,8(s0)
ffffffffc02083fa:	4685                	li	a3,1
ffffffffc02083fc:	e494                	sd	a3,8(s1)
ffffffffc02083fe:	02e787b3          	mul	a5,a5,a4
ffffffffc0208402:	e898                	sd	a4,16(s1)
ffffffffc0208404:	ec9c                	sd	a5,24(s1)
ffffffffc0208406:	60e2                	ld	ra,24(sp)
ffffffffc0208408:	6442                	ld	s0,16(sp)
ffffffffc020840a:	64a2                	ld	s1,8(sp)
ffffffffc020840c:	6105                	addi	sp,sp,32
ffffffffc020840e:	8082                	ret
ffffffffc0208410:	00006697          	auipc	a3,0x6
ffffffffc0208414:	18068693          	addi	a3,a3,384 # ffffffffc020e590 <syscalls+0xd48>
ffffffffc0208418:	00003617          	auipc	a2,0x3
ffffffffc020841c:	40060613          	addi	a2,a2,1024 # ffffffffc020b818 <commands+0x210>
ffffffffc0208420:	04200593          	li	a1,66
ffffffffc0208424:	00006517          	auipc	a0,0x6
ffffffffc0208428:	24450513          	addi	a0,a0,580 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc020842c:	872f80ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208430:	00006697          	auipc	a3,0x6
ffffffffc0208434:	f2868693          	addi	a3,a3,-216 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc0208438:	00003617          	auipc	a2,0x3
ffffffffc020843c:	3e060613          	addi	a2,a2,992 # ffffffffc020b818 <commands+0x210>
ffffffffc0208440:	04500593          	li	a1,69
ffffffffc0208444:	00006517          	auipc	a0,0x6
ffffffffc0208448:	22450513          	addi	a0,a0,548 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc020844c:	852f80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208450 <dev_ioctl>:
ffffffffc0208450:	c909                	beqz	a0,ffffffffc0208462 <dev_ioctl+0x12>
ffffffffc0208452:	4d34                	lw	a3,88(a0)
ffffffffc0208454:	6705                	lui	a4,0x1
ffffffffc0208456:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020845a:	00e69463          	bne	a3,a4,ffffffffc0208462 <dev_ioctl+0x12>
ffffffffc020845e:	751c                	ld	a5,40(a0)
ffffffffc0208460:	8782                	jr	a5
ffffffffc0208462:	1141                	addi	sp,sp,-16
ffffffffc0208464:	00006697          	auipc	a3,0x6
ffffffffc0208468:	ef468693          	addi	a3,a3,-268 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc020846c:	00003617          	auipc	a2,0x3
ffffffffc0208470:	3ac60613          	addi	a2,a2,940 # ffffffffc020b818 <commands+0x210>
ffffffffc0208474:	03500593          	li	a1,53
ffffffffc0208478:	00006517          	auipc	a0,0x6
ffffffffc020847c:	1f050513          	addi	a0,a0,496 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc0208480:	e406                	sd	ra,8(sp)
ffffffffc0208482:	81cf80ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208486 <dev_tryseek>:
ffffffffc0208486:	c51d                	beqz	a0,ffffffffc02084b4 <dev_tryseek+0x2e>
ffffffffc0208488:	4d38                	lw	a4,88(a0)
ffffffffc020848a:	6785                	lui	a5,0x1
ffffffffc020848c:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208490:	02f71263          	bne	a4,a5,ffffffffc02084b4 <dev_tryseek+0x2e>
ffffffffc0208494:	611c                	ld	a5,0(a0)
ffffffffc0208496:	cf89                	beqz	a5,ffffffffc02084b0 <dev_tryseek+0x2a>
ffffffffc0208498:	6518                	ld	a4,8(a0)
ffffffffc020849a:	02e5f6b3          	remu	a3,a1,a4
ffffffffc020849e:	ea89                	bnez	a3,ffffffffc02084b0 <dev_tryseek+0x2a>
ffffffffc02084a0:	0005c863          	bltz	a1,ffffffffc02084b0 <dev_tryseek+0x2a>
ffffffffc02084a4:	02e787b3          	mul	a5,a5,a4
ffffffffc02084a8:	00f5f463          	bgeu	a1,a5,ffffffffc02084b0 <dev_tryseek+0x2a>
ffffffffc02084ac:	4501                	li	a0,0
ffffffffc02084ae:	8082                	ret
ffffffffc02084b0:	5575                	li	a0,-3
ffffffffc02084b2:	8082                	ret
ffffffffc02084b4:	1141                	addi	sp,sp,-16
ffffffffc02084b6:	00006697          	auipc	a3,0x6
ffffffffc02084ba:	ea268693          	addi	a3,a3,-350 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc02084be:	00003617          	auipc	a2,0x3
ffffffffc02084c2:	35a60613          	addi	a2,a2,858 # ffffffffc020b818 <commands+0x210>
ffffffffc02084c6:	05f00593          	li	a1,95
ffffffffc02084ca:	00006517          	auipc	a0,0x6
ffffffffc02084ce:	19e50513          	addi	a0,a0,414 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc02084d2:	e406                	sd	ra,8(sp)
ffffffffc02084d4:	fcbf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02084d8 <dev_gettype>:
ffffffffc02084d8:	c10d                	beqz	a0,ffffffffc02084fa <dev_gettype+0x22>
ffffffffc02084da:	4d38                	lw	a4,88(a0)
ffffffffc02084dc:	6785                	lui	a5,0x1
ffffffffc02084de:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02084e2:	00f71c63          	bne	a4,a5,ffffffffc02084fa <dev_gettype+0x22>
ffffffffc02084e6:	6118                	ld	a4,0(a0)
ffffffffc02084e8:	6795                	lui	a5,0x5
ffffffffc02084ea:	c701                	beqz	a4,ffffffffc02084f2 <dev_gettype+0x1a>
ffffffffc02084ec:	c19c                	sw	a5,0(a1)
ffffffffc02084ee:	4501                	li	a0,0
ffffffffc02084f0:	8082                	ret
ffffffffc02084f2:	6791                	lui	a5,0x4
ffffffffc02084f4:	c19c                	sw	a5,0(a1)
ffffffffc02084f6:	4501                	li	a0,0
ffffffffc02084f8:	8082                	ret
ffffffffc02084fa:	1141                	addi	sp,sp,-16
ffffffffc02084fc:	00006697          	auipc	a3,0x6
ffffffffc0208500:	e5c68693          	addi	a3,a3,-420 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc0208504:	00003617          	auipc	a2,0x3
ffffffffc0208508:	31460613          	addi	a2,a2,788 # ffffffffc020b818 <commands+0x210>
ffffffffc020850c:	05300593          	li	a1,83
ffffffffc0208510:	00006517          	auipc	a0,0x6
ffffffffc0208514:	15850513          	addi	a0,a0,344 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc0208518:	e406                	sd	ra,8(sp)
ffffffffc020851a:	f85f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020851e <dev_write>:
ffffffffc020851e:	c911                	beqz	a0,ffffffffc0208532 <dev_write+0x14>
ffffffffc0208520:	4d34                	lw	a3,88(a0)
ffffffffc0208522:	6705                	lui	a4,0x1
ffffffffc0208524:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208528:	00e69563          	bne	a3,a4,ffffffffc0208532 <dev_write+0x14>
ffffffffc020852c:	711c                	ld	a5,32(a0)
ffffffffc020852e:	4605                	li	a2,1
ffffffffc0208530:	8782                	jr	a5
ffffffffc0208532:	1141                	addi	sp,sp,-16
ffffffffc0208534:	00006697          	auipc	a3,0x6
ffffffffc0208538:	e2468693          	addi	a3,a3,-476 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc020853c:	00003617          	auipc	a2,0x3
ffffffffc0208540:	2dc60613          	addi	a2,a2,732 # ffffffffc020b818 <commands+0x210>
ffffffffc0208544:	02c00593          	li	a1,44
ffffffffc0208548:	00006517          	auipc	a0,0x6
ffffffffc020854c:	12050513          	addi	a0,a0,288 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc0208550:	e406                	sd	ra,8(sp)
ffffffffc0208552:	f4df70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208556 <dev_read>:
ffffffffc0208556:	c911                	beqz	a0,ffffffffc020856a <dev_read+0x14>
ffffffffc0208558:	4d34                	lw	a3,88(a0)
ffffffffc020855a:	6705                	lui	a4,0x1
ffffffffc020855c:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208560:	00e69563          	bne	a3,a4,ffffffffc020856a <dev_read+0x14>
ffffffffc0208564:	711c                	ld	a5,32(a0)
ffffffffc0208566:	4601                	li	a2,0
ffffffffc0208568:	8782                	jr	a5
ffffffffc020856a:	1141                	addi	sp,sp,-16
ffffffffc020856c:	00006697          	auipc	a3,0x6
ffffffffc0208570:	dec68693          	addi	a3,a3,-532 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc0208574:	00003617          	auipc	a2,0x3
ffffffffc0208578:	2a460613          	addi	a2,a2,676 # ffffffffc020b818 <commands+0x210>
ffffffffc020857c:	02300593          	li	a1,35
ffffffffc0208580:	00006517          	auipc	a0,0x6
ffffffffc0208584:	0e850513          	addi	a0,a0,232 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc0208588:	e406                	sd	ra,8(sp)
ffffffffc020858a:	f15f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020858e <dev_close>:
ffffffffc020858e:	c909                	beqz	a0,ffffffffc02085a0 <dev_close+0x12>
ffffffffc0208590:	4d34                	lw	a3,88(a0)
ffffffffc0208592:	6705                	lui	a4,0x1
ffffffffc0208594:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208598:	00e69463          	bne	a3,a4,ffffffffc02085a0 <dev_close+0x12>
ffffffffc020859c:	6d1c                	ld	a5,24(a0)
ffffffffc020859e:	8782                	jr	a5
ffffffffc02085a0:	1141                	addi	sp,sp,-16
ffffffffc02085a2:	00006697          	auipc	a3,0x6
ffffffffc02085a6:	db668693          	addi	a3,a3,-586 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc02085aa:	00003617          	auipc	a2,0x3
ffffffffc02085ae:	26e60613          	addi	a2,a2,622 # ffffffffc020b818 <commands+0x210>
ffffffffc02085b2:	45e9                	li	a1,26
ffffffffc02085b4:	00006517          	auipc	a0,0x6
ffffffffc02085b8:	0b450513          	addi	a0,a0,180 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc02085bc:	e406                	sd	ra,8(sp)
ffffffffc02085be:	ee1f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02085c2 <dev_open>:
ffffffffc02085c2:	03c5f713          	andi	a4,a1,60
ffffffffc02085c6:	eb11                	bnez	a4,ffffffffc02085da <dev_open+0x18>
ffffffffc02085c8:	c919                	beqz	a0,ffffffffc02085de <dev_open+0x1c>
ffffffffc02085ca:	4d34                	lw	a3,88(a0)
ffffffffc02085cc:	6705                	lui	a4,0x1
ffffffffc02085ce:	23470713          	addi	a4,a4,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc02085d2:	00e69663          	bne	a3,a4,ffffffffc02085de <dev_open+0x1c>
ffffffffc02085d6:	691c                	ld	a5,16(a0)
ffffffffc02085d8:	8782                	jr	a5
ffffffffc02085da:	5575                	li	a0,-3
ffffffffc02085dc:	8082                	ret
ffffffffc02085de:	1141                	addi	sp,sp,-16
ffffffffc02085e0:	00006697          	auipc	a3,0x6
ffffffffc02085e4:	d7868693          	addi	a3,a3,-648 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc02085e8:	00003617          	auipc	a2,0x3
ffffffffc02085ec:	23060613          	addi	a2,a2,560 # ffffffffc020b818 <commands+0x210>
ffffffffc02085f0:	45c5                	li	a1,17
ffffffffc02085f2:	00006517          	auipc	a0,0x6
ffffffffc02085f6:	07650513          	addi	a0,a0,118 # ffffffffc020e668 <syscalls+0xe20>
ffffffffc02085fa:	e406                	sd	ra,8(sp)
ffffffffc02085fc:	ea3f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208600 <dev_init>:
ffffffffc0208600:	1141                	addi	sp,sp,-16
ffffffffc0208602:	e406                	sd	ra,8(sp)
ffffffffc0208604:	542000ef          	jal	ra,ffffffffc0208b46 <dev_init_stdin>
ffffffffc0208608:	65a000ef          	jal	ra,ffffffffc0208c62 <dev_init_stdout>
ffffffffc020860c:	60a2                	ld	ra,8(sp)
ffffffffc020860e:	0141                	addi	sp,sp,16
ffffffffc0208610:	a439                	j	ffffffffc020881e <dev_init_disk0>

ffffffffc0208612 <dev_create_inode>:
ffffffffc0208612:	6505                	lui	a0,0x1
ffffffffc0208614:	1141                	addi	sp,sp,-16
ffffffffc0208616:	23450513          	addi	a0,a0,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc020861a:	e022                	sd	s0,0(sp)
ffffffffc020861c:	e406                	sd	ra,8(sp)
ffffffffc020861e:	852ff0ef          	jal	ra,ffffffffc0207670 <__alloc_inode>
ffffffffc0208622:	842a                	mv	s0,a0
ffffffffc0208624:	c901                	beqz	a0,ffffffffc0208634 <dev_create_inode+0x22>
ffffffffc0208626:	4601                	li	a2,0
ffffffffc0208628:	00006597          	auipc	a1,0x6
ffffffffc020862c:	05858593          	addi	a1,a1,88 # ffffffffc020e680 <dev_node_ops>
ffffffffc0208630:	85cff0ef          	jal	ra,ffffffffc020768c <inode_init>
ffffffffc0208634:	60a2                	ld	ra,8(sp)
ffffffffc0208636:	8522                	mv	a0,s0
ffffffffc0208638:	6402                	ld	s0,0(sp)
ffffffffc020863a:	0141                	addi	sp,sp,16
ffffffffc020863c:	8082                	ret

ffffffffc020863e <disk0_open>:
ffffffffc020863e:	4501                	li	a0,0
ffffffffc0208640:	8082                	ret

ffffffffc0208642 <disk0_close>:
ffffffffc0208642:	4501                	li	a0,0
ffffffffc0208644:	8082                	ret

ffffffffc0208646 <disk0_ioctl>:
ffffffffc0208646:	5531                	li	a0,-20
ffffffffc0208648:	8082                	ret

ffffffffc020864a <disk0_io>:
ffffffffc020864a:	659c                	ld	a5,8(a1)
ffffffffc020864c:	7159                	addi	sp,sp,-112
ffffffffc020864e:	eca6                	sd	s1,88(sp)
ffffffffc0208650:	f45e                	sd	s7,40(sp)
ffffffffc0208652:	6d84                	ld	s1,24(a1)
ffffffffc0208654:	6b85                	lui	s7,0x1
ffffffffc0208656:	1bfd                	addi	s7,s7,-1
ffffffffc0208658:	e4ce                	sd	s3,72(sp)
ffffffffc020865a:	43f7d993          	srai	s3,a5,0x3f
ffffffffc020865e:	0179f9b3          	and	s3,s3,s7
ffffffffc0208662:	99be                	add	s3,s3,a5
ffffffffc0208664:	8fc5                	or	a5,a5,s1
ffffffffc0208666:	f486                	sd	ra,104(sp)
ffffffffc0208668:	f0a2                	sd	s0,96(sp)
ffffffffc020866a:	e8ca                	sd	s2,80(sp)
ffffffffc020866c:	e0d2                	sd	s4,64(sp)
ffffffffc020866e:	fc56                	sd	s5,56(sp)
ffffffffc0208670:	f85a                	sd	s6,48(sp)
ffffffffc0208672:	f062                	sd	s8,32(sp)
ffffffffc0208674:	ec66                	sd	s9,24(sp)
ffffffffc0208676:	e86a                	sd	s10,16(sp)
ffffffffc0208678:	0177f7b3          	and	a5,a5,s7
ffffffffc020867c:	10079d63          	bnez	a5,ffffffffc0208796 <disk0_io+0x14c>
ffffffffc0208680:	40c9d993          	srai	s3,s3,0xc
ffffffffc0208684:	00c4d713          	srli	a4,s1,0xc
ffffffffc0208688:	2981                	sext.w	s3,s3
ffffffffc020868a:	2701                	sext.w	a4,a4
ffffffffc020868c:	00e987bb          	addw	a5,s3,a4
ffffffffc0208690:	6114                	ld	a3,0(a0)
ffffffffc0208692:	1782                	slli	a5,a5,0x20
ffffffffc0208694:	9381                	srli	a5,a5,0x20
ffffffffc0208696:	10f6e063          	bltu	a3,a5,ffffffffc0208796 <disk0_io+0x14c>
ffffffffc020869a:	4501                	li	a0,0
ffffffffc020869c:	ef19                	bnez	a4,ffffffffc02086ba <disk0_io+0x70>
ffffffffc020869e:	70a6                	ld	ra,104(sp)
ffffffffc02086a0:	7406                	ld	s0,96(sp)
ffffffffc02086a2:	64e6                	ld	s1,88(sp)
ffffffffc02086a4:	6946                	ld	s2,80(sp)
ffffffffc02086a6:	69a6                	ld	s3,72(sp)
ffffffffc02086a8:	6a06                	ld	s4,64(sp)
ffffffffc02086aa:	7ae2                	ld	s5,56(sp)
ffffffffc02086ac:	7b42                	ld	s6,48(sp)
ffffffffc02086ae:	7ba2                	ld	s7,40(sp)
ffffffffc02086b0:	7c02                	ld	s8,32(sp)
ffffffffc02086b2:	6ce2                	ld	s9,24(sp)
ffffffffc02086b4:	6d42                	ld	s10,16(sp)
ffffffffc02086b6:	6165                	addi	sp,sp,112
ffffffffc02086b8:	8082                	ret
ffffffffc02086ba:	0008d517          	auipc	a0,0x8d
ffffffffc02086be:	18650513          	addi	a0,a0,390 # ffffffffc0295840 <disk0_sem>
ffffffffc02086c2:	8b2e                	mv	s6,a1
ffffffffc02086c4:	8c32                	mv	s8,a2
ffffffffc02086c6:	0008ea97          	auipc	s5,0x8e
ffffffffc02086ca:	232a8a93          	addi	s5,s5,562 # ffffffffc02968f8 <disk0_buffer>
ffffffffc02086ce:	ea3fb0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc02086d2:	6c91                	lui	s9,0x4
ffffffffc02086d4:	e4b9                	bnez	s1,ffffffffc0208722 <disk0_io+0xd8>
ffffffffc02086d6:	a845                	j	ffffffffc0208786 <disk0_io+0x13c>
ffffffffc02086d8:	00c4d413          	srli	s0,s1,0xc
ffffffffc02086dc:	0034169b          	slliw	a3,s0,0x3
ffffffffc02086e0:	00068d1b          	sext.w	s10,a3
ffffffffc02086e4:	1682                	slli	a3,a3,0x20
ffffffffc02086e6:	2401                	sext.w	s0,s0
ffffffffc02086e8:	9281                	srli	a3,a3,0x20
ffffffffc02086ea:	8926                	mv	s2,s1
ffffffffc02086ec:	00399a1b          	slliw	s4,s3,0x3
ffffffffc02086f0:	862e                	mv	a2,a1
ffffffffc02086f2:	4509                	li	a0,2
ffffffffc02086f4:	85d2                	mv	a1,s4
ffffffffc02086f6:	c4af80ef          	jal	ra,ffffffffc0200b40 <ide_read_secs>
ffffffffc02086fa:	e165                	bnez	a0,ffffffffc02087da <disk0_io+0x190>
ffffffffc02086fc:	000ab583          	ld	a1,0(s5)
ffffffffc0208700:	0038                	addi	a4,sp,8
ffffffffc0208702:	4685                	li	a3,1
ffffffffc0208704:	864a                	mv	a2,s2
ffffffffc0208706:	855a                	mv	a0,s6
ffffffffc0208708:	cf1fc0ef          	jal	ra,ffffffffc02053f8 <iobuf_move>
ffffffffc020870c:	67a2                	ld	a5,8(sp)
ffffffffc020870e:	09279663          	bne	a5,s2,ffffffffc020879a <disk0_io+0x150>
ffffffffc0208712:	017977b3          	and	a5,s2,s7
ffffffffc0208716:	e3d1                	bnez	a5,ffffffffc020879a <disk0_io+0x150>
ffffffffc0208718:	412484b3          	sub	s1,s1,s2
ffffffffc020871c:	013409bb          	addw	s3,s0,s3
ffffffffc0208720:	c0bd                	beqz	s1,ffffffffc0208786 <disk0_io+0x13c>
ffffffffc0208722:	000ab583          	ld	a1,0(s5)
ffffffffc0208726:	000c1b63          	bnez	s8,ffffffffc020873c <disk0_io+0xf2>
ffffffffc020872a:	fb94e7e3          	bltu	s1,s9,ffffffffc02086d8 <disk0_io+0x8e>
ffffffffc020872e:	02000693          	li	a3,32
ffffffffc0208732:	02000d13          	li	s10,32
ffffffffc0208736:	4411                	li	s0,4
ffffffffc0208738:	6911                	lui	s2,0x4
ffffffffc020873a:	bf4d                	j	ffffffffc02086ec <disk0_io+0xa2>
ffffffffc020873c:	0038                	addi	a4,sp,8
ffffffffc020873e:	4681                	li	a3,0
ffffffffc0208740:	6611                	lui	a2,0x4
ffffffffc0208742:	855a                	mv	a0,s6
ffffffffc0208744:	cb5fc0ef          	jal	ra,ffffffffc02053f8 <iobuf_move>
ffffffffc0208748:	6422                	ld	s0,8(sp)
ffffffffc020874a:	c825                	beqz	s0,ffffffffc02087ba <disk0_io+0x170>
ffffffffc020874c:	0684e763          	bltu	s1,s0,ffffffffc02087ba <disk0_io+0x170>
ffffffffc0208750:	017477b3          	and	a5,s0,s7
ffffffffc0208754:	e3bd                	bnez	a5,ffffffffc02087ba <disk0_io+0x170>
ffffffffc0208756:	8031                	srli	s0,s0,0xc
ffffffffc0208758:	0034179b          	slliw	a5,s0,0x3
ffffffffc020875c:	000ab603          	ld	a2,0(s5)
ffffffffc0208760:	0039991b          	slliw	s2,s3,0x3
ffffffffc0208764:	02079693          	slli	a3,a5,0x20
ffffffffc0208768:	9281                	srli	a3,a3,0x20
ffffffffc020876a:	85ca                	mv	a1,s2
ffffffffc020876c:	4509                	li	a0,2
ffffffffc020876e:	2401                	sext.w	s0,s0
ffffffffc0208770:	00078a1b          	sext.w	s4,a5
ffffffffc0208774:	c62f80ef          	jal	ra,ffffffffc0200bd6 <ide_write_secs>
ffffffffc0208778:	e151                	bnez	a0,ffffffffc02087fc <disk0_io+0x1b2>
ffffffffc020877a:	6922                	ld	s2,8(sp)
ffffffffc020877c:	013409bb          	addw	s3,s0,s3
ffffffffc0208780:	412484b3          	sub	s1,s1,s2
ffffffffc0208784:	fcd9                	bnez	s1,ffffffffc0208722 <disk0_io+0xd8>
ffffffffc0208786:	0008d517          	auipc	a0,0x8d
ffffffffc020878a:	0ba50513          	addi	a0,a0,186 # ffffffffc0295840 <disk0_sem>
ffffffffc020878e:	ddffb0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0208792:	4501                	li	a0,0
ffffffffc0208794:	b729                	j	ffffffffc020869e <disk0_io+0x54>
ffffffffc0208796:	5575                	li	a0,-3
ffffffffc0208798:	b719                	j	ffffffffc020869e <disk0_io+0x54>
ffffffffc020879a:	00006697          	auipc	a3,0x6
ffffffffc020879e:	05e68693          	addi	a3,a3,94 # ffffffffc020e7f8 <dev_node_ops+0x178>
ffffffffc02087a2:	00003617          	auipc	a2,0x3
ffffffffc02087a6:	07660613          	addi	a2,a2,118 # ffffffffc020b818 <commands+0x210>
ffffffffc02087aa:	06200593          	li	a1,98
ffffffffc02087ae:	00006517          	auipc	a0,0x6
ffffffffc02087b2:	f9250513          	addi	a0,a0,-110 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc02087b6:	ce9f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02087ba:	00006697          	auipc	a3,0x6
ffffffffc02087be:	f4668693          	addi	a3,a3,-186 # ffffffffc020e700 <dev_node_ops+0x80>
ffffffffc02087c2:	00003617          	auipc	a2,0x3
ffffffffc02087c6:	05660613          	addi	a2,a2,86 # ffffffffc020b818 <commands+0x210>
ffffffffc02087ca:	05700593          	li	a1,87
ffffffffc02087ce:	00006517          	auipc	a0,0x6
ffffffffc02087d2:	f7250513          	addi	a0,a0,-142 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc02087d6:	cc9f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02087da:	88aa                	mv	a7,a0
ffffffffc02087dc:	886a                	mv	a6,s10
ffffffffc02087de:	87a2                	mv	a5,s0
ffffffffc02087e0:	8752                	mv	a4,s4
ffffffffc02087e2:	86ce                	mv	a3,s3
ffffffffc02087e4:	00006617          	auipc	a2,0x6
ffffffffc02087e8:	fcc60613          	addi	a2,a2,-52 # ffffffffc020e7b0 <dev_node_ops+0x130>
ffffffffc02087ec:	02d00593          	li	a1,45
ffffffffc02087f0:	00006517          	auipc	a0,0x6
ffffffffc02087f4:	f5050513          	addi	a0,a0,-176 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc02087f8:	ca7f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02087fc:	88aa                	mv	a7,a0
ffffffffc02087fe:	8852                	mv	a6,s4
ffffffffc0208800:	87a2                	mv	a5,s0
ffffffffc0208802:	874a                	mv	a4,s2
ffffffffc0208804:	86ce                	mv	a3,s3
ffffffffc0208806:	00006617          	auipc	a2,0x6
ffffffffc020880a:	f5a60613          	addi	a2,a2,-166 # ffffffffc020e760 <dev_node_ops+0xe0>
ffffffffc020880e:	03700593          	li	a1,55
ffffffffc0208812:	00006517          	auipc	a0,0x6
ffffffffc0208816:	f2e50513          	addi	a0,a0,-210 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc020881a:	c85f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020881e <dev_init_disk0>:
ffffffffc020881e:	1101                	addi	sp,sp,-32
ffffffffc0208820:	ec06                	sd	ra,24(sp)
ffffffffc0208822:	e822                	sd	s0,16(sp)
ffffffffc0208824:	e426                	sd	s1,8(sp)
ffffffffc0208826:	dedff0ef          	jal	ra,ffffffffc0208612 <dev_create_inode>
ffffffffc020882a:	c541                	beqz	a0,ffffffffc02088b2 <dev_init_disk0+0x94>
ffffffffc020882c:	4d38                	lw	a4,88(a0)
ffffffffc020882e:	6485                	lui	s1,0x1
ffffffffc0208830:	23448793          	addi	a5,s1,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208834:	842a                	mv	s0,a0
ffffffffc0208836:	0cf71f63          	bne	a4,a5,ffffffffc0208914 <dev_init_disk0+0xf6>
ffffffffc020883a:	4509                	li	a0,2
ffffffffc020883c:	ab8f80ef          	jal	ra,ffffffffc0200af4 <ide_device_valid>
ffffffffc0208840:	cd55                	beqz	a0,ffffffffc02088fc <dev_init_disk0+0xde>
ffffffffc0208842:	4509                	li	a0,2
ffffffffc0208844:	ad4f80ef          	jal	ra,ffffffffc0200b18 <ide_device_size>
ffffffffc0208848:	00355793          	srli	a5,a0,0x3
ffffffffc020884c:	e01c                	sd	a5,0(s0)
ffffffffc020884e:	00000797          	auipc	a5,0x0
ffffffffc0208852:	df078793          	addi	a5,a5,-528 # ffffffffc020863e <disk0_open>
ffffffffc0208856:	e81c                	sd	a5,16(s0)
ffffffffc0208858:	00000797          	auipc	a5,0x0
ffffffffc020885c:	dea78793          	addi	a5,a5,-534 # ffffffffc0208642 <disk0_close>
ffffffffc0208860:	ec1c                	sd	a5,24(s0)
ffffffffc0208862:	00000797          	auipc	a5,0x0
ffffffffc0208866:	de878793          	addi	a5,a5,-536 # ffffffffc020864a <disk0_io>
ffffffffc020886a:	f01c                	sd	a5,32(s0)
ffffffffc020886c:	00000797          	auipc	a5,0x0
ffffffffc0208870:	dda78793          	addi	a5,a5,-550 # ffffffffc0208646 <disk0_ioctl>
ffffffffc0208874:	f41c                	sd	a5,40(s0)
ffffffffc0208876:	4585                	li	a1,1
ffffffffc0208878:	0008d517          	auipc	a0,0x8d
ffffffffc020887c:	fc850513          	addi	a0,a0,-56 # ffffffffc0295840 <disk0_sem>
ffffffffc0208880:	e404                	sd	s1,8(s0)
ffffffffc0208882:	ce5fb0ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc0208886:	6511                	lui	a0,0x4
ffffffffc0208888:	f06f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020888c:	0008e797          	auipc	a5,0x8e
ffffffffc0208890:	06a7b623          	sd	a0,108(a5) # ffffffffc02968f8 <disk0_buffer>
ffffffffc0208894:	c921                	beqz	a0,ffffffffc02088e4 <dev_init_disk0+0xc6>
ffffffffc0208896:	4605                	li	a2,1
ffffffffc0208898:	85a2                	mv	a1,s0
ffffffffc020889a:	00006517          	auipc	a0,0x6
ffffffffc020889e:	fee50513          	addi	a0,a0,-18 # ffffffffc020e888 <dev_node_ops+0x208>
ffffffffc02088a2:	c2cff0ef          	jal	ra,ffffffffc0207cce <vfs_add_dev>
ffffffffc02088a6:	e115                	bnez	a0,ffffffffc02088ca <dev_init_disk0+0xac>
ffffffffc02088a8:	60e2                	ld	ra,24(sp)
ffffffffc02088aa:	6442                	ld	s0,16(sp)
ffffffffc02088ac:	64a2                	ld	s1,8(sp)
ffffffffc02088ae:	6105                	addi	sp,sp,32
ffffffffc02088b0:	8082                	ret
ffffffffc02088b2:	00006617          	auipc	a2,0x6
ffffffffc02088b6:	f7660613          	addi	a2,a2,-138 # ffffffffc020e828 <dev_node_ops+0x1a8>
ffffffffc02088ba:	08700593          	li	a1,135
ffffffffc02088be:	00006517          	auipc	a0,0x6
ffffffffc02088c2:	e8250513          	addi	a0,a0,-382 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc02088c6:	bd9f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088ca:	86aa                	mv	a3,a0
ffffffffc02088cc:	00006617          	auipc	a2,0x6
ffffffffc02088d0:	fc460613          	addi	a2,a2,-60 # ffffffffc020e890 <dev_node_ops+0x210>
ffffffffc02088d4:	08d00593          	li	a1,141
ffffffffc02088d8:	00006517          	auipc	a0,0x6
ffffffffc02088dc:	e6850513          	addi	a0,a0,-408 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc02088e0:	bbff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088e4:	00006617          	auipc	a2,0x6
ffffffffc02088e8:	f8460613          	addi	a2,a2,-124 # ffffffffc020e868 <dev_node_ops+0x1e8>
ffffffffc02088ec:	07f00593          	li	a1,127
ffffffffc02088f0:	00006517          	auipc	a0,0x6
ffffffffc02088f4:	e5050513          	addi	a0,a0,-432 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc02088f8:	ba7f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02088fc:	00006617          	auipc	a2,0x6
ffffffffc0208900:	f4c60613          	addi	a2,a2,-180 # ffffffffc020e848 <dev_node_ops+0x1c8>
ffffffffc0208904:	07300593          	li	a1,115
ffffffffc0208908:	00006517          	auipc	a0,0x6
ffffffffc020890c:	e3850513          	addi	a0,a0,-456 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc0208910:	b8ff70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208914:	00006697          	auipc	a3,0x6
ffffffffc0208918:	a4468693          	addi	a3,a3,-1468 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc020891c:	00003617          	auipc	a2,0x3
ffffffffc0208920:	efc60613          	addi	a2,a2,-260 # ffffffffc020b818 <commands+0x210>
ffffffffc0208924:	08900593          	li	a1,137
ffffffffc0208928:	00006517          	auipc	a0,0x6
ffffffffc020892c:	e1850513          	addi	a0,a0,-488 # ffffffffc020e740 <dev_node_ops+0xc0>
ffffffffc0208930:	b6ff70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208934 <stdin_open>:
ffffffffc0208934:	4501                	li	a0,0
ffffffffc0208936:	e191                	bnez	a1,ffffffffc020893a <stdin_open+0x6>
ffffffffc0208938:	8082                	ret
ffffffffc020893a:	5575                	li	a0,-3
ffffffffc020893c:	8082                	ret

ffffffffc020893e <stdin_close>:
ffffffffc020893e:	4501                	li	a0,0
ffffffffc0208940:	8082                	ret

ffffffffc0208942 <stdin_ioctl>:
ffffffffc0208942:	5575                	li	a0,-3
ffffffffc0208944:	8082                	ret

ffffffffc0208946 <stdin_io>:
ffffffffc0208946:	7135                	addi	sp,sp,-160
ffffffffc0208948:	ed06                	sd	ra,152(sp)
ffffffffc020894a:	e922                	sd	s0,144(sp)
ffffffffc020894c:	e526                	sd	s1,136(sp)
ffffffffc020894e:	e14a                	sd	s2,128(sp)
ffffffffc0208950:	fcce                	sd	s3,120(sp)
ffffffffc0208952:	f8d2                	sd	s4,112(sp)
ffffffffc0208954:	f4d6                	sd	s5,104(sp)
ffffffffc0208956:	f0da                	sd	s6,96(sp)
ffffffffc0208958:	ecde                	sd	s7,88(sp)
ffffffffc020895a:	e8e2                	sd	s8,80(sp)
ffffffffc020895c:	e4e6                	sd	s9,72(sp)
ffffffffc020895e:	e0ea                	sd	s10,64(sp)
ffffffffc0208960:	fc6e                	sd	s11,56(sp)
ffffffffc0208962:	14061163          	bnez	a2,ffffffffc0208aa4 <stdin_io+0x15e>
ffffffffc0208966:	0005bd83          	ld	s11,0(a1)
ffffffffc020896a:	0185bd03          	ld	s10,24(a1)
ffffffffc020896e:	8b2e                	mv	s6,a1
ffffffffc0208970:	100027f3          	csrr	a5,sstatus
ffffffffc0208974:	8b89                	andi	a5,a5,2
ffffffffc0208976:	10079e63          	bnez	a5,ffffffffc0208a92 <stdin_io+0x14c>
ffffffffc020897a:	4401                	li	s0,0
ffffffffc020897c:	100d0963          	beqz	s10,ffffffffc0208a8e <stdin_io+0x148>
ffffffffc0208980:	0008e997          	auipc	s3,0x8e
ffffffffc0208984:	f8098993          	addi	s3,s3,-128 # ffffffffc0296900 <p_rpos>
ffffffffc0208988:	0009b783          	ld	a5,0(s3)
ffffffffc020898c:	800004b7          	lui	s1,0x80000
ffffffffc0208990:	6c85                	lui	s9,0x1
ffffffffc0208992:	4a81                	li	s5,0
ffffffffc0208994:	0008ea17          	auipc	s4,0x8e
ffffffffc0208998:	f74a0a13          	addi	s4,s4,-140 # ffffffffc0296908 <p_wpos>
ffffffffc020899c:	0491                	addi	s1,s1,4
ffffffffc020899e:	0008d917          	auipc	s2,0x8d
ffffffffc02089a2:	eba90913          	addi	s2,s2,-326 # ffffffffc0295858 <__wait_queue>
ffffffffc02089a6:	1cfd                	addi	s9,s9,-1
ffffffffc02089a8:	000a3703          	ld	a4,0(s4)
ffffffffc02089ac:	000a8c1b          	sext.w	s8,s5
ffffffffc02089b0:	8be2                	mv	s7,s8
ffffffffc02089b2:	02e7d763          	bge	a5,a4,ffffffffc02089e0 <stdin_io+0x9a>
ffffffffc02089b6:	a859                	j	ffffffffc0208a4c <stdin_io+0x106>
ffffffffc02089b8:	815fe0ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc02089bc:	100027f3          	csrr	a5,sstatus
ffffffffc02089c0:	8b89                	andi	a5,a5,2
ffffffffc02089c2:	4401                	li	s0,0
ffffffffc02089c4:	ef8d                	bnez	a5,ffffffffc02089fe <stdin_io+0xb8>
ffffffffc02089c6:	0028                	addi	a0,sp,8
ffffffffc02089c8:	c3bfb0ef          	jal	ra,ffffffffc0204602 <wait_in_queue>
ffffffffc02089cc:	e121                	bnez	a0,ffffffffc0208a0c <stdin_io+0xc6>
ffffffffc02089ce:	47c2                	lw	a5,16(sp)
ffffffffc02089d0:	04979563          	bne	a5,s1,ffffffffc0208a1a <stdin_io+0xd4>
ffffffffc02089d4:	0009b783          	ld	a5,0(s3)
ffffffffc02089d8:	000a3703          	ld	a4,0(s4)
ffffffffc02089dc:	06e7c863          	blt	a5,a4,ffffffffc0208a4c <stdin_io+0x106>
ffffffffc02089e0:	8626                	mv	a2,s1
ffffffffc02089e2:	002c                	addi	a1,sp,8
ffffffffc02089e4:	854a                	mv	a0,s2
ffffffffc02089e6:	d47fb0ef          	jal	ra,ffffffffc020472c <wait_current_set>
ffffffffc02089ea:	d479                	beqz	s0,ffffffffc02089b8 <stdin_io+0x72>
ffffffffc02089ec:	a80f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc02089f0:	fdcfe0ef          	jal	ra,ffffffffc02071cc <schedule>
ffffffffc02089f4:	100027f3          	csrr	a5,sstatus
ffffffffc02089f8:	8b89                	andi	a5,a5,2
ffffffffc02089fa:	4401                	li	s0,0
ffffffffc02089fc:	d7e9                	beqz	a5,ffffffffc02089c6 <stdin_io+0x80>
ffffffffc02089fe:	a74f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208a02:	0028                	addi	a0,sp,8
ffffffffc0208a04:	4405                	li	s0,1
ffffffffc0208a06:	bfdfb0ef          	jal	ra,ffffffffc0204602 <wait_in_queue>
ffffffffc0208a0a:	d171                	beqz	a0,ffffffffc02089ce <stdin_io+0x88>
ffffffffc0208a0c:	002c                	addi	a1,sp,8
ffffffffc0208a0e:	854a                	mv	a0,s2
ffffffffc0208a10:	b99fb0ef          	jal	ra,ffffffffc02045a8 <wait_queue_del>
ffffffffc0208a14:	47c2                	lw	a5,16(sp)
ffffffffc0208a16:	fa978fe3          	beq	a5,s1,ffffffffc02089d4 <stdin_io+0x8e>
ffffffffc0208a1a:	e435                	bnez	s0,ffffffffc0208a86 <stdin_io+0x140>
ffffffffc0208a1c:	060b8963          	beqz	s7,ffffffffc0208a8e <stdin_io+0x148>
ffffffffc0208a20:	018b3783          	ld	a5,24(s6)
ffffffffc0208a24:	41578ab3          	sub	s5,a5,s5
ffffffffc0208a28:	015b3c23          	sd	s5,24(s6)
ffffffffc0208a2c:	60ea                	ld	ra,152(sp)
ffffffffc0208a2e:	644a                	ld	s0,144(sp)
ffffffffc0208a30:	64aa                	ld	s1,136(sp)
ffffffffc0208a32:	690a                	ld	s2,128(sp)
ffffffffc0208a34:	79e6                	ld	s3,120(sp)
ffffffffc0208a36:	7a46                	ld	s4,112(sp)
ffffffffc0208a38:	7aa6                	ld	s5,104(sp)
ffffffffc0208a3a:	7b06                	ld	s6,96(sp)
ffffffffc0208a3c:	6c46                	ld	s8,80(sp)
ffffffffc0208a3e:	6ca6                	ld	s9,72(sp)
ffffffffc0208a40:	6d06                	ld	s10,64(sp)
ffffffffc0208a42:	7de2                	ld	s11,56(sp)
ffffffffc0208a44:	855e                	mv	a0,s7
ffffffffc0208a46:	6be6                	ld	s7,88(sp)
ffffffffc0208a48:	610d                	addi	sp,sp,160
ffffffffc0208a4a:	8082                	ret
ffffffffc0208a4c:	43f7d713          	srai	a4,a5,0x3f
ffffffffc0208a50:	03475693          	srli	a3,a4,0x34
ffffffffc0208a54:	00d78733          	add	a4,a5,a3
ffffffffc0208a58:	01977733          	and	a4,a4,s9
ffffffffc0208a5c:	8f15                	sub	a4,a4,a3
ffffffffc0208a5e:	0008d697          	auipc	a3,0x8d
ffffffffc0208a62:	e0a68693          	addi	a3,a3,-502 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208a66:	9736                	add	a4,a4,a3
ffffffffc0208a68:	00074683          	lbu	a3,0(a4)
ffffffffc0208a6c:	0785                	addi	a5,a5,1
ffffffffc0208a6e:	015d8733          	add	a4,s11,s5
ffffffffc0208a72:	00d70023          	sb	a3,0(a4)
ffffffffc0208a76:	00f9b023          	sd	a5,0(s3)
ffffffffc0208a7a:	0a85                	addi	s5,s5,1
ffffffffc0208a7c:	001c0b9b          	addiw	s7,s8,1
ffffffffc0208a80:	f3aae4e3          	bltu	s5,s10,ffffffffc02089a8 <stdin_io+0x62>
ffffffffc0208a84:	dc51                	beqz	s0,ffffffffc0208a20 <stdin_io+0xda>
ffffffffc0208a86:	9e6f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208a8a:	f80b9be3          	bnez	s7,ffffffffc0208a20 <stdin_io+0xda>
ffffffffc0208a8e:	4b81                	li	s7,0
ffffffffc0208a90:	bf71                	j	ffffffffc0208a2c <stdin_io+0xe6>
ffffffffc0208a92:	9e0f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208a96:	4405                	li	s0,1
ffffffffc0208a98:	ee0d14e3          	bnez	s10,ffffffffc0208980 <stdin_io+0x3a>
ffffffffc0208a9c:	9d0f80ef          	jal	ra,ffffffffc0200c6c <intr_enable>
ffffffffc0208aa0:	4b81                	li	s7,0
ffffffffc0208aa2:	b769                	j	ffffffffc0208a2c <stdin_io+0xe6>
ffffffffc0208aa4:	5bf5                	li	s7,-3
ffffffffc0208aa6:	b759                	j	ffffffffc0208a2c <stdin_io+0xe6>

ffffffffc0208aa8 <dev_stdin_write>:
ffffffffc0208aa8:	e111                	bnez	a0,ffffffffc0208aac <dev_stdin_write+0x4>
ffffffffc0208aaa:	8082                	ret
ffffffffc0208aac:	1101                	addi	sp,sp,-32
ffffffffc0208aae:	e822                	sd	s0,16(sp)
ffffffffc0208ab0:	ec06                	sd	ra,24(sp)
ffffffffc0208ab2:	e426                	sd	s1,8(sp)
ffffffffc0208ab4:	842a                	mv	s0,a0
ffffffffc0208ab6:	100027f3          	csrr	a5,sstatus
ffffffffc0208aba:	8b89                	andi	a5,a5,2
ffffffffc0208abc:	4481                	li	s1,0
ffffffffc0208abe:	e3c1                	bnez	a5,ffffffffc0208b3e <dev_stdin_write+0x96>
ffffffffc0208ac0:	0008e597          	auipc	a1,0x8e
ffffffffc0208ac4:	e4858593          	addi	a1,a1,-440 # ffffffffc0296908 <p_wpos>
ffffffffc0208ac8:	6198                	ld	a4,0(a1)
ffffffffc0208aca:	6605                	lui	a2,0x1
ffffffffc0208acc:	fff60513          	addi	a0,a2,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0208ad0:	43f75693          	srai	a3,a4,0x3f
ffffffffc0208ad4:	92d1                	srli	a3,a3,0x34
ffffffffc0208ad6:	00d707b3          	add	a5,a4,a3
ffffffffc0208ada:	8fe9                	and	a5,a5,a0
ffffffffc0208adc:	8f95                	sub	a5,a5,a3
ffffffffc0208ade:	0008d697          	auipc	a3,0x8d
ffffffffc0208ae2:	d8a68693          	addi	a3,a3,-630 # ffffffffc0295868 <stdin_buffer>
ffffffffc0208ae6:	97b6                	add	a5,a5,a3
ffffffffc0208ae8:	00878023          	sb	s0,0(a5)
ffffffffc0208aec:	0008e797          	auipc	a5,0x8e
ffffffffc0208af0:	e147b783          	ld	a5,-492(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208af4:	40f707b3          	sub	a5,a4,a5
ffffffffc0208af8:	00c7d463          	bge	a5,a2,ffffffffc0208b00 <dev_stdin_write+0x58>
ffffffffc0208afc:	0705                	addi	a4,a4,1
ffffffffc0208afe:	e198                	sd	a4,0(a1)
ffffffffc0208b00:	0008d517          	auipc	a0,0x8d
ffffffffc0208b04:	d5850513          	addi	a0,a0,-680 # ffffffffc0295858 <__wait_queue>
ffffffffc0208b08:	aeffb0ef          	jal	ra,ffffffffc02045f6 <wait_queue_empty>
ffffffffc0208b0c:	cd09                	beqz	a0,ffffffffc0208b26 <dev_stdin_write+0x7e>
ffffffffc0208b0e:	e491                	bnez	s1,ffffffffc0208b1a <dev_stdin_write+0x72>
ffffffffc0208b10:	60e2                	ld	ra,24(sp)
ffffffffc0208b12:	6442                	ld	s0,16(sp)
ffffffffc0208b14:	64a2                	ld	s1,8(sp)
ffffffffc0208b16:	6105                	addi	sp,sp,32
ffffffffc0208b18:	8082                	ret
ffffffffc0208b1a:	6442                	ld	s0,16(sp)
ffffffffc0208b1c:	60e2                	ld	ra,24(sp)
ffffffffc0208b1e:	64a2                	ld	s1,8(sp)
ffffffffc0208b20:	6105                	addi	sp,sp,32
ffffffffc0208b22:	94af806f          	j	ffffffffc0200c6c <intr_enable>
ffffffffc0208b26:	800005b7          	lui	a1,0x80000
ffffffffc0208b2a:	4605                	li	a2,1
ffffffffc0208b2c:	0591                	addi	a1,a1,4
ffffffffc0208b2e:	0008d517          	auipc	a0,0x8d
ffffffffc0208b32:	d2a50513          	addi	a0,a0,-726 # ffffffffc0295858 <__wait_queue>
ffffffffc0208b36:	b29fb0ef          	jal	ra,ffffffffc020465e <wakeup_queue>
ffffffffc0208b3a:	d8f9                	beqz	s1,ffffffffc0208b10 <dev_stdin_write+0x68>
ffffffffc0208b3c:	bff9                	j	ffffffffc0208b1a <dev_stdin_write+0x72>
ffffffffc0208b3e:	934f80ef          	jal	ra,ffffffffc0200c72 <intr_disable>
ffffffffc0208b42:	4485                	li	s1,1
ffffffffc0208b44:	bfb5                	j	ffffffffc0208ac0 <dev_stdin_write+0x18>

ffffffffc0208b46 <dev_init_stdin>:
ffffffffc0208b46:	1141                	addi	sp,sp,-16
ffffffffc0208b48:	e406                	sd	ra,8(sp)
ffffffffc0208b4a:	e022                	sd	s0,0(sp)
ffffffffc0208b4c:	ac7ff0ef          	jal	ra,ffffffffc0208612 <dev_create_inode>
ffffffffc0208b50:	c93d                	beqz	a0,ffffffffc0208bc6 <dev_init_stdin+0x80>
ffffffffc0208b52:	4d38                	lw	a4,88(a0)
ffffffffc0208b54:	6785                	lui	a5,0x1
ffffffffc0208b56:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208b5a:	842a                	mv	s0,a0
ffffffffc0208b5c:	08f71e63          	bne	a4,a5,ffffffffc0208bf8 <dev_init_stdin+0xb2>
ffffffffc0208b60:	4785                	li	a5,1
ffffffffc0208b62:	e41c                	sd	a5,8(s0)
ffffffffc0208b64:	00000797          	auipc	a5,0x0
ffffffffc0208b68:	dd078793          	addi	a5,a5,-560 # ffffffffc0208934 <stdin_open>
ffffffffc0208b6c:	e81c                	sd	a5,16(s0)
ffffffffc0208b6e:	00000797          	auipc	a5,0x0
ffffffffc0208b72:	dd078793          	addi	a5,a5,-560 # ffffffffc020893e <stdin_close>
ffffffffc0208b76:	ec1c                	sd	a5,24(s0)
ffffffffc0208b78:	00000797          	auipc	a5,0x0
ffffffffc0208b7c:	dce78793          	addi	a5,a5,-562 # ffffffffc0208946 <stdin_io>
ffffffffc0208b80:	f01c                	sd	a5,32(s0)
ffffffffc0208b82:	00000797          	auipc	a5,0x0
ffffffffc0208b86:	dc078793          	addi	a5,a5,-576 # ffffffffc0208942 <stdin_ioctl>
ffffffffc0208b8a:	f41c                	sd	a5,40(s0)
ffffffffc0208b8c:	0008d517          	auipc	a0,0x8d
ffffffffc0208b90:	ccc50513          	addi	a0,a0,-820 # ffffffffc0295858 <__wait_queue>
ffffffffc0208b94:	00043023          	sd	zero,0(s0)
ffffffffc0208b98:	0008e797          	auipc	a5,0x8e
ffffffffc0208b9c:	d607b823          	sd	zero,-656(a5) # ffffffffc0296908 <p_wpos>
ffffffffc0208ba0:	0008e797          	auipc	a5,0x8e
ffffffffc0208ba4:	d607b023          	sd	zero,-672(a5) # ffffffffc0296900 <p_rpos>
ffffffffc0208ba8:	9fbfb0ef          	jal	ra,ffffffffc02045a2 <wait_queue_init>
ffffffffc0208bac:	4601                	li	a2,0
ffffffffc0208bae:	85a2                	mv	a1,s0
ffffffffc0208bb0:	00006517          	auipc	a0,0x6
ffffffffc0208bb4:	d4050513          	addi	a0,a0,-704 # ffffffffc020e8f0 <dev_node_ops+0x270>
ffffffffc0208bb8:	916ff0ef          	jal	ra,ffffffffc0207cce <vfs_add_dev>
ffffffffc0208bbc:	e10d                	bnez	a0,ffffffffc0208bde <dev_init_stdin+0x98>
ffffffffc0208bbe:	60a2                	ld	ra,8(sp)
ffffffffc0208bc0:	6402                	ld	s0,0(sp)
ffffffffc0208bc2:	0141                	addi	sp,sp,16
ffffffffc0208bc4:	8082                	ret
ffffffffc0208bc6:	00006617          	auipc	a2,0x6
ffffffffc0208bca:	cea60613          	addi	a2,a2,-790 # ffffffffc020e8b0 <dev_node_ops+0x230>
ffffffffc0208bce:	07500593          	li	a1,117
ffffffffc0208bd2:	00006517          	auipc	a0,0x6
ffffffffc0208bd6:	cfe50513          	addi	a0,a0,-770 # ffffffffc020e8d0 <dev_node_ops+0x250>
ffffffffc0208bda:	8c5f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208bde:	86aa                	mv	a3,a0
ffffffffc0208be0:	00006617          	auipc	a2,0x6
ffffffffc0208be4:	d1860613          	addi	a2,a2,-744 # ffffffffc020e8f8 <dev_node_ops+0x278>
ffffffffc0208be8:	07b00593          	li	a1,123
ffffffffc0208bec:	00006517          	auipc	a0,0x6
ffffffffc0208bf0:	ce450513          	addi	a0,a0,-796 # ffffffffc020e8d0 <dev_node_ops+0x250>
ffffffffc0208bf4:	8abf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208bf8:	00005697          	auipc	a3,0x5
ffffffffc0208bfc:	76068693          	addi	a3,a3,1888 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc0208c00:	00003617          	auipc	a2,0x3
ffffffffc0208c04:	c1860613          	addi	a2,a2,-1000 # ffffffffc020b818 <commands+0x210>
ffffffffc0208c08:	07700593          	li	a1,119
ffffffffc0208c0c:	00006517          	auipc	a0,0x6
ffffffffc0208c10:	cc450513          	addi	a0,a0,-828 # ffffffffc020e8d0 <dev_node_ops+0x250>
ffffffffc0208c14:	88bf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208c18 <stdout_open>:
ffffffffc0208c18:	4785                	li	a5,1
ffffffffc0208c1a:	4501                	li	a0,0
ffffffffc0208c1c:	00f59363          	bne	a1,a5,ffffffffc0208c22 <stdout_open+0xa>
ffffffffc0208c20:	8082                	ret
ffffffffc0208c22:	5575                	li	a0,-3
ffffffffc0208c24:	8082                	ret

ffffffffc0208c26 <stdout_close>:
ffffffffc0208c26:	4501                	li	a0,0
ffffffffc0208c28:	8082                	ret

ffffffffc0208c2a <stdout_ioctl>:
ffffffffc0208c2a:	5575                	li	a0,-3
ffffffffc0208c2c:	8082                	ret

ffffffffc0208c2e <stdout_io>:
ffffffffc0208c2e:	ca05                	beqz	a2,ffffffffc0208c5e <stdout_io+0x30>
ffffffffc0208c30:	6d9c                	ld	a5,24(a1)
ffffffffc0208c32:	1101                	addi	sp,sp,-32
ffffffffc0208c34:	e822                	sd	s0,16(sp)
ffffffffc0208c36:	e426                	sd	s1,8(sp)
ffffffffc0208c38:	ec06                	sd	ra,24(sp)
ffffffffc0208c3a:	6180                	ld	s0,0(a1)
ffffffffc0208c3c:	84ae                	mv	s1,a1
ffffffffc0208c3e:	cb91                	beqz	a5,ffffffffc0208c52 <stdout_io+0x24>
ffffffffc0208c40:	00044503          	lbu	a0,0(s0)
ffffffffc0208c44:	0405                	addi	s0,s0,1
ffffffffc0208c46:	d9cf70ef          	jal	ra,ffffffffc02001e2 <cputchar>
ffffffffc0208c4a:	6c9c                	ld	a5,24(s1)
ffffffffc0208c4c:	17fd                	addi	a5,a5,-1
ffffffffc0208c4e:	ec9c                	sd	a5,24(s1)
ffffffffc0208c50:	fbe5                	bnez	a5,ffffffffc0208c40 <stdout_io+0x12>
ffffffffc0208c52:	60e2                	ld	ra,24(sp)
ffffffffc0208c54:	6442                	ld	s0,16(sp)
ffffffffc0208c56:	64a2                	ld	s1,8(sp)
ffffffffc0208c58:	4501                	li	a0,0
ffffffffc0208c5a:	6105                	addi	sp,sp,32
ffffffffc0208c5c:	8082                	ret
ffffffffc0208c5e:	5575                	li	a0,-3
ffffffffc0208c60:	8082                	ret

ffffffffc0208c62 <dev_init_stdout>:
ffffffffc0208c62:	1141                	addi	sp,sp,-16
ffffffffc0208c64:	e406                	sd	ra,8(sp)
ffffffffc0208c66:	9adff0ef          	jal	ra,ffffffffc0208612 <dev_create_inode>
ffffffffc0208c6a:	c939                	beqz	a0,ffffffffc0208cc0 <dev_init_stdout+0x5e>
ffffffffc0208c6c:	4d38                	lw	a4,88(a0)
ffffffffc0208c6e:	6785                	lui	a5,0x1
ffffffffc0208c70:	23478793          	addi	a5,a5,564 # 1234 <_binary_bin_swap_img_size-0x6acc>
ffffffffc0208c74:	85aa                	mv	a1,a0
ffffffffc0208c76:	06f71e63          	bne	a4,a5,ffffffffc0208cf2 <dev_init_stdout+0x90>
ffffffffc0208c7a:	4785                	li	a5,1
ffffffffc0208c7c:	e51c                	sd	a5,8(a0)
ffffffffc0208c7e:	00000797          	auipc	a5,0x0
ffffffffc0208c82:	f9a78793          	addi	a5,a5,-102 # ffffffffc0208c18 <stdout_open>
ffffffffc0208c86:	e91c                	sd	a5,16(a0)
ffffffffc0208c88:	00000797          	auipc	a5,0x0
ffffffffc0208c8c:	f9e78793          	addi	a5,a5,-98 # ffffffffc0208c26 <stdout_close>
ffffffffc0208c90:	ed1c                	sd	a5,24(a0)
ffffffffc0208c92:	00000797          	auipc	a5,0x0
ffffffffc0208c96:	f9c78793          	addi	a5,a5,-100 # ffffffffc0208c2e <stdout_io>
ffffffffc0208c9a:	f11c                	sd	a5,32(a0)
ffffffffc0208c9c:	00000797          	auipc	a5,0x0
ffffffffc0208ca0:	f8e78793          	addi	a5,a5,-114 # ffffffffc0208c2a <stdout_ioctl>
ffffffffc0208ca4:	00053023          	sd	zero,0(a0)
ffffffffc0208ca8:	f51c                	sd	a5,40(a0)
ffffffffc0208caa:	4601                	li	a2,0
ffffffffc0208cac:	00006517          	auipc	a0,0x6
ffffffffc0208cb0:	cac50513          	addi	a0,a0,-852 # ffffffffc020e958 <dev_node_ops+0x2d8>
ffffffffc0208cb4:	81aff0ef          	jal	ra,ffffffffc0207cce <vfs_add_dev>
ffffffffc0208cb8:	e105                	bnez	a0,ffffffffc0208cd8 <dev_init_stdout+0x76>
ffffffffc0208cba:	60a2                	ld	ra,8(sp)
ffffffffc0208cbc:	0141                	addi	sp,sp,16
ffffffffc0208cbe:	8082                	ret
ffffffffc0208cc0:	00006617          	auipc	a2,0x6
ffffffffc0208cc4:	c5860613          	addi	a2,a2,-936 # ffffffffc020e918 <dev_node_ops+0x298>
ffffffffc0208cc8:	03700593          	li	a1,55
ffffffffc0208ccc:	00006517          	auipc	a0,0x6
ffffffffc0208cd0:	c6c50513          	addi	a0,a0,-916 # ffffffffc020e938 <dev_node_ops+0x2b8>
ffffffffc0208cd4:	fcaf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cd8:	86aa                	mv	a3,a0
ffffffffc0208cda:	00006617          	auipc	a2,0x6
ffffffffc0208cde:	c8660613          	addi	a2,a2,-890 # ffffffffc020e960 <dev_node_ops+0x2e0>
ffffffffc0208ce2:	03d00593          	li	a1,61
ffffffffc0208ce6:	00006517          	auipc	a0,0x6
ffffffffc0208cea:	c5250513          	addi	a0,a0,-942 # ffffffffc020e938 <dev_node_ops+0x2b8>
ffffffffc0208cee:	fb0f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208cf2:	00005697          	auipc	a3,0x5
ffffffffc0208cf6:	66668693          	addi	a3,a3,1638 # ffffffffc020e358 <syscalls+0xb10>
ffffffffc0208cfa:	00003617          	auipc	a2,0x3
ffffffffc0208cfe:	b1e60613          	addi	a2,a2,-1250 # ffffffffc020b818 <commands+0x210>
ffffffffc0208d02:	03900593          	li	a1,57
ffffffffc0208d06:	00006517          	auipc	a0,0x6
ffffffffc0208d0a:	c3250513          	addi	a0,a0,-974 # ffffffffc020e938 <dev_node_ops+0x2b8>
ffffffffc0208d0e:	f90f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d12 <bitmap_translate.part.0>:
ffffffffc0208d12:	1141                	addi	sp,sp,-16
ffffffffc0208d14:	00006697          	auipc	a3,0x6
ffffffffc0208d18:	c6c68693          	addi	a3,a3,-916 # ffffffffc020e980 <dev_node_ops+0x300>
ffffffffc0208d1c:	00003617          	auipc	a2,0x3
ffffffffc0208d20:	afc60613          	addi	a2,a2,-1284 # ffffffffc020b818 <commands+0x210>
ffffffffc0208d24:	04c00593          	li	a1,76
ffffffffc0208d28:	00006517          	auipc	a0,0x6
ffffffffc0208d2c:	c7050513          	addi	a0,a0,-912 # ffffffffc020e998 <dev_node_ops+0x318>
ffffffffc0208d30:	e406                	sd	ra,8(sp)
ffffffffc0208d32:	f6cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208d36 <bitmap_create>:
ffffffffc0208d36:	7139                	addi	sp,sp,-64
ffffffffc0208d38:	fc06                	sd	ra,56(sp)
ffffffffc0208d3a:	f822                	sd	s0,48(sp)
ffffffffc0208d3c:	f426                	sd	s1,40(sp)
ffffffffc0208d3e:	f04a                	sd	s2,32(sp)
ffffffffc0208d40:	ec4e                	sd	s3,24(sp)
ffffffffc0208d42:	e852                	sd	s4,16(sp)
ffffffffc0208d44:	e456                	sd	s5,8(sp)
ffffffffc0208d46:	c14d                	beqz	a0,ffffffffc0208de8 <bitmap_create+0xb2>
ffffffffc0208d48:	842a                	mv	s0,a0
ffffffffc0208d4a:	4541                	li	a0,16
ffffffffc0208d4c:	a42f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208d50:	84aa                	mv	s1,a0
ffffffffc0208d52:	cd25                	beqz	a0,ffffffffc0208dca <bitmap_create+0x94>
ffffffffc0208d54:	02041a13          	slli	s4,s0,0x20
ffffffffc0208d58:	020a5a13          	srli	s4,s4,0x20
ffffffffc0208d5c:	01fa0793          	addi	a5,s4,31
ffffffffc0208d60:	0057d993          	srli	s3,a5,0x5
ffffffffc0208d64:	00299a93          	slli	s5,s3,0x2
ffffffffc0208d68:	8556                	mv	a0,s5
ffffffffc0208d6a:	894e                	mv	s2,s3
ffffffffc0208d6c:	a22f90ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0208d70:	c53d                	beqz	a0,ffffffffc0208dde <bitmap_create+0xa8>
ffffffffc0208d72:	0134a223          	sw	s3,4(s1) # ffffffff80000004 <_binary_bin_sfs_img_size+0xffffffff7ff8ad04>
ffffffffc0208d76:	c080                	sw	s0,0(s1)
ffffffffc0208d78:	8656                	mv	a2,s5
ffffffffc0208d7a:	0ff00593          	li	a1,255
ffffffffc0208d7e:	5b8020ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0208d82:	e488                	sd	a0,8(s1)
ffffffffc0208d84:	0996                	slli	s3,s3,0x5
ffffffffc0208d86:	053a0263          	beq	s4,s3,ffffffffc0208dca <bitmap_create+0x94>
ffffffffc0208d8a:	fff9079b          	addiw	a5,s2,-1
ffffffffc0208d8e:	0057969b          	slliw	a3,a5,0x5
ffffffffc0208d92:	0054561b          	srliw	a2,s0,0x5
ffffffffc0208d96:	40d4073b          	subw	a4,s0,a3
ffffffffc0208d9a:	0054541b          	srliw	s0,s0,0x5
ffffffffc0208d9e:	08f61463          	bne	a2,a5,ffffffffc0208e26 <bitmap_create+0xf0>
ffffffffc0208da2:	fff7069b          	addiw	a3,a4,-1
ffffffffc0208da6:	47f9                	li	a5,30
ffffffffc0208da8:	04d7ef63          	bltu	a5,a3,ffffffffc0208e06 <bitmap_create+0xd0>
ffffffffc0208dac:	1402                	slli	s0,s0,0x20
ffffffffc0208dae:	8079                	srli	s0,s0,0x1e
ffffffffc0208db0:	9522                	add	a0,a0,s0
ffffffffc0208db2:	411c                	lw	a5,0(a0)
ffffffffc0208db4:	4585                	li	a1,1
ffffffffc0208db6:	02000613          	li	a2,32
ffffffffc0208dba:	00e596bb          	sllw	a3,a1,a4
ffffffffc0208dbe:	8fb5                	xor	a5,a5,a3
ffffffffc0208dc0:	2705                	addiw	a4,a4,1
ffffffffc0208dc2:	2781                	sext.w	a5,a5
ffffffffc0208dc4:	fec71be3          	bne	a4,a2,ffffffffc0208dba <bitmap_create+0x84>
ffffffffc0208dc8:	c11c                	sw	a5,0(a0)
ffffffffc0208dca:	70e2                	ld	ra,56(sp)
ffffffffc0208dcc:	7442                	ld	s0,48(sp)
ffffffffc0208dce:	7902                	ld	s2,32(sp)
ffffffffc0208dd0:	69e2                	ld	s3,24(sp)
ffffffffc0208dd2:	6a42                	ld	s4,16(sp)
ffffffffc0208dd4:	6aa2                	ld	s5,8(sp)
ffffffffc0208dd6:	8526                	mv	a0,s1
ffffffffc0208dd8:	74a2                	ld	s1,40(sp)
ffffffffc0208dda:	6121                	addi	sp,sp,64
ffffffffc0208ddc:	8082                	ret
ffffffffc0208dde:	8526                	mv	a0,s1
ffffffffc0208de0:	a5ef90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208de4:	4481                	li	s1,0
ffffffffc0208de6:	b7d5                	j	ffffffffc0208dca <bitmap_create+0x94>
ffffffffc0208de8:	00006697          	auipc	a3,0x6
ffffffffc0208dec:	bc868693          	addi	a3,a3,-1080 # ffffffffc020e9b0 <dev_node_ops+0x330>
ffffffffc0208df0:	00003617          	auipc	a2,0x3
ffffffffc0208df4:	a2860613          	addi	a2,a2,-1496 # ffffffffc020b818 <commands+0x210>
ffffffffc0208df8:	45d5                	li	a1,21
ffffffffc0208dfa:	00006517          	auipc	a0,0x6
ffffffffc0208dfe:	b9e50513          	addi	a0,a0,-1122 # ffffffffc020e998 <dev_node_ops+0x318>
ffffffffc0208e02:	e9cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e06:	00006697          	auipc	a3,0x6
ffffffffc0208e0a:	bea68693          	addi	a3,a3,-1046 # ffffffffc020e9f0 <dev_node_ops+0x370>
ffffffffc0208e0e:	00003617          	auipc	a2,0x3
ffffffffc0208e12:	a0a60613          	addi	a2,a2,-1526 # ffffffffc020b818 <commands+0x210>
ffffffffc0208e16:	02b00593          	li	a1,43
ffffffffc0208e1a:	00006517          	auipc	a0,0x6
ffffffffc0208e1e:	b7e50513          	addi	a0,a0,-1154 # ffffffffc020e998 <dev_node_ops+0x318>
ffffffffc0208e22:	e7cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208e26:	00006697          	auipc	a3,0x6
ffffffffc0208e2a:	bb268693          	addi	a3,a3,-1102 # ffffffffc020e9d8 <dev_node_ops+0x358>
ffffffffc0208e2e:	00003617          	auipc	a2,0x3
ffffffffc0208e32:	9ea60613          	addi	a2,a2,-1558 # ffffffffc020b818 <commands+0x210>
ffffffffc0208e36:	02a00593          	li	a1,42
ffffffffc0208e3a:	00006517          	auipc	a0,0x6
ffffffffc0208e3e:	b5e50513          	addi	a0,a0,-1186 # ffffffffc020e998 <dev_node_ops+0x318>
ffffffffc0208e42:	e5cf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208e46 <bitmap_alloc>:
ffffffffc0208e46:	4150                	lw	a2,4(a0)
ffffffffc0208e48:	651c                	ld	a5,8(a0)
ffffffffc0208e4a:	c231                	beqz	a2,ffffffffc0208e8e <bitmap_alloc+0x48>
ffffffffc0208e4c:	4701                	li	a4,0
ffffffffc0208e4e:	a029                	j	ffffffffc0208e58 <bitmap_alloc+0x12>
ffffffffc0208e50:	2705                	addiw	a4,a4,1
ffffffffc0208e52:	0791                	addi	a5,a5,4
ffffffffc0208e54:	02e60d63          	beq	a2,a4,ffffffffc0208e8e <bitmap_alloc+0x48>
ffffffffc0208e58:	4394                	lw	a3,0(a5)
ffffffffc0208e5a:	dafd                	beqz	a3,ffffffffc0208e50 <bitmap_alloc+0xa>
ffffffffc0208e5c:	4501                	li	a0,0
ffffffffc0208e5e:	4885                	li	a7,1
ffffffffc0208e60:	8e36                	mv	t3,a3
ffffffffc0208e62:	02000313          	li	t1,32
ffffffffc0208e66:	a021                	j	ffffffffc0208e6e <bitmap_alloc+0x28>
ffffffffc0208e68:	2505                	addiw	a0,a0,1
ffffffffc0208e6a:	02650463          	beq	a0,t1,ffffffffc0208e92 <bitmap_alloc+0x4c>
ffffffffc0208e6e:	00a8983b          	sllw	a6,a7,a0
ffffffffc0208e72:	0106f633          	and	a2,a3,a6
ffffffffc0208e76:	2601                	sext.w	a2,a2
ffffffffc0208e78:	da65                	beqz	a2,ffffffffc0208e68 <bitmap_alloc+0x22>
ffffffffc0208e7a:	010e4833          	xor	a6,t3,a6
ffffffffc0208e7e:	0057171b          	slliw	a4,a4,0x5
ffffffffc0208e82:	9f29                	addw	a4,a4,a0
ffffffffc0208e84:	0107a023          	sw	a6,0(a5)
ffffffffc0208e88:	c198                	sw	a4,0(a1)
ffffffffc0208e8a:	4501                	li	a0,0
ffffffffc0208e8c:	8082                	ret
ffffffffc0208e8e:	5571                	li	a0,-4
ffffffffc0208e90:	8082                	ret
ffffffffc0208e92:	1141                	addi	sp,sp,-16
ffffffffc0208e94:	00004697          	auipc	a3,0x4
ffffffffc0208e98:	a0468693          	addi	a3,a3,-1532 # ffffffffc020c898 <default_pmm_manager+0x598>
ffffffffc0208e9c:	00003617          	auipc	a2,0x3
ffffffffc0208ea0:	97c60613          	addi	a2,a2,-1668 # ffffffffc020b818 <commands+0x210>
ffffffffc0208ea4:	04300593          	li	a1,67
ffffffffc0208ea8:	00006517          	auipc	a0,0x6
ffffffffc0208eac:	af050513          	addi	a0,a0,-1296 # ffffffffc020e998 <dev_node_ops+0x318>
ffffffffc0208eb0:	e406                	sd	ra,8(sp)
ffffffffc0208eb2:	decf70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208eb6 <bitmap_test>:
ffffffffc0208eb6:	411c                	lw	a5,0(a0)
ffffffffc0208eb8:	00f5ff63          	bgeu	a1,a5,ffffffffc0208ed6 <bitmap_test+0x20>
ffffffffc0208ebc:	651c                	ld	a5,8(a0)
ffffffffc0208ebe:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208ec2:	070a                	slli	a4,a4,0x2
ffffffffc0208ec4:	97ba                	add	a5,a5,a4
ffffffffc0208ec6:	4388                	lw	a0,0(a5)
ffffffffc0208ec8:	4785                	li	a5,1
ffffffffc0208eca:	00b795bb          	sllw	a1,a5,a1
ffffffffc0208ece:	8d6d                	and	a0,a0,a1
ffffffffc0208ed0:	1502                	slli	a0,a0,0x20
ffffffffc0208ed2:	9101                	srli	a0,a0,0x20
ffffffffc0208ed4:	8082                	ret
ffffffffc0208ed6:	1141                	addi	sp,sp,-16
ffffffffc0208ed8:	e406                	sd	ra,8(sp)
ffffffffc0208eda:	e39ff0ef          	jal	ra,ffffffffc0208d12 <bitmap_translate.part.0>

ffffffffc0208ede <bitmap_free>:
ffffffffc0208ede:	411c                	lw	a5,0(a0)
ffffffffc0208ee0:	1141                	addi	sp,sp,-16
ffffffffc0208ee2:	e406                	sd	ra,8(sp)
ffffffffc0208ee4:	02f5f463          	bgeu	a1,a5,ffffffffc0208f0c <bitmap_free+0x2e>
ffffffffc0208ee8:	651c                	ld	a5,8(a0)
ffffffffc0208eea:	0055d71b          	srliw	a4,a1,0x5
ffffffffc0208eee:	070a                	slli	a4,a4,0x2
ffffffffc0208ef0:	97ba                	add	a5,a5,a4
ffffffffc0208ef2:	4398                	lw	a4,0(a5)
ffffffffc0208ef4:	4685                	li	a3,1
ffffffffc0208ef6:	00b695bb          	sllw	a1,a3,a1
ffffffffc0208efa:	00b776b3          	and	a3,a4,a1
ffffffffc0208efe:	2681                	sext.w	a3,a3
ffffffffc0208f00:	ea81                	bnez	a3,ffffffffc0208f10 <bitmap_free+0x32>
ffffffffc0208f02:	60a2                	ld	ra,8(sp)
ffffffffc0208f04:	8f4d                	or	a4,a4,a1
ffffffffc0208f06:	c398                	sw	a4,0(a5)
ffffffffc0208f08:	0141                	addi	sp,sp,16
ffffffffc0208f0a:	8082                	ret
ffffffffc0208f0c:	e07ff0ef          	jal	ra,ffffffffc0208d12 <bitmap_translate.part.0>
ffffffffc0208f10:	00006697          	auipc	a3,0x6
ffffffffc0208f14:	b0868693          	addi	a3,a3,-1272 # ffffffffc020ea18 <dev_node_ops+0x398>
ffffffffc0208f18:	00003617          	auipc	a2,0x3
ffffffffc0208f1c:	90060613          	addi	a2,a2,-1792 # ffffffffc020b818 <commands+0x210>
ffffffffc0208f20:	05f00593          	li	a1,95
ffffffffc0208f24:	00006517          	auipc	a0,0x6
ffffffffc0208f28:	a7450513          	addi	a0,a0,-1420 # ffffffffc020e998 <dev_node_ops+0x318>
ffffffffc0208f2c:	d72f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f30 <bitmap_destroy>:
ffffffffc0208f30:	1141                	addi	sp,sp,-16
ffffffffc0208f32:	e022                	sd	s0,0(sp)
ffffffffc0208f34:	842a                	mv	s0,a0
ffffffffc0208f36:	6508                	ld	a0,8(a0)
ffffffffc0208f38:	e406                	sd	ra,8(sp)
ffffffffc0208f3a:	904f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208f3e:	8522                	mv	a0,s0
ffffffffc0208f40:	6402                	ld	s0,0(sp)
ffffffffc0208f42:	60a2                	ld	ra,8(sp)
ffffffffc0208f44:	0141                	addi	sp,sp,16
ffffffffc0208f46:	8f8f906f          	j	ffffffffc020203e <kfree>

ffffffffc0208f4a <bitmap_getdata>:
ffffffffc0208f4a:	c589                	beqz	a1,ffffffffc0208f54 <bitmap_getdata+0xa>
ffffffffc0208f4c:	00456783          	lwu	a5,4(a0)
ffffffffc0208f50:	078a                	slli	a5,a5,0x2
ffffffffc0208f52:	e19c                	sd	a5,0(a1)
ffffffffc0208f54:	6508                	ld	a0,8(a0)
ffffffffc0208f56:	8082                	ret

ffffffffc0208f58 <sfs_init>:
ffffffffc0208f58:	1141                	addi	sp,sp,-16
ffffffffc0208f5a:	00006517          	auipc	a0,0x6
ffffffffc0208f5e:	92e50513          	addi	a0,a0,-1746 # ffffffffc020e888 <dev_node_ops+0x208>
ffffffffc0208f62:	e406                	sd	ra,8(sp)
ffffffffc0208f64:	554000ef          	jal	ra,ffffffffc02094b8 <sfs_mount>
ffffffffc0208f68:	e501                	bnez	a0,ffffffffc0208f70 <sfs_init+0x18>
ffffffffc0208f6a:	60a2                	ld	ra,8(sp)
ffffffffc0208f6c:	0141                	addi	sp,sp,16
ffffffffc0208f6e:	8082                	ret
ffffffffc0208f70:	86aa                	mv	a3,a0
ffffffffc0208f72:	00006617          	auipc	a2,0x6
ffffffffc0208f76:	ab660613          	addi	a2,a2,-1354 # ffffffffc020ea28 <dev_node_ops+0x3a8>
ffffffffc0208f7a:	45c1                	li	a1,16
ffffffffc0208f7c:	00006517          	auipc	a0,0x6
ffffffffc0208f80:	acc50513          	addi	a0,a0,-1332 # ffffffffc020ea48 <dev_node_ops+0x3c8>
ffffffffc0208f84:	d1af70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0208f88 <sfs_unmount>:
ffffffffc0208f88:	1141                	addi	sp,sp,-16
ffffffffc0208f8a:	e406                	sd	ra,8(sp)
ffffffffc0208f8c:	e022                	sd	s0,0(sp)
ffffffffc0208f8e:	cd1d                	beqz	a0,ffffffffc0208fcc <sfs_unmount+0x44>
ffffffffc0208f90:	0b052783          	lw	a5,176(a0)
ffffffffc0208f94:	842a                	mv	s0,a0
ffffffffc0208f96:	eb9d                	bnez	a5,ffffffffc0208fcc <sfs_unmount+0x44>
ffffffffc0208f98:	7158                	ld	a4,160(a0)
ffffffffc0208f9a:	09850793          	addi	a5,a0,152
ffffffffc0208f9e:	02f71563          	bne	a4,a5,ffffffffc0208fc8 <sfs_unmount+0x40>
ffffffffc0208fa2:	613c                	ld	a5,64(a0)
ffffffffc0208fa4:	e7a1                	bnez	a5,ffffffffc0208fec <sfs_unmount+0x64>
ffffffffc0208fa6:	7d08                	ld	a0,56(a0)
ffffffffc0208fa8:	f89ff0ef          	jal	ra,ffffffffc0208f30 <bitmap_destroy>
ffffffffc0208fac:	6428                	ld	a0,72(s0)
ffffffffc0208fae:	890f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208fb2:	7448                	ld	a0,168(s0)
ffffffffc0208fb4:	88af90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208fb8:	8522                	mv	a0,s0
ffffffffc0208fba:	884f90ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0208fbe:	4501                	li	a0,0
ffffffffc0208fc0:	60a2                	ld	ra,8(sp)
ffffffffc0208fc2:	6402                	ld	s0,0(sp)
ffffffffc0208fc4:	0141                	addi	sp,sp,16
ffffffffc0208fc6:	8082                	ret
ffffffffc0208fc8:	5545                	li	a0,-15
ffffffffc0208fca:	bfdd                	j	ffffffffc0208fc0 <sfs_unmount+0x38>
ffffffffc0208fcc:	00006697          	auipc	a3,0x6
ffffffffc0208fd0:	a9468693          	addi	a3,a3,-1388 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc0208fd4:	00003617          	auipc	a2,0x3
ffffffffc0208fd8:	84460613          	addi	a2,a2,-1980 # ffffffffc020b818 <commands+0x210>
ffffffffc0208fdc:	04100593          	li	a1,65
ffffffffc0208fe0:	00006517          	auipc	a0,0x6
ffffffffc0208fe4:	ab050513          	addi	a0,a0,-1360 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0208fe8:	cb6f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0208fec:	00006697          	auipc	a3,0x6
ffffffffc0208ff0:	abc68693          	addi	a3,a3,-1348 # ffffffffc020eaa8 <dev_node_ops+0x428>
ffffffffc0208ff4:	00003617          	auipc	a2,0x3
ffffffffc0208ff8:	82460613          	addi	a2,a2,-2012 # ffffffffc020b818 <commands+0x210>
ffffffffc0208ffc:	04500593          	li	a1,69
ffffffffc0209000:	00006517          	auipc	a0,0x6
ffffffffc0209004:	a9050513          	addi	a0,a0,-1392 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0209008:	c96f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020900c <sfs_cleanup>:
ffffffffc020900c:	1101                	addi	sp,sp,-32
ffffffffc020900e:	ec06                	sd	ra,24(sp)
ffffffffc0209010:	e822                	sd	s0,16(sp)
ffffffffc0209012:	e426                	sd	s1,8(sp)
ffffffffc0209014:	e04a                	sd	s2,0(sp)
ffffffffc0209016:	c525                	beqz	a0,ffffffffc020907e <sfs_cleanup+0x72>
ffffffffc0209018:	0b052783          	lw	a5,176(a0)
ffffffffc020901c:	84aa                	mv	s1,a0
ffffffffc020901e:	e3a5                	bnez	a5,ffffffffc020907e <sfs_cleanup+0x72>
ffffffffc0209020:	4158                	lw	a4,4(a0)
ffffffffc0209022:	4514                	lw	a3,8(a0)
ffffffffc0209024:	00c50913          	addi	s2,a0,12
ffffffffc0209028:	85ca                	mv	a1,s2
ffffffffc020902a:	40d7063b          	subw	a2,a4,a3
ffffffffc020902e:	00006517          	auipc	a0,0x6
ffffffffc0209032:	a9250513          	addi	a0,a0,-1390 # ffffffffc020eac0 <dev_node_ops+0x440>
ffffffffc0209036:	970f70ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020903a:	02000413          	li	s0,32
ffffffffc020903e:	a019                	j	ffffffffc0209044 <sfs_cleanup+0x38>
ffffffffc0209040:	347d                	addiw	s0,s0,-1
ffffffffc0209042:	c819                	beqz	s0,ffffffffc0209058 <sfs_cleanup+0x4c>
ffffffffc0209044:	7cdc                	ld	a5,184(s1)
ffffffffc0209046:	8526                	mv	a0,s1
ffffffffc0209048:	9782                	jalr	a5
ffffffffc020904a:	f97d                	bnez	a0,ffffffffc0209040 <sfs_cleanup+0x34>
ffffffffc020904c:	60e2                	ld	ra,24(sp)
ffffffffc020904e:	6442                	ld	s0,16(sp)
ffffffffc0209050:	64a2                	ld	s1,8(sp)
ffffffffc0209052:	6902                	ld	s2,0(sp)
ffffffffc0209054:	6105                	addi	sp,sp,32
ffffffffc0209056:	8082                	ret
ffffffffc0209058:	6442                	ld	s0,16(sp)
ffffffffc020905a:	60e2                	ld	ra,24(sp)
ffffffffc020905c:	64a2                	ld	s1,8(sp)
ffffffffc020905e:	86ca                	mv	a3,s2
ffffffffc0209060:	6902                	ld	s2,0(sp)
ffffffffc0209062:	872a                	mv	a4,a0
ffffffffc0209064:	00006617          	auipc	a2,0x6
ffffffffc0209068:	a7c60613          	addi	a2,a2,-1412 # ffffffffc020eae0 <dev_node_ops+0x460>
ffffffffc020906c:	05f00593          	li	a1,95
ffffffffc0209070:	00006517          	auipc	a0,0x6
ffffffffc0209074:	a2050513          	addi	a0,a0,-1504 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0209078:	6105                	addi	sp,sp,32
ffffffffc020907a:	c8cf706f          	j	ffffffffc0200506 <__warn>
ffffffffc020907e:	00006697          	auipc	a3,0x6
ffffffffc0209082:	9e268693          	addi	a3,a3,-1566 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc0209086:	00002617          	auipc	a2,0x2
ffffffffc020908a:	79260613          	addi	a2,a2,1938 # ffffffffc020b818 <commands+0x210>
ffffffffc020908e:	05400593          	li	a1,84
ffffffffc0209092:	00006517          	auipc	a0,0x6
ffffffffc0209096:	9fe50513          	addi	a0,a0,-1538 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc020909a:	c04f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020909e <sfs_sync>:
ffffffffc020909e:	7179                	addi	sp,sp,-48
ffffffffc02090a0:	f406                	sd	ra,40(sp)
ffffffffc02090a2:	f022                	sd	s0,32(sp)
ffffffffc02090a4:	ec26                	sd	s1,24(sp)
ffffffffc02090a6:	e84a                	sd	s2,16(sp)
ffffffffc02090a8:	e44e                	sd	s3,8(sp)
ffffffffc02090aa:	e052                	sd	s4,0(sp)
ffffffffc02090ac:	cd4d                	beqz	a0,ffffffffc0209166 <sfs_sync+0xc8>
ffffffffc02090ae:	0b052783          	lw	a5,176(a0)
ffffffffc02090b2:	8a2a                	mv	s4,a0
ffffffffc02090b4:	ebcd                	bnez	a5,ffffffffc0209166 <sfs_sync+0xc8>
ffffffffc02090b6:	52d010ef          	jal	ra,ffffffffc020ade2 <lock_sfs_fs>
ffffffffc02090ba:	0a0a3403          	ld	s0,160(s4)
ffffffffc02090be:	098a0913          	addi	s2,s4,152
ffffffffc02090c2:	02890763          	beq	s2,s0,ffffffffc02090f0 <sfs_sync+0x52>
ffffffffc02090c6:	00004997          	auipc	s3,0x4
ffffffffc02090ca:	0ca98993          	addi	s3,s3,202 # ffffffffc020d190 <default_pmm_manager+0xe90>
ffffffffc02090ce:	7c1c                	ld	a5,56(s0)
ffffffffc02090d0:	fc840493          	addi	s1,s0,-56
ffffffffc02090d4:	cbb5                	beqz	a5,ffffffffc0209148 <sfs_sync+0xaa>
ffffffffc02090d6:	7b9c                	ld	a5,48(a5)
ffffffffc02090d8:	cba5                	beqz	a5,ffffffffc0209148 <sfs_sync+0xaa>
ffffffffc02090da:	85ce                	mv	a1,s3
ffffffffc02090dc:	8526                	mv	a0,s1
ffffffffc02090de:	e28fe0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc02090e2:	7c1c                	ld	a5,56(s0)
ffffffffc02090e4:	8526                	mv	a0,s1
ffffffffc02090e6:	7b9c                	ld	a5,48(a5)
ffffffffc02090e8:	9782                	jalr	a5
ffffffffc02090ea:	6400                	ld	s0,8(s0)
ffffffffc02090ec:	fe8911e3          	bne	s2,s0,ffffffffc02090ce <sfs_sync+0x30>
ffffffffc02090f0:	8552                	mv	a0,s4
ffffffffc02090f2:	501010ef          	jal	ra,ffffffffc020adf2 <unlock_sfs_fs>
ffffffffc02090f6:	040a3783          	ld	a5,64(s4)
ffffffffc02090fa:	4501                	li	a0,0
ffffffffc02090fc:	eb89                	bnez	a5,ffffffffc020910e <sfs_sync+0x70>
ffffffffc02090fe:	70a2                	ld	ra,40(sp)
ffffffffc0209100:	7402                	ld	s0,32(sp)
ffffffffc0209102:	64e2                	ld	s1,24(sp)
ffffffffc0209104:	6942                	ld	s2,16(sp)
ffffffffc0209106:	69a2                	ld	s3,8(sp)
ffffffffc0209108:	6a02                	ld	s4,0(sp)
ffffffffc020910a:	6145                	addi	sp,sp,48
ffffffffc020910c:	8082                	ret
ffffffffc020910e:	040a3023          	sd	zero,64(s4)
ffffffffc0209112:	8552                	mv	a0,s4
ffffffffc0209114:	3b3010ef          	jal	ra,ffffffffc020acc6 <sfs_sync_super>
ffffffffc0209118:	cd01                	beqz	a0,ffffffffc0209130 <sfs_sync+0x92>
ffffffffc020911a:	70a2                	ld	ra,40(sp)
ffffffffc020911c:	7402                	ld	s0,32(sp)
ffffffffc020911e:	4785                	li	a5,1
ffffffffc0209120:	04fa3023          	sd	a5,64(s4)
ffffffffc0209124:	64e2                	ld	s1,24(sp)
ffffffffc0209126:	6942                	ld	s2,16(sp)
ffffffffc0209128:	69a2                	ld	s3,8(sp)
ffffffffc020912a:	6a02                	ld	s4,0(sp)
ffffffffc020912c:	6145                	addi	sp,sp,48
ffffffffc020912e:	8082                	ret
ffffffffc0209130:	8552                	mv	a0,s4
ffffffffc0209132:	3db010ef          	jal	ra,ffffffffc020ad0c <sfs_sync_freemap>
ffffffffc0209136:	f175                	bnez	a0,ffffffffc020911a <sfs_sync+0x7c>
ffffffffc0209138:	70a2                	ld	ra,40(sp)
ffffffffc020913a:	7402                	ld	s0,32(sp)
ffffffffc020913c:	64e2                	ld	s1,24(sp)
ffffffffc020913e:	6942                	ld	s2,16(sp)
ffffffffc0209140:	69a2                	ld	s3,8(sp)
ffffffffc0209142:	6a02                	ld	s4,0(sp)
ffffffffc0209144:	6145                	addi	sp,sp,48
ffffffffc0209146:	8082                	ret
ffffffffc0209148:	00004697          	auipc	a3,0x4
ffffffffc020914c:	ff868693          	addi	a3,a3,-8 # ffffffffc020d140 <default_pmm_manager+0xe40>
ffffffffc0209150:	00002617          	auipc	a2,0x2
ffffffffc0209154:	6c860613          	addi	a2,a2,1736 # ffffffffc020b818 <commands+0x210>
ffffffffc0209158:	45ed                	li	a1,27
ffffffffc020915a:	00006517          	auipc	a0,0x6
ffffffffc020915e:	93650513          	addi	a0,a0,-1738 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0209162:	b3cf70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209166:	00006697          	auipc	a3,0x6
ffffffffc020916a:	8fa68693          	addi	a3,a3,-1798 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc020916e:	00002617          	auipc	a2,0x2
ffffffffc0209172:	6aa60613          	addi	a2,a2,1706 # ffffffffc020b818 <commands+0x210>
ffffffffc0209176:	45d5                	li	a1,21
ffffffffc0209178:	00006517          	auipc	a0,0x6
ffffffffc020917c:	91850513          	addi	a0,a0,-1768 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0209180:	b1ef70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209184 <sfs_get_root>:
ffffffffc0209184:	1101                	addi	sp,sp,-32
ffffffffc0209186:	ec06                	sd	ra,24(sp)
ffffffffc0209188:	cd09                	beqz	a0,ffffffffc02091a2 <sfs_get_root+0x1e>
ffffffffc020918a:	0b052783          	lw	a5,176(a0)
ffffffffc020918e:	eb91                	bnez	a5,ffffffffc02091a2 <sfs_get_root+0x1e>
ffffffffc0209190:	4605                	li	a2,1
ffffffffc0209192:	002c                	addi	a1,sp,8
ffffffffc0209194:	364010ef          	jal	ra,ffffffffc020a4f8 <sfs_load_inode>
ffffffffc0209198:	e50d                	bnez	a0,ffffffffc02091c2 <sfs_get_root+0x3e>
ffffffffc020919a:	60e2                	ld	ra,24(sp)
ffffffffc020919c:	6522                	ld	a0,8(sp)
ffffffffc020919e:	6105                	addi	sp,sp,32
ffffffffc02091a0:	8082                	ret
ffffffffc02091a2:	00006697          	auipc	a3,0x6
ffffffffc02091a6:	8be68693          	addi	a3,a3,-1858 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc02091aa:	00002617          	auipc	a2,0x2
ffffffffc02091ae:	66e60613          	addi	a2,a2,1646 # ffffffffc020b818 <commands+0x210>
ffffffffc02091b2:	03600593          	li	a1,54
ffffffffc02091b6:	00006517          	auipc	a0,0x6
ffffffffc02091ba:	8da50513          	addi	a0,a0,-1830 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc02091be:	ae0f70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02091c2:	86aa                	mv	a3,a0
ffffffffc02091c4:	00006617          	auipc	a2,0x6
ffffffffc02091c8:	93c60613          	addi	a2,a2,-1732 # ffffffffc020eb00 <dev_node_ops+0x480>
ffffffffc02091cc:	03700593          	li	a1,55
ffffffffc02091d0:	00006517          	auipc	a0,0x6
ffffffffc02091d4:	8c050513          	addi	a0,a0,-1856 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc02091d8:	ac6f70ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02091dc <sfs_do_mount>:
ffffffffc02091dc:	6518                	ld	a4,8(a0)
ffffffffc02091de:	7171                	addi	sp,sp,-176
ffffffffc02091e0:	f506                	sd	ra,168(sp)
ffffffffc02091e2:	f122                	sd	s0,160(sp)
ffffffffc02091e4:	ed26                	sd	s1,152(sp)
ffffffffc02091e6:	e94a                	sd	s2,144(sp)
ffffffffc02091e8:	e54e                	sd	s3,136(sp)
ffffffffc02091ea:	e152                	sd	s4,128(sp)
ffffffffc02091ec:	fcd6                	sd	s5,120(sp)
ffffffffc02091ee:	f8da                	sd	s6,112(sp)
ffffffffc02091f0:	f4de                	sd	s7,104(sp)
ffffffffc02091f2:	f0e2                	sd	s8,96(sp)
ffffffffc02091f4:	ece6                	sd	s9,88(sp)
ffffffffc02091f6:	e8ea                	sd	s10,80(sp)
ffffffffc02091f8:	e4ee                	sd	s11,72(sp)
ffffffffc02091fa:	6785                	lui	a5,0x1
ffffffffc02091fc:	24f71663          	bne	a4,a5,ffffffffc0209448 <sfs_do_mount+0x26c>
ffffffffc0209200:	892a                	mv	s2,a0
ffffffffc0209202:	4501                	li	a0,0
ffffffffc0209204:	8aae                	mv	s5,a1
ffffffffc0209206:	f00fe0ef          	jal	ra,ffffffffc0207906 <__alloc_fs>
ffffffffc020920a:	842a                	mv	s0,a0
ffffffffc020920c:	24050463          	beqz	a0,ffffffffc0209454 <sfs_do_mount+0x278>
ffffffffc0209210:	0b052b03          	lw	s6,176(a0)
ffffffffc0209214:	260b1263          	bnez	s6,ffffffffc0209478 <sfs_do_mount+0x29c>
ffffffffc0209218:	03253823          	sd	s2,48(a0)
ffffffffc020921c:	6505                	lui	a0,0x1
ffffffffc020921e:	d71f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc0209222:	e428                	sd	a0,72(s0)
ffffffffc0209224:	84aa                	mv	s1,a0
ffffffffc0209226:	16050363          	beqz	a0,ffffffffc020938c <sfs_do_mount+0x1b0>
ffffffffc020922a:	85aa                	mv	a1,a0
ffffffffc020922c:	4681                	li	a3,0
ffffffffc020922e:	6605                	lui	a2,0x1
ffffffffc0209230:	1008                	addi	a0,sp,32
ffffffffc0209232:	9bcfc0ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc0209236:	02093783          	ld	a5,32(s2)
ffffffffc020923a:	85aa                	mv	a1,a0
ffffffffc020923c:	4601                	li	a2,0
ffffffffc020923e:	854a                	mv	a0,s2
ffffffffc0209240:	9782                	jalr	a5
ffffffffc0209242:	8a2a                	mv	s4,a0
ffffffffc0209244:	10051e63          	bnez	a0,ffffffffc0209360 <sfs_do_mount+0x184>
ffffffffc0209248:	408c                	lw	a1,0(s1)
ffffffffc020924a:	2f8dc637          	lui	a2,0x2f8dc
ffffffffc020924e:	e2a60613          	addi	a2,a2,-470 # 2f8dbe2a <_binary_bin_sfs_img_size+0x2f866b2a>
ffffffffc0209252:	14c59863          	bne	a1,a2,ffffffffc02093a2 <sfs_do_mount+0x1c6>
ffffffffc0209256:	40dc                	lw	a5,4(s1)
ffffffffc0209258:	00093603          	ld	a2,0(s2)
ffffffffc020925c:	02079713          	slli	a4,a5,0x20
ffffffffc0209260:	9301                	srli	a4,a4,0x20
ffffffffc0209262:	12e66763          	bltu	a2,a4,ffffffffc0209390 <sfs_do_mount+0x1b4>
ffffffffc0209266:	020485a3          	sb	zero,43(s1)
ffffffffc020926a:	0084af03          	lw	t5,8(s1)
ffffffffc020926e:	00c4ae83          	lw	t4,12(s1)
ffffffffc0209272:	0104ae03          	lw	t3,16(s1)
ffffffffc0209276:	0144a303          	lw	t1,20(s1)
ffffffffc020927a:	0184a883          	lw	a7,24(s1)
ffffffffc020927e:	01c4a803          	lw	a6,28(s1)
ffffffffc0209282:	5090                	lw	a2,32(s1)
ffffffffc0209284:	50d4                	lw	a3,36(s1)
ffffffffc0209286:	5498                	lw	a4,40(s1)
ffffffffc0209288:	6511                	lui	a0,0x4
ffffffffc020928a:	c00c                	sw	a1,0(s0)
ffffffffc020928c:	c05c                	sw	a5,4(s0)
ffffffffc020928e:	01e42423          	sw	t5,8(s0)
ffffffffc0209292:	01d42623          	sw	t4,12(s0)
ffffffffc0209296:	01c42823          	sw	t3,16(s0)
ffffffffc020929a:	00642a23          	sw	t1,20(s0)
ffffffffc020929e:	01142c23          	sw	a7,24(s0)
ffffffffc02092a2:	01042e23          	sw	a6,28(s0)
ffffffffc02092a6:	d010                	sw	a2,32(s0)
ffffffffc02092a8:	d054                	sw	a3,36(s0)
ffffffffc02092aa:	d418                	sw	a4,40(s0)
ffffffffc02092ac:	ce3f80ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc02092b0:	f448                	sd	a0,168(s0)
ffffffffc02092b2:	8c2a                	mv	s8,a0
ffffffffc02092b4:	18050c63          	beqz	a0,ffffffffc020944c <sfs_do_mount+0x270>
ffffffffc02092b8:	6711                	lui	a4,0x4
ffffffffc02092ba:	87aa                	mv	a5,a0
ffffffffc02092bc:	972a                	add	a4,a4,a0
ffffffffc02092be:	e79c                	sd	a5,8(a5)
ffffffffc02092c0:	e39c                	sd	a5,0(a5)
ffffffffc02092c2:	07c1                	addi	a5,a5,16
ffffffffc02092c4:	fee79de3          	bne	a5,a4,ffffffffc02092be <sfs_do_mount+0xe2>
ffffffffc02092c8:	0044eb83          	lwu	s7,4(s1)
ffffffffc02092cc:	67a1                	lui	a5,0x8
ffffffffc02092ce:	fff78993          	addi	s3,a5,-1 # 7fff <_binary_bin_swap_img_size+0x2ff>
ffffffffc02092d2:	9bce                	add	s7,s7,s3
ffffffffc02092d4:	77e1                	lui	a5,0xffff8
ffffffffc02092d6:	00fbfbb3          	and	s7,s7,a5
ffffffffc02092da:	2b81                	sext.w	s7,s7
ffffffffc02092dc:	855e                	mv	a0,s7
ffffffffc02092de:	a59ff0ef          	jal	ra,ffffffffc0208d36 <bitmap_create>
ffffffffc02092e2:	fc08                	sd	a0,56(s0)
ffffffffc02092e4:	8d2a                	mv	s10,a0
ffffffffc02092e6:	14050f63          	beqz	a0,ffffffffc0209444 <sfs_do_mount+0x268>
ffffffffc02092ea:	0044e783          	lwu	a5,4(s1)
ffffffffc02092ee:	082c                	addi	a1,sp,24
ffffffffc02092f0:	97ce                	add	a5,a5,s3
ffffffffc02092f2:	00f7d713          	srli	a4,a5,0xf
ffffffffc02092f6:	e43a                	sd	a4,8(sp)
ffffffffc02092f8:	40f7d993          	srai	s3,a5,0xf
ffffffffc02092fc:	c4fff0ef          	jal	ra,ffffffffc0208f4a <bitmap_getdata>
ffffffffc0209300:	14050c63          	beqz	a0,ffffffffc0209458 <sfs_do_mount+0x27c>
ffffffffc0209304:	00c9979b          	slliw	a5,s3,0xc
ffffffffc0209308:	66e2                	ld	a3,24(sp)
ffffffffc020930a:	1782                	slli	a5,a5,0x20
ffffffffc020930c:	9381                	srli	a5,a5,0x20
ffffffffc020930e:	14d79563          	bne	a5,a3,ffffffffc0209458 <sfs_do_mount+0x27c>
ffffffffc0209312:	6722                	ld	a4,8(sp)
ffffffffc0209314:	6d89                	lui	s11,0x2
ffffffffc0209316:	89aa                	mv	s3,a0
ffffffffc0209318:	00c71c93          	slli	s9,a4,0xc
ffffffffc020931c:	9caa                	add	s9,s9,a0
ffffffffc020931e:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0209322:	e711                	bnez	a4,ffffffffc020932e <sfs_do_mount+0x152>
ffffffffc0209324:	a079                	j	ffffffffc02093b2 <sfs_do_mount+0x1d6>
ffffffffc0209326:	6785                	lui	a5,0x1
ffffffffc0209328:	99be                	add	s3,s3,a5
ffffffffc020932a:	093c8463          	beq	s9,s3,ffffffffc02093b2 <sfs_do_mount+0x1d6>
ffffffffc020932e:	013d86bb          	addw	a3,s11,s3
ffffffffc0209332:	1682                	slli	a3,a3,0x20
ffffffffc0209334:	6605                	lui	a2,0x1
ffffffffc0209336:	85ce                	mv	a1,s3
ffffffffc0209338:	9281                	srli	a3,a3,0x20
ffffffffc020933a:	1008                	addi	a0,sp,32
ffffffffc020933c:	8b2fc0ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc0209340:	02093783          	ld	a5,32(s2)
ffffffffc0209344:	85aa                	mv	a1,a0
ffffffffc0209346:	4601                	li	a2,0
ffffffffc0209348:	854a                	mv	a0,s2
ffffffffc020934a:	9782                	jalr	a5
ffffffffc020934c:	dd69                	beqz	a0,ffffffffc0209326 <sfs_do_mount+0x14a>
ffffffffc020934e:	e42a                	sd	a0,8(sp)
ffffffffc0209350:	856a                	mv	a0,s10
ffffffffc0209352:	bdfff0ef          	jal	ra,ffffffffc0208f30 <bitmap_destroy>
ffffffffc0209356:	67a2                	ld	a5,8(sp)
ffffffffc0209358:	8a3e                	mv	s4,a5
ffffffffc020935a:	8562                	mv	a0,s8
ffffffffc020935c:	ce3f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209360:	8526                	mv	a0,s1
ffffffffc0209362:	cddf80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc0209366:	8522                	mv	a0,s0
ffffffffc0209368:	cd7f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020936c:	70aa                	ld	ra,168(sp)
ffffffffc020936e:	740a                	ld	s0,160(sp)
ffffffffc0209370:	64ea                	ld	s1,152(sp)
ffffffffc0209372:	694a                	ld	s2,144(sp)
ffffffffc0209374:	69aa                	ld	s3,136(sp)
ffffffffc0209376:	7ae6                	ld	s5,120(sp)
ffffffffc0209378:	7b46                	ld	s6,112(sp)
ffffffffc020937a:	7ba6                	ld	s7,104(sp)
ffffffffc020937c:	7c06                	ld	s8,96(sp)
ffffffffc020937e:	6ce6                	ld	s9,88(sp)
ffffffffc0209380:	6d46                	ld	s10,80(sp)
ffffffffc0209382:	6da6                	ld	s11,72(sp)
ffffffffc0209384:	8552                	mv	a0,s4
ffffffffc0209386:	6a0a                	ld	s4,128(sp)
ffffffffc0209388:	614d                	addi	sp,sp,176
ffffffffc020938a:	8082                	ret
ffffffffc020938c:	5a71                	li	s4,-4
ffffffffc020938e:	bfe1                	j	ffffffffc0209366 <sfs_do_mount+0x18a>
ffffffffc0209390:	85be                	mv	a1,a5
ffffffffc0209392:	00005517          	auipc	a0,0x5
ffffffffc0209396:	7c650513          	addi	a0,a0,1990 # ffffffffc020eb58 <dev_node_ops+0x4d8>
ffffffffc020939a:	e0df60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc020939e:	5a75                	li	s4,-3
ffffffffc02093a0:	b7c1                	j	ffffffffc0209360 <sfs_do_mount+0x184>
ffffffffc02093a2:	00005517          	auipc	a0,0x5
ffffffffc02093a6:	77e50513          	addi	a0,a0,1918 # ffffffffc020eb20 <dev_node_ops+0x4a0>
ffffffffc02093aa:	dfdf60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc02093ae:	5a75                	li	s4,-3
ffffffffc02093b0:	bf45                	j	ffffffffc0209360 <sfs_do_mount+0x184>
ffffffffc02093b2:	00442903          	lw	s2,4(s0)
ffffffffc02093b6:	4481                	li	s1,0
ffffffffc02093b8:	080b8c63          	beqz	s7,ffffffffc0209450 <sfs_do_mount+0x274>
ffffffffc02093bc:	85a6                	mv	a1,s1
ffffffffc02093be:	856a                	mv	a0,s10
ffffffffc02093c0:	af7ff0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc02093c4:	c111                	beqz	a0,ffffffffc02093c8 <sfs_do_mount+0x1ec>
ffffffffc02093c6:	2b05                	addiw	s6,s6,1
ffffffffc02093c8:	2485                	addiw	s1,s1,1
ffffffffc02093ca:	fe9b99e3          	bne	s7,s1,ffffffffc02093bc <sfs_do_mount+0x1e0>
ffffffffc02093ce:	441c                	lw	a5,8(s0)
ffffffffc02093d0:	0d679463          	bne	a5,s6,ffffffffc0209498 <sfs_do_mount+0x2bc>
ffffffffc02093d4:	4585                	li	a1,1
ffffffffc02093d6:	05040513          	addi	a0,s0,80
ffffffffc02093da:	04043023          	sd	zero,64(s0)
ffffffffc02093de:	988fb0ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc02093e2:	4585                	li	a1,1
ffffffffc02093e4:	06840513          	addi	a0,s0,104
ffffffffc02093e8:	97efb0ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc02093ec:	4585                	li	a1,1
ffffffffc02093ee:	08040513          	addi	a0,s0,128
ffffffffc02093f2:	974fb0ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc02093f6:	09840793          	addi	a5,s0,152
ffffffffc02093fa:	f05c                	sd	a5,160(s0)
ffffffffc02093fc:	ec5c                	sd	a5,152(s0)
ffffffffc02093fe:	874a                	mv	a4,s2
ffffffffc0209400:	86da                	mv	a3,s6
ffffffffc0209402:	4169063b          	subw	a2,s2,s6
ffffffffc0209406:	00c40593          	addi	a1,s0,12
ffffffffc020940a:	00005517          	auipc	a0,0x5
ffffffffc020940e:	7de50513          	addi	a0,a0,2014 # ffffffffc020ebe8 <dev_node_ops+0x568>
ffffffffc0209412:	d95f60ef          	jal	ra,ffffffffc02001a6 <cprintf>
ffffffffc0209416:	00000797          	auipc	a5,0x0
ffffffffc020941a:	c8878793          	addi	a5,a5,-888 # ffffffffc020909e <sfs_sync>
ffffffffc020941e:	fc5c                	sd	a5,184(s0)
ffffffffc0209420:	00000797          	auipc	a5,0x0
ffffffffc0209424:	d6478793          	addi	a5,a5,-668 # ffffffffc0209184 <sfs_get_root>
ffffffffc0209428:	e07c                	sd	a5,192(s0)
ffffffffc020942a:	00000797          	auipc	a5,0x0
ffffffffc020942e:	b5e78793          	addi	a5,a5,-1186 # ffffffffc0208f88 <sfs_unmount>
ffffffffc0209432:	e47c                	sd	a5,200(s0)
ffffffffc0209434:	00000797          	auipc	a5,0x0
ffffffffc0209438:	bd878793          	addi	a5,a5,-1064 # ffffffffc020900c <sfs_cleanup>
ffffffffc020943c:	e87c                	sd	a5,208(s0)
ffffffffc020943e:	008ab023          	sd	s0,0(s5)
ffffffffc0209442:	b72d                	j	ffffffffc020936c <sfs_do_mount+0x190>
ffffffffc0209444:	5a71                	li	s4,-4
ffffffffc0209446:	bf11                	j	ffffffffc020935a <sfs_do_mount+0x17e>
ffffffffc0209448:	5a49                	li	s4,-14
ffffffffc020944a:	b70d                	j	ffffffffc020936c <sfs_do_mount+0x190>
ffffffffc020944c:	5a71                	li	s4,-4
ffffffffc020944e:	bf09                	j	ffffffffc0209360 <sfs_do_mount+0x184>
ffffffffc0209450:	4b01                	li	s6,0
ffffffffc0209452:	bfb5                	j	ffffffffc02093ce <sfs_do_mount+0x1f2>
ffffffffc0209454:	5a71                	li	s4,-4
ffffffffc0209456:	bf19                	j	ffffffffc020936c <sfs_do_mount+0x190>
ffffffffc0209458:	00005697          	auipc	a3,0x5
ffffffffc020945c:	73068693          	addi	a3,a3,1840 # ffffffffc020eb88 <dev_node_ops+0x508>
ffffffffc0209460:	00002617          	auipc	a2,0x2
ffffffffc0209464:	3b860613          	addi	a2,a2,952 # ffffffffc020b818 <commands+0x210>
ffffffffc0209468:	08300593          	li	a1,131
ffffffffc020946c:	00005517          	auipc	a0,0x5
ffffffffc0209470:	62450513          	addi	a0,a0,1572 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0209474:	82af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209478:	00005697          	auipc	a3,0x5
ffffffffc020947c:	5e868693          	addi	a3,a3,1512 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc0209480:	00002617          	auipc	a2,0x2
ffffffffc0209484:	39860613          	addi	a2,a2,920 # ffffffffc020b818 <commands+0x210>
ffffffffc0209488:	0a300593          	li	a1,163
ffffffffc020948c:	00005517          	auipc	a0,0x5
ffffffffc0209490:	60450513          	addi	a0,a0,1540 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc0209494:	80af70ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209498:	00005697          	auipc	a3,0x5
ffffffffc020949c:	72068693          	addi	a3,a3,1824 # ffffffffc020ebb8 <dev_node_ops+0x538>
ffffffffc02094a0:	00002617          	auipc	a2,0x2
ffffffffc02094a4:	37860613          	addi	a2,a2,888 # ffffffffc020b818 <commands+0x210>
ffffffffc02094a8:	0e000593          	li	a1,224
ffffffffc02094ac:	00005517          	auipc	a0,0x5
ffffffffc02094b0:	5e450513          	addi	a0,a0,1508 # ffffffffc020ea90 <dev_node_ops+0x410>
ffffffffc02094b4:	febf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02094b8 <sfs_mount>:
ffffffffc02094b8:	00000597          	auipc	a1,0x0
ffffffffc02094bc:	d2458593          	addi	a1,a1,-732 # ffffffffc02091dc <sfs_do_mount>
ffffffffc02094c0:	817fe06f          	j	ffffffffc0207cd6 <vfs_mount>

ffffffffc02094c4 <sfs_opendir>:
ffffffffc02094c4:	0235f593          	andi	a1,a1,35
ffffffffc02094c8:	4501                	li	a0,0
ffffffffc02094ca:	e191                	bnez	a1,ffffffffc02094ce <sfs_opendir+0xa>
ffffffffc02094cc:	8082                	ret
ffffffffc02094ce:	553d                	li	a0,-17
ffffffffc02094d0:	8082                	ret

ffffffffc02094d2 <sfs_openfile>:
ffffffffc02094d2:	4501                	li	a0,0
ffffffffc02094d4:	8082                	ret

ffffffffc02094d6 <sfs_gettype>:
ffffffffc02094d6:	1141                	addi	sp,sp,-16
ffffffffc02094d8:	e406                	sd	ra,8(sp)
ffffffffc02094da:	c939                	beqz	a0,ffffffffc0209530 <sfs_gettype+0x5a>
ffffffffc02094dc:	4d34                	lw	a3,88(a0)
ffffffffc02094de:	6785                	lui	a5,0x1
ffffffffc02094e0:	23578713          	addi	a4,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02094e4:	04e69663          	bne	a3,a4,ffffffffc0209530 <sfs_gettype+0x5a>
ffffffffc02094e8:	6114                	ld	a3,0(a0)
ffffffffc02094ea:	4709                	li	a4,2
ffffffffc02094ec:	0046d683          	lhu	a3,4(a3)
ffffffffc02094f0:	02e68a63          	beq	a3,a4,ffffffffc0209524 <sfs_gettype+0x4e>
ffffffffc02094f4:	470d                	li	a4,3
ffffffffc02094f6:	02e68163          	beq	a3,a4,ffffffffc0209518 <sfs_gettype+0x42>
ffffffffc02094fa:	4705                	li	a4,1
ffffffffc02094fc:	00e68f63          	beq	a3,a4,ffffffffc020951a <sfs_gettype+0x44>
ffffffffc0209500:	00005617          	auipc	a2,0x5
ffffffffc0209504:	75860613          	addi	a2,a2,1880 # ffffffffc020ec58 <dev_node_ops+0x5d8>
ffffffffc0209508:	39100593          	li	a1,913
ffffffffc020950c:	00005517          	auipc	a0,0x5
ffffffffc0209510:	73450513          	addi	a0,a0,1844 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209514:	f8bf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209518:	678d                	lui	a5,0x3
ffffffffc020951a:	60a2                	ld	ra,8(sp)
ffffffffc020951c:	c19c                	sw	a5,0(a1)
ffffffffc020951e:	4501                	li	a0,0
ffffffffc0209520:	0141                	addi	sp,sp,16
ffffffffc0209522:	8082                	ret
ffffffffc0209524:	60a2                	ld	ra,8(sp)
ffffffffc0209526:	6789                	lui	a5,0x2
ffffffffc0209528:	c19c                	sw	a5,0(a1)
ffffffffc020952a:	4501                	li	a0,0
ffffffffc020952c:	0141                	addi	sp,sp,16
ffffffffc020952e:	8082                	ret
ffffffffc0209530:	00005697          	auipc	a3,0x5
ffffffffc0209534:	6d868693          	addi	a3,a3,1752 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc0209538:	00002617          	auipc	a2,0x2
ffffffffc020953c:	2e060613          	addi	a2,a2,736 # ffffffffc020b818 <commands+0x210>
ffffffffc0209540:	38500593          	li	a1,901
ffffffffc0209544:	00005517          	auipc	a0,0x5
ffffffffc0209548:	6fc50513          	addi	a0,a0,1788 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020954c:	f53f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209550 <sfs_fsync>:
ffffffffc0209550:	7179                	addi	sp,sp,-48
ffffffffc0209552:	ec26                	sd	s1,24(sp)
ffffffffc0209554:	7524                	ld	s1,104(a0)
ffffffffc0209556:	f406                	sd	ra,40(sp)
ffffffffc0209558:	f022                	sd	s0,32(sp)
ffffffffc020955a:	e84a                	sd	s2,16(sp)
ffffffffc020955c:	e44e                	sd	s3,8(sp)
ffffffffc020955e:	c4bd                	beqz	s1,ffffffffc02095cc <sfs_fsync+0x7c>
ffffffffc0209560:	0b04a783          	lw	a5,176(s1)
ffffffffc0209564:	e7a5                	bnez	a5,ffffffffc02095cc <sfs_fsync+0x7c>
ffffffffc0209566:	4d38                	lw	a4,88(a0)
ffffffffc0209568:	6785                	lui	a5,0x1
ffffffffc020956a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020956e:	842a                	mv	s0,a0
ffffffffc0209570:	06f71e63          	bne	a4,a5,ffffffffc02095ec <sfs_fsync+0x9c>
ffffffffc0209574:	691c                	ld	a5,16(a0)
ffffffffc0209576:	4901                	li	s2,0
ffffffffc0209578:	eb89                	bnez	a5,ffffffffc020958a <sfs_fsync+0x3a>
ffffffffc020957a:	70a2                	ld	ra,40(sp)
ffffffffc020957c:	7402                	ld	s0,32(sp)
ffffffffc020957e:	64e2                	ld	s1,24(sp)
ffffffffc0209580:	69a2                	ld	s3,8(sp)
ffffffffc0209582:	854a                	mv	a0,s2
ffffffffc0209584:	6942                	ld	s2,16(sp)
ffffffffc0209586:	6145                	addi	sp,sp,48
ffffffffc0209588:	8082                	ret
ffffffffc020958a:	02050993          	addi	s3,a0,32
ffffffffc020958e:	854e                	mv	a0,s3
ffffffffc0209590:	fe1fa0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0209594:	681c                	ld	a5,16(s0)
ffffffffc0209596:	ef81                	bnez	a5,ffffffffc02095ae <sfs_fsync+0x5e>
ffffffffc0209598:	854e                	mv	a0,s3
ffffffffc020959a:	fd3fa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020959e:	70a2                	ld	ra,40(sp)
ffffffffc02095a0:	7402                	ld	s0,32(sp)
ffffffffc02095a2:	64e2                	ld	s1,24(sp)
ffffffffc02095a4:	69a2                	ld	s3,8(sp)
ffffffffc02095a6:	854a                	mv	a0,s2
ffffffffc02095a8:	6942                	ld	s2,16(sp)
ffffffffc02095aa:	6145                	addi	sp,sp,48
ffffffffc02095ac:	8082                	ret
ffffffffc02095ae:	4414                	lw	a3,8(s0)
ffffffffc02095b0:	600c                	ld	a1,0(s0)
ffffffffc02095b2:	00043823          	sd	zero,16(s0)
ffffffffc02095b6:	4701                	li	a4,0
ffffffffc02095b8:	04000613          	li	a2,64
ffffffffc02095bc:	8526                	mv	a0,s1
ffffffffc02095be:	674010ef          	jal	ra,ffffffffc020ac32 <sfs_wbuf>
ffffffffc02095c2:	892a                	mv	s2,a0
ffffffffc02095c4:	d971                	beqz	a0,ffffffffc0209598 <sfs_fsync+0x48>
ffffffffc02095c6:	4785                	li	a5,1
ffffffffc02095c8:	e81c                	sd	a5,16(s0)
ffffffffc02095ca:	b7f9                	j	ffffffffc0209598 <sfs_fsync+0x48>
ffffffffc02095cc:	00005697          	auipc	a3,0x5
ffffffffc02095d0:	49468693          	addi	a3,a3,1172 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc02095d4:	00002617          	auipc	a2,0x2
ffffffffc02095d8:	24460613          	addi	a2,a2,580 # ffffffffc020b818 <commands+0x210>
ffffffffc02095dc:	2c900593          	li	a1,713
ffffffffc02095e0:	00005517          	auipc	a0,0x5
ffffffffc02095e4:	66050513          	addi	a0,a0,1632 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc02095e8:	eb7f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02095ec:	00005697          	auipc	a3,0x5
ffffffffc02095f0:	61c68693          	addi	a3,a3,1564 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc02095f4:	00002617          	auipc	a2,0x2
ffffffffc02095f8:	22460613          	addi	a2,a2,548 # ffffffffc020b818 <commands+0x210>
ffffffffc02095fc:	2ca00593          	li	a1,714
ffffffffc0209600:	00005517          	auipc	a0,0x5
ffffffffc0209604:	64050513          	addi	a0,a0,1600 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209608:	e97f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020960c <sfs_fstat>:
ffffffffc020960c:	1101                	addi	sp,sp,-32
ffffffffc020960e:	e426                	sd	s1,8(sp)
ffffffffc0209610:	84ae                	mv	s1,a1
ffffffffc0209612:	e822                	sd	s0,16(sp)
ffffffffc0209614:	02000613          	li	a2,32
ffffffffc0209618:	842a                	mv	s0,a0
ffffffffc020961a:	4581                	li	a1,0
ffffffffc020961c:	8526                	mv	a0,s1
ffffffffc020961e:	ec06                	sd	ra,24(sp)
ffffffffc0209620:	517010ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc0209624:	c439                	beqz	s0,ffffffffc0209672 <sfs_fstat+0x66>
ffffffffc0209626:	783c                	ld	a5,112(s0)
ffffffffc0209628:	c7a9                	beqz	a5,ffffffffc0209672 <sfs_fstat+0x66>
ffffffffc020962a:	6bbc                	ld	a5,80(a5)
ffffffffc020962c:	c3b9                	beqz	a5,ffffffffc0209672 <sfs_fstat+0x66>
ffffffffc020962e:	00005597          	auipc	a1,0x5
ffffffffc0209632:	fca58593          	addi	a1,a1,-54 # ffffffffc020e5f8 <syscalls+0xdb0>
ffffffffc0209636:	8522                	mv	a0,s0
ffffffffc0209638:	8cefe0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc020963c:	783c                	ld	a5,112(s0)
ffffffffc020963e:	85a6                	mv	a1,s1
ffffffffc0209640:	8522                	mv	a0,s0
ffffffffc0209642:	6bbc                	ld	a5,80(a5)
ffffffffc0209644:	9782                	jalr	a5
ffffffffc0209646:	e10d                	bnez	a0,ffffffffc0209668 <sfs_fstat+0x5c>
ffffffffc0209648:	4c38                	lw	a4,88(s0)
ffffffffc020964a:	6785                	lui	a5,0x1
ffffffffc020964c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209650:	04f71163          	bne	a4,a5,ffffffffc0209692 <sfs_fstat+0x86>
ffffffffc0209654:	601c                	ld	a5,0(s0)
ffffffffc0209656:	0067d683          	lhu	a3,6(a5)
ffffffffc020965a:	0087e703          	lwu	a4,8(a5)
ffffffffc020965e:	0007e783          	lwu	a5,0(a5)
ffffffffc0209662:	e494                	sd	a3,8(s1)
ffffffffc0209664:	e898                	sd	a4,16(s1)
ffffffffc0209666:	ec9c                	sd	a5,24(s1)
ffffffffc0209668:	60e2                	ld	ra,24(sp)
ffffffffc020966a:	6442                	ld	s0,16(sp)
ffffffffc020966c:	64a2                	ld	s1,8(sp)
ffffffffc020966e:	6105                	addi	sp,sp,32
ffffffffc0209670:	8082                	ret
ffffffffc0209672:	00005697          	auipc	a3,0x5
ffffffffc0209676:	f1e68693          	addi	a3,a3,-226 # ffffffffc020e590 <syscalls+0xd48>
ffffffffc020967a:	00002617          	auipc	a2,0x2
ffffffffc020967e:	19e60613          	addi	a2,a2,414 # ffffffffc020b818 <commands+0x210>
ffffffffc0209682:	2ba00593          	li	a1,698
ffffffffc0209686:	00005517          	auipc	a0,0x5
ffffffffc020968a:	5ba50513          	addi	a0,a0,1466 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020968e:	e11f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209692:	00005697          	auipc	a3,0x5
ffffffffc0209696:	57668693          	addi	a3,a3,1398 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020969a:	00002617          	auipc	a2,0x2
ffffffffc020969e:	17e60613          	addi	a2,a2,382 # ffffffffc020b818 <commands+0x210>
ffffffffc02096a2:	2bd00593          	li	a1,701
ffffffffc02096a6:	00005517          	auipc	a0,0x5
ffffffffc02096aa:	59a50513          	addi	a0,a0,1434 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc02096ae:	df1f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02096b2 <sfs_tryseek>:
ffffffffc02096b2:	080007b7          	lui	a5,0x8000
ffffffffc02096b6:	04f5fd63          	bgeu	a1,a5,ffffffffc0209710 <sfs_tryseek+0x5e>
ffffffffc02096ba:	1101                	addi	sp,sp,-32
ffffffffc02096bc:	e822                	sd	s0,16(sp)
ffffffffc02096be:	ec06                	sd	ra,24(sp)
ffffffffc02096c0:	e426                	sd	s1,8(sp)
ffffffffc02096c2:	842a                	mv	s0,a0
ffffffffc02096c4:	c921                	beqz	a0,ffffffffc0209714 <sfs_tryseek+0x62>
ffffffffc02096c6:	4d38                	lw	a4,88(a0)
ffffffffc02096c8:	6785                	lui	a5,0x1
ffffffffc02096ca:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc02096ce:	04f71363          	bne	a4,a5,ffffffffc0209714 <sfs_tryseek+0x62>
ffffffffc02096d2:	611c                	ld	a5,0(a0)
ffffffffc02096d4:	84ae                	mv	s1,a1
ffffffffc02096d6:	0007e783          	lwu	a5,0(a5)
ffffffffc02096da:	02b7d563          	bge	a5,a1,ffffffffc0209704 <sfs_tryseek+0x52>
ffffffffc02096de:	793c                	ld	a5,112(a0)
ffffffffc02096e0:	cbb1                	beqz	a5,ffffffffc0209734 <sfs_tryseek+0x82>
ffffffffc02096e2:	73bc                	ld	a5,96(a5)
ffffffffc02096e4:	cba1                	beqz	a5,ffffffffc0209734 <sfs_tryseek+0x82>
ffffffffc02096e6:	00005597          	auipc	a1,0x5
ffffffffc02096ea:	e0258593          	addi	a1,a1,-510 # ffffffffc020e4e8 <syscalls+0xca0>
ffffffffc02096ee:	818fe0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc02096f2:	783c                	ld	a5,112(s0)
ffffffffc02096f4:	8522                	mv	a0,s0
ffffffffc02096f6:	6442                	ld	s0,16(sp)
ffffffffc02096f8:	60e2                	ld	ra,24(sp)
ffffffffc02096fa:	73bc                	ld	a5,96(a5)
ffffffffc02096fc:	85a6                	mv	a1,s1
ffffffffc02096fe:	64a2                	ld	s1,8(sp)
ffffffffc0209700:	6105                	addi	sp,sp,32
ffffffffc0209702:	8782                	jr	a5
ffffffffc0209704:	60e2                	ld	ra,24(sp)
ffffffffc0209706:	6442                	ld	s0,16(sp)
ffffffffc0209708:	64a2                	ld	s1,8(sp)
ffffffffc020970a:	4501                	li	a0,0
ffffffffc020970c:	6105                	addi	sp,sp,32
ffffffffc020970e:	8082                	ret
ffffffffc0209710:	5575                	li	a0,-3
ffffffffc0209712:	8082                	ret
ffffffffc0209714:	00005697          	auipc	a3,0x5
ffffffffc0209718:	4f468693          	addi	a3,a3,1268 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020971c:	00002617          	auipc	a2,0x2
ffffffffc0209720:	0fc60613          	addi	a2,a2,252 # ffffffffc020b818 <commands+0x210>
ffffffffc0209724:	39c00593          	li	a1,924
ffffffffc0209728:	00005517          	auipc	a0,0x5
ffffffffc020972c:	51850513          	addi	a0,a0,1304 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209730:	d6ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209734:	00005697          	auipc	a3,0x5
ffffffffc0209738:	d5c68693          	addi	a3,a3,-676 # ffffffffc020e490 <syscalls+0xc48>
ffffffffc020973c:	00002617          	auipc	a2,0x2
ffffffffc0209740:	0dc60613          	addi	a2,a2,220 # ffffffffc020b818 <commands+0x210>
ffffffffc0209744:	39e00593          	li	a1,926
ffffffffc0209748:	00005517          	auipc	a0,0x5
ffffffffc020974c:	4f850513          	addi	a0,a0,1272 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209750:	d4ff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209754 <sfs_close>:
ffffffffc0209754:	1141                	addi	sp,sp,-16
ffffffffc0209756:	e406                	sd	ra,8(sp)
ffffffffc0209758:	e022                	sd	s0,0(sp)
ffffffffc020975a:	c11d                	beqz	a0,ffffffffc0209780 <sfs_close+0x2c>
ffffffffc020975c:	793c                	ld	a5,112(a0)
ffffffffc020975e:	842a                	mv	s0,a0
ffffffffc0209760:	c385                	beqz	a5,ffffffffc0209780 <sfs_close+0x2c>
ffffffffc0209762:	7b9c                	ld	a5,48(a5)
ffffffffc0209764:	cf91                	beqz	a5,ffffffffc0209780 <sfs_close+0x2c>
ffffffffc0209766:	00004597          	auipc	a1,0x4
ffffffffc020976a:	a2a58593          	addi	a1,a1,-1494 # ffffffffc020d190 <default_pmm_manager+0xe90>
ffffffffc020976e:	f99fd0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc0209772:	783c                	ld	a5,112(s0)
ffffffffc0209774:	8522                	mv	a0,s0
ffffffffc0209776:	6402                	ld	s0,0(sp)
ffffffffc0209778:	60a2                	ld	ra,8(sp)
ffffffffc020977a:	7b9c                	ld	a5,48(a5)
ffffffffc020977c:	0141                	addi	sp,sp,16
ffffffffc020977e:	8782                	jr	a5
ffffffffc0209780:	00004697          	auipc	a3,0x4
ffffffffc0209784:	9c068693          	addi	a3,a3,-1600 # ffffffffc020d140 <default_pmm_manager+0xe40>
ffffffffc0209788:	00002617          	auipc	a2,0x2
ffffffffc020978c:	09060613          	addi	a2,a2,144 # ffffffffc020b818 <commands+0x210>
ffffffffc0209790:	21c00593          	li	a1,540
ffffffffc0209794:	00005517          	auipc	a0,0x5
ffffffffc0209798:	4ac50513          	addi	a0,a0,1196 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020979c:	d03f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02097a0 <sfs_io.part.0>:
ffffffffc02097a0:	1141                	addi	sp,sp,-16
ffffffffc02097a2:	00005697          	auipc	a3,0x5
ffffffffc02097a6:	46668693          	addi	a3,a3,1126 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc02097aa:	00002617          	auipc	a2,0x2
ffffffffc02097ae:	06e60613          	addi	a2,a2,110 # ffffffffc020b818 <commands+0x210>
ffffffffc02097b2:	29900593          	li	a1,665
ffffffffc02097b6:	00005517          	auipc	a0,0x5
ffffffffc02097ba:	48a50513          	addi	a0,a0,1162 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc02097be:	e406                	sd	ra,8(sp)
ffffffffc02097c0:	cdff60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02097c4 <sfs_block_free>:
ffffffffc02097c4:	1101                	addi	sp,sp,-32
ffffffffc02097c6:	e426                	sd	s1,8(sp)
ffffffffc02097c8:	ec06                	sd	ra,24(sp)
ffffffffc02097ca:	e822                	sd	s0,16(sp)
ffffffffc02097cc:	4154                	lw	a3,4(a0)
ffffffffc02097ce:	84ae                	mv	s1,a1
ffffffffc02097d0:	c595                	beqz	a1,ffffffffc02097fc <sfs_block_free+0x38>
ffffffffc02097d2:	02d5f563          	bgeu	a1,a3,ffffffffc02097fc <sfs_block_free+0x38>
ffffffffc02097d6:	842a                	mv	s0,a0
ffffffffc02097d8:	7d08                	ld	a0,56(a0)
ffffffffc02097da:	edcff0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc02097de:	ed05                	bnez	a0,ffffffffc0209816 <sfs_block_free+0x52>
ffffffffc02097e0:	7c08                	ld	a0,56(s0)
ffffffffc02097e2:	85a6                	mv	a1,s1
ffffffffc02097e4:	efaff0ef          	jal	ra,ffffffffc0208ede <bitmap_free>
ffffffffc02097e8:	441c                	lw	a5,8(s0)
ffffffffc02097ea:	4705                	li	a4,1
ffffffffc02097ec:	60e2                	ld	ra,24(sp)
ffffffffc02097ee:	2785                	addiw	a5,a5,1
ffffffffc02097f0:	e038                	sd	a4,64(s0)
ffffffffc02097f2:	c41c                	sw	a5,8(s0)
ffffffffc02097f4:	6442                	ld	s0,16(sp)
ffffffffc02097f6:	64a2                	ld	s1,8(sp)
ffffffffc02097f8:	6105                	addi	sp,sp,32
ffffffffc02097fa:	8082                	ret
ffffffffc02097fc:	8726                	mv	a4,s1
ffffffffc02097fe:	00005617          	auipc	a2,0x5
ffffffffc0209802:	47260613          	addi	a2,a2,1138 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc0209806:	05300593          	li	a1,83
ffffffffc020980a:	00005517          	auipc	a0,0x5
ffffffffc020980e:	43650513          	addi	a0,a0,1078 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209812:	c8df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209816:	00005697          	auipc	a3,0x5
ffffffffc020981a:	49268693          	addi	a3,a3,1170 # ffffffffc020eca8 <dev_node_ops+0x628>
ffffffffc020981e:	00002617          	auipc	a2,0x2
ffffffffc0209822:	ffa60613          	addi	a2,a2,-6 # ffffffffc020b818 <commands+0x210>
ffffffffc0209826:	06a00593          	li	a1,106
ffffffffc020982a:	00005517          	auipc	a0,0x5
ffffffffc020982e:	41650513          	addi	a0,a0,1046 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209832:	c6df60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209836 <sfs_reclaim>:
ffffffffc0209836:	1101                	addi	sp,sp,-32
ffffffffc0209838:	e426                	sd	s1,8(sp)
ffffffffc020983a:	7524                	ld	s1,104(a0)
ffffffffc020983c:	ec06                	sd	ra,24(sp)
ffffffffc020983e:	e822                	sd	s0,16(sp)
ffffffffc0209840:	e04a                	sd	s2,0(sp)
ffffffffc0209842:	0e048a63          	beqz	s1,ffffffffc0209936 <sfs_reclaim+0x100>
ffffffffc0209846:	0b04a783          	lw	a5,176(s1)
ffffffffc020984a:	0e079663          	bnez	a5,ffffffffc0209936 <sfs_reclaim+0x100>
ffffffffc020984e:	4d38                	lw	a4,88(a0)
ffffffffc0209850:	6785                	lui	a5,0x1
ffffffffc0209852:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209856:	842a                	mv	s0,a0
ffffffffc0209858:	10f71f63          	bne	a4,a5,ffffffffc0209976 <sfs_reclaim+0x140>
ffffffffc020985c:	8526                	mv	a0,s1
ffffffffc020985e:	584010ef          	jal	ra,ffffffffc020ade2 <lock_sfs_fs>
ffffffffc0209862:	4c1c                	lw	a5,24(s0)
ffffffffc0209864:	0ef05963          	blez	a5,ffffffffc0209956 <sfs_reclaim+0x120>
ffffffffc0209868:	fff7871b          	addiw	a4,a5,-1
ffffffffc020986c:	cc18                	sw	a4,24(s0)
ffffffffc020986e:	eb59                	bnez	a4,ffffffffc0209904 <sfs_reclaim+0xce>
ffffffffc0209870:	05c42903          	lw	s2,92(s0)
ffffffffc0209874:	08091863          	bnez	s2,ffffffffc0209904 <sfs_reclaim+0xce>
ffffffffc0209878:	601c                	ld	a5,0(s0)
ffffffffc020987a:	0067d783          	lhu	a5,6(a5)
ffffffffc020987e:	e785                	bnez	a5,ffffffffc02098a6 <sfs_reclaim+0x70>
ffffffffc0209880:	783c                	ld	a5,112(s0)
ffffffffc0209882:	10078a63          	beqz	a5,ffffffffc0209996 <sfs_reclaim+0x160>
ffffffffc0209886:	73bc                	ld	a5,96(a5)
ffffffffc0209888:	10078763          	beqz	a5,ffffffffc0209996 <sfs_reclaim+0x160>
ffffffffc020988c:	00005597          	auipc	a1,0x5
ffffffffc0209890:	c5c58593          	addi	a1,a1,-932 # ffffffffc020e4e8 <syscalls+0xca0>
ffffffffc0209894:	8522                	mv	a0,s0
ffffffffc0209896:	e71fd0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc020989a:	783c                	ld	a5,112(s0)
ffffffffc020989c:	4581                	li	a1,0
ffffffffc020989e:	8522                	mv	a0,s0
ffffffffc02098a0:	73bc                	ld	a5,96(a5)
ffffffffc02098a2:	9782                	jalr	a5
ffffffffc02098a4:	e559                	bnez	a0,ffffffffc0209932 <sfs_reclaim+0xfc>
ffffffffc02098a6:	681c                	ld	a5,16(s0)
ffffffffc02098a8:	c39d                	beqz	a5,ffffffffc02098ce <sfs_reclaim+0x98>
ffffffffc02098aa:	783c                	ld	a5,112(s0)
ffffffffc02098ac:	10078563          	beqz	a5,ffffffffc02099b6 <sfs_reclaim+0x180>
ffffffffc02098b0:	7b9c                	ld	a5,48(a5)
ffffffffc02098b2:	10078263          	beqz	a5,ffffffffc02099b6 <sfs_reclaim+0x180>
ffffffffc02098b6:	8522                	mv	a0,s0
ffffffffc02098b8:	00004597          	auipc	a1,0x4
ffffffffc02098bc:	8d858593          	addi	a1,a1,-1832 # ffffffffc020d190 <default_pmm_manager+0xe90>
ffffffffc02098c0:	e47fd0ef          	jal	ra,ffffffffc0207706 <inode_check>
ffffffffc02098c4:	783c                	ld	a5,112(s0)
ffffffffc02098c6:	8522                	mv	a0,s0
ffffffffc02098c8:	7b9c                	ld	a5,48(a5)
ffffffffc02098ca:	9782                	jalr	a5
ffffffffc02098cc:	e13d                	bnez	a0,ffffffffc0209932 <sfs_reclaim+0xfc>
ffffffffc02098ce:	7c18                	ld	a4,56(s0)
ffffffffc02098d0:	603c                	ld	a5,64(s0)
ffffffffc02098d2:	8526                	mv	a0,s1
ffffffffc02098d4:	e71c                	sd	a5,8(a4)
ffffffffc02098d6:	e398                	sd	a4,0(a5)
ffffffffc02098d8:	6438                	ld	a4,72(s0)
ffffffffc02098da:	683c                	ld	a5,80(s0)
ffffffffc02098dc:	e71c                	sd	a5,8(a4)
ffffffffc02098de:	e398                	sd	a4,0(a5)
ffffffffc02098e0:	512010ef          	jal	ra,ffffffffc020adf2 <unlock_sfs_fs>
ffffffffc02098e4:	6008                	ld	a0,0(s0)
ffffffffc02098e6:	00655783          	lhu	a5,6(a0)
ffffffffc02098ea:	cb85                	beqz	a5,ffffffffc020991a <sfs_reclaim+0xe4>
ffffffffc02098ec:	f52f80ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc02098f0:	8522                	mv	a0,s0
ffffffffc02098f2:	da9fd0ef          	jal	ra,ffffffffc020769a <inode_kill>
ffffffffc02098f6:	60e2                	ld	ra,24(sp)
ffffffffc02098f8:	6442                	ld	s0,16(sp)
ffffffffc02098fa:	64a2                	ld	s1,8(sp)
ffffffffc02098fc:	854a                	mv	a0,s2
ffffffffc02098fe:	6902                	ld	s2,0(sp)
ffffffffc0209900:	6105                	addi	sp,sp,32
ffffffffc0209902:	8082                	ret
ffffffffc0209904:	5945                	li	s2,-15
ffffffffc0209906:	8526                	mv	a0,s1
ffffffffc0209908:	4ea010ef          	jal	ra,ffffffffc020adf2 <unlock_sfs_fs>
ffffffffc020990c:	60e2                	ld	ra,24(sp)
ffffffffc020990e:	6442                	ld	s0,16(sp)
ffffffffc0209910:	64a2                	ld	s1,8(sp)
ffffffffc0209912:	854a                	mv	a0,s2
ffffffffc0209914:	6902                	ld	s2,0(sp)
ffffffffc0209916:	6105                	addi	sp,sp,32
ffffffffc0209918:	8082                	ret
ffffffffc020991a:	440c                	lw	a1,8(s0)
ffffffffc020991c:	8526                	mv	a0,s1
ffffffffc020991e:	ea7ff0ef          	jal	ra,ffffffffc02097c4 <sfs_block_free>
ffffffffc0209922:	6008                	ld	a0,0(s0)
ffffffffc0209924:	5d4c                	lw	a1,60(a0)
ffffffffc0209926:	d1f9                	beqz	a1,ffffffffc02098ec <sfs_reclaim+0xb6>
ffffffffc0209928:	8526                	mv	a0,s1
ffffffffc020992a:	e9bff0ef          	jal	ra,ffffffffc02097c4 <sfs_block_free>
ffffffffc020992e:	6008                	ld	a0,0(s0)
ffffffffc0209930:	bf75                	j	ffffffffc02098ec <sfs_reclaim+0xb6>
ffffffffc0209932:	892a                	mv	s2,a0
ffffffffc0209934:	bfc9                	j	ffffffffc0209906 <sfs_reclaim+0xd0>
ffffffffc0209936:	00005697          	auipc	a3,0x5
ffffffffc020993a:	12a68693          	addi	a3,a3,298 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc020993e:	00002617          	auipc	a2,0x2
ffffffffc0209942:	eda60613          	addi	a2,a2,-294 # ffffffffc020b818 <commands+0x210>
ffffffffc0209946:	35a00593          	li	a1,858
ffffffffc020994a:	00005517          	auipc	a0,0x5
ffffffffc020994e:	2f650513          	addi	a0,a0,758 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209952:	b4df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209956:	00005697          	auipc	a3,0x5
ffffffffc020995a:	37268693          	addi	a3,a3,882 # ffffffffc020ecc8 <dev_node_ops+0x648>
ffffffffc020995e:	00002617          	auipc	a2,0x2
ffffffffc0209962:	eba60613          	addi	a2,a2,-326 # ffffffffc020b818 <commands+0x210>
ffffffffc0209966:	36000593          	li	a1,864
ffffffffc020996a:	00005517          	auipc	a0,0x5
ffffffffc020996e:	2d650513          	addi	a0,a0,726 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209972:	b2df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209976:	00005697          	auipc	a3,0x5
ffffffffc020997a:	29268693          	addi	a3,a3,658 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020997e:	00002617          	auipc	a2,0x2
ffffffffc0209982:	e9a60613          	addi	a2,a2,-358 # ffffffffc020b818 <commands+0x210>
ffffffffc0209986:	35b00593          	li	a1,859
ffffffffc020998a:	00005517          	auipc	a0,0x5
ffffffffc020998e:	2b650513          	addi	a0,a0,694 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209992:	b0df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209996:	00005697          	auipc	a3,0x5
ffffffffc020999a:	afa68693          	addi	a3,a3,-1286 # ffffffffc020e490 <syscalls+0xc48>
ffffffffc020999e:	00002617          	auipc	a2,0x2
ffffffffc02099a2:	e7a60613          	addi	a2,a2,-390 # ffffffffc020b818 <commands+0x210>
ffffffffc02099a6:	36500593          	li	a1,869
ffffffffc02099aa:	00005517          	auipc	a0,0x5
ffffffffc02099ae:	29650513          	addi	a0,a0,662 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc02099b2:	aedf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc02099b6:	00003697          	auipc	a3,0x3
ffffffffc02099ba:	78a68693          	addi	a3,a3,1930 # ffffffffc020d140 <default_pmm_manager+0xe40>
ffffffffc02099be:	00002617          	auipc	a2,0x2
ffffffffc02099c2:	e5a60613          	addi	a2,a2,-422 # ffffffffc020b818 <commands+0x210>
ffffffffc02099c6:	36a00593          	li	a1,874
ffffffffc02099ca:	00005517          	auipc	a0,0x5
ffffffffc02099ce:	27650513          	addi	a0,a0,630 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc02099d2:	acdf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc02099d6 <sfs_block_alloc>:
ffffffffc02099d6:	1101                	addi	sp,sp,-32
ffffffffc02099d8:	e822                	sd	s0,16(sp)
ffffffffc02099da:	842a                	mv	s0,a0
ffffffffc02099dc:	7d08                	ld	a0,56(a0)
ffffffffc02099de:	e426                	sd	s1,8(sp)
ffffffffc02099e0:	ec06                	sd	ra,24(sp)
ffffffffc02099e2:	84ae                	mv	s1,a1
ffffffffc02099e4:	c62ff0ef          	jal	ra,ffffffffc0208e46 <bitmap_alloc>
ffffffffc02099e8:	e90d                	bnez	a0,ffffffffc0209a1a <sfs_block_alloc+0x44>
ffffffffc02099ea:	441c                	lw	a5,8(s0)
ffffffffc02099ec:	cbad                	beqz	a5,ffffffffc0209a5e <sfs_block_alloc+0x88>
ffffffffc02099ee:	37fd                	addiw	a5,a5,-1
ffffffffc02099f0:	c41c                	sw	a5,8(s0)
ffffffffc02099f2:	408c                	lw	a1,0(s1)
ffffffffc02099f4:	4785                	li	a5,1
ffffffffc02099f6:	e03c                	sd	a5,64(s0)
ffffffffc02099f8:	4054                	lw	a3,4(s0)
ffffffffc02099fa:	c58d                	beqz	a1,ffffffffc0209a24 <sfs_block_alloc+0x4e>
ffffffffc02099fc:	02d5f463          	bgeu	a1,a3,ffffffffc0209a24 <sfs_block_alloc+0x4e>
ffffffffc0209a00:	7c08                	ld	a0,56(s0)
ffffffffc0209a02:	cb4ff0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc0209a06:	ed05                	bnez	a0,ffffffffc0209a3e <sfs_block_alloc+0x68>
ffffffffc0209a08:	8522                	mv	a0,s0
ffffffffc0209a0a:	6442                	ld	s0,16(sp)
ffffffffc0209a0c:	408c                	lw	a1,0(s1)
ffffffffc0209a0e:	60e2                	ld	ra,24(sp)
ffffffffc0209a10:	64a2                	ld	s1,8(sp)
ffffffffc0209a12:	4605                	li	a2,1
ffffffffc0209a14:	6105                	addi	sp,sp,32
ffffffffc0209a16:	36c0106f          	j	ffffffffc020ad82 <sfs_clear_block>
ffffffffc0209a1a:	60e2                	ld	ra,24(sp)
ffffffffc0209a1c:	6442                	ld	s0,16(sp)
ffffffffc0209a1e:	64a2                	ld	s1,8(sp)
ffffffffc0209a20:	6105                	addi	sp,sp,32
ffffffffc0209a22:	8082                	ret
ffffffffc0209a24:	872e                	mv	a4,a1
ffffffffc0209a26:	00005617          	auipc	a2,0x5
ffffffffc0209a2a:	24a60613          	addi	a2,a2,586 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc0209a2e:	05300593          	li	a1,83
ffffffffc0209a32:	00005517          	auipc	a0,0x5
ffffffffc0209a36:	20e50513          	addi	a0,a0,526 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209a3a:	a65f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a3e:	00005697          	auipc	a3,0x5
ffffffffc0209a42:	2c268693          	addi	a3,a3,706 # ffffffffc020ed00 <dev_node_ops+0x680>
ffffffffc0209a46:	00002617          	auipc	a2,0x2
ffffffffc0209a4a:	dd260613          	addi	a2,a2,-558 # ffffffffc020b818 <commands+0x210>
ffffffffc0209a4e:	06100593          	li	a1,97
ffffffffc0209a52:	00005517          	auipc	a0,0x5
ffffffffc0209a56:	1ee50513          	addi	a0,a0,494 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209a5a:	a45f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209a5e:	00005697          	auipc	a3,0x5
ffffffffc0209a62:	28268693          	addi	a3,a3,642 # ffffffffc020ece0 <dev_node_ops+0x660>
ffffffffc0209a66:	00002617          	auipc	a2,0x2
ffffffffc0209a6a:	db260613          	addi	a2,a2,-590 # ffffffffc020b818 <commands+0x210>
ffffffffc0209a6e:	05f00593          	li	a1,95
ffffffffc0209a72:	00005517          	auipc	a0,0x5
ffffffffc0209a76:	1ce50513          	addi	a0,a0,462 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209a7a:	a25f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209a7e <sfs_bmap_load_nolock>:
ffffffffc0209a7e:	7159                	addi	sp,sp,-112
ffffffffc0209a80:	f85a                	sd	s6,48(sp)
ffffffffc0209a82:	0005bb03          	ld	s6,0(a1)
ffffffffc0209a86:	f45e                	sd	s7,40(sp)
ffffffffc0209a88:	f486                	sd	ra,104(sp)
ffffffffc0209a8a:	008b2b83          	lw	s7,8(s6)
ffffffffc0209a8e:	f0a2                	sd	s0,96(sp)
ffffffffc0209a90:	eca6                	sd	s1,88(sp)
ffffffffc0209a92:	e8ca                	sd	s2,80(sp)
ffffffffc0209a94:	e4ce                	sd	s3,72(sp)
ffffffffc0209a96:	e0d2                	sd	s4,64(sp)
ffffffffc0209a98:	fc56                	sd	s5,56(sp)
ffffffffc0209a9a:	f062                	sd	s8,32(sp)
ffffffffc0209a9c:	ec66                	sd	s9,24(sp)
ffffffffc0209a9e:	18cbe363          	bltu	s7,a2,ffffffffc0209c24 <sfs_bmap_load_nolock+0x1a6>
ffffffffc0209aa2:	47ad                	li	a5,11
ffffffffc0209aa4:	8aae                	mv	s5,a1
ffffffffc0209aa6:	8432                	mv	s0,a2
ffffffffc0209aa8:	84aa                	mv	s1,a0
ffffffffc0209aaa:	89b6                	mv	s3,a3
ffffffffc0209aac:	04c7f563          	bgeu	a5,a2,ffffffffc0209af6 <sfs_bmap_load_nolock+0x78>
ffffffffc0209ab0:	ff46071b          	addiw	a4,a2,-12
ffffffffc0209ab4:	0007069b          	sext.w	a3,a4
ffffffffc0209ab8:	3ff00793          	li	a5,1023
ffffffffc0209abc:	1ad7e163          	bltu	a5,a3,ffffffffc0209c5e <sfs_bmap_load_nolock+0x1e0>
ffffffffc0209ac0:	03cb2a03          	lw	s4,60(s6)
ffffffffc0209ac4:	02071793          	slli	a5,a4,0x20
ffffffffc0209ac8:	c602                	sw	zero,12(sp)
ffffffffc0209aca:	c452                	sw	s4,8(sp)
ffffffffc0209acc:	01e7dc13          	srli	s8,a5,0x1e
ffffffffc0209ad0:	0e0a1e63          	bnez	s4,ffffffffc0209bcc <sfs_bmap_load_nolock+0x14e>
ffffffffc0209ad4:	0acb8663          	beq	s7,a2,ffffffffc0209b80 <sfs_bmap_load_nolock+0x102>
ffffffffc0209ad8:	4a01                	li	s4,0
ffffffffc0209ada:	40d4                	lw	a3,4(s1)
ffffffffc0209adc:	8752                	mv	a4,s4
ffffffffc0209ade:	00005617          	auipc	a2,0x5
ffffffffc0209ae2:	19260613          	addi	a2,a2,402 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc0209ae6:	05300593          	li	a1,83
ffffffffc0209aea:	00005517          	auipc	a0,0x5
ffffffffc0209aee:	15650513          	addi	a0,a0,342 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209af2:	9adf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209af6:	02061793          	slli	a5,a2,0x20
ffffffffc0209afa:	01e7da13          	srli	s4,a5,0x1e
ffffffffc0209afe:	9a5a                	add	s4,s4,s6
ffffffffc0209b00:	00ca2583          	lw	a1,12(s4)
ffffffffc0209b04:	c22e                	sw	a1,4(sp)
ffffffffc0209b06:	ed99                	bnez	a1,ffffffffc0209b24 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209b08:	fccb98e3          	bne	s7,a2,ffffffffc0209ad8 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209b0c:	004c                	addi	a1,sp,4
ffffffffc0209b0e:	ec9ff0ef          	jal	ra,ffffffffc02099d6 <sfs_block_alloc>
ffffffffc0209b12:	892a                	mv	s2,a0
ffffffffc0209b14:	e921                	bnez	a0,ffffffffc0209b64 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209b16:	4592                	lw	a1,4(sp)
ffffffffc0209b18:	4705                	li	a4,1
ffffffffc0209b1a:	00ba2623          	sw	a1,12(s4)
ffffffffc0209b1e:	00eab823          	sd	a4,16(s5)
ffffffffc0209b22:	d9dd                	beqz	a1,ffffffffc0209ad8 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209b24:	40d4                	lw	a3,4(s1)
ffffffffc0209b26:	10d5ff63          	bgeu	a1,a3,ffffffffc0209c44 <sfs_bmap_load_nolock+0x1c6>
ffffffffc0209b2a:	7c88                	ld	a0,56(s1)
ffffffffc0209b2c:	b8aff0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc0209b30:	18051363          	bnez	a0,ffffffffc0209cb6 <sfs_bmap_load_nolock+0x238>
ffffffffc0209b34:	4a12                	lw	s4,4(sp)
ffffffffc0209b36:	fa0a02e3          	beqz	s4,ffffffffc0209ada <sfs_bmap_load_nolock+0x5c>
ffffffffc0209b3a:	40dc                	lw	a5,4(s1)
ffffffffc0209b3c:	f8fa7fe3          	bgeu	s4,a5,ffffffffc0209ada <sfs_bmap_load_nolock+0x5c>
ffffffffc0209b40:	7c88                	ld	a0,56(s1)
ffffffffc0209b42:	85d2                	mv	a1,s4
ffffffffc0209b44:	b72ff0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc0209b48:	12051763          	bnez	a0,ffffffffc0209c76 <sfs_bmap_load_nolock+0x1f8>
ffffffffc0209b4c:	008b9763          	bne	s7,s0,ffffffffc0209b5a <sfs_bmap_load_nolock+0xdc>
ffffffffc0209b50:	008b2783          	lw	a5,8(s6)
ffffffffc0209b54:	2785                	addiw	a5,a5,1
ffffffffc0209b56:	00fb2423          	sw	a5,8(s6)
ffffffffc0209b5a:	4901                	li	s2,0
ffffffffc0209b5c:	00098463          	beqz	s3,ffffffffc0209b64 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209b60:	0149a023          	sw	s4,0(s3)
ffffffffc0209b64:	70a6                	ld	ra,104(sp)
ffffffffc0209b66:	7406                	ld	s0,96(sp)
ffffffffc0209b68:	64e6                	ld	s1,88(sp)
ffffffffc0209b6a:	69a6                	ld	s3,72(sp)
ffffffffc0209b6c:	6a06                	ld	s4,64(sp)
ffffffffc0209b6e:	7ae2                	ld	s5,56(sp)
ffffffffc0209b70:	7b42                	ld	s6,48(sp)
ffffffffc0209b72:	7ba2                	ld	s7,40(sp)
ffffffffc0209b74:	7c02                	ld	s8,32(sp)
ffffffffc0209b76:	6ce2                	ld	s9,24(sp)
ffffffffc0209b78:	854a                	mv	a0,s2
ffffffffc0209b7a:	6946                	ld	s2,80(sp)
ffffffffc0209b7c:	6165                	addi	sp,sp,112
ffffffffc0209b7e:	8082                	ret
ffffffffc0209b80:	002c                	addi	a1,sp,8
ffffffffc0209b82:	e55ff0ef          	jal	ra,ffffffffc02099d6 <sfs_block_alloc>
ffffffffc0209b86:	892a                	mv	s2,a0
ffffffffc0209b88:	00c10c93          	addi	s9,sp,12
ffffffffc0209b8c:	fd61                	bnez	a0,ffffffffc0209b64 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209b8e:	85e6                	mv	a1,s9
ffffffffc0209b90:	8526                	mv	a0,s1
ffffffffc0209b92:	e45ff0ef          	jal	ra,ffffffffc02099d6 <sfs_block_alloc>
ffffffffc0209b96:	892a                	mv	s2,a0
ffffffffc0209b98:	e925                	bnez	a0,ffffffffc0209c08 <sfs_bmap_load_nolock+0x18a>
ffffffffc0209b9a:	46a2                	lw	a3,8(sp)
ffffffffc0209b9c:	85e6                	mv	a1,s9
ffffffffc0209b9e:	8762                	mv	a4,s8
ffffffffc0209ba0:	4611                	li	a2,4
ffffffffc0209ba2:	8526                	mv	a0,s1
ffffffffc0209ba4:	08e010ef          	jal	ra,ffffffffc020ac32 <sfs_wbuf>
ffffffffc0209ba8:	45b2                	lw	a1,12(sp)
ffffffffc0209baa:	892a                	mv	s2,a0
ffffffffc0209bac:	e939                	bnez	a0,ffffffffc0209c02 <sfs_bmap_load_nolock+0x184>
ffffffffc0209bae:	03cb2683          	lw	a3,60(s6)
ffffffffc0209bb2:	4722                	lw	a4,8(sp)
ffffffffc0209bb4:	c22e                	sw	a1,4(sp)
ffffffffc0209bb6:	f6d706e3          	beq	a4,a3,ffffffffc0209b22 <sfs_bmap_load_nolock+0xa4>
ffffffffc0209bba:	eef1                	bnez	a3,ffffffffc0209c96 <sfs_bmap_load_nolock+0x218>
ffffffffc0209bbc:	02eb2e23          	sw	a4,60(s6)
ffffffffc0209bc0:	4705                	li	a4,1
ffffffffc0209bc2:	00eab823          	sd	a4,16(s5)
ffffffffc0209bc6:	f00589e3          	beqz	a1,ffffffffc0209ad8 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209bca:	bfa9                	j	ffffffffc0209b24 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209bcc:	00c10c93          	addi	s9,sp,12
ffffffffc0209bd0:	8762                	mv	a4,s8
ffffffffc0209bd2:	86d2                	mv	a3,s4
ffffffffc0209bd4:	4611                	li	a2,4
ffffffffc0209bd6:	85e6                	mv	a1,s9
ffffffffc0209bd8:	7db000ef          	jal	ra,ffffffffc020abb2 <sfs_rbuf>
ffffffffc0209bdc:	892a                	mv	s2,a0
ffffffffc0209bde:	f159                	bnez	a0,ffffffffc0209b64 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209be0:	45b2                	lw	a1,12(sp)
ffffffffc0209be2:	e995                	bnez	a1,ffffffffc0209c16 <sfs_bmap_load_nolock+0x198>
ffffffffc0209be4:	fa8b85e3          	beq	s7,s0,ffffffffc0209b8e <sfs_bmap_load_nolock+0x110>
ffffffffc0209be8:	03cb2703          	lw	a4,60(s6)
ffffffffc0209bec:	47a2                	lw	a5,8(sp)
ffffffffc0209bee:	c202                	sw	zero,4(sp)
ffffffffc0209bf0:	eee784e3          	beq	a5,a4,ffffffffc0209ad8 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209bf4:	e34d                	bnez	a4,ffffffffc0209c96 <sfs_bmap_load_nolock+0x218>
ffffffffc0209bf6:	02fb2e23          	sw	a5,60(s6)
ffffffffc0209bfa:	4785                	li	a5,1
ffffffffc0209bfc:	00fab823          	sd	a5,16(s5)
ffffffffc0209c00:	bde1                	j	ffffffffc0209ad8 <sfs_bmap_load_nolock+0x5a>
ffffffffc0209c02:	8526                	mv	a0,s1
ffffffffc0209c04:	bc1ff0ef          	jal	ra,ffffffffc02097c4 <sfs_block_free>
ffffffffc0209c08:	45a2                	lw	a1,8(sp)
ffffffffc0209c0a:	f4ba0de3          	beq	s4,a1,ffffffffc0209b64 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c0e:	8526                	mv	a0,s1
ffffffffc0209c10:	bb5ff0ef          	jal	ra,ffffffffc02097c4 <sfs_block_free>
ffffffffc0209c14:	bf81                	j	ffffffffc0209b64 <sfs_bmap_load_nolock+0xe6>
ffffffffc0209c16:	03cb2683          	lw	a3,60(s6)
ffffffffc0209c1a:	4722                	lw	a4,8(sp)
ffffffffc0209c1c:	c22e                	sw	a1,4(sp)
ffffffffc0209c1e:	f8e69ee3          	bne	a3,a4,ffffffffc0209bba <sfs_bmap_load_nolock+0x13c>
ffffffffc0209c22:	b709                	j	ffffffffc0209b24 <sfs_bmap_load_nolock+0xa6>
ffffffffc0209c24:	00005697          	auipc	a3,0x5
ffffffffc0209c28:	10468693          	addi	a3,a3,260 # ffffffffc020ed28 <dev_node_ops+0x6a8>
ffffffffc0209c2c:	00002617          	auipc	a2,0x2
ffffffffc0209c30:	bec60613          	addi	a2,a2,-1044 # ffffffffc020b818 <commands+0x210>
ffffffffc0209c34:	16400593          	li	a1,356
ffffffffc0209c38:	00005517          	auipc	a0,0x5
ffffffffc0209c3c:	00850513          	addi	a0,a0,8 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209c40:	85ff60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c44:	872e                	mv	a4,a1
ffffffffc0209c46:	00005617          	auipc	a2,0x5
ffffffffc0209c4a:	02a60613          	addi	a2,a2,42 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc0209c4e:	05300593          	li	a1,83
ffffffffc0209c52:	00005517          	auipc	a0,0x5
ffffffffc0209c56:	fee50513          	addi	a0,a0,-18 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209c5a:	845f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c5e:	00005617          	auipc	a2,0x5
ffffffffc0209c62:	0fa60613          	addi	a2,a2,250 # ffffffffc020ed58 <dev_node_ops+0x6d8>
ffffffffc0209c66:	11e00593          	li	a1,286
ffffffffc0209c6a:	00005517          	auipc	a0,0x5
ffffffffc0209c6e:	fd650513          	addi	a0,a0,-42 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209c72:	82df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c76:	00005697          	auipc	a3,0x5
ffffffffc0209c7a:	03268693          	addi	a3,a3,50 # ffffffffc020eca8 <dev_node_ops+0x628>
ffffffffc0209c7e:	00002617          	auipc	a2,0x2
ffffffffc0209c82:	b9a60613          	addi	a2,a2,-1126 # ffffffffc020b818 <commands+0x210>
ffffffffc0209c86:	16b00593          	li	a1,363
ffffffffc0209c8a:	00005517          	auipc	a0,0x5
ffffffffc0209c8e:	fb650513          	addi	a0,a0,-74 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209c92:	80df60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209c96:	00005697          	auipc	a3,0x5
ffffffffc0209c9a:	0aa68693          	addi	a3,a3,170 # ffffffffc020ed40 <dev_node_ops+0x6c0>
ffffffffc0209c9e:	00002617          	auipc	a2,0x2
ffffffffc0209ca2:	b7a60613          	addi	a2,a2,-1158 # ffffffffc020b818 <commands+0x210>
ffffffffc0209ca6:	11800593          	li	a1,280
ffffffffc0209caa:	00005517          	auipc	a0,0x5
ffffffffc0209cae:	f9650513          	addi	a0,a0,-106 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209cb2:	fecf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209cb6:	00005697          	auipc	a3,0x5
ffffffffc0209cba:	0d268693          	addi	a3,a3,210 # ffffffffc020ed88 <dev_node_ops+0x708>
ffffffffc0209cbe:	00002617          	auipc	a2,0x2
ffffffffc0209cc2:	b5a60613          	addi	a2,a2,-1190 # ffffffffc020b818 <commands+0x210>
ffffffffc0209cc6:	12100593          	li	a1,289
ffffffffc0209cca:	00005517          	auipc	a0,0x5
ffffffffc0209cce:	f7650513          	addi	a0,a0,-138 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209cd2:	fccf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209cd6 <sfs_io_nolock>:
ffffffffc0209cd6:	7175                	addi	sp,sp,-144
ffffffffc0209cd8:	f0d2                	sd	s4,96(sp)
ffffffffc0209cda:	8a2e                	mv	s4,a1
ffffffffc0209cdc:	618c                	ld	a1,0(a1)
ffffffffc0209cde:	e506                	sd	ra,136(sp)
ffffffffc0209ce0:	e122                	sd	s0,128(sp)
ffffffffc0209ce2:	0045d883          	lhu	a7,4(a1)
ffffffffc0209ce6:	fca6                	sd	s1,120(sp)
ffffffffc0209ce8:	f8ca                	sd	s2,112(sp)
ffffffffc0209cea:	f4ce                	sd	s3,104(sp)
ffffffffc0209cec:	ecd6                	sd	s5,88(sp)
ffffffffc0209cee:	e8da                	sd	s6,80(sp)
ffffffffc0209cf0:	e4de                	sd	s7,72(sp)
ffffffffc0209cf2:	e0e2                	sd	s8,64(sp)
ffffffffc0209cf4:	fc66                	sd	s9,56(sp)
ffffffffc0209cf6:	f86a                	sd	s10,48(sp)
ffffffffc0209cf8:	f46e                	sd	s11,40(sp)
ffffffffc0209cfa:	4809                	li	a6,2
ffffffffc0209cfc:	19088663          	beq	a7,a6,ffffffffc0209e88 <sfs_io_nolock+0x1b2>
ffffffffc0209d00:	00073903          	ld	s2,0(a4) # 4000 <_binary_bin_swap_img_size-0x3d00>
ffffffffc0209d04:	8aba                	mv	s5,a4
ffffffffc0209d06:	000ab023          	sd	zero,0(s5)
ffffffffc0209d0a:	08000737          	lui	a4,0x8000
ffffffffc0209d0e:	8436                	mv	s0,a3
ffffffffc0209d10:	8836                	mv	a6,a3
ffffffffc0209d12:	9936                	add	s2,s2,a3
ffffffffc0209d14:	16e6f863          	bgeu	a3,a4,ffffffffc0209e84 <sfs_io_nolock+0x1ae>
ffffffffc0209d18:	16d94663          	blt	s2,a3,ffffffffc0209e84 <sfs_io_nolock+0x1ae>
ffffffffc0209d1c:	89aa                	mv	s3,a0
ffffffffc0209d1e:	4501                	li	a0,0
ffffffffc0209d20:	0d268f63          	beq	a3,s2,ffffffffc0209dfe <sfs_io_nolock+0x128>
ffffffffc0209d24:	84b2                	mv	s1,a2
ffffffffc0209d26:	01277463          	bgeu	a4,s2,ffffffffc0209d2e <sfs_io_nolock+0x58>
ffffffffc0209d2a:	08000937          	lui	s2,0x8000
ffffffffc0209d2e:	c7fd                	beqz	a5,ffffffffc0209e1c <sfs_io_nolock+0x146>
ffffffffc0209d30:	00001797          	auipc	a5,0x1
ffffffffc0209d34:	f0278793          	addi	a5,a5,-254 # ffffffffc020ac32 <sfs_wbuf>
ffffffffc0209d38:	00001b97          	auipc	s7,0x1
ffffffffc0209d3c:	e1ab8b93          	addi	s7,s7,-486 # ffffffffc020ab52 <sfs_wblock>
ffffffffc0209d40:	e03e                	sd	a5,0(sp)
ffffffffc0209d42:	6705                	lui	a4,0x1
ffffffffc0209d44:	40c45793          	srai	a5,s0,0xc
ffffffffc0209d48:	40c95c93          	srai	s9,s2,0xc
ffffffffc0209d4c:	fff70d13          	addi	s10,a4,-1 # fff <_binary_bin_swap_img_size-0x6d01>
ffffffffc0209d50:	40fc8c3b          	subw	s8,s9,a5
ffffffffc0209d54:	01a47d33          	and	s10,s0,s10
ffffffffc0209d58:	8ce2                	mv	s9,s8
ffffffffc0209d5a:	00078d9b          	sext.w	s11,a5
ffffffffc0209d5e:	8b6a                	mv	s6,s10
ffffffffc0209d60:	020d0d63          	beqz	s10,ffffffffc0209d9a <sfs_io_nolock+0xc4>
ffffffffc0209d64:	40890b33          	sub	s6,s2,s0
ffffffffc0209d68:	0e0c1e63          	bnez	s8,ffffffffc0209e64 <sfs_io_nolock+0x18e>
ffffffffc0209d6c:	0874                	addi	a3,sp,28
ffffffffc0209d6e:	866e                	mv	a2,s11
ffffffffc0209d70:	85d2                	mv	a1,s4
ffffffffc0209d72:	854e                	mv	a0,s3
ffffffffc0209d74:	e442                	sd	a6,8(sp)
ffffffffc0209d76:	d09ff0ef          	jal	ra,ffffffffc0209a7e <sfs_bmap_load_nolock>
ffffffffc0209d7a:	6822                	ld	a6,8(sp)
ffffffffc0209d7c:	10051263          	bnez	a0,ffffffffc0209e80 <sfs_io_nolock+0x1aa>
ffffffffc0209d80:	46f2                	lw	a3,28(sp)
ffffffffc0209d82:	6782                	ld	a5,0(sp)
ffffffffc0209d84:	876a                	mv	a4,s10
ffffffffc0209d86:	865a                	mv	a2,s6
ffffffffc0209d88:	85a6                	mv	a1,s1
ffffffffc0209d8a:	854e                	mv	a0,s3
ffffffffc0209d8c:	9782                	jalr	a5
ffffffffc0209d8e:	6822                	ld	a6,8(sp)
ffffffffc0209d90:	e965                	bnez	a0,ffffffffc0209e80 <sfs_io_nolock+0x1aa>
ffffffffc0209d92:	94da                	add	s1,s1,s6
ffffffffc0209d94:	2d85                	addiw	s11,s11,1
ffffffffc0209d96:	fffc8c1b          	addiw	s8,s9,-1
ffffffffc0209d9a:	020c0c63          	beqz	s8,ffffffffc0209dd2 <sfs_io_nolock+0xfc>
ffffffffc0209d9e:	018d8d3b          	addw	s10,s11,s8
ffffffffc0209da2:	6c85                	lui	s9,0x1
ffffffffc0209da4:	0874                	addi	a3,sp,28
ffffffffc0209da6:	866e                	mv	a2,s11
ffffffffc0209da8:	85d2                	mv	a1,s4
ffffffffc0209daa:	854e                	mv	a0,s3
ffffffffc0209dac:	cd3ff0ef          	jal	ra,ffffffffc0209a7e <sfs_bmap_load_nolock>
ffffffffc0209db0:	e55d                	bnez	a0,ffffffffc0209e5e <sfs_io_nolock+0x188>
ffffffffc0209db2:	4672                	lw	a2,28(sp)
ffffffffc0209db4:	4685                	li	a3,1
ffffffffc0209db6:	85a6                	mv	a1,s1
ffffffffc0209db8:	854e                	mv	a0,s3
ffffffffc0209dba:	9b82                	jalr	s7
ffffffffc0209dbc:	e14d                	bnez	a0,ffffffffc0209e5e <sfs_io_nolock+0x188>
ffffffffc0209dbe:	2d85                	addiw	s11,s11,1
ffffffffc0209dc0:	94e6                	add	s1,s1,s9
ffffffffc0209dc2:	ffad91e3          	bne	s11,s10,ffffffffc0209da4 <sfs_io_nolock+0xce>
ffffffffc0209dc6:	00cc1c1b          	slliw	s8,s8,0xc
ffffffffc0209dca:	1c02                	slli	s8,s8,0x20
ffffffffc0209dcc:	020c5c13          	srli	s8,s8,0x20
ffffffffc0209dd0:	9b62                	add	s6,s6,s8
ffffffffc0209dd2:	1952                	slli	s2,s2,0x34
ffffffffc0209dd4:	03495b93          	srli	s7,s2,0x34
ffffffffc0209dd8:	06091363          	bnez	s2,ffffffffc0209e3e <sfs_io_nolock+0x168>
ffffffffc0209ddc:	01640833          	add	a6,s0,s6
ffffffffc0209de0:	4501                	li	a0,0
ffffffffc0209de2:	000a3783          	ld	a5,0(s4)
ffffffffc0209de6:	016ab023          	sd	s6,0(s5)
ffffffffc0209dea:	0007e703          	lwu	a4,0(a5)
ffffffffc0209dee:	01077863          	bgeu	a4,a6,ffffffffc0209dfe <sfs_io_nolock+0x128>
ffffffffc0209df2:	0164043b          	addw	s0,s0,s6
ffffffffc0209df6:	c380                	sw	s0,0(a5)
ffffffffc0209df8:	4785                	li	a5,1
ffffffffc0209dfa:	00fa3823          	sd	a5,16(s4)
ffffffffc0209dfe:	60aa                	ld	ra,136(sp)
ffffffffc0209e00:	640a                	ld	s0,128(sp)
ffffffffc0209e02:	74e6                	ld	s1,120(sp)
ffffffffc0209e04:	7946                	ld	s2,112(sp)
ffffffffc0209e06:	79a6                	ld	s3,104(sp)
ffffffffc0209e08:	7a06                	ld	s4,96(sp)
ffffffffc0209e0a:	6ae6                	ld	s5,88(sp)
ffffffffc0209e0c:	6b46                	ld	s6,80(sp)
ffffffffc0209e0e:	6ba6                	ld	s7,72(sp)
ffffffffc0209e10:	6c06                	ld	s8,64(sp)
ffffffffc0209e12:	7ce2                	ld	s9,56(sp)
ffffffffc0209e14:	7d42                	ld	s10,48(sp)
ffffffffc0209e16:	7da2                	ld	s11,40(sp)
ffffffffc0209e18:	6149                	addi	sp,sp,144
ffffffffc0209e1a:	8082                	ret
ffffffffc0209e1c:	0005e783          	lwu	a5,0(a1)
ffffffffc0209e20:	4501                	li	a0,0
ffffffffc0209e22:	fcf45ee3          	bge	s0,a5,ffffffffc0209dfe <sfs_io_nolock+0x128>
ffffffffc0209e26:	0527c263          	blt	a5,s2,ffffffffc0209e6a <sfs_io_nolock+0x194>
ffffffffc0209e2a:	00001797          	auipc	a5,0x1
ffffffffc0209e2e:	d8878793          	addi	a5,a5,-632 # ffffffffc020abb2 <sfs_rbuf>
ffffffffc0209e32:	00001b97          	auipc	s7,0x1
ffffffffc0209e36:	cc0b8b93          	addi	s7,s7,-832 # ffffffffc020aaf2 <sfs_rblock>
ffffffffc0209e3a:	e03e                	sd	a5,0(sp)
ffffffffc0209e3c:	b719                	j	ffffffffc0209d42 <sfs_io_nolock+0x6c>
ffffffffc0209e3e:	0874                	addi	a3,sp,28
ffffffffc0209e40:	866e                	mv	a2,s11
ffffffffc0209e42:	85d2                	mv	a1,s4
ffffffffc0209e44:	854e                	mv	a0,s3
ffffffffc0209e46:	c39ff0ef          	jal	ra,ffffffffc0209a7e <sfs_bmap_load_nolock>
ffffffffc0209e4a:	e911                	bnez	a0,ffffffffc0209e5e <sfs_io_nolock+0x188>
ffffffffc0209e4c:	46f2                	lw	a3,28(sp)
ffffffffc0209e4e:	6782                	ld	a5,0(sp)
ffffffffc0209e50:	4701                	li	a4,0
ffffffffc0209e52:	865e                	mv	a2,s7
ffffffffc0209e54:	85a6                	mv	a1,s1
ffffffffc0209e56:	854e                	mv	a0,s3
ffffffffc0209e58:	9782                	jalr	a5
ffffffffc0209e5a:	e111                	bnez	a0,ffffffffc0209e5e <sfs_io_nolock+0x188>
ffffffffc0209e5c:	9b5e                	add	s6,s6,s7
ffffffffc0209e5e:	01640833          	add	a6,s0,s6
ffffffffc0209e62:	b741                	j	ffffffffc0209de2 <sfs_io_nolock+0x10c>
ffffffffc0209e64:	41a70b33          	sub	s6,a4,s10
ffffffffc0209e68:	b711                	j	ffffffffc0209d6c <sfs_io_nolock+0x96>
ffffffffc0209e6a:	893e                	mv	s2,a5
ffffffffc0209e6c:	00001797          	auipc	a5,0x1
ffffffffc0209e70:	d4678793          	addi	a5,a5,-698 # ffffffffc020abb2 <sfs_rbuf>
ffffffffc0209e74:	00001b97          	auipc	s7,0x1
ffffffffc0209e78:	c7eb8b93          	addi	s7,s7,-898 # ffffffffc020aaf2 <sfs_rblock>
ffffffffc0209e7c:	e03e                	sd	a5,0(sp)
ffffffffc0209e7e:	b5d1                	j	ffffffffc0209d42 <sfs_io_nolock+0x6c>
ffffffffc0209e80:	4b01                	li	s6,0
ffffffffc0209e82:	b785                	j	ffffffffc0209de2 <sfs_io_nolock+0x10c>
ffffffffc0209e84:	5575                	li	a0,-3
ffffffffc0209e86:	bfa5                	j	ffffffffc0209dfe <sfs_io_nolock+0x128>
ffffffffc0209e88:	00005697          	auipc	a3,0x5
ffffffffc0209e8c:	f2868693          	addi	a3,a3,-216 # ffffffffc020edb0 <dev_node_ops+0x730>
ffffffffc0209e90:	00002617          	auipc	a2,0x2
ffffffffc0209e94:	98860613          	addi	a2,a2,-1656 # ffffffffc020b818 <commands+0x210>
ffffffffc0209e98:	22b00593          	li	a1,555
ffffffffc0209e9c:	00005517          	auipc	a0,0x5
ffffffffc0209ea0:	da450513          	addi	a0,a0,-604 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209ea4:	dfaf60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc0209ea8 <sfs_read>:
ffffffffc0209ea8:	7139                	addi	sp,sp,-64
ffffffffc0209eaa:	f04a                	sd	s2,32(sp)
ffffffffc0209eac:	06853903          	ld	s2,104(a0)
ffffffffc0209eb0:	fc06                	sd	ra,56(sp)
ffffffffc0209eb2:	f822                	sd	s0,48(sp)
ffffffffc0209eb4:	f426                	sd	s1,40(sp)
ffffffffc0209eb6:	ec4e                	sd	s3,24(sp)
ffffffffc0209eb8:	04090f63          	beqz	s2,ffffffffc0209f16 <sfs_read+0x6e>
ffffffffc0209ebc:	0b092783          	lw	a5,176(s2) # 80000b0 <_binary_bin_sfs_img_size+0x7f8adb0>
ffffffffc0209ec0:	ebb9                	bnez	a5,ffffffffc0209f16 <sfs_read+0x6e>
ffffffffc0209ec2:	4d38                	lw	a4,88(a0)
ffffffffc0209ec4:	6785                	lui	a5,0x1
ffffffffc0209ec6:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209eca:	842a                	mv	s0,a0
ffffffffc0209ecc:	06f71563          	bne	a4,a5,ffffffffc0209f36 <sfs_read+0x8e>
ffffffffc0209ed0:	02050993          	addi	s3,a0,32
ffffffffc0209ed4:	854e                	mv	a0,s3
ffffffffc0209ed6:	84ae                	mv	s1,a1
ffffffffc0209ed8:	e98fa0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0209edc:	0184b803          	ld	a6,24(s1)
ffffffffc0209ee0:	6494                	ld	a3,8(s1)
ffffffffc0209ee2:	6090                	ld	a2,0(s1)
ffffffffc0209ee4:	85a2                	mv	a1,s0
ffffffffc0209ee6:	4781                	li	a5,0
ffffffffc0209ee8:	0038                	addi	a4,sp,8
ffffffffc0209eea:	854a                	mv	a0,s2
ffffffffc0209eec:	e442                	sd	a6,8(sp)
ffffffffc0209eee:	de9ff0ef          	jal	ra,ffffffffc0209cd6 <sfs_io_nolock>
ffffffffc0209ef2:	65a2                	ld	a1,8(sp)
ffffffffc0209ef4:	842a                	mv	s0,a0
ffffffffc0209ef6:	ed81                	bnez	a1,ffffffffc0209f0e <sfs_read+0x66>
ffffffffc0209ef8:	854e                	mv	a0,s3
ffffffffc0209efa:	e72fa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0209efe:	70e2                	ld	ra,56(sp)
ffffffffc0209f00:	8522                	mv	a0,s0
ffffffffc0209f02:	7442                	ld	s0,48(sp)
ffffffffc0209f04:	74a2                	ld	s1,40(sp)
ffffffffc0209f06:	7902                	ld	s2,32(sp)
ffffffffc0209f08:	69e2                	ld	s3,24(sp)
ffffffffc0209f0a:	6121                	addi	sp,sp,64
ffffffffc0209f0c:	8082                	ret
ffffffffc0209f0e:	8526                	mv	a0,s1
ffffffffc0209f10:	d54fb0ef          	jal	ra,ffffffffc0205464 <iobuf_skip>
ffffffffc0209f14:	b7d5                	j	ffffffffc0209ef8 <sfs_read+0x50>
ffffffffc0209f16:	00005697          	auipc	a3,0x5
ffffffffc0209f1a:	b4a68693          	addi	a3,a3,-1206 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc0209f1e:	00002617          	auipc	a2,0x2
ffffffffc0209f22:	8fa60613          	addi	a2,a2,-1798 # ffffffffc020b818 <commands+0x210>
ffffffffc0209f26:	29800593          	li	a1,664
ffffffffc0209f2a:	00005517          	auipc	a0,0x5
ffffffffc0209f2e:	d1650513          	addi	a0,a0,-746 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209f32:	d6cf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209f36:	86bff0ef          	jal	ra,ffffffffc02097a0 <sfs_io.part.0>

ffffffffc0209f3a <sfs_write>:
ffffffffc0209f3a:	7139                	addi	sp,sp,-64
ffffffffc0209f3c:	f04a                	sd	s2,32(sp)
ffffffffc0209f3e:	06853903          	ld	s2,104(a0)
ffffffffc0209f42:	fc06                	sd	ra,56(sp)
ffffffffc0209f44:	f822                	sd	s0,48(sp)
ffffffffc0209f46:	f426                	sd	s1,40(sp)
ffffffffc0209f48:	ec4e                	sd	s3,24(sp)
ffffffffc0209f4a:	04090f63          	beqz	s2,ffffffffc0209fa8 <sfs_write+0x6e>
ffffffffc0209f4e:	0b092783          	lw	a5,176(s2)
ffffffffc0209f52:	ebb9                	bnez	a5,ffffffffc0209fa8 <sfs_write+0x6e>
ffffffffc0209f54:	4d38                	lw	a4,88(a0)
ffffffffc0209f56:	6785                	lui	a5,0x1
ffffffffc0209f58:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc0209f5c:	842a                	mv	s0,a0
ffffffffc0209f5e:	06f71563          	bne	a4,a5,ffffffffc0209fc8 <sfs_write+0x8e>
ffffffffc0209f62:	02050993          	addi	s3,a0,32
ffffffffc0209f66:	854e                	mv	a0,s3
ffffffffc0209f68:	84ae                	mv	s1,a1
ffffffffc0209f6a:	e06fa0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc0209f6e:	0184b803          	ld	a6,24(s1)
ffffffffc0209f72:	6494                	ld	a3,8(s1)
ffffffffc0209f74:	6090                	ld	a2,0(s1)
ffffffffc0209f76:	85a2                	mv	a1,s0
ffffffffc0209f78:	4785                	li	a5,1
ffffffffc0209f7a:	0038                	addi	a4,sp,8
ffffffffc0209f7c:	854a                	mv	a0,s2
ffffffffc0209f7e:	e442                	sd	a6,8(sp)
ffffffffc0209f80:	d57ff0ef          	jal	ra,ffffffffc0209cd6 <sfs_io_nolock>
ffffffffc0209f84:	65a2                	ld	a1,8(sp)
ffffffffc0209f86:	842a                	mv	s0,a0
ffffffffc0209f88:	ed81                	bnez	a1,ffffffffc0209fa0 <sfs_write+0x66>
ffffffffc0209f8a:	854e                	mv	a0,s3
ffffffffc0209f8c:	de0fa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc0209f90:	70e2                	ld	ra,56(sp)
ffffffffc0209f92:	8522                	mv	a0,s0
ffffffffc0209f94:	7442                	ld	s0,48(sp)
ffffffffc0209f96:	74a2                	ld	s1,40(sp)
ffffffffc0209f98:	7902                	ld	s2,32(sp)
ffffffffc0209f9a:	69e2                	ld	s3,24(sp)
ffffffffc0209f9c:	6121                	addi	sp,sp,64
ffffffffc0209f9e:	8082                	ret
ffffffffc0209fa0:	8526                	mv	a0,s1
ffffffffc0209fa2:	cc2fb0ef          	jal	ra,ffffffffc0205464 <iobuf_skip>
ffffffffc0209fa6:	b7d5                	j	ffffffffc0209f8a <sfs_write+0x50>
ffffffffc0209fa8:	00005697          	auipc	a3,0x5
ffffffffc0209fac:	ab868693          	addi	a3,a3,-1352 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc0209fb0:	00002617          	auipc	a2,0x2
ffffffffc0209fb4:	86860613          	addi	a2,a2,-1944 # ffffffffc020b818 <commands+0x210>
ffffffffc0209fb8:	29800593          	li	a1,664
ffffffffc0209fbc:	00005517          	auipc	a0,0x5
ffffffffc0209fc0:	c8450513          	addi	a0,a0,-892 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc0209fc4:	cdaf60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc0209fc8:	fd8ff0ef          	jal	ra,ffffffffc02097a0 <sfs_io.part.0>

ffffffffc0209fcc <sfs_dirent_read_nolock>:
ffffffffc0209fcc:	6198                	ld	a4,0(a1)
ffffffffc0209fce:	7179                	addi	sp,sp,-48
ffffffffc0209fd0:	f406                	sd	ra,40(sp)
ffffffffc0209fd2:	00475883          	lhu	a7,4(a4)
ffffffffc0209fd6:	f022                	sd	s0,32(sp)
ffffffffc0209fd8:	ec26                	sd	s1,24(sp)
ffffffffc0209fda:	4809                	li	a6,2
ffffffffc0209fdc:	05089b63          	bne	a7,a6,ffffffffc020a032 <sfs_dirent_read_nolock+0x66>
ffffffffc0209fe0:	4718                	lw	a4,8(a4)
ffffffffc0209fe2:	87b2                	mv	a5,a2
ffffffffc0209fe4:	2601                	sext.w	a2,a2
ffffffffc0209fe6:	04e7f663          	bgeu	a5,a4,ffffffffc020a032 <sfs_dirent_read_nolock+0x66>
ffffffffc0209fea:	84b6                	mv	s1,a3
ffffffffc0209fec:	0074                	addi	a3,sp,12
ffffffffc0209fee:	842a                	mv	s0,a0
ffffffffc0209ff0:	a8fff0ef          	jal	ra,ffffffffc0209a7e <sfs_bmap_load_nolock>
ffffffffc0209ff4:	c511                	beqz	a0,ffffffffc020a000 <sfs_dirent_read_nolock+0x34>
ffffffffc0209ff6:	70a2                	ld	ra,40(sp)
ffffffffc0209ff8:	7402                	ld	s0,32(sp)
ffffffffc0209ffa:	64e2                	ld	s1,24(sp)
ffffffffc0209ffc:	6145                	addi	sp,sp,48
ffffffffc0209ffe:	8082                	ret
ffffffffc020a000:	45b2                	lw	a1,12(sp)
ffffffffc020a002:	4054                	lw	a3,4(s0)
ffffffffc020a004:	c5b9                	beqz	a1,ffffffffc020a052 <sfs_dirent_read_nolock+0x86>
ffffffffc020a006:	04d5f663          	bgeu	a1,a3,ffffffffc020a052 <sfs_dirent_read_nolock+0x86>
ffffffffc020a00a:	7c08                	ld	a0,56(s0)
ffffffffc020a00c:	eabfe0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc020a010:	ed31                	bnez	a0,ffffffffc020a06c <sfs_dirent_read_nolock+0xa0>
ffffffffc020a012:	46b2                	lw	a3,12(sp)
ffffffffc020a014:	4701                	li	a4,0
ffffffffc020a016:	10400613          	li	a2,260
ffffffffc020a01a:	85a6                	mv	a1,s1
ffffffffc020a01c:	8522                	mv	a0,s0
ffffffffc020a01e:	395000ef          	jal	ra,ffffffffc020abb2 <sfs_rbuf>
ffffffffc020a022:	f971                	bnez	a0,ffffffffc0209ff6 <sfs_dirent_read_nolock+0x2a>
ffffffffc020a024:	100481a3          	sb	zero,259(s1)
ffffffffc020a028:	70a2                	ld	ra,40(sp)
ffffffffc020a02a:	7402                	ld	s0,32(sp)
ffffffffc020a02c:	64e2                	ld	s1,24(sp)
ffffffffc020a02e:	6145                	addi	sp,sp,48
ffffffffc020a030:	8082                	ret
ffffffffc020a032:	00005697          	auipc	a3,0x5
ffffffffc020a036:	d9e68693          	addi	a3,a3,-610 # ffffffffc020edd0 <dev_node_ops+0x750>
ffffffffc020a03a:	00001617          	auipc	a2,0x1
ffffffffc020a03e:	7de60613          	addi	a2,a2,2014 # ffffffffc020b818 <commands+0x210>
ffffffffc020a042:	18e00593          	li	a1,398
ffffffffc020a046:	00005517          	auipc	a0,0x5
ffffffffc020a04a:	bfa50513          	addi	a0,a0,-1030 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a04e:	c50f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a052:	872e                	mv	a4,a1
ffffffffc020a054:	00005617          	auipc	a2,0x5
ffffffffc020a058:	c1c60613          	addi	a2,a2,-996 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc020a05c:	05300593          	li	a1,83
ffffffffc020a060:	00005517          	auipc	a0,0x5
ffffffffc020a064:	be050513          	addi	a0,a0,-1056 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a068:	c36f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a06c:	00005697          	auipc	a3,0x5
ffffffffc020a070:	c3c68693          	addi	a3,a3,-964 # ffffffffc020eca8 <dev_node_ops+0x628>
ffffffffc020a074:	00001617          	auipc	a2,0x1
ffffffffc020a078:	7a460613          	addi	a2,a2,1956 # ffffffffc020b818 <commands+0x210>
ffffffffc020a07c:	19500593          	li	a1,405
ffffffffc020a080:	00005517          	auipc	a0,0x5
ffffffffc020a084:	bc050513          	addi	a0,a0,-1088 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a088:	c16f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a08c <sfs_getdirentry>:
ffffffffc020a08c:	715d                	addi	sp,sp,-80
ffffffffc020a08e:	ec56                	sd	s5,24(sp)
ffffffffc020a090:	8aaa                	mv	s5,a0
ffffffffc020a092:	10400513          	li	a0,260
ffffffffc020a096:	e85a                	sd	s6,16(sp)
ffffffffc020a098:	e486                	sd	ra,72(sp)
ffffffffc020a09a:	e0a2                	sd	s0,64(sp)
ffffffffc020a09c:	fc26                	sd	s1,56(sp)
ffffffffc020a09e:	f84a                	sd	s2,48(sp)
ffffffffc020a0a0:	f44e                	sd	s3,40(sp)
ffffffffc020a0a2:	f052                	sd	s4,32(sp)
ffffffffc020a0a4:	e45e                	sd	s7,8(sp)
ffffffffc020a0a6:	e062                	sd	s8,0(sp)
ffffffffc020a0a8:	8b2e                	mv	s6,a1
ffffffffc020a0aa:	ee5f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a0ae:	cd61                	beqz	a0,ffffffffc020a186 <sfs_getdirentry+0xfa>
ffffffffc020a0b0:	068abb83          	ld	s7,104(s5)
ffffffffc020a0b4:	0c0b8b63          	beqz	s7,ffffffffc020a18a <sfs_getdirentry+0xfe>
ffffffffc020a0b8:	0b0ba783          	lw	a5,176(s7)
ffffffffc020a0bc:	e7f9                	bnez	a5,ffffffffc020a18a <sfs_getdirentry+0xfe>
ffffffffc020a0be:	058aa703          	lw	a4,88(s5)
ffffffffc020a0c2:	6785                	lui	a5,0x1
ffffffffc020a0c4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a0c8:	0ef71163          	bne	a4,a5,ffffffffc020a1aa <sfs_getdirentry+0x11e>
ffffffffc020a0cc:	008b3983          	ld	s3,8(s6)
ffffffffc020a0d0:	892a                	mv	s2,a0
ffffffffc020a0d2:	0a09c163          	bltz	s3,ffffffffc020a174 <sfs_getdirentry+0xe8>
ffffffffc020a0d6:	0ff9f793          	zext.b	a5,s3
ffffffffc020a0da:	efc9                	bnez	a5,ffffffffc020a174 <sfs_getdirentry+0xe8>
ffffffffc020a0dc:	000ab783          	ld	a5,0(s5)
ffffffffc020a0e0:	0089d993          	srli	s3,s3,0x8
ffffffffc020a0e4:	2981                	sext.w	s3,s3
ffffffffc020a0e6:	479c                	lw	a5,8(a5)
ffffffffc020a0e8:	0937eb63          	bltu	a5,s3,ffffffffc020a17e <sfs_getdirentry+0xf2>
ffffffffc020a0ec:	020a8c13          	addi	s8,s5,32
ffffffffc020a0f0:	8562                	mv	a0,s8
ffffffffc020a0f2:	c7efa0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020a0f6:	000ab783          	ld	a5,0(s5)
ffffffffc020a0fa:	0087aa03          	lw	s4,8(a5)
ffffffffc020a0fe:	07405663          	blez	s4,ffffffffc020a16a <sfs_getdirentry+0xde>
ffffffffc020a102:	4481                	li	s1,0
ffffffffc020a104:	a811                	j	ffffffffc020a118 <sfs_getdirentry+0x8c>
ffffffffc020a106:	00092783          	lw	a5,0(s2)
ffffffffc020a10a:	c781                	beqz	a5,ffffffffc020a112 <sfs_getdirentry+0x86>
ffffffffc020a10c:	02098263          	beqz	s3,ffffffffc020a130 <sfs_getdirentry+0xa4>
ffffffffc020a110:	39fd                	addiw	s3,s3,-1
ffffffffc020a112:	2485                	addiw	s1,s1,1
ffffffffc020a114:	049a0b63          	beq	s4,s1,ffffffffc020a16a <sfs_getdirentry+0xde>
ffffffffc020a118:	86ca                	mv	a3,s2
ffffffffc020a11a:	8626                	mv	a2,s1
ffffffffc020a11c:	85d6                	mv	a1,s5
ffffffffc020a11e:	855e                	mv	a0,s7
ffffffffc020a120:	eadff0ef          	jal	ra,ffffffffc0209fcc <sfs_dirent_read_nolock>
ffffffffc020a124:	842a                	mv	s0,a0
ffffffffc020a126:	d165                	beqz	a0,ffffffffc020a106 <sfs_getdirentry+0x7a>
ffffffffc020a128:	8562                	mv	a0,s8
ffffffffc020a12a:	c42fa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a12e:	a831                	j	ffffffffc020a14a <sfs_getdirentry+0xbe>
ffffffffc020a130:	8562                	mv	a0,s8
ffffffffc020a132:	c3afa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a136:	4701                	li	a4,0
ffffffffc020a138:	4685                	li	a3,1
ffffffffc020a13a:	10000613          	li	a2,256
ffffffffc020a13e:	00490593          	addi	a1,s2,4
ffffffffc020a142:	855a                	mv	a0,s6
ffffffffc020a144:	ab4fb0ef          	jal	ra,ffffffffc02053f8 <iobuf_move>
ffffffffc020a148:	842a                	mv	s0,a0
ffffffffc020a14a:	854a                	mv	a0,s2
ffffffffc020a14c:	ef3f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a150:	60a6                	ld	ra,72(sp)
ffffffffc020a152:	8522                	mv	a0,s0
ffffffffc020a154:	6406                	ld	s0,64(sp)
ffffffffc020a156:	74e2                	ld	s1,56(sp)
ffffffffc020a158:	7942                	ld	s2,48(sp)
ffffffffc020a15a:	79a2                	ld	s3,40(sp)
ffffffffc020a15c:	7a02                	ld	s4,32(sp)
ffffffffc020a15e:	6ae2                	ld	s5,24(sp)
ffffffffc020a160:	6b42                	ld	s6,16(sp)
ffffffffc020a162:	6ba2                	ld	s7,8(sp)
ffffffffc020a164:	6c02                	ld	s8,0(sp)
ffffffffc020a166:	6161                	addi	sp,sp,80
ffffffffc020a168:	8082                	ret
ffffffffc020a16a:	8562                	mv	a0,s8
ffffffffc020a16c:	5441                	li	s0,-16
ffffffffc020a16e:	bfefa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a172:	bfe1                	j	ffffffffc020a14a <sfs_getdirentry+0xbe>
ffffffffc020a174:	854a                	mv	a0,s2
ffffffffc020a176:	ec9f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a17a:	5475                	li	s0,-3
ffffffffc020a17c:	bfd1                	j	ffffffffc020a150 <sfs_getdirentry+0xc4>
ffffffffc020a17e:	ec1f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a182:	5441                	li	s0,-16
ffffffffc020a184:	b7f1                	j	ffffffffc020a150 <sfs_getdirentry+0xc4>
ffffffffc020a186:	5471                	li	s0,-4
ffffffffc020a188:	b7e1                	j	ffffffffc020a150 <sfs_getdirentry+0xc4>
ffffffffc020a18a:	00005697          	auipc	a3,0x5
ffffffffc020a18e:	8d668693          	addi	a3,a3,-1834 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc020a192:	00001617          	auipc	a2,0x1
ffffffffc020a196:	68660613          	addi	a2,a2,1670 # ffffffffc020b818 <commands+0x210>
ffffffffc020a19a:	33c00593          	li	a1,828
ffffffffc020a19e:	00005517          	auipc	a0,0x5
ffffffffc020a1a2:	aa250513          	addi	a0,a0,-1374 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a1a6:	af8f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a1aa:	00005697          	auipc	a3,0x5
ffffffffc020a1ae:	a5e68693          	addi	a3,a3,-1442 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020a1b2:	00001617          	auipc	a2,0x1
ffffffffc020a1b6:	66660613          	addi	a2,a2,1638 # ffffffffc020b818 <commands+0x210>
ffffffffc020a1ba:	33d00593          	li	a1,829
ffffffffc020a1be:	00005517          	auipc	a0,0x5
ffffffffc020a1c2:	a8250513          	addi	a0,a0,-1406 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a1c6:	ad8f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a1ca <sfs_dirent_search_nolock.constprop.0>:
ffffffffc020a1ca:	715d                	addi	sp,sp,-80
ffffffffc020a1cc:	f052                	sd	s4,32(sp)
ffffffffc020a1ce:	8a2a                	mv	s4,a0
ffffffffc020a1d0:	8532                	mv	a0,a2
ffffffffc020a1d2:	f44e                	sd	s3,40(sp)
ffffffffc020a1d4:	e85a                	sd	s6,16(sp)
ffffffffc020a1d6:	e45e                	sd	s7,8(sp)
ffffffffc020a1d8:	e486                	sd	ra,72(sp)
ffffffffc020a1da:	e0a2                	sd	s0,64(sp)
ffffffffc020a1dc:	fc26                	sd	s1,56(sp)
ffffffffc020a1de:	f84a                	sd	s2,48(sp)
ffffffffc020a1e0:	ec56                	sd	s5,24(sp)
ffffffffc020a1e2:	e062                	sd	s8,0(sp)
ffffffffc020a1e4:	8b32                	mv	s6,a2
ffffffffc020a1e6:	89ae                	mv	s3,a1
ffffffffc020a1e8:	8bb6                	mv	s7,a3
ffffffffc020a1ea:	0aa010ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc020a1ee:	0ff00793          	li	a5,255
ffffffffc020a1f2:	06a7ef63          	bltu	a5,a0,ffffffffc020a270 <sfs_dirent_search_nolock.constprop.0+0xa6>
ffffffffc020a1f6:	10400513          	li	a0,260
ffffffffc020a1fa:	d95f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a1fe:	892a                	mv	s2,a0
ffffffffc020a200:	c535                	beqz	a0,ffffffffc020a26c <sfs_dirent_search_nolock.constprop.0+0xa2>
ffffffffc020a202:	0009b783          	ld	a5,0(s3)
ffffffffc020a206:	0087aa83          	lw	s5,8(a5)
ffffffffc020a20a:	05505a63          	blez	s5,ffffffffc020a25e <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a20e:	4481                	li	s1,0
ffffffffc020a210:	00450c13          	addi	s8,a0,4
ffffffffc020a214:	a829                	j	ffffffffc020a22e <sfs_dirent_search_nolock.constprop.0+0x64>
ffffffffc020a216:	00092783          	lw	a5,0(s2)
ffffffffc020a21a:	c799                	beqz	a5,ffffffffc020a228 <sfs_dirent_search_nolock.constprop.0+0x5e>
ffffffffc020a21c:	85e2                	mv	a1,s8
ffffffffc020a21e:	855a                	mv	a0,s6
ffffffffc020a220:	0bc010ef          	jal	ra,ffffffffc020b2dc <strcmp>
ffffffffc020a224:	842a                	mv	s0,a0
ffffffffc020a226:	cd15                	beqz	a0,ffffffffc020a262 <sfs_dirent_search_nolock.constprop.0+0x98>
ffffffffc020a228:	2485                	addiw	s1,s1,1
ffffffffc020a22a:	029a8a63          	beq	s5,s1,ffffffffc020a25e <sfs_dirent_search_nolock.constprop.0+0x94>
ffffffffc020a22e:	86ca                	mv	a3,s2
ffffffffc020a230:	8626                	mv	a2,s1
ffffffffc020a232:	85ce                	mv	a1,s3
ffffffffc020a234:	8552                	mv	a0,s4
ffffffffc020a236:	d97ff0ef          	jal	ra,ffffffffc0209fcc <sfs_dirent_read_nolock>
ffffffffc020a23a:	842a                	mv	s0,a0
ffffffffc020a23c:	dd69                	beqz	a0,ffffffffc020a216 <sfs_dirent_search_nolock.constprop.0+0x4c>
ffffffffc020a23e:	854a                	mv	a0,s2
ffffffffc020a240:	dfff70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a244:	60a6                	ld	ra,72(sp)
ffffffffc020a246:	8522                	mv	a0,s0
ffffffffc020a248:	6406                	ld	s0,64(sp)
ffffffffc020a24a:	74e2                	ld	s1,56(sp)
ffffffffc020a24c:	7942                	ld	s2,48(sp)
ffffffffc020a24e:	79a2                	ld	s3,40(sp)
ffffffffc020a250:	7a02                	ld	s4,32(sp)
ffffffffc020a252:	6ae2                	ld	s5,24(sp)
ffffffffc020a254:	6b42                	ld	s6,16(sp)
ffffffffc020a256:	6ba2                	ld	s7,8(sp)
ffffffffc020a258:	6c02                	ld	s8,0(sp)
ffffffffc020a25a:	6161                	addi	sp,sp,80
ffffffffc020a25c:	8082                	ret
ffffffffc020a25e:	5441                	li	s0,-16
ffffffffc020a260:	bff9                	j	ffffffffc020a23e <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a262:	00092783          	lw	a5,0(s2)
ffffffffc020a266:	00fba023          	sw	a5,0(s7)
ffffffffc020a26a:	bfd1                	j	ffffffffc020a23e <sfs_dirent_search_nolock.constprop.0+0x74>
ffffffffc020a26c:	5471                	li	s0,-4
ffffffffc020a26e:	bfd9                	j	ffffffffc020a244 <sfs_dirent_search_nolock.constprop.0+0x7a>
ffffffffc020a270:	00005697          	auipc	a3,0x5
ffffffffc020a274:	bb068693          	addi	a3,a3,-1104 # ffffffffc020ee20 <dev_node_ops+0x7a0>
ffffffffc020a278:	00001617          	auipc	a2,0x1
ffffffffc020a27c:	5a060613          	addi	a2,a2,1440 # ffffffffc020b818 <commands+0x210>
ffffffffc020a280:	1ba00593          	li	a1,442
ffffffffc020a284:	00005517          	auipc	a0,0x5
ffffffffc020a288:	9bc50513          	addi	a0,a0,-1604 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a28c:	a12f60ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a290 <sfs_truncfile>:
ffffffffc020a290:	7175                	addi	sp,sp,-144
ffffffffc020a292:	e506                	sd	ra,136(sp)
ffffffffc020a294:	e122                	sd	s0,128(sp)
ffffffffc020a296:	fca6                	sd	s1,120(sp)
ffffffffc020a298:	f8ca                	sd	s2,112(sp)
ffffffffc020a29a:	f4ce                	sd	s3,104(sp)
ffffffffc020a29c:	f0d2                	sd	s4,96(sp)
ffffffffc020a29e:	ecd6                	sd	s5,88(sp)
ffffffffc020a2a0:	e8da                	sd	s6,80(sp)
ffffffffc020a2a2:	e4de                	sd	s7,72(sp)
ffffffffc020a2a4:	e0e2                	sd	s8,64(sp)
ffffffffc020a2a6:	fc66                	sd	s9,56(sp)
ffffffffc020a2a8:	f86a                	sd	s10,48(sp)
ffffffffc020a2aa:	f46e                	sd	s11,40(sp)
ffffffffc020a2ac:	080007b7          	lui	a5,0x8000
ffffffffc020a2b0:	16b7e463          	bltu	a5,a1,ffffffffc020a418 <sfs_truncfile+0x188>
ffffffffc020a2b4:	06853c83          	ld	s9,104(a0)
ffffffffc020a2b8:	89aa                	mv	s3,a0
ffffffffc020a2ba:	160c8163          	beqz	s9,ffffffffc020a41c <sfs_truncfile+0x18c>
ffffffffc020a2be:	0b0ca783          	lw	a5,176(s9) # 10b0 <_binary_bin_swap_img_size-0x6c50>
ffffffffc020a2c2:	14079d63          	bnez	a5,ffffffffc020a41c <sfs_truncfile+0x18c>
ffffffffc020a2c6:	4d38                	lw	a4,88(a0)
ffffffffc020a2c8:	6405                	lui	s0,0x1
ffffffffc020a2ca:	23540793          	addi	a5,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a2ce:	16f71763          	bne	a4,a5,ffffffffc020a43c <sfs_truncfile+0x1ac>
ffffffffc020a2d2:	00053a83          	ld	s5,0(a0)
ffffffffc020a2d6:	147d                	addi	s0,s0,-1
ffffffffc020a2d8:	942e                	add	s0,s0,a1
ffffffffc020a2da:	000ae783          	lwu	a5,0(s5)
ffffffffc020a2de:	8031                	srli	s0,s0,0xc
ffffffffc020a2e0:	8a2e                	mv	s4,a1
ffffffffc020a2e2:	2401                	sext.w	s0,s0
ffffffffc020a2e4:	02b79763          	bne	a5,a1,ffffffffc020a312 <sfs_truncfile+0x82>
ffffffffc020a2e8:	008aa783          	lw	a5,8(s5)
ffffffffc020a2ec:	4901                	li	s2,0
ffffffffc020a2ee:	18879763          	bne	a5,s0,ffffffffc020a47c <sfs_truncfile+0x1ec>
ffffffffc020a2f2:	60aa                	ld	ra,136(sp)
ffffffffc020a2f4:	640a                	ld	s0,128(sp)
ffffffffc020a2f6:	74e6                	ld	s1,120(sp)
ffffffffc020a2f8:	79a6                	ld	s3,104(sp)
ffffffffc020a2fa:	7a06                	ld	s4,96(sp)
ffffffffc020a2fc:	6ae6                	ld	s5,88(sp)
ffffffffc020a2fe:	6b46                	ld	s6,80(sp)
ffffffffc020a300:	6ba6                	ld	s7,72(sp)
ffffffffc020a302:	6c06                	ld	s8,64(sp)
ffffffffc020a304:	7ce2                	ld	s9,56(sp)
ffffffffc020a306:	7d42                	ld	s10,48(sp)
ffffffffc020a308:	7da2                	ld	s11,40(sp)
ffffffffc020a30a:	854a                	mv	a0,s2
ffffffffc020a30c:	7946                	ld	s2,112(sp)
ffffffffc020a30e:	6149                	addi	sp,sp,144
ffffffffc020a310:	8082                	ret
ffffffffc020a312:	02050b13          	addi	s6,a0,32
ffffffffc020a316:	855a                	mv	a0,s6
ffffffffc020a318:	a58fa0ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020a31c:	008aa483          	lw	s1,8(s5)
ffffffffc020a320:	0a84e663          	bltu	s1,s0,ffffffffc020a3cc <sfs_truncfile+0x13c>
ffffffffc020a324:	0c947163          	bgeu	s0,s1,ffffffffc020a3e6 <sfs_truncfile+0x156>
ffffffffc020a328:	4dad                	li	s11,11
ffffffffc020a32a:	4b85                	li	s7,1
ffffffffc020a32c:	a09d                	j	ffffffffc020a392 <sfs_truncfile+0x102>
ffffffffc020a32e:	ff37091b          	addiw	s2,a4,-13
ffffffffc020a332:	0009079b          	sext.w	a5,s2
ffffffffc020a336:	3ff00713          	li	a4,1023
ffffffffc020a33a:	04f76563          	bltu	a4,a5,ffffffffc020a384 <sfs_truncfile+0xf4>
ffffffffc020a33e:	03cd2c03          	lw	s8,60(s10)
ffffffffc020a342:	040c0163          	beqz	s8,ffffffffc020a384 <sfs_truncfile+0xf4>
ffffffffc020a346:	004ca783          	lw	a5,4(s9)
ffffffffc020a34a:	18fc7963          	bgeu	s8,a5,ffffffffc020a4dc <sfs_truncfile+0x24c>
ffffffffc020a34e:	038cb503          	ld	a0,56(s9)
ffffffffc020a352:	85e2                	mv	a1,s8
ffffffffc020a354:	b63fe0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc020a358:	16051263          	bnez	a0,ffffffffc020a4bc <sfs_truncfile+0x22c>
ffffffffc020a35c:	02091793          	slli	a5,s2,0x20
ffffffffc020a360:	01e7d713          	srli	a4,a5,0x1e
ffffffffc020a364:	86e2                	mv	a3,s8
ffffffffc020a366:	4611                	li	a2,4
ffffffffc020a368:	082c                	addi	a1,sp,24
ffffffffc020a36a:	8566                	mv	a0,s9
ffffffffc020a36c:	e43a                	sd	a4,8(sp)
ffffffffc020a36e:	ce02                	sw	zero,28(sp)
ffffffffc020a370:	043000ef          	jal	ra,ffffffffc020abb2 <sfs_rbuf>
ffffffffc020a374:	892a                	mv	s2,a0
ffffffffc020a376:	e141                	bnez	a0,ffffffffc020a3f6 <sfs_truncfile+0x166>
ffffffffc020a378:	47e2                	lw	a5,24(sp)
ffffffffc020a37a:	6722                	ld	a4,8(sp)
ffffffffc020a37c:	e3c9                	bnez	a5,ffffffffc020a3fe <sfs_truncfile+0x16e>
ffffffffc020a37e:	008d2603          	lw	a2,8(s10)
ffffffffc020a382:	367d                	addiw	a2,a2,-1
ffffffffc020a384:	00cd2423          	sw	a2,8(s10)
ffffffffc020a388:	0179b823          	sd	s7,16(s3)
ffffffffc020a38c:	34fd                	addiw	s1,s1,-1
ffffffffc020a38e:	04940a63          	beq	s0,s1,ffffffffc020a3e2 <sfs_truncfile+0x152>
ffffffffc020a392:	0009bd03          	ld	s10,0(s3)
ffffffffc020a396:	008d2703          	lw	a4,8(s10)
ffffffffc020a39a:	c369                	beqz	a4,ffffffffc020a45c <sfs_truncfile+0x1cc>
ffffffffc020a39c:	fff7079b          	addiw	a5,a4,-1
ffffffffc020a3a0:	0007861b          	sext.w	a2,a5
ffffffffc020a3a4:	f8cde5e3          	bltu	s11,a2,ffffffffc020a32e <sfs_truncfile+0x9e>
ffffffffc020a3a8:	02079713          	slli	a4,a5,0x20
ffffffffc020a3ac:	01e75793          	srli	a5,a4,0x1e
ffffffffc020a3b0:	00fd0933          	add	s2,s10,a5
ffffffffc020a3b4:	00c92583          	lw	a1,12(s2)
ffffffffc020a3b8:	d5f1                	beqz	a1,ffffffffc020a384 <sfs_truncfile+0xf4>
ffffffffc020a3ba:	8566                	mv	a0,s9
ffffffffc020a3bc:	c08ff0ef          	jal	ra,ffffffffc02097c4 <sfs_block_free>
ffffffffc020a3c0:	00092623          	sw	zero,12(s2)
ffffffffc020a3c4:	008d2603          	lw	a2,8(s10)
ffffffffc020a3c8:	367d                	addiw	a2,a2,-1
ffffffffc020a3ca:	bf6d                	j	ffffffffc020a384 <sfs_truncfile+0xf4>
ffffffffc020a3cc:	4681                	li	a3,0
ffffffffc020a3ce:	8626                	mv	a2,s1
ffffffffc020a3d0:	85ce                	mv	a1,s3
ffffffffc020a3d2:	8566                	mv	a0,s9
ffffffffc020a3d4:	eaaff0ef          	jal	ra,ffffffffc0209a7e <sfs_bmap_load_nolock>
ffffffffc020a3d8:	892a                	mv	s2,a0
ffffffffc020a3da:	ed11                	bnez	a0,ffffffffc020a3f6 <sfs_truncfile+0x166>
ffffffffc020a3dc:	2485                	addiw	s1,s1,1
ffffffffc020a3de:	fe9417e3          	bne	s0,s1,ffffffffc020a3cc <sfs_truncfile+0x13c>
ffffffffc020a3e2:	008aa483          	lw	s1,8(s5)
ffffffffc020a3e6:	0a941b63          	bne	s0,s1,ffffffffc020a49c <sfs_truncfile+0x20c>
ffffffffc020a3ea:	014aa023          	sw	s4,0(s5)
ffffffffc020a3ee:	4785                	li	a5,1
ffffffffc020a3f0:	00f9b823          	sd	a5,16(s3)
ffffffffc020a3f4:	4901                	li	s2,0
ffffffffc020a3f6:	855a                	mv	a0,s6
ffffffffc020a3f8:	974fa0ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a3fc:	bddd                	j	ffffffffc020a2f2 <sfs_truncfile+0x62>
ffffffffc020a3fe:	86e2                	mv	a3,s8
ffffffffc020a400:	4611                	li	a2,4
ffffffffc020a402:	086c                	addi	a1,sp,28
ffffffffc020a404:	8566                	mv	a0,s9
ffffffffc020a406:	02d000ef          	jal	ra,ffffffffc020ac32 <sfs_wbuf>
ffffffffc020a40a:	892a                	mv	s2,a0
ffffffffc020a40c:	f56d                	bnez	a0,ffffffffc020a3f6 <sfs_truncfile+0x166>
ffffffffc020a40e:	45e2                	lw	a1,24(sp)
ffffffffc020a410:	8566                	mv	a0,s9
ffffffffc020a412:	bb2ff0ef          	jal	ra,ffffffffc02097c4 <sfs_block_free>
ffffffffc020a416:	b7a5                	j	ffffffffc020a37e <sfs_truncfile+0xee>
ffffffffc020a418:	5975                	li	s2,-3
ffffffffc020a41a:	bde1                	j	ffffffffc020a2f2 <sfs_truncfile+0x62>
ffffffffc020a41c:	00004697          	auipc	a3,0x4
ffffffffc020a420:	64468693          	addi	a3,a3,1604 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc020a424:	00001617          	auipc	a2,0x1
ffffffffc020a428:	3f460613          	addi	a2,a2,1012 # ffffffffc020b818 <commands+0x210>
ffffffffc020a42c:	3ab00593          	li	a1,939
ffffffffc020a430:	00005517          	auipc	a0,0x5
ffffffffc020a434:	81050513          	addi	a0,a0,-2032 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a438:	866f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a43c:	00004697          	auipc	a3,0x4
ffffffffc020a440:	7cc68693          	addi	a3,a3,1996 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020a444:	00001617          	auipc	a2,0x1
ffffffffc020a448:	3d460613          	addi	a2,a2,980 # ffffffffc020b818 <commands+0x210>
ffffffffc020a44c:	3ac00593          	li	a1,940
ffffffffc020a450:	00004517          	auipc	a0,0x4
ffffffffc020a454:	7f050513          	addi	a0,a0,2032 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a458:	846f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a45c:	00005697          	auipc	a3,0x5
ffffffffc020a460:	a0468693          	addi	a3,a3,-1532 # ffffffffc020ee60 <dev_node_ops+0x7e0>
ffffffffc020a464:	00001617          	auipc	a2,0x1
ffffffffc020a468:	3b460613          	addi	a2,a2,948 # ffffffffc020b818 <commands+0x210>
ffffffffc020a46c:	17b00593          	li	a1,379
ffffffffc020a470:	00004517          	auipc	a0,0x4
ffffffffc020a474:	7d050513          	addi	a0,a0,2000 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a478:	826f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a47c:	00005697          	auipc	a3,0x5
ffffffffc020a480:	9cc68693          	addi	a3,a3,-1588 # ffffffffc020ee48 <dev_node_ops+0x7c8>
ffffffffc020a484:	00001617          	auipc	a2,0x1
ffffffffc020a488:	39460613          	addi	a2,a2,916 # ffffffffc020b818 <commands+0x210>
ffffffffc020a48c:	3b300593          	li	a1,947
ffffffffc020a490:	00004517          	auipc	a0,0x4
ffffffffc020a494:	7b050513          	addi	a0,a0,1968 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a498:	806f60ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a49c:	00005697          	auipc	a3,0x5
ffffffffc020a4a0:	a1468693          	addi	a3,a3,-1516 # ffffffffc020eeb0 <dev_node_ops+0x830>
ffffffffc020a4a4:	00001617          	auipc	a2,0x1
ffffffffc020a4a8:	37460613          	addi	a2,a2,884 # ffffffffc020b818 <commands+0x210>
ffffffffc020a4ac:	3cc00593          	li	a1,972
ffffffffc020a4b0:	00004517          	auipc	a0,0x4
ffffffffc020a4b4:	79050513          	addi	a0,a0,1936 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a4b8:	fe7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4bc:	00005697          	auipc	a3,0x5
ffffffffc020a4c0:	9bc68693          	addi	a3,a3,-1604 # ffffffffc020ee78 <dev_node_ops+0x7f8>
ffffffffc020a4c4:	00001617          	auipc	a2,0x1
ffffffffc020a4c8:	35460613          	addi	a2,a2,852 # ffffffffc020b818 <commands+0x210>
ffffffffc020a4cc:	12b00593          	li	a1,299
ffffffffc020a4d0:	00004517          	auipc	a0,0x4
ffffffffc020a4d4:	77050513          	addi	a0,a0,1904 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a4d8:	fc7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a4dc:	8762                	mv	a4,s8
ffffffffc020a4de:	86be                	mv	a3,a5
ffffffffc020a4e0:	00004617          	auipc	a2,0x4
ffffffffc020a4e4:	79060613          	addi	a2,a2,1936 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc020a4e8:	05300593          	li	a1,83
ffffffffc020a4ec:	00004517          	auipc	a0,0x4
ffffffffc020a4f0:	75450513          	addi	a0,a0,1876 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a4f4:	fabf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a4f8 <sfs_load_inode>:
ffffffffc020a4f8:	7139                	addi	sp,sp,-64
ffffffffc020a4fa:	fc06                	sd	ra,56(sp)
ffffffffc020a4fc:	f822                	sd	s0,48(sp)
ffffffffc020a4fe:	f426                	sd	s1,40(sp)
ffffffffc020a500:	f04a                	sd	s2,32(sp)
ffffffffc020a502:	84b2                	mv	s1,a2
ffffffffc020a504:	892a                	mv	s2,a0
ffffffffc020a506:	ec4e                	sd	s3,24(sp)
ffffffffc020a508:	e852                	sd	s4,16(sp)
ffffffffc020a50a:	89ae                	mv	s3,a1
ffffffffc020a50c:	e456                	sd	s5,8(sp)
ffffffffc020a50e:	0d5000ef          	jal	ra,ffffffffc020ade2 <lock_sfs_fs>
ffffffffc020a512:	45a9                	li	a1,10
ffffffffc020a514:	8526                	mv	a0,s1
ffffffffc020a516:	0a893403          	ld	s0,168(s2)
ffffffffc020a51a:	0e9000ef          	jal	ra,ffffffffc020ae02 <hash32>
ffffffffc020a51e:	02051793          	slli	a5,a0,0x20
ffffffffc020a522:	01c7d713          	srli	a4,a5,0x1c
ffffffffc020a526:	9722                	add	a4,a4,s0
ffffffffc020a528:	843a                	mv	s0,a4
ffffffffc020a52a:	a029                	j	ffffffffc020a534 <sfs_load_inode+0x3c>
ffffffffc020a52c:	fc042783          	lw	a5,-64(s0)
ffffffffc020a530:	10978863          	beq	a5,s1,ffffffffc020a640 <sfs_load_inode+0x148>
ffffffffc020a534:	6400                	ld	s0,8(s0)
ffffffffc020a536:	fe871be3          	bne	a4,s0,ffffffffc020a52c <sfs_load_inode+0x34>
ffffffffc020a53a:	04000513          	li	a0,64
ffffffffc020a53e:	a51f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a542:	8aaa                	mv	s5,a0
ffffffffc020a544:	16050563          	beqz	a0,ffffffffc020a6ae <sfs_load_inode+0x1b6>
ffffffffc020a548:	00492683          	lw	a3,4(s2)
ffffffffc020a54c:	18048363          	beqz	s1,ffffffffc020a6d2 <sfs_load_inode+0x1da>
ffffffffc020a550:	18d4f163          	bgeu	s1,a3,ffffffffc020a6d2 <sfs_load_inode+0x1da>
ffffffffc020a554:	03893503          	ld	a0,56(s2)
ffffffffc020a558:	85a6                	mv	a1,s1
ffffffffc020a55a:	95dfe0ef          	jal	ra,ffffffffc0208eb6 <bitmap_test>
ffffffffc020a55e:	18051763          	bnez	a0,ffffffffc020a6ec <sfs_load_inode+0x1f4>
ffffffffc020a562:	4701                	li	a4,0
ffffffffc020a564:	86a6                	mv	a3,s1
ffffffffc020a566:	04000613          	li	a2,64
ffffffffc020a56a:	85d6                	mv	a1,s5
ffffffffc020a56c:	854a                	mv	a0,s2
ffffffffc020a56e:	644000ef          	jal	ra,ffffffffc020abb2 <sfs_rbuf>
ffffffffc020a572:	842a                	mv	s0,a0
ffffffffc020a574:	0e051563          	bnez	a0,ffffffffc020a65e <sfs_load_inode+0x166>
ffffffffc020a578:	006ad783          	lhu	a5,6(s5)
ffffffffc020a57c:	12078b63          	beqz	a5,ffffffffc020a6b2 <sfs_load_inode+0x1ba>
ffffffffc020a580:	6405                	lui	s0,0x1
ffffffffc020a582:	23540513          	addi	a0,s0,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a586:	8eafd0ef          	jal	ra,ffffffffc0207670 <__alloc_inode>
ffffffffc020a58a:	8a2a                	mv	s4,a0
ffffffffc020a58c:	c961                	beqz	a0,ffffffffc020a65c <sfs_load_inode+0x164>
ffffffffc020a58e:	004ad683          	lhu	a3,4(s5)
ffffffffc020a592:	4785                	li	a5,1
ffffffffc020a594:	0cf69c63          	bne	a3,a5,ffffffffc020a66c <sfs_load_inode+0x174>
ffffffffc020a598:	864a                	mv	a2,s2
ffffffffc020a59a:	00005597          	auipc	a1,0x5
ffffffffc020a59e:	a2658593          	addi	a1,a1,-1498 # ffffffffc020efc0 <sfs_node_fileops>
ffffffffc020a5a2:	8eafd0ef          	jal	ra,ffffffffc020768c <inode_init>
ffffffffc020a5a6:	058a2783          	lw	a5,88(s4)
ffffffffc020a5aa:	23540413          	addi	s0,s0,565
ffffffffc020a5ae:	0e879063          	bne	a5,s0,ffffffffc020a68e <sfs_load_inode+0x196>
ffffffffc020a5b2:	4785                	li	a5,1
ffffffffc020a5b4:	00fa2c23          	sw	a5,24(s4)
ffffffffc020a5b8:	015a3023          	sd	s5,0(s4)
ffffffffc020a5bc:	009a2423          	sw	s1,8(s4)
ffffffffc020a5c0:	000a3823          	sd	zero,16(s4)
ffffffffc020a5c4:	4585                	li	a1,1
ffffffffc020a5c6:	020a0513          	addi	a0,s4,32
ffffffffc020a5ca:	f9df90ef          	jal	ra,ffffffffc0204566 <sem_init>
ffffffffc020a5ce:	058a2703          	lw	a4,88(s4)
ffffffffc020a5d2:	6785                	lui	a5,0x1
ffffffffc020a5d4:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a5d8:	14f71663          	bne	a4,a5,ffffffffc020a724 <sfs_load_inode+0x22c>
ffffffffc020a5dc:	0a093703          	ld	a4,160(s2)
ffffffffc020a5e0:	038a0793          	addi	a5,s4,56
ffffffffc020a5e4:	008a2503          	lw	a0,8(s4)
ffffffffc020a5e8:	e31c                	sd	a5,0(a4)
ffffffffc020a5ea:	0af93023          	sd	a5,160(s2)
ffffffffc020a5ee:	09890793          	addi	a5,s2,152
ffffffffc020a5f2:	0a893403          	ld	s0,168(s2)
ffffffffc020a5f6:	45a9                	li	a1,10
ffffffffc020a5f8:	04ea3023          	sd	a4,64(s4)
ffffffffc020a5fc:	02fa3c23          	sd	a5,56(s4)
ffffffffc020a600:	003000ef          	jal	ra,ffffffffc020ae02 <hash32>
ffffffffc020a604:	02051713          	slli	a4,a0,0x20
ffffffffc020a608:	01c75793          	srli	a5,a4,0x1c
ffffffffc020a60c:	97a2                	add	a5,a5,s0
ffffffffc020a60e:	6798                	ld	a4,8(a5)
ffffffffc020a610:	048a0693          	addi	a3,s4,72
ffffffffc020a614:	e314                	sd	a3,0(a4)
ffffffffc020a616:	e794                	sd	a3,8(a5)
ffffffffc020a618:	04ea3823          	sd	a4,80(s4)
ffffffffc020a61c:	04fa3423          	sd	a5,72(s4)
ffffffffc020a620:	854a                	mv	a0,s2
ffffffffc020a622:	7d0000ef          	jal	ra,ffffffffc020adf2 <unlock_sfs_fs>
ffffffffc020a626:	4401                	li	s0,0
ffffffffc020a628:	0149b023          	sd	s4,0(s3)
ffffffffc020a62c:	70e2                	ld	ra,56(sp)
ffffffffc020a62e:	8522                	mv	a0,s0
ffffffffc020a630:	7442                	ld	s0,48(sp)
ffffffffc020a632:	74a2                	ld	s1,40(sp)
ffffffffc020a634:	7902                	ld	s2,32(sp)
ffffffffc020a636:	69e2                	ld	s3,24(sp)
ffffffffc020a638:	6a42                	ld	s4,16(sp)
ffffffffc020a63a:	6aa2                	ld	s5,8(sp)
ffffffffc020a63c:	6121                	addi	sp,sp,64
ffffffffc020a63e:	8082                	ret
ffffffffc020a640:	fb840a13          	addi	s4,s0,-72
ffffffffc020a644:	8552                	mv	a0,s4
ffffffffc020a646:	8a8fd0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc020a64a:	4785                	li	a5,1
ffffffffc020a64c:	fcf51ae3          	bne	a0,a5,ffffffffc020a620 <sfs_load_inode+0x128>
ffffffffc020a650:	fd042783          	lw	a5,-48(s0)
ffffffffc020a654:	2785                	addiw	a5,a5,1
ffffffffc020a656:	fcf42823          	sw	a5,-48(s0)
ffffffffc020a65a:	b7d9                	j	ffffffffc020a620 <sfs_load_inode+0x128>
ffffffffc020a65c:	5471                	li	s0,-4
ffffffffc020a65e:	8556                	mv	a0,s5
ffffffffc020a660:	9dff70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a664:	854a                	mv	a0,s2
ffffffffc020a666:	78c000ef          	jal	ra,ffffffffc020adf2 <unlock_sfs_fs>
ffffffffc020a66a:	b7c9                	j	ffffffffc020a62c <sfs_load_inode+0x134>
ffffffffc020a66c:	4789                	li	a5,2
ffffffffc020a66e:	08f69f63          	bne	a3,a5,ffffffffc020a70c <sfs_load_inode+0x214>
ffffffffc020a672:	864a                	mv	a2,s2
ffffffffc020a674:	00005597          	auipc	a1,0x5
ffffffffc020a678:	8cc58593          	addi	a1,a1,-1844 # ffffffffc020ef40 <sfs_node_dirops>
ffffffffc020a67c:	810fd0ef          	jal	ra,ffffffffc020768c <inode_init>
ffffffffc020a680:	058a2703          	lw	a4,88(s4)
ffffffffc020a684:	6785                	lui	a5,0x1
ffffffffc020a686:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a68a:	f2f704e3          	beq	a4,a5,ffffffffc020a5b2 <sfs_load_inode+0xba>
ffffffffc020a68e:	00004697          	auipc	a3,0x4
ffffffffc020a692:	57a68693          	addi	a3,a3,1402 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020a696:	00001617          	auipc	a2,0x1
ffffffffc020a69a:	18260613          	addi	a2,a2,386 # ffffffffc020b818 <commands+0x210>
ffffffffc020a69e:	07700593          	li	a1,119
ffffffffc020a6a2:	00004517          	auipc	a0,0x4
ffffffffc020a6a6:	59e50513          	addi	a0,a0,1438 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a6aa:	df5f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a6ae:	5471                	li	s0,-4
ffffffffc020a6b0:	bf55                	j	ffffffffc020a664 <sfs_load_inode+0x16c>
ffffffffc020a6b2:	00005697          	auipc	a3,0x5
ffffffffc020a6b6:	81668693          	addi	a3,a3,-2026 # ffffffffc020eec8 <dev_node_ops+0x848>
ffffffffc020a6ba:	00001617          	auipc	a2,0x1
ffffffffc020a6be:	15e60613          	addi	a2,a2,350 # ffffffffc020b818 <commands+0x210>
ffffffffc020a6c2:	0ad00593          	li	a1,173
ffffffffc020a6c6:	00004517          	auipc	a0,0x4
ffffffffc020a6ca:	57a50513          	addi	a0,a0,1402 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a6ce:	dd1f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a6d2:	8726                	mv	a4,s1
ffffffffc020a6d4:	00004617          	auipc	a2,0x4
ffffffffc020a6d8:	59c60613          	addi	a2,a2,1436 # ffffffffc020ec70 <dev_node_ops+0x5f0>
ffffffffc020a6dc:	05300593          	li	a1,83
ffffffffc020a6e0:	00004517          	auipc	a0,0x4
ffffffffc020a6e4:	56050513          	addi	a0,a0,1376 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a6e8:	db7f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a6ec:	00004697          	auipc	a3,0x4
ffffffffc020a6f0:	5bc68693          	addi	a3,a3,1468 # ffffffffc020eca8 <dev_node_ops+0x628>
ffffffffc020a6f4:	00001617          	auipc	a2,0x1
ffffffffc020a6f8:	12460613          	addi	a2,a2,292 # ffffffffc020b818 <commands+0x210>
ffffffffc020a6fc:	0a800593          	li	a1,168
ffffffffc020a700:	00004517          	auipc	a0,0x4
ffffffffc020a704:	54050513          	addi	a0,a0,1344 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a708:	d97f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a70c:	00004617          	auipc	a2,0x4
ffffffffc020a710:	54c60613          	addi	a2,a2,1356 # ffffffffc020ec58 <dev_node_ops+0x5d8>
ffffffffc020a714:	02e00593          	li	a1,46
ffffffffc020a718:	00004517          	auipc	a0,0x4
ffffffffc020a71c:	52850513          	addi	a0,a0,1320 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a720:	d7ff50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a724:	00004697          	auipc	a3,0x4
ffffffffc020a728:	4e468693          	addi	a3,a3,1252 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020a72c:	00001617          	auipc	a2,0x1
ffffffffc020a730:	0ec60613          	addi	a2,a2,236 # ffffffffc020b818 <commands+0x210>
ffffffffc020a734:	0b100593          	li	a1,177
ffffffffc020a738:	00004517          	auipc	a0,0x4
ffffffffc020a73c:	50850513          	addi	a0,a0,1288 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a740:	d5ff50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a744 <sfs_lookup>:
ffffffffc020a744:	7139                	addi	sp,sp,-64
ffffffffc020a746:	ec4e                	sd	s3,24(sp)
ffffffffc020a748:	06853983          	ld	s3,104(a0)
ffffffffc020a74c:	fc06                	sd	ra,56(sp)
ffffffffc020a74e:	f822                	sd	s0,48(sp)
ffffffffc020a750:	f426                	sd	s1,40(sp)
ffffffffc020a752:	f04a                	sd	s2,32(sp)
ffffffffc020a754:	e852                	sd	s4,16(sp)
ffffffffc020a756:	0a098c63          	beqz	s3,ffffffffc020a80e <sfs_lookup+0xca>
ffffffffc020a75a:	0b09a783          	lw	a5,176(s3)
ffffffffc020a75e:	ebc5                	bnez	a5,ffffffffc020a80e <sfs_lookup+0xca>
ffffffffc020a760:	0005c783          	lbu	a5,0(a1)
ffffffffc020a764:	84ae                	mv	s1,a1
ffffffffc020a766:	c7c1                	beqz	a5,ffffffffc020a7ee <sfs_lookup+0xaa>
ffffffffc020a768:	02f00713          	li	a4,47
ffffffffc020a76c:	08e78163          	beq	a5,a4,ffffffffc020a7ee <sfs_lookup+0xaa>
ffffffffc020a770:	842a                	mv	s0,a0
ffffffffc020a772:	8a32                	mv	s4,a2
ffffffffc020a774:	f7bfc0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc020a778:	4c38                	lw	a4,88(s0)
ffffffffc020a77a:	6785                	lui	a5,0x1
ffffffffc020a77c:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a780:	0af71763          	bne	a4,a5,ffffffffc020a82e <sfs_lookup+0xea>
ffffffffc020a784:	6018                	ld	a4,0(s0)
ffffffffc020a786:	4789                	li	a5,2
ffffffffc020a788:	00475703          	lhu	a4,4(a4)
ffffffffc020a78c:	04f71c63          	bne	a4,a5,ffffffffc020a7e4 <sfs_lookup+0xa0>
ffffffffc020a790:	02040913          	addi	s2,s0,32
ffffffffc020a794:	854a                	mv	a0,s2
ffffffffc020a796:	ddbf90ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020a79a:	8626                	mv	a2,s1
ffffffffc020a79c:	0054                	addi	a3,sp,4
ffffffffc020a79e:	85a2                	mv	a1,s0
ffffffffc020a7a0:	854e                	mv	a0,s3
ffffffffc020a7a2:	a29ff0ef          	jal	ra,ffffffffc020a1ca <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a7a6:	84aa                	mv	s1,a0
ffffffffc020a7a8:	854a                	mv	a0,s2
ffffffffc020a7aa:	dc3f90ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a7ae:	cc89                	beqz	s1,ffffffffc020a7c8 <sfs_lookup+0x84>
ffffffffc020a7b0:	8522                	mv	a0,s0
ffffffffc020a7b2:	80afd0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020a7b6:	70e2                	ld	ra,56(sp)
ffffffffc020a7b8:	7442                	ld	s0,48(sp)
ffffffffc020a7ba:	7902                	ld	s2,32(sp)
ffffffffc020a7bc:	69e2                	ld	s3,24(sp)
ffffffffc020a7be:	6a42                	ld	s4,16(sp)
ffffffffc020a7c0:	8526                	mv	a0,s1
ffffffffc020a7c2:	74a2                	ld	s1,40(sp)
ffffffffc020a7c4:	6121                	addi	sp,sp,64
ffffffffc020a7c6:	8082                	ret
ffffffffc020a7c8:	4612                	lw	a2,4(sp)
ffffffffc020a7ca:	002c                	addi	a1,sp,8
ffffffffc020a7cc:	854e                	mv	a0,s3
ffffffffc020a7ce:	d2bff0ef          	jal	ra,ffffffffc020a4f8 <sfs_load_inode>
ffffffffc020a7d2:	84aa                	mv	s1,a0
ffffffffc020a7d4:	8522                	mv	a0,s0
ffffffffc020a7d6:	fe7fc0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020a7da:	fcf1                	bnez	s1,ffffffffc020a7b6 <sfs_lookup+0x72>
ffffffffc020a7dc:	67a2                	ld	a5,8(sp)
ffffffffc020a7de:	00fa3023          	sd	a5,0(s4)
ffffffffc020a7e2:	bfd1                	j	ffffffffc020a7b6 <sfs_lookup+0x72>
ffffffffc020a7e4:	8522                	mv	a0,s0
ffffffffc020a7e6:	fd7fc0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020a7ea:	54b9                	li	s1,-18
ffffffffc020a7ec:	b7e9                	j	ffffffffc020a7b6 <sfs_lookup+0x72>
ffffffffc020a7ee:	00004697          	auipc	a3,0x4
ffffffffc020a7f2:	6f268693          	addi	a3,a3,1778 # ffffffffc020eee0 <dev_node_ops+0x860>
ffffffffc020a7f6:	00001617          	auipc	a2,0x1
ffffffffc020a7fa:	02260613          	addi	a2,a2,34 # ffffffffc020b818 <commands+0x210>
ffffffffc020a7fe:	3dd00593          	li	a1,989
ffffffffc020a802:	00004517          	auipc	a0,0x4
ffffffffc020a806:	43e50513          	addi	a0,a0,1086 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a80a:	c95f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a80e:	00004697          	auipc	a3,0x4
ffffffffc020a812:	25268693          	addi	a3,a3,594 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc020a816:	00001617          	auipc	a2,0x1
ffffffffc020a81a:	00260613          	addi	a2,a2,2 # ffffffffc020b818 <commands+0x210>
ffffffffc020a81e:	3dc00593          	li	a1,988
ffffffffc020a822:	00004517          	auipc	a0,0x4
ffffffffc020a826:	41e50513          	addi	a0,a0,1054 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a82a:	c75f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020a82e:	00004697          	auipc	a3,0x4
ffffffffc020a832:	3da68693          	addi	a3,a3,986 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020a836:	00001617          	auipc	a2,0x1
ffffffffc020a83a:	fe260613          	addi	a2,a2,-30 # ffffffffc020b818 <commands+0x210>
ffffffffc020a83e:	3df00593          	li	a1,991
ffffffffc020a842:	00004517          	auipc	a0,0x4
ffffffffc020a846:	3fe50513          	addi	a0,a0,1022 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020a84a:	c55f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020a84e <sfs_namefile>:
ffffffffc020a84e:	6d98                	ld	a4,24(a1)
ffffffffc020a850:	7175                	addi	sp,sp,-144
ffffffffc020a852:	e506                	sd	ra,136(sp)
ffffffffc020a854:	e122                	sd	s0,128(sp)
ffffffffc020a856:	fca6                	sd	s1,120(sp)
ffffffffc020a858:	f8ca                	sd	s2,112(sp)
ffffffffc020a85a:	f4ce                	sd	s3,104(sp)
ffffffffc020a85c:	f0d2                	sd	s4,96(sp)
ffffffffc020a85e:	ecd6                	sd	s5,88(sp)
ffffffffc020a860:	e8da                	sd	s6,80(sp)
ffffffffc020a862:	e4de                	sd	s7,72(sp)
ffffffffc020a864:	e0e2                	sd	s8,64(sp)
ffffffffc020a866:	fc66                	sd	s9,56(sp)
ffffffffc020a868:	f86a                	sd	s10,48(sp)
ffffffffc020a86a:	f46e                	sd	s11,40(sp)
ffffffffc020a86c:	e42e                	sd	a1,8(sp)
ffffffffc020a86e:	4789                	li	a5,2
ffffffffc020a870:	1ae7f363          	bgeu	a5,a4,ffffffffc020aa16 <sfs_namefile+0x1c8>
ffffffffc020a874:	89aa                	mv	s3,a0
ffffffffc020a876:	10400513          	li	a0,260
ffffffffc020a87a:	f14f70ef          	jal	ra,ffffffffc0201f8e <kmalloc>
ffffffffc020a87e:	842a                	mv	s0,a0
ffffffffc020a880:	18050b63          	beqz	a0,ffffffffc020aa16 <sfs_namefile+0x1c8>
ffffffffc020a884:	0689b483          	ld	s1,104(s3)
ffffffffc020a888:	1e048963          	beqz	s1,ffffffffc020aa7a <sfs_namefile+0x22c>
ffffffffc020a88c:	0b04a783          	lw	a5,176(s1)
ffffffffc020a890:	1e079563          	bnez	a5,ffffffffc020aa7a <sfs_namefile+0x22c>
ffffffffc020a894:	0589ac83          	lw	s9,88(s3)
ffffffffc020a898:	6785                	lui	a5,0x1
ffffffffc020a89a:	23578793          	addi	a5,a5,565 # 1235 <_binary_bin_swap_img_size-0x6acb>
ffffffffc020a89e:	1afc9e63          	bne	s9,a5,ffffffffc020aa5a <sfs_namefile+0x20c>
ffffffffc020a8a2:	6722                	ld	a4,8(sp)
ffffffffc020a8a4:	854e                	mv	a0,s3
ffffffffc020a8a6:	8ace                	mv	s5,s3
ffffffffc020a8a8:	6f1c                	ld	a5,24(a4)
ffffffffc020a8aa:	00073b03          	ld	s6,0(a4)
ffffffffc020a8ae:	02098a13          	addi	s4,s3,32
ffffffffc020a8b2:	ffe78b93          	addi	s7,a5,-2
ffffffffc020a8b6:	9b3e                	add	s6,s6,a5
ffffffffc020a8b8:	00004d17          	auipc	s10,0x4
ffffffffc020a8bc:	648d0d13          	addi	s10,s10,1608 # ffffffffc020ef00 <dev_node_ops+0x880>
ffffffffc020a8c0:	e2ffc0ef          	jal	ra,ffffffffc02076ee <inode_ref_inc>
ffffffffc020a8c4:	00440c13          	addi	s8,s0,4
ffffffffc020a8c8:	e066                	sd	s9,0(sp)
ffffffffc020a8ca:	8552                	mv	a0,s4
ffffffffc020a8cc:	ca5f90ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020a8d0:	0854                	addi	a3,sp,20
ffffffffc020a8d2:	866a                	mv	a2,s10
ffffffffc020a8d4:	85d6                	mv	a1,s5
ffffffffc020a8d6:	8526                	mv	a0,s1
ffffffffc020a8d8:	8f3ff0ef          	jal	ra,ffffffffc020a1ca <sfs_dirent_search_nolock.constprop.0>
ffffffffc020a8dc:	8daa                	mv	s11,a0
ffffffffc020a8de:	8552                	mv	a0,s4
ffffffffc020a8e0:	c8df90ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a8e4:	020d8863          	beqz	s11,ffffffffc020a914 <sfs_namefile+0xc6>
ffffffffc020a8e8:	854e                	mv	a0,s3
ffffffffc020a8ea:	ed3fc0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020a8ee:	8522                	mv	a0,s0
ffffffffc020a8f0:	f4ef70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020a8f4:	60aa                	ld	ra,136(sp)
ffffffffc020a8f6:	640a                	ld	s0,128(sp)
ffffffffc020a8f8:	74e6                	ld	s1,120(sp)
ffffffffc020a8fa:	7946                	ld	s2,112(sp)
ffffffffc020a8fc:	79a6                	ld	s3,104(sp)
ffffffffc020a8fe:	7a06                	ld	s4,96(sp)
ffffffffc020a900:	6ae6                	ld	s5,88(sp)
ffffffffc020a902:	6b46                	ld	s6,80(sp)
ffffffffc020a904:	6ba6                	ld	s7,72(sp)
ffffffffc020a906:	6c06                	ld	s8,64(sp)
ffffffffc020a908:	7ce2                	ld	s9,56(sp)
ffffffffc020a90a:	7d42                	ld	s10,48(sp)
ffffffffc020a90c:	856e                	mv	a0,s11
ffffffffc020a90e:	7da2                	ld	s11,40(sp)
ffffffffc020a910:	6149                	addi	sp,sp,144
ffffffffc020a912:	8082                	ret
ffffffffc020a914:	4652                	lw	a2,20(sp)
ffffffffc020a916:	082c                	addi	a1,sp,24
ffffffffc020a918:	8526                	mv	a0,s1
ffffffffc020a91a:	bdfff0ef          	jal	ra,ffffffffc020a4f8 <sfs_load_inode>
ffffffffc020a91e:	8daa                	mv	s11,a0
ffffffffc020a920:	f561                	bnez	a0,ffffffffc020a8e8 <sfs_namefile+0x9a>
ffffffffc020a922:	854e                	mv	a0,s3
ffffffffc020a924:	008aa903          	lw	s2,8(s5)
ffffffffc020a928:	e95fc0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020a92c:	6ce2                	ld	s9,24(sp)
ffffffffc020a92e:	0b3c8463          	beq	s9,s3,ffffffffc020a9d6 <sfs_namefile+0x188>
ffffffffc020a932:	100c8463          	beqz	s9,ffffffffc020aa3a <sfs_namefile+0x1ec>
ffffffffc020a936:	058ca703          	lw	a4,88(s9)
ffffffffc020a93a:	6782                	ld	a5,0(sp)
ffffffffc020a93c:	0ef71f63          	bne	a4,a5,ffffffffc020aa3a <sfs_namefile+0x1ec>
ffffffffc020a940:	008ca703          	lw	a4,8(s9)
ffffffffc020a944:	8ae6                	mv	s5,s9
ffffffffc020a946:	0d270a63          	beq	a4,s2,ffffffffc020aa1a <sfs_namefile+0x1cc>
ffffffffc020a94a:	000cb703          	ld	a4,0(s9)
ffffffffc020a94e:	4789                	li	a5,2
ffffffffc020a950:	00475703          	lhu	a4,4(a4)
ffffffffc020a954:	0cf71363          	bne	a4,a5,ffffffffc020aa1a <sfs_namefile+0x1cc>
ffffffffc020a958:	020c8a13          	addi	s4,s9,32
ffffffffc020a95c:	8552                	mv	a0,s4
ffffffffc020a95e:	c13f90ef          	jal	ra,ffffffffc0204570 <down>
ffffffffc020a962:	000cb703          	ld	a4,0(s9)
ffffffffc020a966:	00872983          	lw	s3,8(a4)
ffffffffc020a96a:	01304963          	bgtz	s3,ffffffffc020a97c <sfs_namefile+0x12e>
ffffffffc020a96e:	a899                	j	ffffffffc020a9c4 <sfs_namefile+0x176>
ffffffffc020a970:	4018                	lw	a4,0(s0)
ffffffffc020a972:	01270e63          	beq	a4,s2,ffffffffc020a98e <sfs_namefile+0x140>
ffffffffc020a976:	2d85                	addiw	s11,s11,1
ffffffffc020a978:	05b98663          	beq	s3,s11,ffffffffc020a9c4 <sfs_namefile+0x176>
ffffffffc020a97c:	86a2                	mv	a3,s0
ffffffffc020a97e:	866e                	mv	a2,s11
ffffffffc020a980:	85e6                	mv	a1,s9
ffffffffc020a982:	8526                	mv	a0,s1
ffffffffc020a984:	e48ff0ef          	jal	ra,ffffffffc0209fcc <sfs_dirent_read_nolock>
ffffffffc020a988:	872a                	mv	a4,a0
ffffffffc020a98a:	d17d                	beqz	a0,ffffffffc020a970 <sfs_namefile+0x122>
ffffffffc020a98c:	a82d                	j	ffffffffc020a9c6 <sfs_namefile+0x178>
ffffffffc020a98e:	8552                	mv	a0,s4
ffffffffc020a990:	bddf90ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a994:	8562                	mv	a0,s8
ffffffffc020a996:	0ff000ef          	jal	ra,ffffffffc020b294 <strlen>
ffffffffc020a99a:	00150793          	addi	a5,a0,1
ffffffffc020a99e:	862a                	mv	a2,a0
ffffffffc020a9a0:	06fbe863          	bltu	s7,a5,ffffffffc020aa10 <sfs_namefile+0x1c2>
ffffffffc020a9a4:	fff64913          	not	s2,a2
ffffffffc020a9a8:	995a                	add	s2,s2,s6
ffffffffc020a9aa:	85e2                	mv	a1,s8
ffffffffc020a9ac:	854a                	mv	a0,s2
ffffffffc020a9ae:	40fb8bb3          	sub	s7,s7,a5
ffffffffc020a9b2:	1d7000ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020a9b6:	02f00793          	li	a5,47
ffffffffc020a9ba:	fefb0fa3          	sb	a5,-1(s6)
ffffffffc020a9be:	89e6                	mv	s3,s9
ffffffffc020a9c0:	8b4a                	mv	s6,s2
ffffffffc020a9c2:	b721                	j	ffffffffc020a8ca <sfs_namefile+0x7c>
ffffffffc020a9c4:	5741                	li	a4,-16
ffffffffc020a9c6:	8552                	mv	a0,s4
ffffffffc020a9c8:	e03a                	sd	a4,0(sp)
ffffffffc020a9ca:	ba3f90ef          	jal	ra,ffffffffc020456c <up>
ffffffffc020a9ce:	6702                	ld	a4,0(sp)
ffffffffc020a9d0:	89e6                	mv	s3,s9
ffffffffc020a9d2:	8dba                	mv	s11,a4
ffffffffc020a9d4:	bf11                	j	ffffffffc020a8e8 <sfs_namefile+0x9a>
ffffffffc020a9d6:	854e                	mv	a0,s3
ffffffffc020a9d8:	de5fc0ef          	jal	ra,ffffffffc02077bc <inode_ref_dec>
ffffffffc020a9dc:	64a2                	ld	s1,8(sp)
ffffffffc020a9de:	85da                	mv	a1,s6
ffffffffc020a9e0:	6c98                	ld	a4,24(s1)
ffffffffc020a9e2:	6088                	ld	a0,0(s1)
ffffffffc020a9e4:	1779                	addi	a4,a4,-2
ffffffffc020a9e6:	41770bb3          	sub	s7,a4,s7
ffffffffc020a9ea:	865e                	mv	a2,s7
ffffffffc020a9ec:	0505                	addi	a0,a0,1
ffffffffc020a9ee:	15b000ef          	jal	ra,ffffffffc020b348 <memmove>
ffffffffc020a9f2:	02f00713          	li	a4,47
ffffffffc020a9f6:	fee50fa3          	sb	a4,-1(a0)
ffffffffc020a9fa:	955e                	add	a0,a0,s7
ffffffffc020a9fc:	00050023          	sb	zero,0(a0)
ffffffffc020aa00:	85de                	mv	a1,s7
ffffffffc020aa02:	8526                	mv	a0,s1
ffffffffc020aa04:	a61fa0ef          	jal	ra,ffffffffc0205464 <iobuf_skip>
ffffffffc020aa08:	8522                	mv	a0,s0
ffffffffc020aa0a:	e34f70ef          	jal	ra,ffffffffc020203e <kfree>
ffffffffc020aa0e:	b5dd                	j	ffffffffc020a8f4 <sfs_namefile+0xa6>
ffffffffc020aa10:	89e6                	mv	s3,s9
ffffffffc020aa12:	5df1                	li	s11,-4
ffffffffc020aa14:	bdd1                	j	ffffffffc020a8e8 <sfs_namefile+0x9a>
ffffffffc020aa16:	5df1                	li	s11,-4
ffffffffc020aa18:	bdf1                	j	ffffffffc020a8f4 <sfs_namefile+0xa6>
ffffffffc020aa1a:	00004697          	auipc	a3,0x4
ffffffffc020aa1e:	4ee68693          	addi	a3,a3,1262 # ffffffffc020ef08 <dev_node_ops+0x888>
ffffffffc020aa22:	00001617          	auipc	a2,0x1
ffffffffc020aa26:	df660613          	addi	a2,a2,-522 # ffffffffc020b818 <commands+0x210>
ffffffffc020aa2a:	2fb00593          	li	a1,763
ffffffffc020aa2e:	00004517          	auipc	a0,0x4
ffffffffc020aa32:	21250513          	addi	a0,a0,530 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020aa36:	a69f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aa3a:	00004697          	auipc	a3,0x4
ffffffffc020aa3e:	1ce68693          	addi	a3,a3,462 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020aa42:	00001617          	auipc	a2,0x1
ffffffffc020aa46:	dd660613          	addi	a2,a2,-554 # ffffffffc020b818 <commands+0x210>
ffffffffc020aa4a:	2fa00593          	li	a1,762
ffffffffc020aa4e:	00004517          	auipc	a0,0x4
ffffffffc020aa52:	1f250513          	addi	a0,a0,498 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020aa56:	a49f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aa5a:	00004697          	auipc	a3,0x4
ffffffffc020aa5e:	1ae68693          	addi	a3,a3,430 # ffffffffc020ec08 <dev_node_ops+0x588>
ffffffffc020aa62:	00001617          	auipc	a2,0x1
ffffffffc020aa66:	db660613          	addi	a2,a2,-586 # ffffffffc020b818 <commands+0x210>
ffffffffc020aa6a:	2e700593          	li	a1,743
ffffffffc020aa6e:	00004517          	auipc	a0,0x4
ffffffffc020aa72:	1d250513          	addi	a0,a0,466 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020aa76:	a29f50ef          	jal	ra,ffffffffc020049e <__panic>
ffffffffc020aa7a:	00004697          	auipc	a3,0x4
ffffffffc020aa7e:	fe668693          	addi	a3,a3,-26 # ffffffffc020ea60 <dev_node_ops+0x3e0>
ffffffffc020aa82:	00001617          	auipc	a2,0x1
ffffffffc020aa86:	d9660613          	addi	a2,a2,-618 # ffffffffc020b818 <commands+0x210>
ffffffffc020aa8a:	2e600593          	li	a1,742
ffffffffc020aa8e:	00004517          	auipc	a0,0x4
ffffffffc020aa92:	1b250513          	addi	a0,a0,434 # ffffffffc020ec40 <dev_node_ops+0x5c0>
ffffffffc020aa96:	a09f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020aa9a <sfs_rwblock_nolock>:
ffffffffc020aa9a:	7139                	addi	sp,sp,-64
ffffffffc020aa9c:	f822                	sd	s0,48(sp)
ffffffffc020aa9e:	f426                	sd	s1,40(sp)
ffffffffc020aaa0:	fc06                	sd	ra,56(sp)
ffffffffc020aaa2:	842a                	mv	s0,a0
ffffffffc020aaa4:	84b6                	mv	s1,a3
ffffffffc020aaa6:	e211                	bnez	a2,ffffffffc020aaaa <sfs_rwblock_nolock+0x10>
ffffffffc020aaa8:	e715                	bnez	a4,ffffffffc020aad4 <sfs_rwblock_nolock+0x3a>
ffffffffc020aaaa:	405c                	lw	a5,4(s0)
ffffffffc020aaac:	02f67463          	bgeu	a2,a5,ffffffffc020aad4 <sfs_rwblock_nolock+0x3a>
ffffffffc020aab0:	00c6169b          	slliw	a3,a2,0xc
ffffffffc020aab4:	1682                	slli	a3,a3,0x20
ffffffffc020aab6:	6605                	lui	a2,0x1
ffffffffc020aab8:	9281                	srli	a3,a3,0x20
ffffffffc020aaba:	850a                	mv	a0,sp
ffffffffc020aabc:	933fa0ef          	jal	ra,ffffffffc02053ee <iobuf_init>
ffffffffc020aac0:	85aa                	mv	a1,a0
ffffffffc020aac2:	7808                	ld	a0,48(s0)
ffffffffc020aac4:	8626                	mv	a2,s1
ffffffffc020aac6:	7118                	ld	a4,32(a0)
ffffffffc020aac8:	9702                	jalr	a4
ffffffffc020aaca:	70e2                	ld	ra,56(sp)
ffffffffc020aacc:	7442                	ld	s0,48(sp)
ffffffffc020aace:	74a2                	ld	s1,40(sp)
ffffffffc020aad0:	6121                	addi	sp,sp,64
ffffffffc020aad2:	8082                	ret
ffffffffc020aad4:	00004697          	auipc	a3,0x4
ffffffffc020aad8:	56c68693          	addi	a3,a3,1388 # ffffffffc020f040 <sfs_node_fileops+0x80>
ffffffffc020aadc:	00001617          	auipc	a2,0x1
ffffffffc020aae0:	d3c60613          	addi	a2,a2,-708 # ffffffffc020b818 <commands+0x210>
ffffffffc020aae4:	45d5                	li	a1,21
ffffffffc020aae6:	00004517          	auipc	a0,0x4
ffffffffc020aaea:	59250513          	addi	a0,a0,1426 # ffffffffc020f078 <sfs_node_fileops+0xb8>
ffffffffc020aaee:	9b1f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020aaf2 <sfs_rblock>:
ffffffffc020aaf2:	7139                	addi	sp,sp,-64
ffffffffc020aaf4:	ec4e                	sd	s3,24(sp)
ffffffffc020aaf6:	89b6                	mv	s3,a3
ffffffffc020aaf8:	f822                	sd	s0,48(sp)
ffffffffc020aafa:	f04a                	sd	s2,32(sp)
ffffffffc020aafc:	e852                	sd	s4,16(sp)
ffffffffc020aafe:	fc06                	sd	ra,56(sp)
ffffffffc020ab00:	f426                	sd	s1,40(sp)
ffffffffc020ab02:	e456                	sd	s5,8(sp)
ffffffffc020ab04:	8a2a                	mv	s4,a0
ffffffffc020ab06:	892e                	mv	s2,a1
ffffffffc020ab08:	8432                	mv	s0,a2
ffffffffc020ab0a:	2e0000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020ab0e:	04098063          	beqz	s3,ffffffffc020ab4e <sfs_rblock+0x5c>
ffffffffc020ab12:	013409bb          	addw	s3,s0,s3
ffffffffc020ab16:	6a85                	lui	s5,0x1
ffffffffc020ab18:	a021                	j	ffffffffc020ab20 <sfs_rblock+0x2e>
ffffffffc020ab1a:	9956                	add	s2,s2,s5
ffffffffc020ab1c:	02898963          	beq	s3,s0,ffffffffc020ab4e <sfs_rblock+0x5c>
ffffffffc020ab20:	8622                	mv	a2,s0
ffffffffc020ab22:	85ca                	mv	a1,s2
ffffffffc020ab24:	4705                	li	a4,1
ffffffffc020ab26:	4681                	li	a3,0
ffffffffc020ab28:	8552                	mv	a0,s4
ffffffffc020ab2a:	f71ff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020ab2e:	84aa                	mv	s1,a0
ffffffffc020ab30:	2405                	addiw	s0,s0,1
ffffffffc020ab32:	d565                	beqz	a0,ffffffffc020ab1a <sfs_rblock+0x28>
ffffffffc020ab34:	8552                	mv	a0,s4
ffffffffc020ab36:	2c4000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020ab3a:	70e2                	ld	ra,56(sp)
ffffffffc020ab3c:	7442                	ld	s0,48(sp)
ffffffffc020ab3e:	7902                	ld	s2,32(sp)
ffffffffc020ab40:	69e2                	ld	s3,24(sp)
ffffffffc020ab42:	6a42                	ld	s4,16(sp)
ffffffffc020ab44:	6aa2                	ld	s5,8(sp)
ffffffffc020ab46:	8526                	mv	a0,s1
ffffffffc020ab48:	74a2                	ld	s1,40(sp)
ffffffffc020ab4a:	6121                	addi	sp,sp,64
ffffffffc020ab4c:	8082                	ret
ffffffffc020ab4e:	4481                	li	s1,0
ffffffffc020ab50:	b7d5                	j	ffffffffc020ab34 <sfs_rblock+0x42>

ffffffffc020ab52 <sfs_wblock>:
ffffffffc020ab52:	7139                	addi	sp,sp,-64
ffffffffc020ab54:	ec4e                	sd	s3,24(sp)
ffffffffc020ab56:	89b6                	mv	s3,a3
ffffffffc020ab58:	f822                	sd	s0,48(sp)
ffffffffc020ab5a:	f04a                	sd	s2,32(sp)
ffffffffc020ab5c:	e852                	sd	s4,16(sp)
ffffffffc020ab5e:	fc06                	sd	ra,56(sp)
ffffffffc020ab60:	f426                	sd	s1,40(sp)
ffffffffc020ab62:	e456                	sd	s5,8(sp)
ffffffffc020ab64:	8a2a                	mv	s4,a0
ffffffffc020ab66:	892e                	mv	s2,a1
ffffffffc020ab68:	8432                	mv	s0,a2
ffffffffc020ab6a:	280000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020ab6e:	04098063          	beqz	s3,ffffffffc020abae <sfs_wblock+0x5c>
ffffffffc020ab72:	013409bb          	addw	s3,s0,s3
ffffffffc020ab76:	6a85                	lui	s5,0x1
ffffffffc020ab78:	a021                	j	ffffffffc020ab80 <sfs_wblock+0x2e>
ffffffffc020ab7a:	9956                	add	s2,s2,s5
ffffffffc020ab7c:	02898963          	beq	s3,s0,ffffffffc020abae <sfs_wblock+0x5c>
ffffffffc020ab80:	8622                	mv	a2,s0
ffffffffc020ab82:	85ca                	mv	a1,s2
ffffffffc020ab84:	4705                	li	a4,1
ffffffffc020ab86:	4685                	li	a3,1
ffffffffc020ab88:	8552                	mv	a0,s4
ffffffffc020ab8a:	f11ff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020ab8e:	84aa                	mv	s1,a0
ffffffffc020ab90:	2405                	addiw	s0,s0,1
ffffffffc020ab92:	d565                	beqz	a0,ffffffffc020ab7a <sfs_wblock+0x28>
ffffffffc020ab94:	8552                	mv	a0,s4
ffffffffc020ab96:	264000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020ab9a:	70e2                	ld	ra,56(sp)
ffffffffc020ab9c:	7442                	ld	s0,48(sp)
ffffffffc020ab9e:	7902                	ld	s2,32(sp)
ffffffffc020aba0:	69e2                	ld	s3,24(sp)
ffffffffc020aba2:	6a42                	ld	s4,16(sp)
ffffffffc020aba4:	6aa2                	ld	s5,8(sp)
ffffffffc020aba6:	8526                	mv	a0,s1
ffffffffc020aba8:	74a2                	ld	s1,40(sp)
ffffffffc020abaa:	6121                	addi	sp,sp,64
ffffffffc020abac:	8082                	ret
ffffffffc020abae:	4481                	li	s1,0
ffffffffc020abb0:	b7d5                	j	ffffffffc020ab94 <sfs_wblock+0x42>

ffffffffc020abb2 <sfs_rbuf>:
ffffffffc020abb2:	7179                	addi	sp,sp,-48
ffffffffc020abb4:	f406                	sd	ra,40(sp)
ffffffffc020abb6:	f022                	sd	s0,32(sp)
ffffffffc020abb8:	ec26                	sd	s1,24(sp)
ffffffffc020abba:	e84a                	sd	s2,16(sp)
ffffffffc020abbc:	e44e                	sd	s3,8(sp)
ffffffffc020abbe:	e052                	sd	s4,0(sp)
ffffffffc020abc0:	6785                	lui	a5,0x1
ffffffffc020abc2:	04f77863          	bgeu	a4,a5,ffffffffc020ac12 <sfs_rbuf+0x60>
ffffffffc020abc6:	84ba                	mv	s1,a4
ffffffffc020abc8:	9732                	add	a4,a4,a2
ffffffffc020abca:	89b2                	mv	s3,a2
ffffffffc020abcc:	04e7e363          	bltu	a5,a4,ffffffffc020ac12 <sfs_rbuf+0x60>
ffffffffc020abd0:	8936                	mv	s2,a3
ffffffffc020abd2:	842a                	mv	s0,a0
ffffffffc020abd4:	8a2e                	mv	s4,a1
ffffffffc020abd6:	214000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020abda:	642c                	ld	a1,72(s0)
ffffffffc020abdc:	864a                	mv	a2,s2
ffffffffc020abde:	4705                	li	a4,1
ffffffffc020abe0:	4681                	li	a3,0
ffffffffc020abe2:	8522                	mv	a0,s0
ffffffffc020abe4:	eb7ff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020abe8:	892a                	mv	s2,a0
ffffffffc020abea:	cd09                	beqz	a0,ffffffffc020ac04 <sfs_rbuf+0x52>
ffffffffc020abec:	8522                	mv	a0,s0
ffffffffc020abee:	20c000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020abf2:	70a2                	ld	ra,40(sp)
ffffffffc020abf4:	7402                	ld	s0,32(sp)
ffffffffc020abf6:	64e2                	ld	s1,24(sp)
ffffffffc020abf8:	69a2                	ld	s3,8(sp)
ffffffffc020abfa:	6a02                	ld	s4,0(sp)
ffffffffc020abfc:	854a                	mv	a0,s2
ffffffffc020abfe:	6942                	ld	s2,16(sp)
ffffffffc020ac00:	6145                	addi	sp,sp,48
ffffffffc020ac02:	8082                	ret
ffffffffc020ac04:	642c                	ld	a1,72(s0)
ffffffffc020ac06:	864e                	mv	a2,s3
ffffffffc020ac08:	8552                	mv	a0,s4
ffffffffc020ac0a:	95a6                	add	a1,a1,s1
ffffffffc020ac0c:	77c000ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020ac10:	bff1                	j	ffffffffc020abec <sfs_rbuf+0x3a>
ffffffffc020ac12:	00004697          	auipc	a3,0x4
ffffffffc020ac16:	47e68693          	addi	a3,a3,1150 # ffffffffc020f090 <sfs_node_fileops+0xd0>
ffffffffc020ac1a:	00001617          	auipc	a2,0x1
ffffffffc020ac1e:	bfe60613          	addi	a2,a2,-1026 # ffffffffc020b818 <commands+0x210>
ffffffffc020ac22:	05500593          	li	a1,85
ffffffffc020ac26:	00004517          	auipc	a0,0x4
ffffffffc020ac2a:	45250513          	addi	a0,a0,1106 # ffffffffc020f078 <sfs_node_fileops+0xb8>
ffffffffc020ac2e:	871f50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020ac32 <sfs_wbuf>:
ffffffffc020ac32:	7139                	addi	sp,sp,-64
ffffffffc020ac34:	fc06                	sd	ra,56(sp)
ffffffffc020ac36:	f822                	sd	s0,48(sp)
ffffffffc020ac38:	f426                	sd	s1,40(sp)
ffffffffc020ac3a:	f04a                	sd	s2,32(sp)
ffffffffc020ac3c:	ec4e                	sd	s3,24(sp)
ffffffffc020ac3e:	e852                	sd	s4,16(sp)
ffffffffc020ac40:	e456                	sd	s5,8(sp)
ffffffffc020ac42:	6785                	lui	a5,0x1
ffffffffc020ac44:	06f77163          	bgeu	a4,a5,ffffffffc020aca6 <sfs_wbuf+0x74>
ffffffffc020ac48:	893a                	mv	s2,a4
ffffffffc020ac4a:	9732                	add	a4,a4,a2
ffffffffc020ac4c:	8a32                	mv	s4,a2
ffffffffc020ac4e:	04e7ec63          	bltu	a5,a4,ffffffffc020aca6 <sfs_wbuf+0x74>
ffffffffc020ac52:	842a                	mv	s0,a0
ffffffffc020ac54:	89b6                	mv	s3,a3
ffffffffc020ac56:	8aae                	mv	s5,a1
ffffffffc020ac58:	192000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020ac5c:	642c                	ld	a1,72(s0)
ffffffffc020ac5e:	4705                	li	a4,1
ffffffffc020ac60:	4681                	li	a3,0
ffffffffc020ac62:	864e                	mv	a2,s3
ffffffffc020ac64:	8522                	mv	a0,s0
ffffffffc020ac66:	e35ff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020ac6a:	84aa                	mv	s1,a0
ffffffffc020ac6c:	cd11                	beqz	a0,ffffffffc020ac88 <sfs_wbuf+0x56>
ffffffffc020ac6e:	8522                	mv	a0,s0
ffffffffc020ac70:	18a000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020ac74:	70e2                	ld	ra,56(sp)
ffffffffc020ac76:	7442                	ld	s0,48(sp)
ffffffffc020ac78:	7902                	ld	s2,32(sp)
ffffffffc020ac7a:	69e2                	ld	s3,24(sp)
ffffffffc020ac7c:	6a42                	ld	s4,16(sp)
ffffffffc020ac7e:	6aa2                	ld	s5,8(sp)
ffffffffc020ac80:	8526                	mv	a0,s1
ffffffffc020ac82:	74a2                	ld	s1,40(sp)
ffffffffc020ac84:	6121                	addi	sp,sp,64
ffffffffc020ac86:	8082                	ret
ffffffffc020ac88:	6428                	ld	a0,72(s0)
ffffffffc020ac8a:	8652                	mv	a2,s4
ffffffffc020ac8c:	85d6                	mv	a1,s5
ffffffffc020ac8e:	954a                	add	a0,a0,s2
ffffffffc020ac90:	6f8000ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020ac94:	642c                	ld	a1,72(s0)
ffffffffc020ac96:	4705                	li	a4,1
ffffffffc020ac98:	4685                	li	a3,1
ffffffffc020ac9a:	864e                	mv	a2,s3
ffffffffc020ac9c:	8522                	mv	a0,s0
ffffffffc020ac9e:	dfdff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020aca2:	84aa                	mv	s1,a0
ffffffffc020aca4:	b7e9                	j	ffffffffc020ac6e <sfs_wbuf+0x3c>
ffffffffc020aca6:	00004697          	auipc	a3,0x4
ffffffffc020acaa:	3ea68693          	addi	a3,a3,1002 # ffffffffc020f090 <sfs_node_fileops+0xd0>
ffffffffc020acae:	00001617          	auipc	a2,0x1
ffffffffc020acb2:	b6a60613          	addi	a2,a2,-1174 # ffffffffc020b818 <commands+0x210>
ffffffffc020acb6:	06b00593          	li	a1,107
ffffffffc020acba:	00004517          	auipc	a0,0x4
ffffffffc020acbe:	3be50513          	addi	a0,a0,958 # ffffffffc020f078 <sfs_node_fileops+0xb8>
ffffffffc020acc2:	fdcf50ef          	jal	ra,ffffffffc020049e <__panic>

ffffffffc020acc6 <sfs_sync_super>:
ffffffffc020acc6:	1101                	addi	sp,sp,-32
ffffffffc020acc8:	ec06                	sd	ra,24(sp)
ffffffffc020acca:	e822                	sd	s0,16(sp)
ffffffffc020accc:	e426                	sd	s1,8(sp)
ffffffffc020acce:	842a                	mv	s0,a0
ffffffffc020acd0:	11a000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020acd4:	6428                	ld	a0,72(s0)
ffffffffc020acd6:	6605                	lui	a2,0x1
ffffffffc020acd8:	4581                	li	a1,0
ffffffffc020acda:	65c000ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc020acde:	6428                	ld	a0,72(s0)
ffffffffc020ace0:	85a2                	mv	a1,s0
ffffffffc020ace2:	02c00613          	li	a2,44
ffffffffc020ace6:	6a2000ef          	jal	ra,ffffffffc020b388 <memcpy>
ffffffffc020acea:	642c                	ld	a1,72(s0)
ffffffffc020acec:	4701                	li	a4,0
ffffffffc020acee:	4685                	li	a3,1
ffffffffc020acf0:	4601                	li	a2,0
ffffffffc020acf2:	8522                	mv	a0,s0
ffffffffc020acf4:	da7ff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020acf8:	84aa                	mv	s1,a0
ffffffffc020acfa:	8522                	mv	a0,s0
ffffffffc020acfc:	0fe000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020ad00:	60e2                	ld	ra,24(sp)
ffffffffc020ad02:	6442                	ld	s0,16(sp)
ffffffffc020ad04:	8526                	mv	a0,s1
ffffffffc020ad06:	64a2                	ld	s1,8(sp)
ffffffffc020ad08:	6105                	addi	sp,sp,32
ffffffffc020ad0a:	8082                	ret

ffffffffc020ad0c <sfs_sync_freemap>:
ffffffffc020ad0c:	7139                	addi	sp,sp,-64
ffffffffc020ad0e:	ec4e                	sd	s3,24(sp)
ffffffffc020ad10:	e852                	sd	s4,16(sp)
ffffffffc020ad12:	00456983          	lwu	s3,4(a0)
ffffffffc020ad16:	8a2a                	mv	s4,a0
ffffffffc020ad18:	7d08                	ld	a0,56(a0)
ffffffffc020ad1a:	67a1                	lui	a5,0x8
ffffffffc020ad1c:	17fd                	addi	a5,a5,-1
ffffffffc020ad1e:	4581                	li	a1,0
ffffffffc020ad20:	f822                	sd	s0,48(sp)
ffffffffc020ad22:	fc06                	sd	ra,56(sp)
ffffffffc020ad24:	f426                	sd	s1,40(sp)
ffffffffc020ad26:	f04a                	sd	s2,32(sp)
ffffffffc020ad28:	e456                	sd	s5,8(sp)
ffffffffc020ad2a:	99be                	add	s3,s3,a5
ffffffffc020ad2c:	a1efe0ef          	jal	ra,ffffffffc0208f4a <bitmap_getdata>
ffffffffc020ad30:	00f9d993          	srli	s3,s3,0xf
ffffffffc020ad34:	842a                	mv	s0,a0
ffffffffc020ad36:	8552                	mv	a0,s4
ffffffffc020ad38:	0b2000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020ad3c:	04098163          	beqz	s3,ffffffffc020ad7e <sfs_sync_freemap+0x72>
ffffffffc020ad40:	09b2                	slli	s3,s3,0xc
ffffffffc020ad42:	99a2                	add	s3,s3,s0
ffffffffc020ad44:	4909                	li	s2,2
ffffffffc020ad46:	6a85                	lui	s5,0x1
ffffffffc020ad48:	a021                	j	ffffffffc020ad50 <sfs_sync_freemap+0x44>
ffffffffc020ad4a:	2905                	addiw	s2,s2,1
ffffffffc020ad4c:	02898963          	beq	s3,s0,ffffffffc020ad7e <sfs_sync_freemap+0x72>
ffffffffc020ad50:	85a2                	mv	a1,s0
ffffffffc020ad52:	864a                	mv	a2,s2
ffffffffc020ad54:	4705                	li	a4,1
ffffffffc020ad56:	4685                	li	a3,1
ffffffffc020ad58:	8552                	mv	a0,s4
ffffffffc020ad5a:	d41ff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020ad5e:	84aa                	mv	s1,a0
ffffffffc020ad60:	9456                	add	s0,s0,s5
ffffffffc020ad62:	d565                	beqz	a0,ffffffffc020ad4a <sfs_sync_freemap+0x3e>
ffffffffc020ad64:	8552                	mv	a0,s4
ffffffffc020ad66:	094000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020ad6a:	70e2                	ld	ra,56(sp)
ffffffffc020ad6c:	7442                	ld	s0,48(sp)
ffffffffc020ad6e:	7902                	ld	s2,32(sp)
ffffffffc020ad70:	69e2                	ld	s3,24(sp)
ffffffffc020ad72:	6a42                	ld	s4,16(sp)
ffffffffc020ad74:	6aa2                	ld	s5,8(sp)
ffffffffc020ad76:	8526                	mv	a0,s1
ffffffffc020ad78:	74a2                	ld	s1,40(sp)
ffffffffc020ad7a:	6121                	addi	sp,sp,64
ffffffffc020ad7c:	8082                	ret
ffffffffc020ad7e:	4481                	li	s1,0
ffffffffc020ad80:	b7d5                	j	ffffffffc020ad64 <sfs_sync_freemap+0x58>

ffffffffc020ad82 <sfs_clear_block>:
ffffffffc020ad82:	7179                	addi	sp,sp,-48
ffffffffc020ad84:	f022                	sd	s0,32(sp)
ffffffffc020ad86:	e84a                	sd	s2,16(sp)
ffffffffc020ad88:	e44e                	sd	s3,8(sp)
ffffffffc020ad8a:	f406                	sd	ra,40(sp)
ffffffffc020ad8c:	89b2                	mv	s3,a2
ffffffffc020ad8e:	ec26                	sd	s1,24(sp)
ffffffffc020ad90:	892a                	mv	s2,a0
ffffffffc020ad92:	842e                	mv	s0,a1
ffffffffc020ad94:	056000ef          	jal	ra,ffffffffc020adea <lock_sfs_io>
ffffffffc020ad98:	04893503          	ld	a0,72(s2)
ffffffffc020ad9c:	6605                	lui	a2,0x1
ffffffffc020ad9e:	4581                	li	a1,0
ffffffffc020ada0:	596000ef          	jal	ra,ffffffffc020b336 <memset>
ffffffffc020ada4:	02098d63          	beqz	s3,ffffffffc020adde <sfs_clear_block+0x5c>
ffffffffc020ada8:	013409bb          	addw	s3,s0,s3
ffffffffc020adac:	a019                	j	ffffffffc020adb2 <sfs_clear_block+0x30>
ffffffffc020adae:	02898863          	beq	s3,s0,ffffffffc020adde <sfs_clear_block+0x5c>
ffffffffc020adb2:	04893583          	ld	a1,72(s2)
ffffffffc020adb6:	8622                	mv	a2,s0
ffffffffc020adb8:	4705                	li	a4,1
ffffffffc020adba:	4685                	li	a3,1
ffffffffc020adbc:	854a                	mv	a0,s2
ffffffffc020adbe:	cddff0ef          	jal	ra,ffffffffc020aa9a <sfs_rwblock_nolock>
ffffffffc020adc2:	84aa                	mv	s1,a0
ffffffffc020adc4:	2405                	addiw	s0,s0,1
ffffffffc020adc6:	d565                	beqz	a0,ffffffffc020adae <sfs_clear_block+0x2c>
ffffffffc020adc8:	854a                	mv	a0,s2
ffffffffc020adca:	030000ef          	jal	ra,ffffffffc020adfa <unlock_sfs_io>
ffffffffc020adce:	70a2                	ld	ra,40(sp)
ffffffffc020add0:	7402                	ld	s0,32(sp)
ffffffffc020add2:	6942                	ld	s2,16(sp)
ffffffffc020add4:	69a2                	ld	s3,8(sp)
ffffffffc020add6:	8526                	mv	a0,s1
ffffffffc020add8:	64e2                	ld	s1,24(sp)
ffffffffc020adda:	6145                	addi	sp,sp,48
ffffffffc020addc:	8082                	ret
ffffffffc020adde:	4481                	li	s1,0
ffffffffc020ade0:	b7e5                	j	ffffffffc020adc8 <sfs_clear_block+0x46>

ffffffffc020ade2 <lock_sfs_fs>:
ffffffffc020ade2:	05050513          	addi	a0,a0,80
ffffffffc020ade6:	f8af906f          	j	ffffffffc0204570 <down>

ffffffffc020adea <lock_sfs_io>:
ffffffffc020adea:	06850513          	addi	a0,a0,104
ffffffffc020adee:	f82f906f          	j	ffffffffc0204570 <down>

ffffffffc020adf2 <unlock_sfs_fs>:
ffffffffc020adf2:	05050513          	addi	a0,a0,80
ffffffffc020adf6:	f76f906f          	j	ffffffffc020456c <up>

ffffffffc020adfa <unlock_sfs_io>:
ffffffffc020adfa:	06850513          	addi	a0,a0,104
ffffffffc020adfe:	f6ef906f          	j	ffffffffc020456c <up>

ffffffffc020ae02 <hash32>:
ffffffffc020ae02:	9e3707b7          	lui	a5,0x9e370
ffffffffc020ae06:	2785                	addiw	a5,a5,1
ffffffffc020ae08:	02a7853b          	mulw	a0,a5,a0
ffffffffc020ae0c:	02000793          	li	a5,32
ffffffffc020ae10:	9f8d                	subw	a5,a5,a1
ffffffffc020ae12:	00f5553b          	srlw	a0,a0,a5
ffffffffc020ae16:	8082                	ret

ffffffffc020ae18 <printnum>:
ffffffffc020ae18:	02071893          	slli	a7,a4,0x20
ffffffffc020ae1c:	7139                	addi	sp,sp,-64
ffffffffc020ae1e:	0208d893          	srli	a7,a7,0x20
ffffffffc020ae22:	e456                	sd	s5,8(sp)
ffffffffc020ae24:	0316fab3          	remu	s5,a3,a7
ffffffffc020ae28:	f822                	sd	s0,48(sp)
ffffffffc020ae2a:	f426                	sd	s1,40(sp)
ffffffffc020ae2c:	f04a                	sd	s2,32(sp)
ffffffffc020ae2e:	ec4e                	sd	s3,24(sp)
ffffffffc020ae30:	fc06                	sd	ra,56(sp)
ffffffffc020ae32:	e852                	sd	s4,16(sp)
ffffffffc020ae34:	84aa                	mv	s1,a0
ffffffffc020ae36:	89ae                	mv	s3,a1
ffffffffc020ae38:	8932                	mv	s2,a2
ffffffffc020ae3a:	fff7841b          	addiw	s0,a5,-1
ffffffffc020ae3e:	2a81                	sext.w	s5,s5
ffffffffc020ae40:	0516f163          	bgeu	a3,a7,ffffffffc020ae82 <printnum+0x6a>
ffffffffc020ae44:	8a42                	mv	s4,a6
ffffffffc020ae46:	00805863          	blez	s0,ffffffffc020ae56 <printnum+0x3e>
ffffffffc020ae4a:	347d                	addiw	s0,s0,-1
ffffffffc020ae4c:	864e                	mv	a2,s3
ffffffffc020ae4e:	85ca                	mv	a1,s2
ffffffffc020ae50:	8552                	mv	a0,s4
ffffffffc020ae52:	9482                	jalr	s1
ffffffffc020ae54:	f87d                	bnez	s0,ffffffffc020ae4a <printnum+0x32>
ffffffffc020ae56:	1a82                	slli	s5,s5,0x20
ffffffffc020ae58:	00004797          	auipc	a5,0x4
ffffffffc020ae5c:	28078793          	addi	a5,a5,640 # ffffffffc020f0d8 <sfs_node_fileops+0x118>
ffffffffc020ae60:	020ada93          	srli	s5,s5,0x20
ffffffffc020ae64:	9abe                	add	s5,s5,a5
ffffffffc020ae66:	7442                	ld	s0,48(sp)
ffffffffc020ae68:	000ac503          	lbu	a0,0(s5) # 1000 <_binary_bin_swap_img_size-0x6d00>
ffffffffc020ae6c:	70e2                	ld	ra,56(sp)
ffffffffc020ae6e:	6a42                	ld	s4,16(sp)
ffffffffc020ae70:	6aa2                	ld	s5,8(sp)
ffffffffc020ae72:	864e                	mv	a2,s3
ffffffffc020ae74:	85ca                	mv	a1,s2
ffffffffc020ae76:	69e2                	ld	s3,24(sp)
ffffffffc020ae78:	7902                	ld	s2,32(sp)
ffffffffc020ae7a:	87a6                	mv	a5,s1
ffffffffc020ae7c:	74a2                	ld	s1,40(sp)
ffffffffc020ae7e:	6121                	addi	sp,sp,64
ffffffffc020ae80:	8782                	jr	a5
ffffffffc020ae82:	0316d6b3          	divu	a3,a3,a7
ffffffffc020ae86:	87a2                	mv	a5,s0
ffffffffc020ae88:	f91ff0ef          	jal	ra,ffffffffc020ae18 <printnum>
ffffffffc020ae8c:	b7e9                	j	ffffffffc020ae56 <printnum+0x3e>

ffffffffc020ae8e <sprintputch>:
ffffffffc020ae8e:	499c                	lw	a5,16(a1)
ffffffffc020ae90:	6198                	ld	a4,0(a1)
ffffffffc020ae92:	6594                	ld	a3,8(a1)
ffffffffc020ae94:	2785                	addiw	a5,a5,1
ffffffffc020ae96:	c99c                	sw	a5,16(a1)
ffffffffc020ae98:	00d77763          	bgeu	a4,a3,ffffffffc020aea6 <sprintputch+0x18>
ffffffffc020ae9c:	00170793          	addi	a5,a4,1
ffffffffc020aea0:	e19c                	sd	a5,0(a1)
ffffffffc020aea2:	00a70023          	sb	a0,0(a4)
ffffffffc020aea6:	8082                	ret

ffffffffc020aea8 <vprintfmt>:
ffffffffc020aea8:	7119                	addi	sp,sp,-128
ffffffffc020aeaa:	f4a6                	sd	s1,104(sp)
ffffffffc020aeac:	f0ca                	sd	s2,96(sp)
ffffffffc020aeae:	ecce                	sd	s3,88(sp)
ffffffffc020aeb0:	e8d2                	sd	s4,80(sp)
ffffffffc020aeb2:	e4d6                	sd	s5,72(sp)
ffffffffc020aeb4:	e0da                	sd	s6,64(sp)
ffffffffc020aeb6:	fc5e                	sd	s7,56(sp)
ffffffffc020aeb8:	ec6e                	sd	s11,24(sp)
ffffffffc020aeba:	fc86                	sd	ra,120(sp)
ffffffffc020aebc:	f8a2                	sd	s0,112(sp)
ffffffffc020aebe:	f862                	sd	s8,48(sp)
ffffffffc020aec0:	f466                	sd	s9,40(sp)
ffffffffc020aec2:	f06a                	sd	s10,32(sp)
ffffffffc020aec4:	89aa                	mv	s3,a0
ffffffffc020aec6:	892e                	mv	s2,a1
ffffffffc020aec8:	84b2                	mv	s1,a2
ffffffffc020aeca:	8db6                	mv	s11,a3
ffffffffc020aecc:	8aba                	mv	s5,a4
ffffffffc020aece:	02500a13          	li	s4,37
ffffffffc020aed2:	5bfd                	li	s7,-1
ffffffffc020aed4:	00004b17          	auipc	s6,0x4
ffffffffc020aed8:	230b0b13          	addi	s6,s6,560 # ffffffffc020f104 <sfs_node_fileops+0x144>
ffffffffc020aedc:	000dc503          	lbu	a0,0(s11) # 2000 <_binary_bin_swap_img_size-0x5d00>
ffffffffc020aee0:	001d8413          	addi	s0,s11,1
ffffffffc020aee4:	01450b63          	beq	a0,s4,ffffffffc020aefa <vprintfmt+0x52>
ffffffffc020aee8:	c129                	beqz	a0,ffffffffc020af2a <vprintfmt+0x82>
ffffffffc020aeea:	864a                	mv	a2,s2
ffffffffc020aeec:	85a6                	mv	a1,s1
ffffffffc020aeee:	0405                	addi	s0,s0,1
ffffffffc020aef0:	9982                	jalr	s3
ffffffffc020aef2:	fff44503          	lbu	a0,-1(s0)
ffffffffc020aef6:	ff4519e3          	bne	a0,s4,ffffffffc020aee8 <vprintfmt+0x40>
ffffffffc020aefa:	00044583          	lbu	a1,0(s0)
ffffffffc020aefe:	02000813          	li	a6,32
ffffffffc020af02:	4d01                	li	s10,0
ffffffffc020af04:	4301                	li	t1,0
ffffffffc020af06:	5cfd                	li	s9,-1
ffffffffc020af08:	5c7d                	li	s8,-1
ffffffffc020af0a:	05500513          	li	a0,85
ffffffffc020af0e:	48a5                	li	a7,9
ffffffffc020af10:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020af14:	0ff67613          	zext.b	a2,a2
ffffffffc020af18:	00140d93          	addi	s11,s0,1
ffffffffc020af1c:	04c56263          	bltu	a0,a2,ffffffffc020af60 <vprintfmt+0xb8>
ffffffffc020af20:	060a                	slli	a2,a2,0x2
ffffffffc020af22:	965a                	add	a2,a2,s6
ffffffffc020af24:	4214                	lw	a3,0(a2)
ffffffffc020af26:	96da                	add	a3,a3,s6
ffffffffc020af28:	8682                	jr	a3
ffffffffc020af2a:	70e6                	ld	ra,120(sp)
ffffffffc020af2c:	7446                	ld	s0,112(sp)
ffffffffc020af2e:	74a6                	ld	s1,104(sp)
ffffffffc020af30:	7906                	ld	s2,96(sp)
ffffffffc020af32:	69e6                	ld	s3,88(sp)
ffffffffc020af34:	6a46                	ld	s4,80(sp)
ffffffffc020af36:	6aa6                	ld	s5,72(sp)
ffffffffc020af38:	6b06                	ld	s6,64(sp)
ffffffffc020af3a:	7be2                	ld	s7,56(sp)
ffffffffc020af3c:	7c42                	ld	s8,48(sp)
ffffffffc020af3e:	7ca2                	ld	s9,40(sp)
ffffffffc020af40:	7d02                	ld	s10,32(sp)
ffffffffc020af42:	6de2                	ld	s11,24(sp)
ffffffffc020af44:	6109                	addi	sp,sp,128
ffffffffc020af46:	8082                	ret
ffffffffc020af48:	882e                	mv	a6,a1
ffffffffc020af4a:	00144583          	lbu	a1,1(s0)
ffffffffc020af4e:	846e                	mv	s0,s11
ffffffffc020af50:	00140d93          	addi	s11,s0,1
ffffffffc020af54:	fdd5861b          	addiw	a2,a1,-35
ffffffffc020af58:	0ff67613          	zext.b	a2,a2
ffffffffc020af5c:	fcc572e3          	bgeu	a0,a2,ffffffffc020af20 <vprintfmt+0x78>
ffffffffc020af60:	864a                	mv	a2,s2
ffffffffc020af62:	85a6                	mv	a1,s1
ffffffffc020af64:	02500513          	li	a0,37
ffffffffc020af68:	9982                	jalr	s3
ffffffffc020af6a:	fff44783          	lbu	a5,-1(s0)
ffffffffc020af6e:	8da2                	mv	s11,s0
ffffffffc020af70:	f74786e3          	beq	a5,s4,ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020af74:	ffedc783          	lbu	a5,-2(s11)
ffffffffc020af78:	1dfd                	addi	s11,s11,-1
ffffffffc020af7a:	ff479de3          	bne	a5,s4,ffffffffc020af74 <vprintfmt+0xcc>
ffffffffc020af7e:	bfb9                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020af80:	fd058c9b          	addiw	s9,a1,-48
ffffffffc020af84:	00144583          	lbu	a1,1(s0)
ffffffffc020af88:	846e                	mv	s0,s11
ffffffffc020af8a:	fd05869b          	addiw	a3,a1,-48
ffffffffc020af8e:	0005861b          	sext.w	a2,a1
ffffffffc020af92:	02d8e463          	bltu	a7,a3,ffffffffc020afba <vprintfmt+0x112>
ffffffffc020af96:	00144583          	lbu	a1,1(s0)
ffffffffc020af9a:	002c969b          	slliw	a3,s9,0x2
ffffffffc020af9e:	0196873b          	addw	a4,a3,s9
ffffffffc020afa2:	0017171b          	slliw	a4,a4,0x1
ffffffffc020afa6:	9f31                	addw	a4,a4,a2
ffffffffc020afa8:	fd05869b          	addiw	a3,a1,-48
ffffffffc020afac:	0405                	addi	s0,s0,1
ffffffffc020afae:	fd070c9b          	addiw	s9,a4,-48
ffffffffc020afb2:	0005861b          	sext.w	a2,a1
ffffffffc020afb6:	fed8f0e3          	bgeu	a7,a3,ffffffffc020af96 <vprintfmt+0xee>
ffffffffc020afba:	f40c5be3          	bgez	s8,ffffffffc020af10 <vprintfmt+0x68>
ffffffffc020afbe:	8c66                	mv	s8,s9
ffffffffc020afc0:	5cfd                	li	s9,-1
ffffffffc020afc2:	b7b9                	j	ffffffffc020af10 <vprintfmt+0x68>
ffffffffc020afc4:	fffc4693          	not	a3,s8
ffffffffc020afc8:	96fd                	srai	a3,a3,0x3f
ffffffffc020afca:	00dc77b3          	and	a5,s8,a3
ffffffffc020afce:	00144583          	lbu	a1,1(s0)
ffffffffc020afd2:	00078c1b          	sext.w	s8,a5
ffffffffc020afd6:	846e                	mv	s0,s11
ffffffffc020afd8:	bf25                	j	ffffffffc020af10 <vprintfmt+0x68>
ffffffffc020afda:	000aac83          	lw	s9,0(s5)
ffffffffc020afde:	00144583          	lbu	a1,1(s0)
ffffffffc020afe2:	0aa1                	addi	s5,s5,8
ffffffffc020afe4:	846e                	mv	s0,s11
ffffffffc020afe6:	bfd1                	j	ffffffffc020afba <vprintfmt+0x112>
ffffffffc020afe8:	4705                	li	a4,1
ffffffffc020afea:	008a8613          	addi	a2,s5,8
ffffffffc020afee:	00674463          	blt	a4,t1,ffffffffc020aff6 <vprintfmt+0x14e>
ffffffffc020aff2:	1c030c63          	beqz	t1,ffffffffc020b1ca <vprintfmt+0x322>
ffffffffc020aff6:	000ab683          	ld	a3,0(s5)
ffffffffc020affa:	4741                	li	a4,16
ffffffffc020affc:	8ab2                	mv	s5,a2
ffffffffc020affe:	2801                	sext.w	a6,a6
ffffffffc020b000:	87e2                	mv	a5,s8
ffffffffc020b002:	8626                	mv	a2,s1
ffffffffc020b004:	85ca                	mv	a1,s2
ffffffffc020b006:	854e                	mv	a0,s3
ffffffffc020b008:	e11ff0ef          	jal	ra,ffffffffc020ae18 <printnum>
ffffffffc020b00c:	bdc1                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020b00e:	000aa503          	lw	a0,0(s5)
ffffffffc020b012:	864a                	mv	a2,s2
ffffffffc020b014:	85a6                	mv	a1,s1
ffffffffc020b016:	0aa1                	addi	s5,s5,8
ffffffffc020b018:	9982                	jalr	s3
ffffffffc020b01a:	b5c9                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020b01c:	4705                	li	a4,1
ffffffffc020b01e:	008a8613          	addi	a2,s5,8
ffffffffc020b022:	00674463          	blt	a4,t1,ffffffffc020b02a <vprintfmt+0x182>
ffffffffc020b026:	18030d63          	beqz	t1,ffffffffc020b1c0 <vprintfmt+0x318>
ffffffffc020b02a:	000ab683          	ld	a3,0(s5)
ffffffffc020b02e:	4729                	li	a4,10
ffffffffc020b030:	8ab2                	mv	s5,a2
ffffffffc020b032:	b7f1                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b034:	00144583          	lbu	a1,1(s0)
ffffffffc020b038:	4d05                	li	s10,1
ffffffffc020b03a:	846e                	mv	s0,s11
ffffffffc020b03c:	bdd1                	j	ffffffffc020af10 <vprintfmt+0x68>
ffffffffc020b03e:	864a                	mv	a2,s2
ffffffffc020b040:	85a6                	mv	a1,s1
ffffffffc020b042:	02500513          	li	a0,37
ffffffffc020b046:	9982                	jalr	s3
ffffffffc020b048:	bd51                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020b04a:	00144583          	lbu	a1,1(s0)
ffffffffc020b04e:	2305                	addiw	t1,t1,1
ffffffffc020b050:	846e                	mv	s0,s11
ffffffffc020b052:	bd7d                	j	ffffffffc020af10 <vprintfmt+0x68>
ffffffffc020b054:	4705                	li	a4,1
ffffffffc020b056:	008a8613          	addi	a2,s5,8
ffffffffc020b05a:	00674463          	blt	a4,t1,ffffffffc020b062 <vprintfmt+0x1ba>
ffffffffc020b05e:	14030c63          	beqz	t1,ffffffffc020b1b6 <vprintfmt+0x30e>
ffffffffc020b062:	000ab683          	ld	a3,0(s5)
ffffffffc020b066:	4721                	li	a4,8
ffffffffc020b068:	8ab2                	mv	s5,a2
ffffffffc020b06a:	bf51                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b06c:	03000513          	li	a0,48
ffffffffc020b070:	864a                	mv	a2,s2
ffffffffc020b072:	85a6                	mv	a1,s1
ffffffffc020b074:	e042                	sd	a6,0(sp)
ffffffffc020b076:	9982                	jalr	s3
ffffffffc020b078:	864a                	mv	a2,s2
ffffffffc020b07a:	85a6                	mv	a1,s1
ffffffffc020b07c:	07800513          	li	a0,120
ffffffffc020b080:	9982                	jalr	s3
ffffffffc020b082:	0aa1                	addi	s5,s5,8
ffffffffc020b084:	6802                	ld	a6,0(sp)
ffffffffc020b086:	4741                	li	a4,16
ffffffffc020b088:	ff8ab683          	ld	a3,-8(s5)
ffffffffc020b08c:	bf8d                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b08e:	000ab403          	ld	s0,0(s5)
ffffffffc020b092:	008a8793          	addi	a5,s5,8
ffffffffc020b096:	e03e                	sd	a5,0(sp)
ffffffffc020b098:	14040c63          	beqz	s0,ffffffffc020b1f0 <vprintfmt+0x348>
ffffffffc020b09c:	11805063          	blez	s8,ffffffffc020b19c <vprintfmt+0x2f4>
ffffffffc020b0a0:	02d00693          	li	a3,45
ffffffffc020b0a4:	0cd81963          	bne	a6,a3,ffffffffc020b176 <vprintfmt+0x2ce>
ffffffffc020b0a8:	00044683          	lbu	a3,0(s0)
ffffffffc020b0ac:	0006851b          	sext.w	a0,a3
ffffffffc020b0b0:	ce8d                	beqz	a3,ffffffffc020b0ea <vprintfmt+0x242>
ffffffffc020b0b2:	00140a93          	addi	s5,s0,1
ffffffffc020b0b6:	05e00413          	li	s0,94
ffffffffc020b0ba:	000cc563          	bltz	s9,ffffffffc020b0c4 <vprintfmt+0x21c>
ffffffffc020b0be:	3cfd                	addiw	s9,s9,-1
ffffffffc020b0c0:	037c8363          	beq	s9,s7,ffffffffc020b0e6 <vprintfmt+0x23e>
ffffffffc020b0c4:	864a                	mv	a2,s2
ffffffffc020b0c6:	85a6                	mv	a1,s1
ffffffffc020b0c8:	100d0663          	beqz	s10,ffffffffc020b1d4 <vprintfmt+0x32c>
ffffffffc020b0cc:	3681                	addiw	a3,a3,-32
ffffffffc020b0ce:	10d47363          	bgeu	s0,a3,ffffffffc020b1d4 <vprintfmt+0x32c>
ffffffffc020b0d2:	03f00513          	li	a0,63
ffffffffc020b0d6:	9982                	jalr	s3
ffffffffc020b0d8:	000ac683          	lbu	a3,0(s5)
ffffffffc020b0dc:	3c7d                	addiw	s8,s8,-1
ffffffffc020b0de:	0a85                	addi	s5,s5,1
ffffffffc020b0e0:	0006851b          	sext.w	a0,a3
ffffffffc020b0e4:	faf9                	bnez	a3,ffffffffc020b0ba <vprintfmt+0x212>
ffffffffc020b0e6:	01805a63          	blez	s8,ffffffffc020b0fa <vprintfmt+0x252>
ffffffffc020b0ea:	3c7d                	addiw	s8,s8,-1
ffffffffc020b0ec:	864a                	mv	a2,s2
ffffffffc020b0ee:	85a6                	mv	a1,s1
ffffffffc020b0f0:	02000513          	li	a0,32
ffffffffc020b0f4:	9982                	jalr	s3
ffffffffc020b0f6:	fe0c1ae3          	bnez	s8,ffffffffc020b0ea <vprintfmt+0x242>
ffffffffc020b0fa:	6a82                	ld	s5,0(sp)
ffffffffc020b0fc:	b3c5                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020b0fe:	4705                	li	a4,1
ffffffffc020b100:	008a8d13          	addi	s10,s5,8
ffffffffc020b104:	00674463          	blt	a4,t1,ffffffffc020b10c <vprintfmt+0x264>
ffffffffc020b108:	0a030463          	beqz	t1,ffffffffc020b1b0 <vprintfmt+0x308>
ffffffffc020b10c:	000ab403          	ld	s0,0(s5)
ffffffffc020b110:	0c044463          	bltz	s0,ffffffffc020b1d8 <vprintfmt+0x330>
ffffffffc020b114:	86a2                	mv	a3,s0
ffffffffc020b116:	8aea                	mv	s5,s10
ffffffffc020b118:	4729                	li	a4,10
ffffffffc020b11a:	b5d5                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b11c:	000aa783          	lw	a5,0(s5)
ffffffffc020b120:	46e1                	li	a3,24
ffffffffc020b122:	0aa1                	addi	s5,s5,8
ffffffffc020b124:	41f7d71b          	sraiw	a4,a5,0x1f
ffffffffc020b128:	8fb9                	xor	a5,a5,a4
ffffffffc020b12a:	40e7873b          	subw	a4,a5,a4
ffffffffc020b12e:	02e6c663          	blt	a3,a4,ffffffffc020b15a <vprintfmt+0x2b2>
ffffffffc020b132:	00371793          	slli	a5,a4,0x3
ffffffffc020b136:	00004697          	auipc	a3,0x4
ffffffffc020b13a:	30268693          	addi	a3,a3,770 # ffffffffc020f438 <error_string>
ffffffffc020b13e:	97b6                	add	a5,a5,a3
ffffffffc020b140:	639c                	ld	a5,0(a5)
ffffffffc020b142:	cf81                	beqz	a5,ffffffffc020b15a <vprintfmt+0x2b2>
ffffffffc020b144:	873e                	mv	a4,a5
ffffffffc020b146:	00000697          	auipc	a3,0x0
ffffffffc020b14a:	28268693          	addi	a3,a3,642 # ffffffffc020b3c8 <etext+0x28>
ffffffffc020b14e:	8626                	mv	a2,s1
ffffffffc020b150:	85ca                	mv	a1,s2
ffffffffc020b152:	854e                	mv	a0,s3
ffffffffc020b154:	0d4000ef          	jal	ra,ffffffffc020b228 <printfmt>
ffffffffc020b158:	b351                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020b15a:	00004697          	auipc	a3,0x4
ffffffffc020b15e:	f9e68693          	addi	a3,a3,-98 # ffffffffc020f0f8 <sfs_node_fileops+0x138>
ffffffffc020b162:	8626                	mv	a2,s1
ffffffffc020b164:	85ca                	mv	a1,s2
ffffffffc020b166:	854e                	mv	a0,s3
ffffffffc020b168:	0c0000ef          	jal	ra,ffffffffc020b228 <printfmt>
ffffffffc020b16c:	bb85                	j	ffffffffc020aedc <vprintfmt+0x34>
ffffffffc020b16e:	00004417          	auipc	s0,0x4
ffffffffc020b172:	f8240413          	addi	s0,s0,-126 # ffffffffc020f0f0 <sfs_node_fileops+0x130>
ffffffffc020b176:	85e6                	mv	a1,s9
ffffffffc020b178:	8522                	mv	a0,s0
ffffffffc020b17a:	e442                	sd	a6,8(sp)
ffffffffc020b17c:	132000ef          	jal	ra,ffffffffc020b2ae <strnlen>
ffffffffc020b180:	40ac0c3b          	subw	s8,s8,a0
ffffffffc020b184:	01805c63          	blez	s8,ffffffffc020b19c <vprintfmt+0x2f4>
ffffffffc020b188:	6822                	ld	a6,8(sp)
ffffffffc020b18a:	00080a9b          	sext.w	s5,a6
ffffffffc020b18e:	3c7d                	addiw	s8,s8,-1
ffffffffc020b190:	864a                	mv	a2,s2
ffffffffc020b192:	85a6                	mv	a1,s1
ffffffffc020b194:	8556                	mv	a0,s5
ffffffffc020b196:	9982                	jalr	s3
ffffffffc020b198:	fe0c1be3          	bnez	s8,ffffffffc020b18e <vprintfmt+0x2e6>
ffffffffc020b19c:	00044683          	lbu	a3,0(s0)
ffffffffc020b1a0:	00140a93          	addi	s5,s0,1
ffffffffc020b1a4:	0006851b          	sext.w	a0,a3
ffffffffc020b1a8:	daa9                	beqz	a3,ffffffffc020b0fa <vprintfmt+0x252>
ffffffffc020b1aa:	05e00413          	li	s0,94
ffffffffc020b1ae:	b731                	j	ffffffffc020b0ba <vprintfmt+0x212>
ffffffffc020b1b0:	000aa403          	lw	s0,0(s5)
ffffffffc020b1b4:	bfb1                	j	ffffffffc020b110 <vprintfmt+0x268>
ffffffffc020b1b6:	000ae683          	lwu	a3,0(s5)
ffffffffc020b1ba:	4721                	li	a4,8
ffffffffc020b1bc:	8ab2                	mv	s5,a2
ffffffffc020b1be:	b581                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b1c0:	000ae683          	lwu	a3,0(s5)
ffffffffc020b1c4:	4729                	li	a4,10
ffffffffc020b1c6:	8ab2                	mv	s5,a2
ffffffffc020b1c8:	bd1d                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b1ca:	000ae683          	lwu	a3,0(s5)
ffffffffc020b1ce:	4741                	li	a4,16
ffffffffc020b1d0:	8ab2                	mv	s5,a2
ffffffffc020b1d2:	b535                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b1d4:	9982                	jalr	s3
ffffffffc020b1d6:	b709                	j	ffffffffc020b0d8 <vprintfmt+0x230>
ffffffffc020b1d8:	864a                	mv	a2,s2
ffffffffc020b1da:	85a6                	mv	a1,s1
ffffffffc020b1dc:	02d00513          	li	a0,45
ffffffffc020b1e0:	e042                	sd	a6,0(sp)
ffffffffc020b1e2:	9982                	jalr	s3
ffffffffc020b1e4:	6802                	ld	a6,0(sp)
ffffffffc020b1e6:	8aea                	mv	s5,s10
ffffffffc020b1e8:	408006b3          	neg	a3,s0
ffffffffc020b1ec:	4729                	li	a4,10
ffffffffc020b1ee:	bd01                	j	ffffffffc020affe <vprintfmt+0x156>
ffffffffc020b1f0:	03805163          	blez	s8,ffffffffc020b212 <vprintfmt+0x36a>
ffffffffc020b1f4:	02d00693          	li	a3,45
ffffffffc020b1f8:	f6d81be3          	bne	a6,a3,ffffffffc020b16e <vprintfmt+0x2c6>
ffffffffc020b1fc:	00004417          	auipc	s0,0x4
ffffffffc020b200:	ef440413          	addi	s0,s0,-268 # ffffffffc020f0f0 <sfs_node_fileops+0x130>
ffffffffc020b204:	02800693          	li	a3,40
ffffffffc020b208:	02800513          	li	a0,40
ffffffffc020b20c:	00140a93          	addi	s5,s0,1
ffffffffc020b210:	b55d                	j	ffffffffc020b0b6 <vprintfmt+0x20e>
ffffffffc020b212:	00004a97          	auipc	s5,0x4
ffffffffc020b216:	edfa8a93          	addi	s5,s5,-289 # ffffffffc020f0f1 <sfs_node_fileops+0x131>
ffffffffc020b21a:	02800513          	li	a0,40
ffffffffc020b21e:	02800693          	li	a3,40
ffffffffc020b222:	05e00413          	li	s0,94
ffffffffc020b226:	bd51                	j	ffffffffc020b0ba <vprintfmt+0x212>

ffffffffc020b228 <printfmt>:
ffffffffc020b228:	7139                	addi	sp,sp,-64
ffffffffc020b22a:	02010313          	addi	t1,sp,32
ffffffffc020b22e:	f03a                	sd	a4,32(sp)
ffffffffc020b230:	871a                	mv	a4,t1
ffffffffc020b232:	ec06                	sd	ra,24(sp)
ffffffffc020b234:	f43e                	sd	a5,40(sp)
ffffffffc020b236:	f842                	sd	a6,48(sp)
ffffffffc020b238:	fc46                	sd	a7,56(sp)
ffffffffc020b23a:	e41a                	sd	t1,8(sp)
ffffffffc020b23c:	c6dff0ef          	jal	ra,ffffffffc020aea8 <vprintfmt>
ffffffffc020b240:	60e2                	ld	ra,24(sp)
ffffffffc020b242:	6121                	addi	sp,sp,64
ffffffffc020b244:	8082                	ret

ffffffffc020b246 <snprintf>:
ffffffffc020b246:	711d                	addi	sp,sp,-96
ffffffffc020b248:	15fd                	addi	a1,a1,-1
ffffffffc020b24a:	03810313          	addi	t1,sp,56
ffffffffc020b24e:	95aa                	add	a1,a1,a0
ffffffffc020b250:	f406                	sd	ra,40(sp)
ffffffffc020b252:	fc36                	sd	a3,56(sp)
ffffffffc020b254:	e0ba                	sd	a4,64(sp)
ffffffffc020b256:	e4be                	sd	a5,72(sp)
ffffffffc020b258:	e8c2                	sd	a6,80(sp)
ffffffffc020b25a:	ecc6                	sd	a7,88(sp)
ffffffffc020b25c:	e01a                	sd	t1,0(sp)
ffffffffc020b25e:	e42a                	sd	a0,8(sp)
ffffffffc020b260:	e82e                	sd	a1,16(sp)
ffffffffc020b262:	cc02                	sw	zero,24(sp)
ffffffffc020b264:	c515                	beqz	a0,ffffffffc020b290 <snprintf+0x4a>
ffffffffc020b266:	02a5e563          	bltu	a1,a0,ffffffffc020b290 <snprintf+0x4a>
ffffffffc020b26a:	75dd                	lui	a1,0xffff7
ffffffffc020b26c:	86b2                	mv	a3,a2
ffffffffc020b26e:	00000517          	auipc	a0,0x0
ffffffffc020b272:	c2050513          	addi	a0,a0,-992 # ffffffffc020ae8e <sprintputch>
ffffffffc020b276:	871a                	mv	a4,t1
ffffffffc020b278:	0030                	addi	a2,sp,8
ffffffffc020b27a:	ad958593          	addi	a1,a1,-1319 # ffffffffffff6ad9 <end+0x3fd601c9>
ffffffffc020b27e:	c2bff0ef          	jal	ra,ffffffffc020aea8 <vprintfmt>
ffffffffc020b282:	67a2                	ld	a5,8(sp)
ffffffffc020b284:	00078023          	sb	zero,0(a5)
ffffffffc020b288:	4562                	lw	a0,24(sp)
ffffffffc020b28a:	70a2                	ld	ra,40(sp)
ffffffffc020b28c:	6125                	addi	sp,sp,96
ffffffffc020b28e:	8082                	ret
ffffffffc020b290:	5575                	li	a0,-3
ffffffffc020b292:	bfe5                	j	ffffffffc020b28a <snprintf+0x44>

ffffffffc020b294 <strlen>:
ffffffffc020b294:	00054783          	lbu	a5,0(a0)
ffffffffc020b298:	872a                	mv	a4,a0
ffffffffc020b29a:	4501                	li	a0,0
ffffffffc020b29c:	cb81                	beqz	a5,ffffffffc020b2ac <strlen+0x18>
ffffffffc020b29e:	0505                	addi	a0,a0,1
ffffffffc020b2a0:	00a707b3          	add	a5,a4,a0
ffffffffc020b2a4:	0007c783          	lbu	a5,0(a5)
ffffffffc020b2a8:	fbfd                	bnez	a5,ffffffffc020b29e <strlen+0xa>
ffffffffc020b2aa:	8082                	ret
ffffffffc020b2ac:	8082                	ret

ffffffffc020b2ae <strnlen>:
ffffffffc020b2ae:	4781                	li	a5,0
ffffffffc020b2b0:	e589                	bnez	a1,ffffffffc020b2ba <strnlen+0xc>
ffffffffc020b2b2:	a811                	j	ffffffffc020b2c6 <strnlen+0x18>
ffffffffc020b2b4:	0785                	addi	a5,a5,1
ffffffffc020b2b6:	00f58863          	beq	a1,a5,ffffffffc020b2c6 <strnlen+0x18>
ffffffffc020b2ba:	00f50733          	add	a4,a0,a5
ffffffffc020b2be:	00074703          	lbu	a4,0(a4)
ffffffffc020b2c2:	fb6d                	bnez	a4,ffffffffc020b2b4 <strnlen+0x6>
ffffffffc020b2c4:	85be                	mv	a1,a5
ffffffffc020b2c6:	852e                	mv	a0,a1
ffffffffc020b2c8:	8082                	ret

ffffffffc020b2ca <strcpy>:
ffffffffc020b2ca:	87aa                	mv	a5,a0
ffffffffc020b2cc:	0005c703          	lbu	a4,0(a1)
ffffffffc020b2d0:	0785                	addi	a5,a5,1
ffffffffc020b2d2:	0585                	addi	a1,a1,1
ffffffffc020b2d4:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b2d8:	fb75                	bnez	a4,ffffffffc020b2cc <strcpy+0x2>
ffffffffc020b2da:	8082                	ret

ffffffffc020b2dc <strcmp>:
ffffffffc020b2dc:	00054783          	lbu	a5,0(a0)
ffffffffc020b2e0:	0005c703          	lbu	a4,0(a1)
ffffffffc020b2e4:	cb89                	beqz	a5,ffffffffc020b2f6 <strcmp+0x1a>
ffffffffc020b2e6:	0505                	addi	a0,a0,1
ffffffffc020b2e8:	0585                	addi	a1,a1,1
ffffffffc020b2ea:	fee789e3          	beq	a5,a4,ffffffffc020b2dc <strcmp>
ffffffffc020b2ee:	0007851b          	sext.w	a0,a5
ffffffffc020b2f2:	9d19                	subw	a0,a0,a4
ffffffffc020b2f4:	8082                	ret
ffffffffc020b2f6:	4501                	li	a0,0
ffffffffc020b2f8:	bfed                	j	ffffffffc020b2f2 <strcmp+0x16>

ffffffffc020b2fa <strncmp>:
ffffffffc020b2fa:	c20d                	beqz	a2,ffffffffc020b31c <strncmp+0x22>
ffffffffc020b2fc:	962e                	add	a2,a2,a1
ffffffffc020b2fe:	a031                	j	ffffffffc020b30a <strncmp+0x10>
ffffffffc020b300:	0505                	addi	a0,a0,1
ffffffffc020b302:	00e79a63          	bne	a5,a4,ffffffffc020b316 <strncmp+0x1c>
ffffffffc020b306:	00b60b63          	beq	a2,a1,ffffffffc020b31c <strncmp+0x22>
ffffffffc020b30a:	00054783          	lbu	a5,0(a0)
ffffffffc020b30e:	0585                	addi	a1,a1,1
ffffffffc020b310:	fff5c703          	lbu	a4,-1(a1)
ffffffffc020b314:	f7f5                	bnez	a5,ffffffffc020b300 <strncmp+0x6>
ffffffffc020b316:	40e7853b          	subw	a0,a5,a4
ffffffffc020b31a:	8082                	ret
ffffffffc020b31c:	4501                	li	a0,0
ffffffffc020b31e:	8082                	ret

ffffffffc020b320 <strchr>:
ffffffffc020b320:	00054783          	lbu	a5,0(a0)
ffffffffc020b324:	c799                	beqz	a5,ffffffffc020b332 <strchr+0x12>
ffffffffc020b326:	00f58763          	beq	a1,a5,ffffffffc020b334 <strchr+0x14>
ffffffffc020b32a:	00154783          	lbu	a5,1(a0)
ffffffffc020b32e:	0505                	addi	a0,a0,1
ffffffffc020b330:	fbfd                	bnez	a5,ffffffffc020b326 <strchr+0x6>
ffffffffc020b332:	4501                	li	a0,0
ffffffffc020b334:	8082                	ret

ffffffffc020b336 <memset>:
ffffffffc020b336:	ca01                	beqz	a2,ffffffffc020b346 <memset+0x10>
ffffffffc020b338:	962a                	add	a2,a2,a0
ffffffffc020b33a:	87aa                	mv	a5,a0
ffffffffc020b33c:	0785                	addi	a5,a5,1
ffffffffc020b33e:	feb78fa3          	sb	a1,-1(a5)
ffffffffc020b342:	fec79de3          	bne	a5,a2,ffffffffc020b33c <memset+0x6>
ffffffffc020b346:	8082                	ret

ffffffffc020b348 <memmove>:
ffffffffc020b348:	02a5f263          	bgeu	a1,a0,ffffffffc020b36c <memmove+0x24>
ffffffffc020b34c:	00c587b3          	add	a5,a1,a2
ffffffffc020b350:	00f57e63          	bgeu	a0,a5,ffffffffc020b36c <memmove+0x24>
ffffffffc020b354:	00c50733          	add	a4,a0,a2
ffffffffc020b358:	c615                	beqz	a2,ffffffffc020b384 <memmove+0x3c>
ffffffffc020b35a:	fff7c683          	lbu	a3,-1(a5)
ffffffffc020b35e:	17fd                	addi	a5,a5,-1
ffffffffc020b360:	177d                	addi	a4,a4,-1
ffffffffc020b362:	00d70023          	sb	a3,0(a4)
ffffffffc020b366:	fef59ae3          	bne	a1,a5,ffffffffc020b35a <memmove+0x12>
ffffffffc020b36a:	8082                	ret
ffffffffc020b36c:	00c586b3          	add	a3,a1,a2
ffffffffc020b370:	87aa                	mv	a5,a0
ffffffffc020b372:	ca11                	beqz	a2,ffffffffc020b386 <memmove+0x3e>
ffffffffc020b374:	0005c703          	lbu	a4,0(a1)
ffffffffc020b378:	0585                	addi	a1,a1,1
ffffffffc020b37a:	0785                	addi	a5,a5,1
ffffffffc020b37c:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b380:	fed59ae3          	bne	a1,a3,ffffffffc020b374 <memmove+0x2c>
ffffffffc020b384:	8082                	ret
ffffffffc020b386:	8082                	ret

ffffffffc020b388 <memcpy>:
ffffffffc020b388:	ca19                	beqz	a2,ffffffffc020b39e <memcpy+0x16>
ffffffffc020b38a:	962e                	add	a2,a2,a1
ffffffffc020b38c:	87aa                	mv	a5,a0
ffffffffc020b38e:	0005c703          	lbu	a4,0(a1)
ffffffffc020b392:	0585                	addi	a1,a1,1
ffffffffc020b394:	0785                	addi	a5,a5,1
ffffffffc020b396:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020b39a:	fec59ae3          	bne	a1,a2,ffffffffc020b38e <memcpy+0x6>
ffffffffc020b39e:	8082                	ret
