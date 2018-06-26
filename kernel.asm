
kernel:     formato del fichero elf32-i386


Desensamblado de la sección .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp
8010002d:	b8 60 2e 10 80       	mov    $0x80102e60,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 60 6f 10 80       	push   $0x80106f60
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 e5 41 00 00       	call   80104240 <initlock>
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
80100092:	68 67 6f 10 80       	push   $0x80106f67
80100097:	50                   	push   %eax
80100098:	e8 93 40 00 00       	call   80104130 <initsleeplock>
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 57 42 00 00       	call   80104340 <acquire>
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 f9 42 00 00       	call   80104460 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 fe 3f 00 00       	call   80104170 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 6d 1f 00 00       	call   801020f0 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 6e 6f 10 80       	push   $0x80106f6e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 5d 40 00 00       	call   80104210 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 27 1f 00 00       	jmp    801020f0 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 7f 6f 10 80       	push   $0x80106f7f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 1c 40 00 00       	call   80104210 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 cc 3f 00 00       	call   801041d0 <releasesleep>
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 30 41 00 00       	call   80104340 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 ff 41 00 00       	jmp    80104460 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 86 6f 10 80       	push   $0x80106f86
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 cb 14 00 00       	call   80101750 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 af 40 00 00       	call   80104340 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(myproc()->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 ce 3a 00 00       	call   80103d90 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(myproc()->killed){
801002d2:	e8 c9 34 00 00       	call   801037a0 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 a5 10 80       	push   $0x8010a520
801002e6:	e8 75 41 00 00       	call   80104460 <release>
        ilock(ip);
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 7d 13 00 00       	call   80101670 <ilock>
        return -1;
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 15 41 00 00       	call   80104460 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 1d 13 00 00       	call   80101670 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
80100379:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100380:	00 00 00 
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
  uint pcs[10];

  cli();
  cons.locking = 0;
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
80100389:	e8 62 23 00 00       	call   801026f0 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 8d 6f 10 80       	push   $0x80106f8d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a5:	c7 04 24 d7 78 10 80 	movl   $0x801078d7,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 a3 3e 00 00       	call   80104260 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 a1 6f 10 80       	push   $0x80106fa1
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
  // use lapiccpunum so that we can call panic from mycpu()
  cprintf("lapicid %d: panic: ", lapicid());
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003d9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 01 57 00 00       	call   80105b20 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 48 56 00 00       	call   80105b20 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 3c 56 00 00       	call   80105b20 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 30 56 00 00       	call   80105b20 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 47 40 00 00       	call   80104560 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 82 3f 00 00       	call   801044b0 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 a5 6f 10 80       	push   $0x80106fa5
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 d0 6f 10 80 	movzbl -0x7fef9030(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 3c 11 00 00       	call   80101750 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 20 3d 00 00       	call   80104340 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 14 3e 00 00       	call   80104460 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 1b 10 00 00       	call   80101670 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 4e 3d 00 00       	call   80104460 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 b8 6f 10 80       	mov    $0x80106fb8,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 73 3b 00 00       	call   80104340 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 bf 6f 10 80       	push   $0x80106fbf
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 38 3b 00 00       	call   80104340 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 f3 3b 00 00       	call   80104460 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 45 36 00 00       	call   80103f40 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 b4 36 00 00       	jmp    80104030 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 c8 6f 10 80       	push   $0x80106fc8
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 8b 38 00 00       	call   80104240 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  ioapicenable(IRQ_KBD, 0);
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bb:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c2:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c5:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cc:	02 10 80 
  cons.locking = 1;
801009cf:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d6:	00 00 00 

  ioapicenable(IRQ_KBD, 0);
801009d9:	e8 c2 18 00 00       	call   801022a0 <ioapicenable>
}
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
#include "x86.h"
#include "elf.h"

int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  uint argc, sz, sp, ustack[3+MAXARG+1];
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;
  struct proc *curproc = myproc();
801009fc:	e8 9f 2d 00 00       	call   801037a0 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)

  begin_op();
80100a07:	e8 44 21 00 00       	call   80102b50 <begin_op>

  if((ip = namei(path)) == 0){
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 a9 14 00 00       	call   80101ec0 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 9c 01 00 00    	je     80100bbe <exec+0x1ce>
    end_op();
    cprintf("exec: fail\n");
    return -1;
  }
  ilock(ip);
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 43 0c 00 00       	call   80101670 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 12 0f 00 00       	call   80101950 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 b1 0e 00 00       	call   80101900 <iunlockput>
    end_op();
80100a4f:	e8 6c 21 00 00       	call   80102bc0 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) != sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a74:	e8 37 62 00 00       	call   80106cb0 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 83 0e 00 00       	call   80101950 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
      continue;
    if(ph.memsz < ph.filesz)
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 f7 5f 00 00       	call   80106b00 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 01 5f 00 00       	call   80106a40 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 d2 60 00 00       	call   80106c30 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 91 0d 00 00       	call   80101900 <iunlockput>
  end_op();
80100b6f:	e8 4c 20 00 00       	call   80102bc0 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b7a:	83 c4 0c             	add    $0xc,%esp
  end_op();
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
80100b7d:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b82:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b87:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b8d:	52                   	push   %edx
80100b8e:	50                   	push   %eax
80100b8f:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b95:	e8 66 5f 00 00       	call   80106b00 <allocuvm>
80100b9a:	83 c4 10             	add    $0x10,%esp
80100b9d:	85 c0                	test   %eax,%eax
80100b9f:	89 c6                	mov    %eax,%esi
80100ba1:	75 3a                	jne    80100bdd <exec+0x1ed>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100ba3:	83 ec 0c             	sub    $0xc,%esp
80100ba6:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bac:	e8 7f 60 00 00       	call   80106c30 <freevm>
80100bb1:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bb4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb9:	e9 9e fe ff ff       	jmp    80100a5c <exec+0x6c>
  struct proc *curproc = myproc();

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bbe:	e8 fd 1f 00 00       	call   80102bc0 <end_op>
    cprintf("exec: fail\n");
80100bc3:	83 ec 0c             	sub    $0xc,%esp
80100bc6:	68 e1 6f 10 80       	push   $0x80106fe1
80100bcb:	e8 90 fa ff ff       	call   80100660 <cprintf>
    return -1;
80100bd0:	83 c4 10             	add    $0x10,%esp
80100bd3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bd8:	e9 7f fe ff ff       	jmp    80100a5c <exec+0x6c>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bdd:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100be3:	83 ec 08             	sub    $0x8,%esp
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100be6:	31 ff                	xor    %edi,%edi
80100be8:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bea:	50                   	push   %eax
80100beb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bf1:	e8 5a 61 00 00       	call   80106d50 <clearpteu>
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bf6:	8b 45 0c             	mov    0xc(%ebp),%eax
80100bf9:	83 c4 10             	add    $0x10,%esp
80100bfc:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c02:	8b 00                	mov    (%eax),%eax
80100c04:	85 c0                	test   %eax,%eax
80100c06:	74 79                	je     80100c81 <exec+0x291>
80100c08:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c0e:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c14:	eb 13                	jmp    80100c29 <exec+0x239>
80100c16:	8d 76 00             	lea    0x0(%esi),%esi
80100c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(argc >= MAXARG)
80100c20:	83 ff 20             	cmp    $0x20,%edi
80100c23:	0f 84 7a ff ff ff    	je     80100ba3 <exec+0x1b3>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c29:	83 ec 0c             	sub    $0xc,%esp
80100c2c:	50                   	push   %eax
80100c2d:	e8 be 3a 00 00       	call   801046f0 <strlen>
80100c32:	f7 d0                	not    %eax
80100c34:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c36:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c39:	5a                   	pop    %edx

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c3a:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c3d:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c40:	e8 ab 3a 00 00       	call   801046f0 <strlen>
80100c45:	83 c0 01             	add    $0x1,%eax
80100c48:	50                   	push   %eax
80100c49:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c4c:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4f:	53                   	push   %ebx
80100c50:	56                   	push   %esi
80100c51:	e8 5a 62 00 00       	call   80106eb0 <copyout>
80100c56:	83 c4 20             	add    $0x20,%esp
80100c59:	85 c0                	test   %eax,%eax
80100c5b:	0f 88 42 ff ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c64:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c6b:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c6e:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
  sp = sz;

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c74:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c77:	85 c0                	test   %eax,%eax
80100c79:	75 a5                	jne    80100c20 <exec+0x230>
80100c7b:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c81:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c88:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100c8a:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c91:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100c95:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100c9c:	ff ff ff 
  ustack[1] = argc;
80100c9f:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ca5:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100ca7:	83 c0 0c             	add    $0xc,%eax
80100caa:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cac:	50                   	push   %eax
80100cad:	52                   	push   %edx
80100cae:	53                   	push   %ebx
80100caf:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cb5:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cbb:	e8 f0 61 00 00       	call   80106eb0 <copyout>
80100cc0:	83 c4 10             	add    $0x10,%esp
80100cc3:	85 c0                	test   %eax,%eax
80100cc5:	0f 88 d8 fe ff ff    	js     80100ba3 <exec+0x1b3>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
80100cce:	0f b6 10             	movzbl (%eax),%edx
80100cd1:	84 d2                	test   %dl,%dl
80100cd3:	74 19                	je     80100cee <exec+0x2fe>
80100cd5:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cd8:	83 c0 01             	add    $0x1,%eax
    if(*s == '/')
      last = s+1;
80100cdb:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cde:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100ce1:	0f 44 c8             	cmove  %eax,%ecx
80100ce4:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ce7:	84 d2                	test   %dl,%dl
80100ce9:	75 f0                	jne    80100cdb <exec+0x2eb>
80100ceb:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));
80100cee:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf4:	50                   	push   %eax
80100cf5:	6a 10                	push   $0x10
80100cf7:	ff 75 08             	pushl  0x8(%ebp)
80100cfa:	89 f8                	mov    %edi,%eax
80100cfc:	83 c0 6c             	add    $0x6c,%eax
80100cff:	50                   	push   %eax
80100d00:	e8 ab 39 00 00       	call   801046b0 <safestrcpy>

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d05:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
80100d0b:	89 f8                	mov    %edi,%eax
80100d0d:	8b 7f 04             	mov    0x4(%edi),%edi
  curproc->pgdir = pgdir;
  curproc->sz = sz;
80100d10:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(curproc->name, last, sizeof(curproc->name));

  // Commit to the user image.
  oldpgdir = curproc->pgdir;
  curproc->pgdir = pgdir;
80100d12:	89 48 04             	mov    %ecx,0x4(%eax)
  curproc->sz = sz;
  curproc->tf->eip = elf.entry;  // main
80100d15:	89 c1                	mov    %eax,%ecx
80100d17:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d1d:	8b 40 18             	mov    0x18(%eax),%eax
80100d20:	89 50 38             	mov    %edx,0x38(%eax)
  curproc->tf->esp = sp;
80100d23:	8b 41 18             	mov    0x18(%ecx),%eax
80100d26:	89 58 44             	mov    %ebx,0x44(%eax)
  switchuvm(curproc);
80100d29:	89 0c 24             	mov    %ecx,(%esp)
80100d2c:	e8 7f 5b 00 00       	call   801068b0 <switchuvm>
  freevm(oldpgdir);
80100d31:	89 3c 24             	mov    %edi,(%esp)
80100d34:	e8 f7 5e 00 00       	call   80106c30 <freevm>
  return 0;
80100d39:	83 c4 10             	add    $0x10,%esp
80100d3c:	31 c0                	xor    %eax,%eax
80100d3e:	e9 19 fd ff ff       	jmp    80100a5c <exec+0x6c>
80100d43:	66 90                	xchg   %ax,%ax
80100d45:	66 90                	xchg   %ax,%ax
80100d47:	66 90                	xchg   %ax,%ax
80100d49:	66 90                	xchg   %ax,%ax
80100d4b:	66 90                	xchg   %ax,%ax
80100d4d:	66 90                	xchg   %ax,%ax
80100d4f:	90                   	nop

80100d50 <fileinit>:
80100d50:	55                   	push   %ebp
80100d51:	89 e5                	mov    %esp,%ebp
80100d53:	83 ec 10             	sub    $0x10,%esp
80100d56:	68 ed 6f 10 80       	push   $0x80106fed
80100d5b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d60:	e8 db 34 00 00       	call   80104240 <initlock>
80100d65:	83 c4 10             	add    $0x10,%esp
80100d68:	c9                   	leave  
80100d69:	c3                   	ret    
80100d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d70 <filealloc>:
80100d70:	55                   	push   %ebp
80100d71:	89 e5                	mov    %esp,%ebp
80100d73:	53                   	push   %ebx
80100d74:	bb 14 00 11 80       	mov    $0x80110014,%ebx
80100d79:	83 ec 10             	sub    $0x10,%esp
80100d7c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d81:	e8 ba 35 00 00       	call   80104340 <acquire>
80100d86:	83 c4 10             	add    $0x10,%esp
80100d89:	eb 10                	jmp    80100d9b <filealloc+0x2b>
80100d8b:	90                   	nop
80100d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100d90:	83 c3 18             	add    $0x18,%ebx
80100d93:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100d99:	74 25                	je     80100dc0 <filealloc+0x50>
80100d9b:	8b 43 04             	mov    0x4(%ebx),%eax
80100d9e:	85 c0                	test   %eax,%eax
80100da0:	75 ee                	jne    80100d90 <filealloc+0x20>
80100da2:	83 ec 0c             	sub    $0xc,%esp
80100da5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dac:	68 e0 ff 10 80       	push   $0x8010ffe0
80100db1:	e8 aa 36 00 00       	call   80104460 <release>
80100db6:	89 d8                	mov    %ebx,%eax
80100db8:	83 c4 10             	add    $0x10,%esp
80100dbb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dbe:	c9                   	leave  
80100dbf:	c3                   	ret    
80100dc0:	83 ec 0c             	sub    $0xc,%esp
80100dc3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100dc8:	e8 93 36 00 00       	call   80104460 <release>
80100dcd:	83 c4 10             	add    $0x10,%esp
80100dd0:	31 c0                	xor    %eax,%eax
80100dd2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dd5:	c9                   	leave  
80100dd6:	c3                   	ret    
80100dd7:	89 f6                	mov    %esi,%esi
80100dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100de0 <filedup>:
80100de0:	55                   	push   %ebp
80100de1:	89 e5                	mov    %esp,%ebp
80100de3:	53                   	push   %ebx
80100de4:	83 ec 10             	sub    $0x10,%esp
80100de7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dea:	68 e0 ff 10 80       	push   $0x8010ffe0
80100def:	e8 4c 35 00 00       	call   80104340 <acquire>
80100df4:	8b 43 04             	mov    0x4(%ebx),%eax
80100df7:	83 c4 10             	add    $0x10,%esp
80100dfa:	85 c0                	test   %eax,%eax
80100dfc:	7e 1a                	jle    80100e18 <filedup+0x38>
80100dfe:	83 c0 01             	add    $0x1,%eax
80100e01:	83 ec 0c             	sub    $0xc,%esp
80100e04:	89 43 04             	mov    %eax,0x4(%ebx)
80100e07:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e0c:	e8 4f 36 00 00       	call   80104460 <release>
80100e11:	89 d8                	mov    %ebx,%eax
80100e13:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e16:	c9                   	leave  
80100e17:	c3                   	ret    
80100e18:	83 ec 0c             	sub    $0xc,%esp
80100e1b:	68 f4 6f 10 80       	push   $0x80106ff4
80100e20:	e8 4b f5 ff ff       	call   80100370 <panic>
80100e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e30 <fileclose>:
80100e30:	55                   	push   %ebp
80100e31:	89 e5                	mov    %esp,%ebp
80100e33:	57                   	push   %edi
80100e34:	56                   	push   %esi
80100e35:	53                   	push   %ebx
80100e36:	83 ec 28             	sub    $0x28,%esp
80100e39:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e3c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e41:	e8 fa 34 00 00       	call   80104340 <acquire>
80100e46:	8b 47 04             	mov    0x4(%edi),%eax
80100e49:	83 c4 10             	add    $0x10,%esp
80100e4c:	85 c0                	test   %eax,%eax
80100e4e:	0f 8e 9b 00 00 00    	jle    80100eef <fileclose+0xbf>
80100e54:	83 e8 01             	sub    $0x1,%eax
80100e57:	85 c0                	test   %eax,%eax
80100e59:	89 47 04             	mov    %eax,0x4(%edi)
80100e5c:	74 1a                	je     80100e78 <fileclose+0x48>
80100e5e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
80100e65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e68:	5b                   	pop    %ebx
80100e69:	5e                   	pop    %esi
80100e6a:	5f                   	pop    %edi
80100e6b:	5d                   	pop    %ebp
80100e6c:	e9 ef 35 00 00       	jmp    80104460 <release>
80100e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e78:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100e7c:	8b 1f                	mov    (%edi),%ebx
80100e7e:	83 ec 0c             	sub    $0xc,%esp
80100e81:	8b 77 0c             	mov    0xc(%edi),%esi
80100e84:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100e8a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e8d:	8b 47 10             	mov    0x10(%edi),%eax
80100e90:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e95:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100e98:	e8 c3 35 00 00       	call   80104460 <release>
80100e9d:	83 c4 10             	add    $0x10,%esp
80100ea0:	83 fb 01             	cmp    $0x1,%ebx
80100ea3:	74 13                	je     80100eb8 <fileclose+0x88>
80100ea5:	83 fb 02             	cmp    $0x2,%ebx
80100ea8:	74 26                	je     80100ed0 <fileclose+0xa0>
80100eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ead:	5b                   	pop    %ebx
80100eae:	5e                   	pop    %esi
80100eaf:	5f                   	pop    %edi
80100eb0:	5d                   	pop    %ebp
80100eb1:	c3                   	ret    
80100eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100eb8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ebc:	83 ec 08             	sub    $0x8,%esp
80100ebf:	53                   	push   %ebx
80100ec0:	56                   	push   %esi
80100ec1:	e8 2a 24 00 00       	call   801032f0 <pipeclose>
80100ec6:	83 c4 10             	add    $0x10,%esp
80100ec9:	eb df                	jmp    80100eaa <fileclose+0x7a>
80100ecb:	90                   	nop
80100ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ed0:	e8 7b 1c 00 00       	call   80102b50 <begin_op>
80100ed5:	83 ec 0c             	sub    $0xc,%esp
80100ed8:	ff 75 e0             	pushl  -0x20(%ebp)
80100edb:	e8 c0 08 00 00       	call   801017a0 <iput>
80100ee0:	83 c4 10             	add    $0x10,%esp
80100ee3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ee6:	5b                   	pop    %ebx
80100ee7:	5e                   	pop    %esi
80100ee8:	5f                   	pop    %edi
80100ee9:	5d                   	pop    %ebp
80100eea:	e9 d1 1c 00 00       	jmp    80102bc0 <end_op>
80100eef:	83 ec 0c             	sub    $0xc,%esp
80100ef2:	68 fc 6f 10 80       	push   $0x80106ffc
80100ef7:	e8 74 f4 ff ff       	call   80100370 <panic>
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f00 <filestat>:
80100f00:	55                   	push   %ebp
80100f01:	89 e5                	mov    %esp,%ebp
80100f03:	53                   	push   %ebx
80100f04:	83 ec 04             	sub    $0x4,%esp
80100f07:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f0a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f0d:	75 31                	jne    80100f40 <filestat+0x40>
80100f0f:	83 ec 0c             	sub    $0xc,%esp
80100f12:	ff 73 10             	pushl  0x10(%ebx)
80100f15:	e8 56 07 00 00       	call   80101670 <ilock>
80100f1a:	58                   	pop    %eax
80100f1b:	5a                   	pop    %edx
80100f1c:	ff 75 0c             	pushl  0xc(%ebp)
80100f1f:	ff 73 10             	pushl  0x10(%ebx)
80100f22:	e8 f9 09 00 00       	call   80101920 <stati>
80100f27:	59                   	pop    %ecx
80100f28:	ff 73 10             	pushl  0x10(%ebx)
80100f2b:	e8 20 08 00 00       	call   80101750 <iunlock>
80100f30:	83 c4 10             	add    $0x10,%esp
80100f33:	31 c0                	xor    %eax,%eax
80100f35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f38:	c9                   	leave  
80100f39:	c3                   	ret    
80100f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f40:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f50 <fileread>:
80100f50:	55                   	push   %ebp
80100f51:	89 e5                	mov    %esp,%ebp
80100f53:	57                   	push   %edi
80100f54:	56                   	push   %esi
80100f55:	53                   	push   %ebx
80100f56:	83 ec 0c             	sub    $0xc,%esp
80100f59:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f5f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f62:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f66:	74 60                	je     80100fc8 <fileread+0x78>
80100f68:	8b 03                	mov    (%ebx),%eax
80100f6a:	83 f8 01             	cmp    $0x1,%eax
80100f6d:	74 41                	je     80100fb0 <fileread+0x60>
80100f6f:	83 f8 02             	cmp    $0x2,%eax
80100f72:	75 5b                	jne    80100fcf <fileread+0x7f>
80100f74:	83 ec 0c             	sub    $0xc,%esp
80100f77:	ff 73 10             	pushl  0x10(%ebx)
80100f7a:	e8 f1 06 00 00       	call   80101670 <ilock>
80100f7f:	57                   	push   %edi
80100f80:	ff 73 14             	pushl  0x14(%ebx)
80100f83:	56                   	push   %esi
80100f84:	ff 73 10             	pushl  0x10(%ebx)
80100f87:	e8 c4 09 00 00       	call   80101950 <readi>
80100f8c:	83 c4 20             	add    $0x20,%esp
80100f8f:	85 c0                	test   %eax,%eax
80100f91:	89 c6                	mov    %eax,%esi
80100f93:	7e 03                	jle    80100f98 <fileread+0x48>
80100f95:	01 43 14             	add    %eax,0x14(%ebx)
80100f98:	83 ec 0c             	sub    $0xc,%esp
80100f9b:	ff 73 10             	pushl  0x10(%ebx)
80100f9e:	e8 ad 07 00 00       	call   80101750 <iunlock>
80100fa3:	83 c4 10             	add    $0x10,%esp
80100fa6:	89 f0                	mov    %esi,%eax
80100fa8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fab:	5b                   	pop    %ebx
80100fac:	5e                   	pop    %esi
80100fad:	5f                   	pop    %edi
80100fae:	5d                   	pop    %ebp
80100faf:	c3                   	ret    
80100fb0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fb3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	5b                   	pop    %ebx
80100fba:	5e                   	pop    %esi
80100fbb:	5f                   	pop    %edi
80100fbc:	5d                   	pop    %ebp
80100fbd:	e9 ce 24 00 00       	jmp    80103490 <piperead>
80100fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100fcd:	eb d9                	jmp    80100fa8 <fileread+0x58>
80100fcf:	83 ec 0c             	sub    $0xc,%esp
80100fd2:	68 06 70 10 80       	push   $0x80107006
80100fd7:	e8 94 f3 ff ff       	call   80100370 <panic>
80100fdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100fe0 <filewrite>:
80100fe0:	55                   	push   %ebp
80100fe1:	89 e5                	mov    %esp,%ebp
80100fe3:	57                   	push   %edi
80100fe4:	56                   	push   %esi
80100fe5:	53                   	push   %ebx
80100fe6:	83 ec 1c             	sub    $0x1c,%esp
80100fe9:	8b 75 08             	mov    0x8(%ebp),%esi
80100fec:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fef:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80100ff3:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100ff6:	8b 45 10             	mov    0x10(%ebp),%eax
80100ff9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100ffc:	0f 84 aa 00 00 00    	je     801010ac <filewrite+0xcc>
80101002:	8b 06                	mov    (%esi),%eax
80101004:	83 f8 01             	cmp    $0x1,%eax
80101007:	0f 84 c2 00 00 00    	je     801010cf <filewrite+0xef>
8010100d:	83 f8 02             	cmp    $0x2,%eax
80101010:	0f 85 d8 00 00 00    	jne    801010ee <filewrite+0x10e>
80101016:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101019:	31 ff                	xor    %edi,%edi
8010101b:	85 c0                	test   %eax,%eax
8010101d:	7f 34                	jg     80101053 <filewrite+0x73>
8010101f:	e9 9c 00 00 00       	jmp    801010c0 <filewrite+0xe0>
80101024:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101028:	01 46 14             	add    %eax,0x14(%esi)
8010102b:	83 ec 0c             	sub    $0xc,%esp
8010102e:	ff 76 10             	pushl  0x10(%esi)
80101031:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101034:	e8 17 07 00 00       	call   80101750 <iunlock>
80101039:	e8 82 1b 00 00       	call   80102bc0 <end_op>
8010103e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101041:	83 c4 10             	add    $0x10,%esp
80101044:	39 d8                	cmp    %ebx,%eax
80101046:	0f 85 95 00 00 00    	jne    801010e1 <filewrite+0x101>
8010104c:	01 c7                	add    %eax,%edi
8010104e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101051:	7e 6d                	jle    801010c0 <filewrite+0xe0>
80101053:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101056:	b8 00 06 00 00       	mov    $0x600,%eax
8010105b:	29 fb                	sub    %edi,%ebx
8010105d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101063:	0f 4f d8             	cmovg  %eax,%ebx
80101066:	e8 e5 1a 00 00       	call   80102b50 <begin_op>
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	e8 fa 05 00 00       	call   80101670 <ilock>
80101076:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101079:	53                   	push   %ebx
8010107a:	ff 76 14             	pushl  0x14(%esi)
8010107d:	01 f8                	add    %edi,%eax
8010107f:	50                   	push   %eax
80101080:	ff 76 10             	pushl  0x10(%esi)
80101083:	e8 c8 09 00 00       	call   80101a50 <writei>
80101088:	83 c4 20             	add    $0x20,%esp
8010108b:	85 c0                	test   %eax,%eax
8010108d:	7f 99                	jg     80101028 <filewrite+0x48>
8010108f:	83 ec 0c             	sub    $0xc,%esp
80101092:	ff 76 10             	pushl  0x10(%esi)
80101095:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101098:	e8 b3 06 00 00       	call   80101750 <iunlock>
8010109d:	e8 1e 1b 00 00       	call   80102bc0 <end_op>
801010a2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010a5:	83 c4 10             	add    $0x10,%esp
801010a8:	85 c0                	test   %eax,%eax
801010aa:	74 98                	je     80101044 <filewrite+0x64>
801010ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010b4:	5b                   	pop    %ebx
801010b5:	5e                   	pop    %esi
801010b6:	5f                   	pop    %edi
801010b7:	5d                   	pop    %ebp
801010b8:	c3                   	ret    
801010b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801010c0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010c3:	75 e7                	jne    801010ac <filewrite+0xcc>
801010c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010c8:	89 f8                	mov    %edi,%eax
801010ca:	5b                   	pop    %ebx
801010cb:	5e                   	pop    %esi
801010cc:	5f                   	pop    %edi
801010cd:	5d                   	pop    %ebp
801010ce:	c3                   	ret    
801010cf:	8b 46 0c             	mov    0xc(%esi),%eax
801010d2:	89 45 08             	mov    %eax,0x8(%ebp)
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	5b                   	pop    %ebx
801010d9:	5e                   	pop    %esi
801010da:	5f                   	pop    %edi
801010db:	5d                   	pop    %ebp
801010dc:	e9 af 22 00 00       	jmp    80103390 <pipewrite>
801010e1:	83 ec 0c             	sub    $0xc,%esp
801010e4:	68 0f 70 10 80       	push   $0x8010700f
801010e9:	e8 82 f2 ff ff       	call   80100370 <panic>
801010ee:	83 ec 0c             	sub    $0xc,%esp
801010f1:	68 15 70 10 80       	push   $0x80107015
801010f6:	e8 75 f2 ff ff       	call   80100370 <panic>
801010fb:	66 90                	xchg   %ax,%ax
801010fd:	66 90                	xchg   %ax,%ax
801010ff:	90                   	nop

80101100 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101100:	55                   	push   %ebp
80101101:	89 e5                	mov    %esp,%ebp
80101103:	57                   	push   %edi
80101104:	56                   	push   %esi
80101105:	53                   	push   %ebx
80101106:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101109:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010110f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101112:	85 c9                	test   %ecx,%ecx
80101114:	0f 84 85 00 00 00    	je     8010119f <balloc+0x9f>
8010111a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101121:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101124:	83 ec 08             	sub    $0x8,%esp
80101127:	89 f0                	mov    %esi,%eax
80101129:	c1 f8 0c             	sar    $0xc,%eax
8010112c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101132:	50                   	push   %eax
80101133:	ff 75 d8             	pushl  -0x28(%ebp)
80101136:	e8 95 ef ff ff       	call   801000d0 <bread>
8010113b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010113e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101143:	83 c4 10             	add    $0x10,%esp
80101146:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101149:	31 c0                	xor    %eax,%eax
8010114b:	eb 2d                	jmp    8010117a <balloc+0x7a>
8010114d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101150:	89 c1                	mov    %eax,%ecx
80101152:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101157:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010115a:	83 e1 07             	and    $0x7,%ecx
8010115d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010115f:	89 c1                	mov    %eax,%ecx
80101161:	c1 f9 03             	sar    $0x3,%ecx
80101164:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101169:	85 d7                	test   %edx,%edi
8010116b:	74 43                	je     801011b0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010116d:	83 c0 01             	add    $0x1,%eax
80101170:	83 c6 01             	add    $0x1,%esi
80101173:	3d 00 10 00 00       	cmp    $0x1000,%eax
80101178:	74 05                	je     8010117f <balloc+0x7f>
8010117a:	3b 75 e0             	cmp    -0x20(%ebp),%esi
8010117d:	72 d1                	jb     80101150 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
8010117f:	83 ec 0c             	sub    $0xc,%esp
80101182:	ff 75 e4             	pushl  -0x1c(%ebp)
80101185:	e8 56 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
8010118a:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
80101191:	83 c4 10             	add    $0x10,%esp
80101194:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101197:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
8010119d:	77 82                	ja     80101121 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
8010119f:	83 ec 0c             	sub    $0xc,%esp
801011a2:	68 1f 70 10 80       	push   $0x8010701f
801011a7:	e8 c4 f1 ff ff       	call   80100370 <panic>
801011ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b0:	09 fa                	or     %edi,%edx
801011b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011b5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011b8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011bc:	57                   	push   %edi
801011bd:	e8 6e 1b 00 00       	call   80102d30 <log_write>
        brelse(bp);
801011c2:	89 3c 24             	mov    %edi,(%esp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011ca:	58                   	pop    %eax
801011cb:	5a                   	pop    %edx
801011cc:	56                   	push   %esi
801011cd:	ff 75 d8             	pushl  -0x28(%ebp)
801011d0:	e8 fb ee ff ff       	call   801000d0 <bread>
801011d5:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
801011d7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011da:	83 c4 0c             	add    $0xc,%esp
801011dd:	68 00 02 00 00       	push   $0x200
801011e2:	6a 00                	push   $0x0
801011e4:	50                   	push   %eax
801011e5:	e8 c6 32 00 00       	call   801044b0 <memset>
  log_write(bp);
801011ea:	89 1c 24             	mov    %ebx,(%esp)
801011ed:	e8 3e 1b 00 00       	call   80102d30 <log_write>
  brelse(bp);
801011f2:	89 1c 24             	mov    %ebx,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
801011fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801011fd:	89 f0                	mov    %esi,%eax
801011ff:	5b                   	pop    %ebx
80101200:	5e                   	pop    %esi
80101201:	5f                   	pop    %edi
80101202:	5d                   	pop    %ebp
80101203:	c3                   	ret    
80101204:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010120a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101210 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101210:	55                   	push   %ebp
80101211:	89 e5                	mov    %esp,%ebp
80101213:	57                   	push   %edi
80101214:	56                   	push   %esi
80101215:	53                   	push   %ebx
80101216:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101218:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010121a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010121f:	83 ec 28             	sub    $0x28,%esp
80101222:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101225:	68 00 0a 11 80       	push   $0x80110a00
8010122a:	e8 11 31 00 00       	call   80104340 <acquire>
8010122f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101232:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101235:	eb 1b                	jmp    80101252 <iget+0x42>
80101237:	89 f6                	mov    %esi,%esi
80101239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101240:	85 f6                	test   %esi,%esi
80101242:	74 44                	je     80101288 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101244:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010124a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101250:	74 4e                	je     801012a0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101252:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101255:	85 c9                	test   %ecx,%ecx
80101257:	7e e7                	jle    80101240 <iget+0x30>
80101259:	39 3b                	cmp    %edi,(%ebx)
8010125b:	75 e3                	jne    80101240 <iget+0x30>
8010125d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101260:	75 de                	jne    80101240 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101262:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101265:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101268:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010126a:	68 00 0a 11 80       	push   $0x80110a00

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010126f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
80101272:	e8 e9 31 00 00       	call   80104460 <release>
      return ip;
80101277:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);

  return ip;
}
8010127a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010127d:	89 f0                	mov    %esi,%eax
8010127f:	5b                   	pop    %ebx
80101280:	5e                   	pop    %esi
80101281:	5f                   	pop    %edi
80101282:	5d                   	pop    %ebp
80101283:	c3                   	ret    
80101284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101288:	85 c9                	test   %ecx,%ecx
8010128a:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010128d:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101293:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101299:	75 b7                	jne    80101252 <iget+0x42>
8010129b:	90                   	nop
8010129c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012a0:	85 f6                	test   %esi,%esi
801012a2:	74 2d                	je     801012d1 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->valid = 0;
  release(&icache.lock);
801012a4:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801012a7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012a9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012ac:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->valid = 0;
801012b3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012ba:	68 00 0a 11 80       	push   $0x80110a00
801012bf:	e8 9c 31 00 00       	call   80104460 <release>

  return ip;
801012c4:	83 c4 10             	add    $0x10,%esp
}
801012c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ca:	89 f0                	mov    %esi,%eax
801012cc:	5b                   	pop    %ebx
801012cd:	5e                   	pop    %esi
801012ce:	5f                   	pop    %edi
801012cf:	5d                   	pop    %ebp
801012d0:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
801012d1:	83 ec 0c             	sub    $0xc,%esp
801012d4:	68 35 70 10 80       	push   $0x80107035
801012d9:	e8 92 f0 ff ff       	call   80100370 <panic>
801012de:	66 90                	xchg   %ax,%ax

801012e0 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
801012e0:	55                   	push   %ebp
801012e1:	89 e5                	mov    %esp,%ebp
801012e3:	57                   	push   %edi
801012e4:	56                   	push   %esi
801012e5:	53                   	push   %ebx
801012e6:	89 c6                	mov    %eax,%esi
801012e8:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
801012eb:	83 fa 0b             	cmp    $0xb,%edx
801012ee:	77 18                	ja     80101308 <bmap+0x28>
801012f0:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
801012f3:	8b 43 5c             	mov    0x5c(%ebx),%eax
801012f6:	85 c0                	test   %eax,%eax
801012f8:	74 76                	je     80101370 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801012fa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fd:	5b                   	pop    %ebx
801012fe:	5e                   	pop    %esi
801012ff:	5f                   	pop    %edi
80101300:	5d                   	pop    %ebp
80101301:	c3                   	ret    
80101302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101308:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010130b:	83 fb 7f             	cmp    $0x7f,%ebx
8010130e:	0f 87 83 00 00 00    	ja     80101397 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101314:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010131a:	85 c0                	test   %eax,%eax
8010131c:	74 6a                	je     80101388 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010131e:	83 ec 08             	sub    $0x8,%esp
80101321:	50                   	push   %eax
80101322:	ff 36                	pushl  (%esi)
80101324:	e8 a7 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101329:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010132d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101330:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101332:	8b 1a                	mov    (%edx),%ebx
80101334:	85 db                	test   %ebx,%ebx
80101336:	75 1d                	jne    80101355 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101338:	8b 06                	mov    (%esi),%eax
8010133a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010133d:	e8 be fd ff ff       	call   80101100 <balloc>
80101342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101345:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101348:	89 c3                	mov    %eax,%ebx
8010134a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010134c:	57                   	push   %edi
8010134d:	e8 de 19 00 00       	call   80102d30 <log_write>
80101352:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101355:	83 ec 0c             	sub    $0xc,%esp
80101358:	57                   	push   %edi
80101359:	e8 82 ee ff ff       	call   801001e0 <brelse>
8010135e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101361:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101364:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101366:	5b                   	pop    %ebx
80101367:	5e                   	pop    %esi
80101368:	5f                   	pop    %edi
80101369:	5d                   	pop    %ebp
8010136a:	c3                   	ret    
8010136b:	90                   	nop
8010136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
80101370:	8b 06                	mov    (%esi),%eax
80101372:	e8 89 fd ff ff       	call   80101100 <balloc>
80101377:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010137a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010137d:	5b                   	pop    %ebx
8010137e:	5e                   	pop    %esi
8010137f:	5f                   	pop    %edi
80101380:	5d                   	pop    %ebp
80101381:	c3                   	ret    
80101382:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
80101388:	8b 06                	mov    (%esi),%eax
8010138a:	e8 71 fd ff ff       	call   80101100 <balloc>
8010138f:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
80101395:	eb 87                	jmp    8010131e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
80101397:	83 ec 0c             	sub    $0xc,%esp
8010139a:	68 45 70 10 80       	push   $0x80107045
8010139f:	e8 cc ef ff ff       	call   80100370 <panic>
801013a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013b0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013b0:	55                   	push   %ebp
801013b1:	89 e5                	mov    %esp,%ebp
801013b3:	56                   	push   %esi
801013b4:	53                   	push   %ebx
801013b5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013b8:	83 ec 08             	sub    $0x8,%esp
801013bb:	6a 01                	push   $0x1
801013bd:	ff 75 08             	pushl  0x8(%ebp)
801013c0:	e8 0b ed ff ff       	call   801000d0 <bread>
801013c5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013c7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ca:	83 c4 0c             	add    $0xc,%esp
801013cd:	6a 1c                	push   $0x1c
801013cf:	50                   	push   %eax
801013d0:	56                   	push   %esi
801013d1:	e8 8a 31 00 00       	call   80104560 <memmove>
  brelse(bp);
801013d6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013d9:	83 c4 10             	add    $0x10,%esp
}
801013dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013df:	5b                   	pop    %ebx
801013e0:	5e                   	pop    %esi
801013e1:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
801013e2:	e9 f9 ed ff ff       	jmp    801001e0 <brelse>
801013e7:	89 f6                	mov    %esi,%esi
801013e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801013f0 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	89 d3                	mov    %edx,%ebx
801013f7:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
801013f9:	83 ec 08             	sub    $0x8,%esp
801013fc:	68 e0 09 11 80       	push   $0x801109e0
80101401:	50                   	push   %eax
80101402:	e8 a9 ff ff ff       	call   801013b0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101407:	58                   	pop    %eax
80101408:	5a                   	pop    %edx
80101409:	89 da                	mov    %ebx,%edx
8010140b:	c1 ea 0c             	shr    $0xc,%edx
8010140e:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101414:	52                   	push   %edx
80101415:	56                   	push   %esi
80101416:	e8 b5 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010141b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010141d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101423:	ba 01 00 00 00       	mov    $0x1,%edx
80101428:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010142b:	c1 fb 03             	sar    $0x3,%ebx
8010142e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101431:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101433:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101438:	85 d1                	test   %edx,%ecx
8010143a:	74 27                	je     80101463 <bfree+0x73>
8010143c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010143e:	f7 d2                	not    %edx
80101440:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101442:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101445:	21 d0                	and    %edx,%eax
80101447:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010144b:	56                   	push   %esi
8010144c:	e8 df 18 00 00       	call   80102d30 <log_write>
  brelse(bp);
80101451:	89 34 24             	mov    %esi,(%esp)
80101454:	e8 87 ed ff ff       	call   801001e0 <brelse>
}
80101459:	83 c4 10             	add    $0x10,%esp
8010145c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010145f:	5b                   	pop    %ebx
80101460:	5e                   	pop    %esi
80101461:	5d                   	pop    %ebp
80101462:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101463:	83 ec 0c             	sub    $0xc,%esp
80101466:	68 58 70 10 80       	push   $0x80107058
8010146b:	e8 00 ef ff ff       	call   80100370 <panic>

80101470 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
80101470:	55                   	push   %ebp
80101471:	89 e5                	mov    %esp,%ebp
80101473:	53                   	push   %ebx
80101474:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
80101479:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
8010147c:	68 6b 70 10 80       	push   $0x8010706b
80101481:	68 00 0a 11 80       	push   $0x80110a00
80101486:	e8 b5 2d 00 00       	call   80104240 <initlock>
8010148b:	83 c4 10             	add    $0x10,%esp
8010148e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
80101490:	83 ec 08             	sub    $0x8,%esp
80101493:	68 72 70 10 80       	push   $0x80107072
80101498:	53                   	push   %ebx
80101499:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010149f:	e8 8c 2c 00 00       	call   80104130 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014a4:	83 c4 10             	add    $0x10,%esp
801014a7:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801014ad:	75 e1                	jne    80101490 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }

  readsb(dev, &sb);
801014af:	83 ec 08             	sub    $0x8,%esp
801014b2:	68 e0 09 11 80       	push   $0x801109e0
801014b7:	ff 75 08             	pushl  0x8(%ebp)
801014ba:	e8 f1 fe ff ff       	call   801013b0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014bf:	ff 35 f8 09 11 80    	pushl  0x801109f8
801014c5:	ff 35 f4 09 11 80    	pushl  0x801109f4
801014cb:	ff 35 f0 09 11 80    	pushl  0x801109f0
801014d1:	ff 35 ec 09 11 80    	pushl  0x801109ec
801014d7:	ff 35 e8 09 11 80    	pushl  0x801109e8
801014dd:	ff 35 e4 09 11 80    	pushl  0x801109e4
801014e3:	ff 35 e0 09 11 80    	pushl  0x801109e0
801014e9:	68 d8 70 10 80       	push   $0x801070d8
801014ee:	e8 6d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
801014f3:	83 c4 30             	add    $0x30,%esp
801014f6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801014f9:	c9                   	leave  
801014fa:	c3                   	ret    
801014fb:	90                   	nop
801014fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101500 <ialloc>:
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101500:	55                   	push   %ebp
80101501:	89 e5                	mov    %esp,%ebp
80101503:	57                   	push   %edi
80101504:	56                   	push   %esi
80101505:	53                   	push   %ebx
80101506:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101509:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
// Allocate an inode on device dev.
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode.
struct inode*
ialloc(uint dev, short type)
{
80101510:	8b 45 0c             	mov    0xc(%ebp),%eax
80101513:	8b 75 08             	mov    0x8(%ebp),%esi
80101516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101519:	0f 86 91 00 00 00    	jbe    801015b0 <ialloc+0xb0>
8010151f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101524:	eb 21                	jmp    80101547 <ialloc+0x47>
80101526:	8d 76 00             	lea    0x0(%esi),%esi
80101529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101530:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101533:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101536:	57                   	push   %edi
80101537:	e8 a4 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010153c:	83 c4 10             	add    $0x10,%esp
8010153f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101545:	76 69                	jbe    801015b0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101547:	89 d8                	mov    %ebx,%eax
80101549:	83 ec 08             	sub    $0x8,%esp
8010154c:	c1 e8 03             	shr    $0x3,%eax
8010154f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101555:	50                   	push   %eax
80101556:	56                   	push   %esi
80101557:	e8 74 eb ff ff       	call   801000d0 <bread>
8010155c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010155e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101560:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101563:	83 e0 07             	and    $0x7,%eax
80101566:	c1 e0 06             	shl    $0x6,%eax
80101569:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010156d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101571:	75 bd                	jne    80101530 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
80101573:	83 ec 04             	sub    $0x4,%esp
80101576:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101579:	6a 40                	push   $0x40
8010157b:	6a 00                	push   $0x0
8010157d:	51                   	push   %ecx
8010157e:	e8 2d 2f 00 00       	call   801044b0 <memset>
      dip->type = type;
80101583:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
80101587:	8b 4d e0             	mov    -0x20(%ebp),%ecx
8010158a:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
8010158d:	89 3c 24             	mov    %edi,(%esp)
80101590:	e8 9b 17 00 00       	call   80102d30 <log_write>
      brelse(bp);
80101595:	89 3c 24             	mov    %edi,(%esp)
80101598:	e8 43 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
8010159d:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015a3:	89 da                	mov    %ebx,%edx
801015a5:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015a7:	5b                   	pop    %ebx
801015a8:	5e                   	pop    %esi
801015a9:	5f                   	pop    %edi
801015aa:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015ab:	e9 60 fc ff ff       	jmp    80101210 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015b0:	83 ec 0c             	sub    $0xc,%esp
801015b3:	68 78 70 10 80       	push   $0x80107078
801015b8:	e8 b3 ed ff ff       	call   80100370 <panic>
801015bd:	8d 76 00             	lea    0x0(%esi),%esi

801015c0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk, since i-node cache is write-through.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
801015c0:	55                   	push   %ebp
801015c1:	89 e5                	mov    %esp,%ebp
801015c3:	56                   	push   %esi
801015c4:	53                   	push   %ebx
801015c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015c8:	83 ec 08             	sub    $0x8,%esp
801015cb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ce:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015d1:	c1 e8 03             	shr    $0x3,%eax
801015d4:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801015da:	50                   	push   %eax
801015db:	ff 73 a4             	pushl  -0x5c(%ebx)
801015de:	e8 ed ea ff ff       	call   801000d0 <bread>
801015e3:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015e5:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
801015e8:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015ec:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
801015ef:	83 e0 07             	and    $0x7,%eax
801015f2:	c1 e0 06             	shl    $0x6,%eax
801015f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
801015f9:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
801015fc:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101600:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
80101603:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101607:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010160b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010160f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101613:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101617:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010161a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010161d:	6a 34                	push   $0x34
8010161f:	53                   	push   %ebx
80101620:	50                   	push   %eax
80101621:	e8 3a 2f 00 00       	call   80104560 <memmove>
  log_write(bp);
80101626:	89 34 24             	mov    %esi,(%esp)
80101629:	e8 02 17 00 00       	call   80102d30 <log_write>
  brelse(bp);
8010162e:	89 75 08             	mov    %esi,0x8(%ebp)
80101631:	83 c4 10             	add    $0x10,%esp
}
80101634:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101637:	5b                   	pop    %ebx
80101638:	5e                   	pop    %esi
80101639:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010163a:	e9 a1 eb ff ff       	jmp    801001e0 <brelse>
8010163f:	90                   	nop

80101640 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101640:	55                   	push   %ebp
80101641:	89 e5                	mov    %esp,%ebp
80101643:	53                   	push   %ebx
80101644:	83 ec 10             	sub    $0x10,%esp
80101647:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010164a:	68 00 0a 11 80       	push   $0x80110a00
8010164f:	e8 ec 2c 00 00       	call   80104340 <acquire>
  ip->ref++;
80101654:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101658:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010165f:	e8 fc 2d 00 00       	call   80104460 <release>
  return ip;
}
80101664:	89 d8                	mov    %ebx,%eax
80101666:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101669:	c9                   	leave  
8010166a:	c3                   	ret    
8010166b:	90                   	nop
8010166c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101670 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	56                   	push   %esi
80101674:	53                   	push   %ebx
80101675:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
80101678:	85 db                	test   %ebx,%ebx
8010167a:	0f 84 b7 00 00 00    	je     80101737 <ilock+0xc7>
80101680:	8b 53 08             	mov    0x8(%ebx),%edx
80101683:	85 d2                	test   %edx,%edx
80101685:	0f 8e ac 00 00 00    	jle    80101737 <ilock+0xc7>
    panic("ilock");

  acquiresleep(&ip->lock);
8010168b:	8d 43 0c             	lea    0xc(%ebx),%eax
8010168e:	83 ec 0c             	sub    $0xc,%esp
80101691:	50                   	push   %eax
80101692:	e8 d9 2a 00 00       	call   80104170 <acquiresleep>

  if(ip->valid == 0){
80101697:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010169a:	83 c4 10             	add    $0x10,%esp
8010169d:	85 c0                	test   %eax,%eax
8010169f:	74 0f                	je     801016b0 <ilock+0x40>
    brelse(bp);
    ip->valid = 1;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016a1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016a4:	5b                   	pop    %ebx
801016a5:	5e                   	pop    %esi
801016a6:	5d                   	pop    %ebp
801016a7:	c3                   	ret    
801016a8:	90                   	nop
801016a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016b0:	8b 43 04             	mov    0x4(%ebx),%eax
801016b3:	83 ec 08             	sub    $0x8,%esp
801016b6:	c1 e8 03             	shr    $0x3,%eax
801016b9:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016bf:	50                   	push   %eax
801016c0:	ff 33                	pushl  (%ebx)
801016c2:	e8 09 ea ff ff       	call   801000d0 <bread>
801016c7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016c9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016cc:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016cf:	83 e0 07             	and    $0x7,%eax
801016d2:	c1 e0 06             	shl    $0x6,%eax
801016d5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
801016d9:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016dc:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(ip->valid == 0){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
801016df:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
801016e3:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
801016e7:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
801016eb:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
801016ef:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
801016f3:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
801016f7:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
801016fb:	8b 50 fc             	mov    -0x4(%eax),%edx
801016fe:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101701:	6a 34                	push   $0x34
80101703:	50                   	push   %eax
80101704:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101707:	50                   	push   %eax
80101708:	e8 53 2e 00 00       	call   80104560 <memmove>
    brelse(bp);
8010170d:	89 34 24             	mov    %esi,(%esp)
80101710:	e8 cb ea ff ff       	call   801001e0 <brelse>
    ip->valid = 1;
    if(ip->type == 0)
80101715:	83 c4 10             	add    $0x10,%esp
80101718:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    brelse(bp);
    ip->valid = 1;
8010171d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
    if(ip->type == 0)
80101724:	0f 85 77 ff ff ff    	jne    801016a1 <ilock+0x31>
      panic("ilock: no type");
8010172a:	83 ec 0c             	sub    $0xc,%esp
8010172d:	68 90 70 10 80       	push   $0x80107090
80101732:	e8 39 ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101737:	83 ec 0c             	sub    $0xc,%esp
8010173a:	68 8a 70 10 80       	push   $0x8010708a
8010173f:	e8 2c ec ff ff       	call   80100370 <panic>
80101744:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010174a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101750 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101750:	55                   	push   %ebp
80101751:	89 e5                	mov    %esp,%ebp
80101753:	56                   	push   %esi
80101754:	53                   	push   %ebx
80101755:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101758:	85 db                	test   %ebx,%ebx
8010175a:	74 28                	je     80101784 <iunlock+0x34>
8010175c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010175f:	83 ec 0c             	sub    $0xc,%esp
80101762:	56                   	push   %esi
80101763:	e8 a8 2a 00 00       	call   80104210 <holdingsleep>
80101768:	83 c4 10             	add    $0x10,%esp
8010176b:	85 c0                	test   %eax,%eax
8010176d:	74 15                	je     80101784 <iunlock+0x34>
8010176f:	8b 43 08             	mov    0x8(%ebx),%eax
80101772:	85 c0                	test   %eax,%eax
80101774:	7e 0e                	jle    80101784 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
80101776:	89 75 08             	mov    %esi,0x8(%ebp)
}
80101779:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010177c:	5b                   	pop    %ebx
8010177d:	5e                   	pop    %esi
8010177e:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
8010177f:	e9 4c 2a 00 00       	jmp    801041d0 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
80101784:	83 ec 0c             	sub    $0xc,%esp
80101787:	68 9f 70 10 80       	push   $0x8010709f
8010178c:	e8 df eb ff ff       	call   80100370 <panic>
80101791:	eb 0d                	jmp    801017a0 <iput>
80101793:	90                   	nop
80101794:	90                   	nop
80101795:	90                   	nop
80101796:	90                   	nop
80101797:	90                   	nop
80101798:	90                   	nop
80101799:	90                   	nop
8010179a:	90                   	nop
8010179b:	90                   	nop
8010179c:	90                   	nop
8010179d:	90                   	nop
8010179e:	90                   	nop
8010179f:	90                   	nop

801017a0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017a0:	55                   	push   %ebp
801017a1:	89 e5                	mov    %esp,%ebp
801017a3:	57                   	push   %edi
801017a4:	56                   	push   %esi
801017a5:	53                   	push   %ebx
801017a6:	83 ec 28             	sub    $0x28,%esp
801017a9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquiresleep(&ip->lock);
801017ac:	8d 7e 0c             	lea    0xc(%esi),%edi
801017af:	57                   	push   %edi
801017b0:	e8 bb 29 00 00       	call   80104170 <acquiresleep>
  if(ip->valid && ip->nlink == 0){
801017b5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017b8:	83 c4 10             	add    $0x10,%esp
801017bb:	85 d2                	test   %edx,%edx
801017bd:	74 07                	je     801017c6 <iput+0x26>
801017bf:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
801017c4:	74 32                	je     801017f8 <iput+0x58>
      ip->type = 0;
      iupdate(ip);
      ip->valid = 0;
    }
  }
  releasesleep(&ip->lock);
801017c6:	83 ec 0c             	sub    $0xc,%esp
801017c9:	57                   	push   %edi
801017ca:	e8 01 2a 00 00       	call   801041d0 <releasesleep>

  acquire(&icache.lock);
801017cf:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
801017d6:	e8 65 2b 00 00       	call   80104340 <acquire>
  ip->ref--;
801017db:	83 6e 08 01          	subl   $0x1,0x8(%esi)
  release(&icache.lock);
801017df:	83 c4 10             	add    $0x10,%esp
801017e2:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
801017e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
801017ec:	5b                   	pop    %ebx
801017ed:	5e                   	pop    %esi
801017ee:	5f                   	pop    %edi
801017ef:	5d                   	pop    %ebp
  }
  releasesleep(&ip->lock);

  acquire(&icache.lock);
  ip->ref--;
  release(&icache.lock);
801017f0:	e9 6b 2c 00 00       	jmp    80104460 <release>
801017f5:	8d 76 00             	lea    0x0(%esi),%esi
void
iput(struct inode *ip)
{
  acquiresleep(&ip->lock);
  if(ip->valid && ip->nlink == 0){
    acquire(&icache.lock);
801017f8:	83 ec 0c             	sub    $0xc,%esp
801017fb:	68 00 0a 11 80       	push   $0x80110a00
80101800:	e8 3b 2b 00 00       	call   80104340 <acquire>
    int r = ip->ref;
80101805:	8b 5e 08             	mov    0x8(%esi),%ebx
    release(&icache.lock);
80101808:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010180f:	e8 4c 2c 00 00       	call   80104460 <release>
    if(r == 1){
80101814:	83 c4 10             	add    $0x10,%esp
80101817:	83 fb 01             	cmp    $0x1,%ebx
8010181a:	75 aa                	jne    801017c6 <iput+0x26>
8010181c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101822:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101825:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101828:	89 cf                	mov    %ecx,%edi
8010182a:	eb 0b                	jmp    80101837 <iput+0x97>
8010182c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101830:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101833:	39 fb                	cmp    %edi,%ebx
80101835:	74 19                	je     80101850 <iput+0xb0>
    if(ip->addrs[i]){
80101837:	8b 13                	mov    (%ebx),%edx
80101839:	85 d2                	test   %edx,%edx
8010183b:	74 f3                	je     80101830 <iput+0x90>
      bfree(ip->dev, ip->addrs[i]);
8010183d:	8b 06                	mov    (%esi),%eax
8010183f:	e8 ac fb ff ff       	call   801013f0 <bfree>
      ip->addrs[i] = 0;
80101844:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010184a:	eb e4                	jmp    80101830 <iput+0x90>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101850:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101856:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101859:	85 c0                	test   %eax,%eax
8010185b:	75 33                	jne    80101890 <iput+0xf0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010185d:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
80101860:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101867:	56                   	push   %esi
80101868:	e8 53 fd ff ff       	call   801015c0 <iupdate>
    int r = ip->ref;
    release(&icache.lock);
    if(r == 1){
      // inode has no links and no other references: truncate and free.
      itrunc(ip);
      ip->type = 0;
8010186d:	31 c0                	xor    %eax,%eax
8010186f:	66 89 46 50          	mov    %ax,0x50(%esi)
      iupdate(ip);
80101873:	89 34 24             	mov    %esi,(%esp)
80101876:	e8 45 fd ff ff       	call   801015c0 <iupdate>
      ip->valid = 0;
8010187b:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
80101882:	83 c4 10             	add    $0x10,%esp
80101885:	e9 3c ff ff ff       	jmp    801017c6 <iput+0x26>
8010188a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
80101890:	83 ec 08             	sub    $0x8,%esp
80101893:	50                   	push   %eax
80101894:	ff 36                	pushl  (%esi)
80101896:	e8 35 e8 ff ff       	call   801000d0 <bread>
8010189b:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018a1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018a4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018a7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018aa:	83 c4 10             	add    $0x10,%esp
801018ad:	89 cf                	mov    %ecx,%edi
801018af:	eb 0e                	jmp    801018bf <iput+0x11f>
801018b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018b8:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018bb:	39 fb                	cmp    %edi,%ebx
801018bd:	74 0f                	je     801018ce <iput+0x12e>
      if(a[j])
801018bf:	8b 13                	mov    (%ebx),%edx
801018c1:	85 d2                	test   %edx,%edx
801018c3:	74 f3                	je     801018b8 <iput+0x118>
        bfree(ip->dev, a[j]);
801018c5:	8b 06                	mov    (%esi),%eax
801018c7:	e8 24 fb ff ff       	call   801013f0 <bfree>
801018cc:	eb ea                	jmp    801018b8 <iput+0x118>
    }
    brelse(bp);
801018ce:	83 ec 0c             	sub    $0xc,%esp
801018d1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018d4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018d7:	e8 04 e9 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018dc:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018e2:	8b 06                	mov    (%esi),%eax
801018e4:	e8 07 fb ff ff       	call   801013f0 <bfree>
    ip->addrs[NDIRECT] = 0;
801018e9:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
801018f0:	00 00 00 
801018f3:	83 c4 10             	add    $0x10,%esp
801018f6:	e9 62 ff ff ff       	jmp    8010185d <iput+0xbd>
801018fb:	90                   	nop
801018fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101900 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101900:	55                   	push   %ebp
80101901:	89 e5                	mov    %esp,%ebp
80101903:	53                   	push   %ebx
80101904:	83 ec 10             	sub    $0x10,%esp
80101907:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010190a:	53                   	push   %ebx
8010190b:	e8 40 fe ff ff       	call   80101750 <iunlock>
  iput(ip);
80101910:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101913:	83 c4 10             	add    $0x10,%esp
}
80101916:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101919:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010191a:	e9 81 fe ff ff       	jmp    801017a0 <iput>
8010191f:	90                   	nop

80101920 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	8b 55 08             	mov    0x8(%ebp),%edx
80101926:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101929:	8b 0a                	mov    (%edx),%ecx
8010192b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010192e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101931:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101934:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101938:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010193b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010193f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101943:	8b 52 58             	mov    0x58(%edx),%edx
80101946:	89 50 10             	mov    %edx,0x10(%eax)
}
80101949:	5d                   	pop    %ebp
8010194a:	c3                   	ret    
8010194b:	90                   	nop
8010194c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101950 <readi>:
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101950:	55                   	push   %ebp
80101951:	89 e5                	mov    %esp,%ebp
80101953:	57                   	push   %edi
80101954:	56                   	push   %esi
80101955:	53                   	push   %ebx
80101956:	83 ec 1c             	sub    $0x1c,%esp
80101959:	8b 45 08             	mov    0x8(%ebp),%eax
8010195c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010195f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101962:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
//PAGEBREAK!
// Read data from inode.
// Caller must hold ip->lock.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101967:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010196a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010196d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101970:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101973:	0f 84 a7 00 00 00    	je     80101a20 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101979:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010197c:	8b 40 58             	mov    0x58(%eax),%eax
8010197f:	39 f0                	cmp    %esi,%eax
80101981:	0f 82 c1 00 00 00    	jb     80101a48 <readi+0xf8>
80101987:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010198a:	89 fa                	mov    %edi,%edx
8010198c:	01 f2                	add    %esi,%edx
8010198e:	0f 82 b4 00 00 00    	jb     80101a48 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
80101994:	89 c1                	mov    %eax,%ecx
80101996:	29 f1                	sub    %esi,%ecx
80101998:	39 d0                	cmp    %edx,%eax
8010199a:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
8010199d:	31 ff                	xor    %edi,%edi
8010199f:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019a1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019a4:	74 6d                	je     80101a13 <readi+0xc3>
801019a6:	8d 76 00             	lea    0x0(%esi),%esi
801019a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019b0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019b3:	89 f2                	mov    %esi,%edx
801019b5:	c1 ea 09             	shr    $0x9,%edx
801019b8:	89 d8                	mov    %ebx,%eax
801019ba:	e8 21 f9 ff ff       	call   801012e0 <bmap>
801019bf:	83 ec 08             	sub    $0x8,%esp
801019c2:	50                   	push   %eax
801019c3:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
801019c5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019ca:	e8 01 e7 ff ff       	call   801000d0 <bread>
801019cf:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019d4:	89 f1                	mov    %esi,%ecx
801019d6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019dc:	83 c4 0c             	add    $0xc,%esp
    memmove(dst, bp->data + off%BSIZE, m);
801019df:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019e2:	29 cb                	sub    %ecx,%ebx
801019e4:	29 f8                	sub    %edi,%eax
801019e6:	39 c3                	cmp    %eax,%ebx
801019e8:	0f 47 d8             	cmova  %eax,%ebx
    memmove(dst, bp->data + off%BSIZE, m);
801019eb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019ef:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019f0:	01 df                	add    %ebx,%edi
801019f2:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
801019f4:	50                   	push   %eax
801019f5:	ff 75 e0             	pushl  -0x20(%ebp)
801019f8:	e8 63 2b 00 00       	call   80104560 <memmove>
    brelse(bp);
801019fd:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a00:	89 14 24             	mov    %edx,(%esp)
80101a03:	e8 d8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a08:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a0b:	83 c4 10             	add    $0x10,%esp
80101a0e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a11:	77 9d                	ja     801019b0 <readi+0x60>
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a16:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a19:	5b                   	pop    %ebx
80101a1a:	5e                   	pop    %esi
80101a1b:	5f                   	pop    %edi
80101a1c:	5d                   	pop    %ebp
80101a1d:	c3                   	ret    
80101a1e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a20:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a24:	66 83 f8 09          	cmp    $0x9,%ax
80101a28:	77 1e                	ja     80101a48 <readi+0xf8>
80101a2a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a31:	85 c0                	test   %eax,%eax
80101a33:	74 13                	je     80101a48 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a35:	89 7d 10             	mov    %edi,0x10(%ebp)
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a38:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a3b:	5b                   	pop    %ebx
80101a3c:	5e                   	pop    %esi
80101a3d:	5f                   	pop    %edi
80101a3e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a3f:	ff e0                	jmp    *%eax
80101a41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a48:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a4d:	eb c7                	jmp    80101a16 <readi+0xc6>
80101a4f:	90                   	nop

80101a50 <writei>:
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a50:	55                   	push   %ebp
80101a51:	89 e5                	mov    %esp,%ebp
80101a53:	57                   	push   %edi
80101a54:	56                   	push   %esi
80101a55:	53                   	push   %ebx
80101a56:	83 ec 1c             	sub    $0x1c,%esp
80101a59:	8b 45 08             	mov    0x8(%ebp),%eax
80101a5c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a5f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a62:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
// PAGEBREAK!
// Write data to inode.
// Caller must hold ip->lock.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a67:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a6a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a6d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a70:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a73:	0f 84 b7 00 00 00    	je     80101b30 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a79:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a7c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a7f:	0f 82 eb 00 00 00    	jb     80101b70 <writei+0x120>
80101a85:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a88:	89 f8                	mov    %edi,%eax
80101a8a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a8c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101a91:	0f 87 d9 00 00 00    	ja     80101b70 <writei+0x120>
80101a97:	39 c6                	cmp    %eax,%esi
80101a99:	0f 87 d1 00 00 00    	ja     80101b70 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101a9f:	85 ff                	test   %edi,%edi
80101aa1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101aa8:	74 78                	je     80101b22 <writei+0xd2>
80101aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ab0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ab3:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101ab5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aba:	c1 ea 09             	shr    $0x9,%edx
80101abd:	89 f8                	mov    %edi,%eax
80101abf:	e8 1c f8 ff ff       	call   801012e0 <bmap>
80101ac4:	83 ec 08             	sub    $0x8,%esp
80101ac7:	50                   	push   %eax
80101ac8:	ff 37                	pushl  (%edi)
80101aca:	e8 01 e6 ff ff       	call   801000d0 <bread>
80101acf:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ad1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ad4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ad7:	89 f1                	mov    %esi,%ecx
80101ad9:	83 c4 0c             	add    $0xc,%esp
80101adc:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101ae2:	29 cb                	sub    %ecx,%ebx
80101ae4:	39 c3                	cmp    %eax,%ebx
80101ae6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101ae9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101aed:	53                   	push   %ebx
80101aee:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101af1:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101af3:	50                   	push   %eax
80101af4:	e8 67 2a 00 00       	call   80104560 <memmove>
    log_write(bp);
80101af9:	89 3c 24             	mov    %edi,(%esp)
80101afc:	e8 2f 12 00 00       	call   80102d30 <log_write>
    brelse(bp);
80101b01:	89 3c 24             	mov    %edi,(%esp)
80101b04:	e8 d7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b09:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b0c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b0f:	83 c4 10             	add    $0x10,%esp
80101b12:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b15:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b18:	77 96                	ja     80101ab0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b1a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b1d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b20:	77 36                	ja     80101b58 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b22:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b28:	5b                   	pop    %ebx
80101b29:	5e                   	pop    %esi
80101b2a:	5f                   	pop    %edi
80101b2b:	5d                   	pop    %ebp
80101b2c:	c3                   	ret    
80101b2d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b34:	66 83 f8 09          	cmp    $0x9,%ax
80101b38:	77 36                	ja     80101b70 <writei+0x120>
80101b3a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b41:	85 c0                	test   %eax,%eax
80101b43:	74 2b                	je     80101b70 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b45:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b4b:	5b                   	pop    %ebx
80101b4c:	5e                   	pop    %esi
80101b4d:	5f                   	pop    %edi
80101b4e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b4f:	ff e0                	jmp    *%eax
80101b51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b58:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b5b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b5e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b61:	50                   	push   %eax
80101b62:	e8 59 fa ff ff       	call   801015c0 <iupdate>
80101b67:	83 c4 10             	add    $0x10,%esp
80101b6a:	eb b6                	jmp    80101b22 <writei+0xd2>
80101b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b75:	eb ae                	jmp    80101b25 <writei+0xd5>
80101b77:	89 f6                	mov    %esi,%esi
80101b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b80 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b80:	55                   	push   %ebp
80101b81:	89 e5                	mov    %esp,%ebp
80101b83:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b86:	6a 0e                	push   $0xe
80101b88:	ff 75 0c             	pushl  0xc(%ebp)
80101b8b:	ff 75 08             	pushl  0x8(%ebp)
80101b8e:	e8 4d 2a 00 00       	call   801045e0 <strncmp>
}
80101b93:	c9                   	leave  
80101b94:	c3                   	ret    
80101b95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	57                   	push   %edi
80101ba4:	56                   	push   %esi
80101ba5:	53                   	push   %ebx
80101ba6:	83 ec 1c             	sub    $0x1c,%esp
80101ba9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bac:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bb1:	0f 85 80 00 00 00    	jne    80101c37 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bb7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bba:	31 ff                	xor    %edi,%edi
80101bbc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bbf:	85 d2                	test   %edx,%edx
80101bc1:	75 0d                	jne    80101bd0 <dirlookup+0x30>
80101bc3:	eb 5b                	jmp    80101c20 <dirlookup+0x80>
80101bc5:	8d 76 00             	lea    0x0(%esi),%esi
80101bc8:	83 c7 10             	add    $0x10,%edi
80101bcb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bce:	76 50                	jbe    80101c20 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101bd0:	6a 10                	push   $0x10
80101bd2:	57                   	push   %edi
80101bd3:	56                   	push   %esi
80101bd4:	53                   	push   %ebx
80101bd5:	e8 76 fd ff ff       	call   80101950 <readi>
80101bda:	83 c4 10             	add    $0x10,%esp
80101bdd:	83 f8 10             	cmp    $0x10,%eax
80101be0:	75 48                	jne    80101c2a <dirlookup+0x8a>
      panic("dirlookup read");
    if(de.inum == 0)
80101be2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101be7:	74 df                	je     80101bc8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101be9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bec:	83 ec 04             	sub    $0x4,%esp
80101bef:	6a 0e                	push   $0xe
80101bf1:	50                   	push   %eax
80101bf2:	ff 75 0c             	pushl  0xc(%ebp)
80101bf5:	e8 e6 29 00 00       	call   801045e0 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101bfa:	83 c4 10             	add    $0x10,%esp
80101bfd:	85 c0                	test   %eax,%eax
80101bff:	75 c7                	jne    80101bc8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c01:	8b 45 10             	mov    0x10(%ebp),%eax
80101c04:	85 c0                	test   %eax,%eax
80101c06:	74 05                	je     80101c0d <dirlookup+0x6d>
        *poff = off;
80101c08:	8b 45 10             	mov    0x10(%ebp),%eax
80101c0b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101c0d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c11:	8b 03                	mov    (%ebx),%eax
80101c13:	e8 f8 f5 ff ff       	call   80101210 <iget>
    }
  }

  return 0;
}
80101c18:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c1b:	5b                   	pop    %ebx
80101c1c:	5e                   	pop    %esi
80101c1d:	5f                   	pop    %edi
80101c1e:	5d                   	pop    %ebp
80101c1f:	c3                   	ret    
80101c20:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c23:	31 c0                	xor    %eax,%eax
}
80101c25:	5b                   	pop    %ebx
80101c26:	5e                   	pop    %esi
80101c27:	5f                   	pop    %edi
80101c28:	5d                   	pop    %ebp
80101c29:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlookup read");
80101c2a:	83 ec 0c             	sub    $0xc,%esp
80101c2d:	68 b9 70 10 80       	push   $0x801070b9
80101c32:	e8 39 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c37:	83 ec 0c             	sub    $0xc,%esp
80101c3a:	68 a7 70 10 80       	push   $0x801070a7
80101c3f:	e8 2c e7 ff ff       	call   80100370 <panic>
80101c44:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c4a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c50 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c50:	55                   	push   %ebp
80101c51:	89 e5                	mov    %esp,%ebp
80101c53:	57                   	push   %edi
80101c54:	56                   	push   %esi
80101c55:	53                   	push   %ebx
80101c56:	89 cf                	mov    %ecx,%edi
80101c58:	89 c3                	mov    %eax,%ebx
80101c5a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c5d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c63:	0f 84 53 01 00 00    	je     80101dbc <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c69:	e8 32 1b 00 00       	call   801037a0 <myproc>
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c6e:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);
80101c71:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c74:	68 00 0a 11 80       	push   $0x80110a00
80101c79:	e8 c2 26 00 00       	call   80104340 <acquire>
  ip->ref++;
80101c7e:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c82:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c89:	e8 d2 27 00 00       	call   80104460 <release>
80101c8e:	83 c4 10             	add    $0x10,%esp
80101c91:	eb 08                	jmp    80101c9b <namex+0x4b>
80101c93:	90                   	nop
80101c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101c98:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101c9b:	0f b6 03             	movzbl (%ebx),%eax
80101c9e:	3c 2f                	cmp    $0x2f,%al
80101ca0:	74 f6                	je     80101c98 <namex+0x48>
    path++;
  if(*path == 0)
80101ca2:	84 c0                	test   %al,%al
80101ca4:	0f 84 e3 00 00 00    	je     80101d8d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101caa:	0f b6 03             	movzbl (%ebx),%eax
80101cad:	89 da                	mov    %ebx,%edx
80101caf:	84 c0                	test   %al,%al
80101cb1:	0f 84 ac 00 00 00    	je     80101d63 <namex+0x113>
80101cb7:	3c 2f                	cmp    $0x2f,%al
80101cb9:	75 09                	jne    80101cc4 <namex+0x74>
80101cbb:	e9 a3 00 00 00       	jmp    80101d63 <namex+0x113>
80101cc0:	84 c0                	test   %al,%al
80101cc2:	74 0a                	je     80101cce <namex+0x7e>
    path++;
80101cc4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cc7:	0f b6 02             	movzbl (%edx),%eax
80101cca:	3c 2f                	cmp    $0x2f,%al
80101ccc:	75 f2                	jne    80101cc0 <namex+0x70>
80101cce:	89 d1                	mov    %edx,%ecx
80101cd0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101cd2:	83 f9 0d             	cmp    $0xd,%ecx
80101cd5:	0f 8e 8d 00 00 00    	jle    80101d68 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101cdb:	83 ec 04             	sub    $0x4,%esp
80101cde:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101ce1:	6a 0e                	push   $0xe
80101ce3:	53                   	push   %ebx
80101ce4:	57                   	push   %edi
80101ce5:	e8 76 28 00 00       	call   80104560 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cea:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101ced:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cf0:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101cf2:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101cf5:	75 11                	jne    80101d08 <namex+0xb8>
80101cf7:	89 f6                	mov    %esi,%esi
80101cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d00:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d03:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d06:	74 f8                	je     80101d00 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(myproc()->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d08:	83 ec 0c             	sub    $0xc,%esp
80101d0b:	56                   	push   %esi
80101d0c:	e8 5f f9 ff ff       	call   80101670 <ilock>
    if(ip->type != T_DIR){
80101d11:	83 c4 10             	add    $0x10,%esp
80101d14:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d19:	0f 85 7f 00 00 00    	jne    80101d9e <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d1f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d22:	85 d2                	test   %edx,%edx
80101d24:	74 09                	je     80101d2f <namex+0xdf>
80101d26:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d29:	0f 84 a3 00 00 00    	je     80101dd2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d2f:	83 ec 04             	sub    $0x4,%esp
80101d32:	6a 00                	push   $0x0
80101d34:	57                   	push   %edi
80101d35:	56                   	push   %esi
80101d36:	e8 65 fe ff ff       	call   80101ba0 <dirlookup>
80101d3b:	83 c4 10             	add    $0x10,%esp
80101d3e:	85 c0                	test   %eax,%eax
80101d40:	74 5c                	je     80101d9e <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d42:	83 ec 0c             	sub    $0xc,%esp
80101d45:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d48:	56                   	push   %esi
80101d49:	e8 02 fa ff ff       	call   80101750 <iunlock>
  iput(ip);
80101d4e:	89 34 24             	mov    %esi,(%esp)
80101d51:	e8 4a fa ff ff       	call   801017a0 <iput>
80101d56:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d59:	83 c4 10             	add    $0x10,%esp
80101d5c:	89 c6                	mov    %eax,%esi
80101d5e:	e9 38 ff ff ff       	jmp    80101c9b <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d63:	31 c9                	xor    %ecx,%ecx
80101d65:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d68:	83 ec 04             	sub    $0x4,%esp
80101d6b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d6e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d71:	51                   	push   %ecx
80101d72:	53                   	push   %ebx
80101d73:	57                   	push   %edi
80101d74:	e8 e7 27 00 00       	call   80104560 <memmove>
    name[len] = 0;
80101d79:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d7c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d7f:	83 c4 10             	add    $0x10,%esp
80101d82:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d86:	89 d3                	mov    %edx,%ebx
80101d88:	e9 65 ff ff ff       	jmp    80101cf2 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d8d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101d90:	85 c0                	test   %eax,%eax
80101d92:	75 54                	jne    80101de8 <namex+0x198>
80101d94:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101d96:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101d99:	5b                   	pop    %ebx
80101d9a:	5e                   	pop    %esi
80101d9b:	5f                   	pop    %edi
80101d9c:	5d                   	pop    %ebp
80101d9d:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d9e:	83 ec 0c             	sub    $0xc,%esp
80101da1:	56                   	push   %esi
80101da2:	e8 a9 f9 ff ff       	call   80101750 <iunlock>
  iput(ip);
80101da7:	89 34 24             	mov    %esi,(%esp)
80101daa:	e8 f1 f9 ff ff       	call   801017a0 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101daf:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101db5:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101db7:	5b                   	pop    %ebx
80101db8:	5e                   	pop    %esi
80101db9:	5f                   	pop    %edi
80101dba:	5d                   	pop    %ebp
80101dbb:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dbc:	ba 01 00 00 00       	mov    $0x1,%edx
80101dc1:	b8 01 00 00 00       	mov    $0x1,%eax
80101dc6:	e8 45 f4 ff ff       	call   80101210 <iget>
80101dcb:	89 c6                	mov    %eax,%esi
80101dcd:	e9 c9 fe ff ff       	jmp    80101c9b <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101dd2:	83 ec 0c             	sub    $0xc,%esp
80101dd5:	56                   	push   %esi
80101dd6:	e8 75 f9 ff ff       	call   80101750 <iunlock>
      return ip;
80101ddb:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dde:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101de1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101de3:	5b                   	pop    %ebx
80101de4:	5e                   	pop    %esi
80101de5:	5f                   	pop    %edi
80101de6:	5d                   	pop    %ebp
80101de7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101de8:	83 ec 0c             	sub    $0xc,%esp
80101deb:	56                   	push   %esi
80101dec:	e8 af f9 ff ff       	call   801017a0 <iput>
    return 0;
80101df1:	83 c4 10             	add    $0x10,%esp
80101df4:	31 c0                	xor    %eax,%eax
80101df6:	eb 9e                	jmp    80101d96 <namex+0x146>
80101df8:	90                   	nop
80101df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e00 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e00:	55                   	push   %ebp
80101e01:	89 e5                	mov    %esp,%ebp
80101e03:	57                   	push   %edi
80101e04:	56                   	push   %esi
80101e05:	53                   	push   %ebx
80101e06:	83 ec 20             	sub    $0x20,%esp
80101e09:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e0c:	6a 00                	push   $0x0
80101e0e:	ff 75 0c             	pushl  0xc(%ebp)
80101e11:	53                   	push   %ebx
80101e12:	e8 89 fd ff ff       	call   80101ba0 <dirlookup>
80101e17:	83 c4 10             	add    $0x10,%esp
80101e1a:	85 c0                	test   %eax,%eax
80101e1c:	75 67                	jne    80101e85 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e1e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e21:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e24:	85 ff                	test   %edi,%edi
80101e26:	74 29                	je     80101e51 <dirlink+0x51>
80101e28:	31 ff                	xor    %edi,%edi
80101e2a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e2d:	eb 09                	jmp    80101e38 <dirlink+0x38>
80101e2f:	90                   	nop
80101e30:	83 c7 10             	add    $0x10,%edi
80101e33:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e36:	76 19                	jbe    80101e51 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e38:	6a 10                	push   $0x10
80101e3a:	57                   	push   %edi
80101e3b:	56                   	push   %esi
80101e3c:	53                   	push   %ebx
80101e3d:	e8 0e fb ff ff       	call   80101950 <readi>
80101e42:	83 c4 10             	add    $0x10,%esp
80101e45:	83 f8 10             	cmp    $0x10,%eax
80101e48:	75 4e                	jne    80101e98 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e4a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e4f:	75 df                	jne    80101e30 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e51:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e54:	83 ec 04             	sub    $0x4,%esp
80101e57:	6a 0e                	push   $0xe
80101e59:	ff 75 0c             	pushl  0xc(%ebp)
80101e5c:	50                   	push   %eax
80101e5d:	e8 ee 27 00 00       	call   80104650 <strncpy>
  de.inum = inum;
80101e62:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e65:	6a 10                	push   $0x10
80101e67:	57                   	push   %edi
80101e68:	56                   	push   %esi
80101e69:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e6a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e6e:	e8 dd fb ff ff       	call   80101a50 <writei>
80101e73:	83 c4 20             	add    $0x20,%esp
80101e76:	83 f8 10             	cmp    $0x10,%eax
80101e79:	75 2a                	jne    80101ea5 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e7b:	31 c0                	xor    %eax,%eax
}
80101e7d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e80:	5b                   	pop    %ebx
80101e81:	5e                   	pop    %esi
80101e82:	5f                   	pop    %edi
80101e83:	5d                   	pop    %ebp
80101e84:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e85:	83 ec 0c             	sub    $0xc,%esp
80101e88:	50                   	push   %eax
80101e89:	e8 12 f9 ff ff       	call   801017a0 <iput>
    return -1;
80101e8e:	83 c4 10             	add    $0x10,%esp
80101e91:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101e96:	eb e5                	jmp    80101e7d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101e98:	83 ec 0c             	sub    $0xc,%esp
80101e9b:	68 c8 70 10 80       	push   $0x801070c8
80101ea0:	e8 cb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101ea5:	83 ec 0c             	sub    $0xc,%esp
80101ea8:	68 be 76 10 80       	push   $0x801076be
80101ead:	e8 be e4 ff ff       	call   80100370 <panic>
80101eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ec0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ec0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ec3:	89 e5                	mov    %esp,%ebp
80101ec5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ec8:	8b 45 08             	mov    0x8(%ebp),%eax
80101ecb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ece:	e8 7d fd ff ff       	call   80101c50 <namex>
}
80101ed3:	c9                   	leave  
80101ed4:	c3                   	ret    
80101ed5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ee0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ee0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ee1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101ee6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ee8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101eeb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101eee:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101eef:	e9 5c fd ff ff       	jmp    80101c50 <namex>
80101ef4:	66 90                	xchg   %ax,%ax
80101ef6:	66 90                	xchg   %ax,%ax
80101ef8:	66 90                	xchg   %ax,%ax
80101efa:	66 90                	xchg   %ax,%ax
80101efc:	66 90                	xchg   %ax,%ax
80101efe:	66 90                	xchg   %ax,%ax

80101f00 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f00:	55                   	push   %ebp
  if(b == 0)
80101f01:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	56                   	push   %esi
80101f06:	53                   	push   %ebx
  if(b == 0)
80101f07:	0f 84 ad 00 00 00    	je     80101fba <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f0d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f10:	89 c1                	mov    %eax,%ecx
80101f12:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f18:	0f 87 8f 00 00 00    	ja     80101fad <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f1e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f23:	90                   	nop
80101f24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f28:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f29:	83 e0 c0             	and    $0xffffffc0,%eax
80101f2c:	3c 40                	cmp    $0x40,%al
80101f2e:	75 f8                	jne    80101f28 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f30:	31 f6                	xor    %esi,%esi
80101f32:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f37:	89 f0                	mov    %esi,%eax
80101f39:	ee                   	out    %al,(%dx)
80101f3a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f3f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f44:	ee                   	out    %al,(%dx)
80101f45:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f4a:	89 d8                	mov    %ebx,%eax
80101f4c:	ee                   	out    %al,(%dx)
80101f4d:	89 d8                	mov    %ebx,%eax
80101f4f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f54:	c1 f8 08             	sar    $0x8,%eax
80101f57:	ee                   	out    %al,(%dx)
80101f58:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f5d:	89 f0                	mov    %esi,%eax
80101f5f:	ee                   	out    %al,(%dx)
80101f60:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f64:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f69:	83 e0 01             	and    $0x1,%eax
80101f6c:	c1 e0 04             	shl    $0x4,%eax
80101f6f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f72:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f73:	f6 01 04             	testb  $0x4,(%ecx)
80101f76:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f7b:	75 13                	jne    80101f90 <idestart+0x90>
80101f7d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f82:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f86:	5b                   	pop    %ebx
80101f87:	5e                   	pop    %esi
80101f88:	5d                   	pop    %ebp
80101f89:	c3                   	ret    
80101f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f90:	b8 30 00 00 00       	mov    $0x30,%eax
80101f95:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101f96:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101f9b:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101f9e:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fa3:	fc                   	cld    
80101fa4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fa6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fa9:	5b                   	pop    %ebx
80101faa:	5e                   	pop    %esi
80101fab:	5d                   	pop    %ebp
80101fac:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fad:	83 ec 0c             	sub    $0xc,%esp
80101fb0:	68 34 71 10 80       	push   $0x80107134
80101fb5:	e8 b6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fba:	83 ec 0c             	sub    $0xc,%esp
80101fbd:	68 2b 71 10 80       	push   $0x8010712b
80101fc2:	e8 a9 e3 ff ff       	call   80100370 <panic>
80101fc7:	89 f6                	mov    %esi,%esi
80101fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fd0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fd0:	55                   	push   %ebp
80101fd1:	89 e5                	mov    %esp,%ebp
80101fd3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fd6:	68 46 71 10 80       	push   $0x80107146
80101fdb:	68 80 a5 10 80       	push   $0x8010a580
80101fe0:	e8 5b 22 00 00       	call   80104240 <initlock>
  ioapicenable(IRQ_IDE, ncpu - 1);
80101fe5:	58                   	pop    %eax
80101fe6:	a1 20 2d 11 80       	mov    0x80112d20,%eax
80101feb:	5a                   	pop    %edx
80101fec:	83 e8 01             	sub    $0x1,%eax
80101fef:	50                   	push   %eax
80101ff0:	6a 0e                	push   $0xe
80101ff2:	e8 a9 02 00 00       	call   801022a0 <ioapicenable>
80101ff7:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101ffa:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fff:	90                   	nop
80102000:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102001:	83 e0 c0             	and    $0xffffffc0,%eax
80102004:	3c 40                	cmp    $0x40,%al
80102006:	75 f8                	jne    80102000 <ideinit+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102008:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010200d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102012:	ee                   	out    %al,(%dx)
80102013:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102018:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201d:	eb 06                	jmp    80102025 <ideinit+0x55>
8010201f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102020:	83 e9 01             	sub    $0x1,%ecx
80102023:	74 0f                	je     80102034 <ideinit+0x64>
80102025:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102026:	84 c0                	test   %al,%al
80102028:	74 f6                	je     80102020 <ideinit+0x50>
      havedisk1 = 1;
8010202a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102031:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102034:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102039:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010203e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010203f:	c9                   	leave  
80102040:	c3                   	ret    
80102041:	eb 0d                	jmp    80102050 <ideintr>
80102043:	90                   	nop
80102044:	90                   	nop
80102045:	90                   	nop
80102046:	90                   	nop
80102047:	90                   	nop
80102048:	90                   	nop
80102049:	90                   	nop
8010204a:	90                   	nop
8010204b:	90                   	nop
8010204c:	90                   	nop
8010204d:	90                   	nop
8010204e:	90                   	nop
8010204f:	90                   	nop

80102050 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102050:	55                   	push   %ebp
80102051:	89 e5                	mov    %esp,%ebp
80102053:	57                   	push   %edi
80102054:	56                   	push   %esi
80102055:	53                   	push   %ebx
80102056:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102059:	68 80 a5 10 80       	push   $0x8010a580
8010205e:	e8 dd 22 00 00       	call   80104340 <acquire>

  if((b = idequeue) == 0){
80102063:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102069:	83 c4 10             	add    $0x10,%esp
8010206c:	85 db                	test   %ebx,%ebx
8010206e:	74 34                	je     801020a4 <ideintr+0x54>
    release(&idelock);
    return;
  }
  idequeue = b->qnext;
80102070:	8b 43 58             	mov    0x58(%ebx),%eax
80102073:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102078:	8b 33                	mov    (%ebx),%esi
8010207a:	f7 c6 04 00 00 00    	test   $0x4,%esi
80102080:	74 3e                	je     801020c0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102082:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
80102085:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
80102088:	83 ce 02             	or     $0x2,%esi
8010208b:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
8010208d:	53                   	push   %ebx
8010208e:	e8 ad 1e 00 00       	call   80103f40 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
80102093:	a1 64 a5 10 80       	mov    0x8010a564,%eax
80102098:	83 c4 10             	add    $0x10,%esp
8010209b:	85 c0                	test   %eax,%eax
8010209d:	74 05                	je     801020a4 <ideintr+0x54>
    idestart(idequeue);
8010209f:	e8 5c fe ff ff       	call   80101f00 <idestart>

  // First queued buffer is the active request.
  acquire(&idelock);

  if((b = idequeue) == 0){
    release(&idelock);
801020a4:	83 ec 0c             	sub    $0xc,%esp
801020a7:	68 80 a5 10 80       	push   $0x8010a580
801020ac:	e8 af 23 00 00       	call   80104460 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020b4:	5b                   	pop    %ebx
801020b5:	5e                   	pop    %esi
801020b6:	5f                   	pop    %edi
801020b7:	5d                   	pop    %ebp
801020b8:	c3                   	ret    
801020b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020c0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c5:	8d 76 00             	lea    0x0(%esi),%esi
801020c8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020c9:	89 c1                	mov    %eax,%ecx
801020cb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ce:	80 f9 40             	cmp    $0x40,%cl
801020d1:	75 f5                	jne    801020c8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020d3:	a8 21                	test   $0x21,%al
801020d5:	75 ab                	jne    80102082 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020d7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020da:	b9 80 00 00 00       	mov    $0x80,%ecx
801020df:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020e4:	fc                   	cld    
801020e5:	f3 6d                	rep insl (%dx),%es:(%edi)
801020e7:	8b 33                	mov    (%ebx),%esi
801020e9:	eb 97                	jmp    80102082 <ideintr+0x32>
801020eb:	90                   	nop
801020ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801020f0 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
801020f0:	55                   	push   %ebp
801020f1:	89 e5                	mov    %esp,%ebp
801020f3:	53                   	push   %ebx
801020f4:	83 ec 10             	sub    $0x10,%esp
801020f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
801020fa:	8d 43 0c             	lea    0xc(%ebx),%eax
801020fd:	50                   	push   %eax
801020fe:	e8 0d 21 00 00       	call   80104210 <holdingsleep>
80102103:	83 c4 10             	add    $0x10,%esp
80102106:	85 c0                	test   %eax,%eax
80102108:	0f 84 ad 00 00 00    	je     801021bb <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010210e:	8b 03                	mov    (%ebx),%eax
80102110:	83 e0 06             	and    $0x6,%eax
80102113:	83 f8 02             	cmp    $0x2,%eax
80102116:	0f 84 b9 00 00 00    	je     801021d5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010211c:	8b 53 04             	mov    0x4(%ebx),%edx
8010211f:	85 d2                	test   %edx,%edx
80102121:	74 0d                	je     80102130 <iderw+0x40>
80102123:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102128:	85 c0                	test   %eax,%eax
8010212a:	0f 84 98 00 00 00    	je     801021c8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102130:	83 ec 0c             	sub    $0xc,%esp
80102133:	68 80 a5 10 80       	push   $0x8010a580
80102138:	e8 03 22 00 00       	call   80104340 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010213d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102143:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102146:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010214d:	85 d2                	test   %edx,%edx
8010214f:	75 09                	jne    8010215a <iderw+0x6a>
80102151:	eb 58                	jmp    801021ab <iderw+0xbb>
80102153:	90                   	nop
80102154:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102158:	89 c2                	mov    %eax,%edx
8010215a:	8b 42 58             	mov    0x58(%edx),%eax
8010215d:	85 c0                	test   %eax,%eax
8010215f:	75 f7                	jne    80102158 <iderw+0x68>
80102161:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102164:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102166:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010216c:	74 44                	je     801021b2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010216e:	8b 03                	mov    (%ebx),%eax
80102170:	83 e0 06             	and    $0x6,%eax
80102173:	83 f8 02             	cmp    $0x2,%eax
80102176:	74 23                	je     8010219b <iderw+0xab>
80102178:	90                   	nop
80102179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
80102180:	83 ec 08             	sub    $0x8,%esp
80102183:	68 80 a5 10 80       	push   $0x8010a580
80102188:	53                   	push   %ebx
80102189:	e8 02 1c 00 00       	call   80103d90 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 c4 10             	add    $0x10,%esp
80102193:	83 e0 06             	and    $0x6,%eax
80102196:	83 f8 02             	cmp    $0x2,%eax
80102199:	75 e5                	jne    80102180 <iderw+0x90>
    sleep(b, &idelock);
  }


  release(&idelock);
8010219b:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021a5:	c9                   	leave  
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }


  release(&idelock);
801021a6:	e9 b5 22 00 00       	jmp    80104460 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021ab:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021b0:	eb b2                	jmp    80102164 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021b2:	89 d8                	mov    %ebx,%eax
801021b4:	e8 47 fd ff ff       	call   80101f00 <idestart>
801021b9:	eb b3                	jmp    8010216e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021bb:	83 ec 0c             	sub    $0xc,%esp
801021be:	68 4a 71 10 80       	push   $0x8010714a
801021c3:	e8 a8 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021c8:	83 ec 0c             	sub    $0xc,%esp
801021cb:	68 75 71 10 80       	push   $0x80107175
801021d0:	e8 9b e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021d5:	83 ec 0c             	sub    $0xc,%esp
801021d8:	68 60 71 10 80       	push   $0x80107160
801021dd:	e8 8e e1 ff ff       	call   80100370 <panic>
801021e2:	66 90                	xchg   %ax,%ax
801021e4:	66 90                	xchg   %ax,%ax
801021e6:	66 90                	xchg   %ax,%ax
801021e8:	66 90                	xchg   %ax,%ax
801021ea:	66 90                	xchg   %ax,%ax
801021ec:	66 90                	xchg   %ax,%ax
801021ee:	66 90                	xchg   %ax,%ax

801021f0 <ioapicinit>:
801021f0:	55                   	push   %ebp
801021f1:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
801021f8:	00 c0 fe 
801021fb:	89 e5                	mov    %esp,%ebp
801021fd:	56                   	push   %esi
801021fe:	53                   	push   %ebx
801021ff:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102206:	00 00 00 
80102209:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010220f:	8b 72 10             	mov    0x10(%edx),%esi
80102212:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102218:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010221e:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80102225:	89 f0                	mov    %esi,%eax
80102227:	c1 e8 10             	shr    $0x10,%eax
8010222a:	0f b6 f0             	movzbl %al,%esi
8010222d:	8b 41 10             	mov    0x10(%ecx),%eax
80102230:	c1 e8 18             	shr    $0x18,%eax
80102233:	39 d0                	cmp    %edx,%eax
80102235:	74 16                	je     8010224d <ioapicinit+0x5d>
80102237:	83 ec 0c             	sub    $0xc,%esp
8010223a:	68 94 71 10 80       	push   $0x80107194
8010223f:	e8 1c e4 ff ff       	call   80100660 <cprintf>
80102244:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
8010224a:	83 c4 10             	add    $0x10,%esp
8010224d:	83 c6 21             	add    $0x21,%esi
80102250:	ba 10 00 00 00       	mov    $0x10,%edx
80102255:	b8 20 00 00 00       	mov    $0x20,%eax
8010225a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102260:	89 11                	mov    %edx,(%ecx)
80102262:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102268:	89 c3                	mov    %eax,%ebx
8010226a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
80102270:	83 c0 01             	add    $0x1,%eax
80102273:	89 59 10             	mov    %ebx,0x10(%ecx)
80102276:	8d 5a 01             	lea    0x1(%edx),%ebx
80102279:	83 c2 02             	add    $0x2,%edx
8010227c:	39 f0                	cmp    %esi,%eax
8010227e:	89 19                	mov    %ebx,(%ecx)
80102280:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102286:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
8010228d:	75 d1                	jne    80102260 <ioapicinit+0x70>
8010228f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102292:	5b                   	pop    %ebx
80102293:	5e                   	pop    %esi
80102294:	5d                   	pop    %ebp
80102295:	c3                   	ret    
80102296:	8d 76 00             	lea    0x0(%esi),%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022a0 <ioapicenable>:
801022a0:	55                   	push   %ebp
801022a1:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022a7:	89 e5                	mov    %esp,%ebp
801022a9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ac:	8d 50 20             	lea    0x20(%eax),%edx
801022af:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022b3:	89 01                	mov    %eax,(%ecx)
801022b5:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022bb:	83 c0 01             	add    $0x1,%eax
801022be:	89 51 10             	mov    %edx,0x10(%ecx)
801022c1:	8b 55 0c             	mov    0xc(%ebp),%edx
801022c4:	89 01                	mov    %eax,(%ecx)
801022c6:	a1 54 26 11 80       	mov    0x80112654,%eax
801022cb:	c1 e2 18             	shl    $0x18,%edx
801022ce:	89 50 10             	mov    %edx,0x10(%eax)
801022d1:	5d                   	pop    %ebp
801022d2:	c3                   	ret    
801022d3:	66 90                	xchg   %ax,%ax
801022d5:	66 90                	xchg   %ax,%ax
801022d7:	66 90                	xchg   %ax,%ax
801022d9:	66 90                	xchg   %ax,%ax
801022db:	66 90                	xchg   %ax,%ax
801022dd:	66 90                	xchg   %ax,%ax
801022df:	90                   	nop

801022e0 <kfree>:
801022e0:	55                   	push   %ebp
801022e1:	89 e5                	mov    %esp,%ebp
801022e3:	53                   	push   %ebx
801022e4:	83 ec 04             	sub    $0x4,%esp
801022e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801022ea:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
801022f0:	75 70                	jne    80102362 <kfree+0x82>
801022f2:	81 fb c8 55 11 80    	cmp    $0x801155c8,%ebx
801022f8:	72 68                	jb     80102362 <kfree+0x82>
801022fa:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102300:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102305:	77 5b                	ja     80102362 <kfree+0x82>
80102307:	83 ec 04             	sub    $0x4,%esp
8010230a:	68 00 10 00 00       	push   $0x1000
8010230f:	6a 01                	push   $0x1
80102311:	53                   	push   %ebx
80102312:	e8 99 21 00 00       	call   801044b0 <memset>
80102317:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010231d:	83 c4 10             	add    $0x10,%esp
80102320:	85 d2                	test   %edx,%edx
80102322:	75 2c                	jne    80102350 <kfree+0x70>
80102324:	a1 98 26 11 80       	mov    0x80112698,%eax
80102329:	89 03                	mov    %eax,(%ebx)
8010232b:	a1 94 26 11 80       	mov    0x80112694,%eax
80102330:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
80102336:	85 c0                	test   %eax,%eax
80102338:	75 06                	jne    80102340 <kfree+0x60>
8010233a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010233d:	c9                   	leave  
8010233e:	c3                   	ret    
8010233f:	90                   	nop
80102340:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
80102347:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010234a:	c9                   	leave  
8010234b:	e9 10 21 00 00       	jmp    80104460 <release>
80102350:	83 ec 0c             	sub    $0xc,%esp
80102353:	68 60 26 11 80       	push   $0x80112660
80102358:	e8 e3 1f 00 00       	call   80104340 <acquire>
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	eb c2                	jmp    80102324 <kfree+0x44>
80102362:	83 ec 0c             	sub    $0xc,%esp
80102365:	68 c6 71 10 80       	push   $0x801071c6
8010236a:	e8 01 e0 ff ff       	call   80100370 <panic>
8010236f:	90                   	nop

80102370 <freerange>:
80102370:	55                   	push   %ebp
80102371:	89 e5                	mov    %esp,%ebp
80102373:	56                   	push   %esi
80102374:	53                   	push   %ebx
80102375:	8b 45 08             	mov    0x8(%ebp),%eax
80102378:	8b 75 0c             	mov    0xc(%ebp),%esi
8010237b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102381:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102387:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010238d:	39 de                	cmp    %ebx,%esi
8010238f:	72 23                	jb     801023b4 <freerange+0x44>
80102391:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102398:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010239e:	83 ec 0c             	sub    $0xc,%esp
801023a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023a7:	50                   	push   %eax
801023a8:	e8 33 ff ff ff       	call   801022e0 <kfree>
801023ad:	83 c4 10             	add    $0x10,%esp
801023b0:	39 f3                	cmp    %esi,%ebx
801023b2:	76 e4                	jbe    80102398 <freerange+0x28>
801023b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023b7:	5b                   	pop    %ebx
801023b8:	5e                   	pop    %esi
801023b9:	5d                   	pop    %ebp
801023ba:	c3                   	ret    
801023bb:	90                   	nop
801023bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023c0 <kinit1>:
801023c0:	55                   	push   %ebp
801023c1:	89 e5                	mov    %esp,%ebp
801023c3:	56                   	push   %esi
801023c4:	53                   	push   %ebx
801023c5:	8b 75 0c             	mov    0xc(%ebp),%esi
801023c8:	83 ec 08             	sub    $0x8,%esp
801023cb:	68 cc 71 10 80       	push   $0x801071cc
801023d0:	68 60 26 11 80       	push   $0x80112660
801023d5:	e8 66 1e 00 00       	call   80104240 <initlock>
801023da:	8b 45 08             	mov    0x8(%ebp),%eax
801023dd:	83 c4 10             	add    $0x10,%esp
801023e0:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
801023e7:	00 00 00 
801023ea:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023f0:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023f6:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023fc:	39 de                	cmp    %ebx,%esi
801023fe:	72 1c                	jb     8010241c <kinit1+0x5c>
80102400:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102406:	83 ec 0c             	sub    $0xc,%esp
80102409:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010240f:	50                   	push   %eax
80102410:	e8 cb fe ff ff       	call   801022e0 <kfree>
80102415:	83 c4 10             	add    $0x10,%esp
80102418:	39 de                	cmp    %ebx,%esi
8010241a:	73 e4                	jae    80102400 <kinit1+0x40>
8010241c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010241f:	5b                   	pop    %ebx
80102420:	5e                   	pop    %esi
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102430 <kinit2>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	56                   	push   %esi
80102434:	53                   	push   %ebx
80102435:	8b 45 08             	mov    0x8(%ebp),%eax
80102438:	8b 75 0c             	mov    0xc(%ebp),%esi
8010243b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102441:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102447:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244d:	39 de                	cmp    %ebx,%esi
8010244f:	72 23                	jb     80102474 <kinit2+0x44>
80102451:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102458:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010245e:	83 ec 0c             	sub    $0xc,%esp
80102461:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80102467:	50                   	push   %eax
80102468:	e8 73 fe ff ff       	call   801022e0 <kfree>
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	39 de                	cmp    %ebx,%esi
80102472:	73 e4                	jae    80102458 <kinit2+0x28>
80102474:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
8010247b:	00 00 00 
8010247e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102481:	5b                   	pop    %ebx
80102482:	5e                   	pop    %esi
80102483:	5d                   	pop    %ebp
80102484:	c3                   	ret    
80102485:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102490 <kalloc>:
80102490:	55                   	push   %ebp
80102491:	89 e5                	mov    %esp,%ebp
80102493:	53                   	push   %ebx
80102494:	83 ec 04             	sub    $0x4,%esp
80102497:	a1 94 26 11 80       	mov    0x80112694,%eax
8010249c:	85 c0                	test   %eax,%eax
8010249e:	75 30                	jne    801024d0 <kalloc+0x40>
801024a0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024a6:	85 db                	test   %ebx,%ebx
801024a8:	74 1c                	je     801024c6 <kalloc+0x36>
801024aa:	8b 13                	mov    (%ebx),%edx
801024ac:	89 15 98 26 11 80    	mov    %edx,0x80112698
801024b2:	85 c0                	test   %eax,%eax
801024b4:	74 10                	je     801024c6 <kalloc+0x36>
801024b6:	83 ec 0c             	sub    $0xc,%esp
801024b9:	68 60 26 11 80       	push   $0x80112660
801024be:	e8 9d 1f 00 00       	call   80104460 <release>
801024c3:	83 c4 10             	add    $0x10,%esp
801024c6:	89 d8                	mov    %ebx,%eax
801024c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024cb:	c9                   	leave  
801024cc:	c3                   	ret    
801024cd:	8d 76 00             	lea    0x0(%esi),%esi
801024d0:	83 ec 0c             	sub    $0xc,%esp
801024d3:	68 60 26 11 80       	push   $0x80112660
801024d8:	e8 63 1e 00 00       	call   80104340 <acquire>
801024dd:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
801024e3:	83 c4 10             	add    $0x10,%esp
801024e6:	a1 94 26 11 80       	mov    0x80112694,%eax
801024eb:	85 db                	test   %ebx,%ebx
801024ed:	75 bb                	jne    801024aa <kalloc+0x1a>
801024ef:	eb c1                	jmp    801024b2 <kalloc+0x22>
801024f1:	66 90                	xchg   %ax,%ax
801024f3:	66 90                	xchg   %ax,%ax
801024f5:	66 90                	xchg   %ax,%ax
801024f7:	66 90                	xchg   %ax,%ax
801024f9:	66 90                	xchg   %ax,%ax
801024fb:	66 90                	xchg   %ax,%ax
801024fd:	66 90                	xchg   %ax,%ax
801024ff:	90                   	nop

80102500 <kbdgetc>:
80102500:	55                   	push   %ebp
80102501:	ba 64 00 00 00       	mov    $0x64,%edx
80102506:	89 e5                	mov    %esp,%ebp
80102508:	ec                   	in     (%dx),%al
80102509:	a8 01                	test   $0x1,%al
8010250b:	0f 84 af 00 00 00    	je     801025c0 <kbdgetc+0xc0>
80102511:	ba 60 00 00 00       	mov    $0x60,%edx
80102516:	ec                   	in     (%dx),%al
80102517:	0f b6 d0             	movzbl %al,%edx
8010251a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102520:	74 7e                	je     801025a0 <kbdgetc+0xa0>
80102522:	84 c0                	test   %al,%al
80102524:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010252a:	79 24                	jns    80102550 <kbdgetc+0x50>
8010252c:	f6 c1 40             	test   $0x40,%cl
8010252f:	75 05                	jne    80102536 <kbdgetc+0x36>
80102531:	89 c2                	mov    %eax,%edx
80102533:	83 e2 7f             	and    $0x7f,%edx
80102536:	0f b6 82 00 73 10 80 	movzbl -0x7fef8d00(%edx),%eax
8010253d:	83 c8 40             	or     $0x40,%eax
80102540:	0f b6 c0             	movzbl %al,%eax
80102543:	f7 d0                	not    %eax
80102545:	21 c8                	and    %ecx,%eax
80102547:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
8010254c:	31 c0                	xor    %eax,%eax
8010254e:	5d                   	pop    %ebp
8010254f:	c3                   	ret    
80102550:	f6 c1 40             	test   $0x40,%cl
80102553:	74 09                	je     8010255e <kbdgetc+0x5e>
80102555:	83 c8 80             	or     $0xffffff80,%eax
80102558:	83 e1 bf             	and    $0xffffffbf,%ecx
8010255b:	0f b6 d0             	movzbl %al,%edx
8010255e:	0f b6 82 00 73 10 80 	movzbl -0x7fef8d00(%edx),%eax
80102565:	09 c1                	or     %eax,%ecx
80102567:	0f b6 82 00 72 10 80 	movzbl -0x7fef8e00(%edx),%eax
8010256e:	31 c1                	xor    %eax,%ecx
80102570:	89 c8                	mov    %ecx,%eax
80102572:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102578:	83 e0 03             	and    $0x3,%eax
8010257b:	83 e1 08             	and    $0x8,%ecx
8010257e:	8b 04 85 e0 71 10 80 	mov    -0x7fef8e20(,%eax,4),%eax
80102585:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
80102589:	74 c3                	je     8010254e <kbdgetc+0x4e>
8010258b:	8d 50 9f             	lea    -0x61(%eax),%edx
8010258e:	83 fa 19             	cmp    $0x19,%edx
80102591:	77 1d                	ja     801025b0 <kbdgetc+0xb0>
80102593:	83 e8 20             	sub    $0x20,%eax
80102596:	5d                   	pop    %ebp
80102597:	c3                   	ret    
80102598:	90                   	nop
80102599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025a0:	31 c0                	xor    %eax,%eax
801025a2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
801025a9:	5d                   	pop    %ebp
801025aa:	c3                   	ret    
801025ab:	90                   	nop
801025ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025b0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025b3:	8d 50 20             	lea    0x20(%eax),%edx
801025b6:	5d                   	pop    %ebp
801025b7:	83 f9 19             	cmp    $0x19,%ecx
801025ba:	0f 46 c2             	cmovbe %edx,%eax
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
801025c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801025c5:	5d                   	pop    %ebp
801025c6:	c3                   	ret    
801025c7:	89 f6                	mov    %esi,%esi
801025c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025d0 <kbdintr>:
801025d0:	55                   	push   %ebp
801025d1:	89 e5                	mov    %esp,%ebp
801025d3:	83 ec 14             	sub    $0x14,%esp
801025d6:	68 00 25 10 80       	push   $0x80102500
801025db:	e8 10 e2 ff ff       	call   801007f0 <consoleintr>
801025e0:	83 c4 10             	add    $0x10,%esp
801025e3:	c9                   	leave  
801025e4:	c3                   	ret    
801025e5:	66 90                	xchg   %ax,%ax
801025e7:	66 90                	xchg   %ax,%ax
801025e9:	66 90                	xchg   %ax,%ax
801025eb:	66 90                	xchg   %ax,%ax
801025ed:	66 90                	xchg   %ax,%ax
801025ef:	90                   	nop

801025f0 <lapicinit>:
801025f0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801025f5:	55                   	push   %ebp
801025f6:	89 e5                	mov    %esp,%ebp
801025f8:	85 c0                	test   %eax,%eax
801025fa:	0f 84 c8 00 00 00    	je     801026c8 <lapicinit+0xd8>
80102600:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102607:	01 00 00 
8010260a:	8b 50 20             	mov    0x20(%eax),%edx
8010260d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102614:	00 00 00 
80102617:	8b 50 20             	mov    0x20(%eax),%edx
8010261a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102621:	00 02 00 
80102624:	8b 50 20             	mov    0x20(%eax),%edx
80102627:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010262e:	96 98 00 
80102631:	8b 50 20             	mov    0x20(%eax),%edx
80102634:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010263b:	00 01 00 
8010263e:	8b 50 20             	mov    0x20(%eax),%edx
80102641:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102648:	00 01 00 
8010264b:	8b 50 20             	mov    0x20(%eax),%edx
8010264e:	8b 50 30             	mov    0x30(%eax),%edx
80102651:	c1 ea 10             	shr    $0x10,%edx
80102654:	80 fa 03             	cmp    $0x3,%dl
80102657:	77 77                	ja     801026d0 <lapicinit+0xe0>
80102659:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102660:	00 00 00 
80102663:	8b 50 20             	mov    0x20(%eax),%edx
80102666:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010266d:	00 00 00 
80102670:	8b 50 20             	mov    0x20(%eax),%edx
80102673:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010267a:	00 00 00 
8010267d:	8b 50 20             	mov    0x20(%eax),%edx
80102680:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102687:	00 00 00 
8010268a:	8b 50 20             	mov    0x20(%eax),%edx
8010268d:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
80102694:	00 00 00 
80102697:	8b 50 20             	mov    0x20(%eax),%edx
8010269a:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026a1:	85 08 00 
801026a4:	8b 50 20             	mov    0x20(%eax),%edx
801026a7:	89 f6                	mov    %esi,%esi
801026a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026b0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026b6:	80 e6 10             	and    $0x10,%dh
801026b9:	75 f5                	jne    801026b0 <lapicinit+0xc0>
801026bb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026c2:	00 00 00 
801026c5:	8b 40 20             	mov    0x20(%eax),%eax
801026c8:	5d                   	pop    %ebp
801026c9:	c3                   	ret    
801026ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801026d0:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
801026d7:	00 01 00 
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	e9 77 ff ff ff       	jmp    80102659 <lapicinit+0x69>
801026e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801026f0 <lapicid>:
801026f0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
801026f5:	55                   	push   %ebp
801026f6:	89 e5                	mov    %esp,%ebp
801026f8:	85 c0                	test   %eax,%eax
801026fa:	74 0c                	je     80102708 <lapicid+0x18>
801026fc:	8b 40 20             	mov    0x20(%eax),%eax
801026ff:	5d                   	pop    %ebp
80102700:	c1 e8 18             	shr    $0x18,%eax
80102703:	c3                   	ret    
80102704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102708:	31 c0                	xor    %eax,%eax
8010270a:	5d                   	pop    %ebp
8010270b:	c3                   	ret    
8010270c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102710 <lapiceoi>:
80102710:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102715:	55                   	push   %ebp
80102716:	89 e5                	mov    %esp,%ebp
80102718:	85 c0                	test   %eax,%eax
8010271a:	74 0d                	je     80102729 <lapiceoi+0x19>
8010271c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102723:	00 00 00 
80102726:	8b 40 20             	mov    0x20(%eax),%eax
80102729:	5d                   	pop    %ebp
8010272a:	c3                   	ret    
8010272b:	90                   	nop
8010272c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102730 <microdelay>:
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
80102733:	5d                   	pop    %ebp
80102734:	c3                   	ret    
80102735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicstartap>:
80102740:	55                   	push   %ebp
80102741:	ba 70 00 00 00       	mov    $0x70,%edx
80102746:	b8 0f 00 00 00       	mov    $0xf,%eax
8010274b:	89 e5                	mov    %esp,%ebp
8010274d:	53                   	push   %ebx
8010274e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102751:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102754:	ee                   	out    %al,(%dx)
80102755:	ba 71 00 00 00       	mov    $0x71,%edx
8010275a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010275f:	ee                   	out    %al,(%dx)
80102760:	31 c0                	xor    %eax,%eax
80102762:	c1 e3 18             	shl    $0x18,%ebx
80102765:	66 a3 67 04 00 80    	mov    %ax,0x80000467
8010276b:	89 c8                	mov    %ecx,%eax
8010276d:	c1 e9 0c             	shr    $0xc,%ecx
80102770:	c1 e8 04             	shr    $0x4,%eax
80102773:	89 da                	mov    %ebx,%edx
80102775:	80 cd 06             	or     $0x6,%ch
80102778:	66 a3 69 04 00 80    	mov    %ax,0x80000469
8010277e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102783:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
80102789:	8b 58 20             	mov    0x20(%eax),%ebx
8010278c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102793:	c5 00 00 
80102796:	8b 58 20             	mov    0x20(%eax),%ebx
80102799:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027a0:	85 00 00 
801027a3:	8b 58 20             	mov    0x20(%eax),%ebx
801027a6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ac:	8b 58 20             	mov    0x20(%eax),%ebx
801027af:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027b5:	8b 58 20             	mov    0x20(%eax),%ebx
801027b8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027be:	8b 50 20             	mov    0x20(%eax),%edx
801027c1:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027c7:	8b 40 20             	mov    0x20(%eax),%eax
801027ca:	5b                   	pop    %ebx
801027cb:	5d                   	pop    %ebp
801027cc:	c3                   	ret    
801027cd:	8d 76 00             	lea    0x0(%esi),%esi

801027d0 <cmostime>:
801027d0:	55                   	push   %ebp
801027d1:	ba 70 00 00 00       	mov    $0x70,%edx
801027d6:	b8 0b 00 00 00       	mov    $0xb,%eax
801027db:	89 e5                	mov    %esp,%ebp
801027dd:	57                   	push   %edi
801027de:	56                   	push   %esi
801027df:	53                   	push   %ebx
801027e0:	83 ec 4c             	sub    $0x4c,%esp
801027e3:	ee                   	out    %al,(%dx)
801027e4:	ba 71 00 00 00       	mov    $0x71,%edx
801027e9:	ec                   	in     (%dx),%al
801027ea:	83 e0 04             	and    $0x4,%eax
801027ed:	8d 75 d0             	lea    -0x30(%ebp),%esi
801027f0:	31 db                	xor    %ebx,%ebx
801027f2:	88 45 b7             	mov    %al,-0x49(%ebp)
801027f5:	bf 70 00 00 00       	mov    $0x70,%edi
801027fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102800:	89 d8                	mov    %ebx,%eax
80102802:	89 fa                	mov    %edi,%edx
80102804:	ee                   	out    %al,(%dx)
80102805:	b9 71 00 00 00       	mov    $0x71,%ecx
8010280a:	89 ca                	mov    %ecx,%edx
8010280c:	ec                   	in     (%dx),%al
8010280d:	0f b6 c0             	movzbl %al,%eax
80102810:	89 fa                	mov    %edi,%edx
80102812:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102815:	b8 02 00 00 00       	mov    $0x2,%eax
8010281a:	ee                   	out    %al,(%dx)
8010281b:	89 ca                	mov    %ecx,%edx
8010281d:	ec                   	in     (%dx),%al
8010281e:	0f b6 c0             	movzbl %al,%eax
80102821:	89 fa                	mov    %edi,%edx
80102823:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102826:	b8 04 00 00 00       	mov    $0x4,%eax
8010282b:	ee                   	out    %al,(%dx)
8010282c:	89 ca                	mov    %ecx,%edx
8010282e:	ec                   	in     (%dx),%al
8010282f:	0f b6 c0             	movzbl %al,%eax
80102832:	89 fa                	mov    %edi,%edx
80102834:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102837:	b8 07 00 00 00       	mov    $0x7,%eax
8010283c:	ee                   	out    %al,(%dx)
8010283d:	89 ca                	mov    %ecx,%edx
8010283f:	ec                   	in     (%dx),%al
80102840:	0f b6 c0             	movzbl %al,%eax
80102843:	89 fa                	mov    %edi,%edx
80102845:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102848:	b8 08 00 00 00       	mov    $0x8,%eax
8010284d:	ee                   	out    %al,(%dx)
8010284e:	89 ca                	mov    %ecx,%edx
80102850:	ec                   	in     (%dx),%al
80102851:	0f b6 c0             	movzbl %al,%eax
80102854:	89 fa                	mov    %edi,%edx
80102856:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102859:	b8 09 00 00 00       	mov    $0x9,%eax
8010285e:	ee                   	out    %al,(%dx)
8010285f:	89 ca                	mov    %ecx,%edx
80102861:	ec                   	in     (%dx),%al
80102862:	0f b6 c0             	movzbl %al,%eax
80102865:	89 fa                	mov    %edi,%edx
80102867:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010286a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010286f:	ee                   	out    %al,(%dx)
80102870:	89 ca                	mov    %ecx,%edx
80102872:	ec                   	in     (%dx),%al
80102873:	84 c0                	test   %al,%al
80102875:	78 89                	js     80102800 <cmostime+0x30>
80102877:	89 d8                	mov    %ebx,%eax
80102879:	89 fa                	mov    %edi,%edx
8010287b:	ee                   	out    %al,(%dx)
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	0f b6 c0             	movzbl %al,%eax
80102882:	89 fa                	mov    %edi,%edx
80102884:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102887:	b8 02 00 00 00       	mov    $0x2,%eax
8010288c:	ee                   	out    %al,(%dx)
8010288d:	89 ca                	mov    %ecx,%edx
8010288f:	ec                   	in     (%dx),%al
80102890:	0f b6 c0             	movzbl %al,%eax
80102893:	89 fa                	mov    %edi,%edx
80102895:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102898:	b8 04 00 00 00       	mov    $0x4,%eax
8010289d:	ee                   	out    %al,(%dx)
8010289e:	89 ca                	mov    %ecx,%edx
801028a0:	ec                   	in     (%dx),%al
801028a1:	0f b6 c0             	movzbl %al,%eax
801028a4:	89 fa                	mov    %edi,%edx
801028a6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028a9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ae:	ee                   	out    %al,(%dx)
801028af:	89 ca                	mov    %ecx,%edx
801028b1:	ec                   	in     (%dx),%al
801028b2:	0f b6 c0             	movzbl %al,%eax
801028b5:	89 fa                	mov    %edi,%edx
801028b7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028ba:	b8 08 00 00 00       	mov    $0x8,%eax
801028bf:	ee                   	out    %al,(%dx)
801028c0:	89 ca                	mov    %ecx,%edx
801028c2:	ec                   	in     (%dx),%al
801028c3:	0f b6 c0             	movzbl %al,%eax
801028c6:	89 fa                	mov    %edi,%edx
801028c8:	89 45 e0             	mov    %eax,-0x20(%ebp)
801028cb:	b8 09 00 00 00       	mov    $0x9,%eax
801028d0:	ee                   	out    %al,(%dx)
801028d1:	89 ca                	mov    %ecx,%edx
801028d3:	ec                   	in     (%dx),%al
801028d4:	0f b6 c0             	movzbl %al,%eax
801028d7:	83 ec 04             	sub    $0x4,%esp
801028da:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801028dd:	8d 45 b8             	lea    -0x48(%ebp),%eax
801028e0:	6a 18                	push   $0x18
801028e2:	56                   	push   %esi
801028e3:	50                   	push   %eax
801028e4:	e8 17 1c 00 00       	call   80104500 <memcmp>
801028e9:	83 c4 10             	add    $0x10,%esp
801028ec:	85 c0                	test   %eax,%eax
801028ee:	0f 85 0c ff ff ff    	jne    80102800 <cmostime+0x30>
801028f4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801028f8:	75 78                	jne    80102972 <cmostime+0x1a2>
801028fa:	8b 45 b8             	mov    -0x48(%ebp),%eax
801028fd:	89 c2                	mov    %eax,%edx
801028ff:	83 e0 0f             	and    $0xf,%eax
80102902:	c1 ea 04             	shr    $0x4,%edx
80102905:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102908:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010290b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010290e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102911:	89 c2                	mov    %eax,%edx
80102913:	83 e0 0f             	and    $0xf,%eax
80102916:	c1 ea 04             	shr    $0x4,%edx
80102919:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010291c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010291f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102922:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102925:	89 c2                	mov    %eax,%edx
80102927:	83 e0 0f             	and    $0xf,%eax
8010292a:	c1 ea 04             	shr    $0x4,%edx
8010292d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102930:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102933:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102936:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102939:	89 c2                	mov    %eax,%edx
8010293b:	83 e0 0f             	and    $0xf,%eax
8010293e:	c1 ea 04             	shr    $0x4,%edx
80102941:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102944:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102947:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010294a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010294d:	89 c2                	mov    %eax,%edx
8010294f:	83 e0 0f             	and    $0xf,%eax
80102952:	c1 ea 04             	shr    $0x4,%edx
80102955:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102958:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010295e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102961:	89 c2                	mov    %eax,%edx
80102963:	83 e0 0f             	and    $0xf,%eax
80102966:	c1 ea 04             	shr    $0x4,%edx
80102969:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296f:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102972:	8b 75 08             	mov    0x8(%ebp),%esi
80102975:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102978:	89 06                	mov    %eax,(%esi)
8010297a:	8b 45 bc             	mov    -0x44(%ebp),%eax
8010297d:	89 46 04             	mov    %eax,0x4(%esi)
80102980:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102983:	89 46 08             	mov    %eax,0x8(%esi)
80102986:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102989:	89 46 0c             	mov    %eax,0xc(%esi)
8010298c:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298f:	89 46 10             	mov    %eax,0x10(%esi)
80102992:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102995:	89 46 14             	mov    %eax,0x14(%esi)
80102998:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
8010299f:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029a2:	5b                   	pop    %ebx
801029a3:	5e                   	pop    %esi
801029a4:	5f                   	pop    %edi
801029a5:	5d                   	pop    %ebp
801029a6:	c3                   	ret    
801029a7:	66 90                	xchg   %ax,%ax
801029a9:	66 90                	xchg   %ax,%ax
801029ab:	66 90                	xchg   %ax,%ax
801029ad:	66 90                	xchg   %ax,%ax
801029af:	90                   	nop

801029b0 <install_trans>:
801029b0:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
801029b6:	85 c9                	test   %ecx,%ecx
801029b8:	0f 8e 85 00 00 00    	jle    80102a43 <install_trans+0x93>
801029be:	55                   	push   %ebp
801029bf:	89 e5                	mov    %esp,%ebp
801029c1:	57                   	push   %edi
801029c2:	56                   	push   %esi
801029c3:	53                   	push   %ebx
801029c4:	31 db                	xor    %ebx,%ebx
801029c6:	83 ec 0c             	sub    $0xc,%esp
801029c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801029d0:	a1 d4 26 11 80       	mov    0x801126d4,%eax
801029d5:	83 ec 08             	sub    $0x8,%esp
801029d8:	01 d8                	add    %ebx,%eax
801029da:	83 c0 01             	add    $0x1,%eax
801029dd:	50                   	push   %eax
801029de:	ff 35 e4 26 11 80    	pushl  0x801126e4
801029e4:	e8 e7 d6 ff ff       	call   801000d0 <bread>
801029e9:	89 c7                	mov    %eax,%edi
801029eb:	58                   	pop    %eax
801029ec:	5a                   	pop    %edx
801029ed:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
801029f4:	ff 35 e4 26 11 80    	pushl  0x801126e4
801029fa:	83 c3 01             	add    $0x1,%ebx
801029fd:	e8 ce d6 ff ff       	call   801000d0 <bread>
80102a02:	89 c6                	mov    %eax,%esi
80102a04:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a07:	83 c4 0c             	add    $0xc,%esp
80102a0a:	68 00 02 00 00       	push   $0x200
80102a0f:	50                   	push   %eax
80102a10:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a13:	50                   	push   %eax
80102a14:	e8 47 1b 00 00       	call   80104560 <memmove>
80102a19:	89 34 24             	mov    %esi,(%esp)
80102a1c:	e8 7f d7 ff ff       	call   801001a0 <bwrite>
80102a21:	89 3c 24             	mov    %edi,(%esp)
80102a24:	e8 b7 d7 ff ff       	call   801001e0 <brelse>
80102a29:	89 34 24             	mov    %esi,(%esp)
80102a2c:	e8 af d7 ff ff       	call   801001e0 <brelse>
80102a31:	83 c4 10             	add    $0x10,%esp
80102a34:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102a3a:	7f 94                	jg     801029d0 <install_trans+0x20>
80102a3c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a3f:	5b                   	pop    %ebx
80102a40:	5e                   	pop    %esi
80102a41:	5f                   	pop    %edi
80102a42:	5d                   	pop    %ebp
80102a43:	f3 c3                	repz ret 
80102a45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a50 <write_head>:
80102a50:	55                   	push   %ebp
80102a51:	89 e5                	mov    %esp,%ebp
80102a53:	53                   	push   %ebx
80102a54:	83 ec 0c             	sub    $0xc,%esp
80102a57:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102a5d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a63:	e8 68 d6 ff ff       	call   801000d0 <bread>
80102a68:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a6e:	83 c4 10             	add    $0x10,%esp
80102a71:	89 c3                	mov    %eax,%ebx
80102a73:	85 c9                	test   %ecx,%ecx
80102a75:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102a78:	7e 1f                	jle    80102a99 <write_head+0x49>
80102a7a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102a81:	31 d2                	xor    %edx,%edx
80102a83:	90                   	nop
80102a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a88:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102a8e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102a92:	83 c2 04             	add    $0x4,%edx
80102a95:	39 c2                	cmp    %eax,%edx
80102a97:	75 ef                	jne    80102a88 <write_head+0x38>
80102a99:	83 ec 0c             	sub    $0xc,%esp
80102a9c:	53                   	push   %ebx
80102a9d:	e8 fe d6 ff ff       	call   801001a0 <bwrite>
80102aa2:	89 1c 24             	mov    %ebx,(%esp)
80102aa5:	e8 36 d7 ff ff       	call   801001e0 <brelse>
80102aaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aad:	c9                   	leave  
80102aae:	c3                   	ret    
80102aaf:	90                   	nop

80102ab0 <initlog>:
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	53                   	push   %ebx
80102ab4:	83 ec 2c             	sub    $0x2c,%esp
80102ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102aba:	68 00 74 10 80       	push   $0x80107400
80102abf:	68 a0 26 11 80       	push   $0x801126a0
80102ac4:	e8 77 17 00 00       	call   80104240 <initlock>
80102ac9:	58                   	pop    %eax
80102aca:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102acd:	5a                   	pop    %edx
80102ace:	50                   	push   %eax
80102acf:	53                   	push   %ebx
80102ad0:	e8 db e8 ff ff       	call   801013b0 <readsb>
80102ad5:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102ad8:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102adb:	59                   	pop    %ecx
80102adc:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4
80102ae2:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
80102ae8:	a3 d4 26 11 80       	mov    %eax,0x801126d4
80102aed:	5a                   	pop    %edx
80102aee:	50                   	push   %eax
80102aef:	53                   	push   %ebx
80102af0:	e8 db d5 ff ff       	call   801000d0 <bread>
80102af5:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102af8:	83 c4 10             	add    $0x10,%esp
80102afb:	85 c9                	test   %ecx,%ecx
80102afd:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
80102b03:	7e 1c                	jle    80102b21 <initlog+0x71>
80102b05:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b0c:	31 d2                	xor    %edx,%edx
80102b0e:	66 90                	xchg   %ax,%ax
80102b10:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b14:	83 c2 04             	add    $0x4,%edx
80102b17:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
80102b1d:	39 da                	cmp    %ebx,%edx
80102b1f:	75 ef                	jne    80102b10 <initlog+0x60>
80102b21:	83 ec 0c             	sub    $0xc,%esp
80102b24:	50                   	push   %eax
80102b25:	e8 b6 d6 ff ff       	call   801001e0 <brelse>
80102b2a:	e8 81 fe ff ff       	call   801029b0 <install_trans>
80102b2f:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102b36:	00 00 00 
80102b39:	e8 12 ff ff ff       	call   80102a50 <write_head>
80102b3e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b41:	c9                   	leave  
80102b42:	c3                   	ret    
80102b43:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b50 <begin_op>:
80102b50:	55                   	push   %ebp
80102b51:	89 e5                	mov    %esp,%ebp
80102b53:	83 ec 14             	sub    $0x14,%esp
80102b56:	68 a0 26 11 80       	push   $0x801126a0
80102b5b:	e8 e0 17 00 00       	call   80104340 <acquire>
80102b60:	83 c4 10             	add    $0x10,%esp
80102b63:	eb 18                	jmp    80102b7d <begin_op+0x2d>
80102b65:	8d 76 00             	lea    0x0(%esi),%esi
80102b68:	83 ec 08             	sub    $0x8,%esp
80102b6b:	68 a0 26 11 80       	push   $0x801126a0
80102b70:	68 a0 26 11 80       	push   $0x801126a0
80102b75:	e8 16 12 00 00       	call   80103d90 <sleep>
80102b7a:	83 c4 10             	add    $0x10,%esp
80102b7d:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102b82:	85 c0                	test   %eax,%eax
80102b84:	75 e2                	jne    80102b68 <begin_op+0x18>
80102b86:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102b8b:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102b91:	83 c0 01             	add    $0x1,%eax
80102b94:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102b97:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102b9a:	83 fa 1e             	cmp    $0x1e,%edx
80102b9d:	7f c9                	jg     80102b68 <begin_op+0x18>
80102b9f:	83 ec 0c             	sub    $0xc,%esp
80102ba2:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102ba7:	68 a0 26 11 80       	push   $0x801126a0
80102bac:	e8 af 18 00 00       	call   80104460 <release>
80102bb1:	83 c4 10             	add    $0x10,%esp
80102bb4:	c9                   	leave  
80102bb5:	c3                   	ret    
80102bb6:	8d 76 00             	lea    0x0(%esi),%esi
80102bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bc0 <end_op>:
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	57                   	push   %edi
80102bc4:	56                   	push   %esi
80102bc5:	53                   	push   %ebx
80102bc6:	83 ec 18             	sub    $0x18,%esp
80102bc9:	68 a0 26 11 80       	push   $0x801126a0
80102bce:	e8 6d 17 00 00       	call   80104340 <acquire>
80102bd3:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102bd8:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102bde:	83 c4 10             	add    $0x10,%esp
80102be1:	83 e8 01             	sub    $0x1,%eax
80102be4:	85 db                	test   %ebx,%ebx
80102be6:	a3 dc 26 11 80       	mov    %eax,0x801126dc
80102beb:	0f 85 23 01 00 00    	jne    80102d14 <end_op+0x154>
80102bf1:	85 c0                	test   %eax,%eax
80102bf3:	0f 85 f7 00 00 00    	jne    80102cf0 <end_op+0x130>
80102bf9:	83 ec 0c             	sub    $0xc,%esp
80102bfc:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102c03:	00 00 00 
80102c06:	31 db                	xor    %ebx,%ebx
80102c08:	68 a0 26 11 80       	push   $0x801126a0
80102c0d:	e8 4e 18 00 00       	call   80104460 <release>
80102c12:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102c18:	83 c4 10             	add    $0x10,%esp
80102c1b:	85 c9                	test   %ecx,%ecx
80102c1d:	0f 8e 8a 00 00 00    	jle    80102cad <end_op+0xed>
80102c23:	90                   	nop
80102c24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c28:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102c2d:	83 ec 08             	sub    $0x8,%esp
80102c30:	01 d8                	add    %ebx,%eax
80102c32:	83 c0 01             	add    $0x1,%eax
80102c35:	50                   	push   %eax
80102c36:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c3c:	e8 8f d4 ff ff       	call   801000d0 <bread>
80102c41:	89 c6                	mov    %eax,%esi
80102c43:	58                   	pop    %eax
80102c44:	5a                   	pop    %edx
80102c45:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102c4c:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102c52:	83 c3 01             	add    $0x1,%ebx
80102c55:	e8 76 d4 ff ff       	call   801000d0 <bread>
80102c5a:	89 c7                	mov    %eax,%edi
80102c5c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c5f:	83 c4 0c             	add    $0xc,%esp
80102c62:	68 00 02 00 00       	push   $0x200
80102c67:	50                   	push   %eax
80102c68:	8d 46 5c             	lea    0x5c(%esi),%eax
80102c6b:	50                   	push   %eax
80102c6c:	e8 ef 18 00 00       	call   80104560 <memmove>
80102c71:	89 34 24             	mov    %esi,(%esp)
80102c74:	e8 27 d5 ff ff       	call   801001a0 <bwrite>
80102c79:	89 3c 24             	mov    %edi,(%esp)
80102c7c:	e8 5f d5 ff ff       	call   801001e0 <brelse>
80102c81:	89 34 24             	mov    %esi,(%esp)
80102c84:	e8 57 d5 ff ff       	call   801001e0 <brelse>
80102c89:	83 c4 10             	add    $0x10,%esp
80102c8c:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102c92:	7c 94                	jl     80102c28 <end_op+0x68>
80102c94:	e8 b7 fd ff ff       	call   80102a50 <write_head>
80102c99:	e8 12 fd ff ff       	call   801029b0 <install_trans>
80102c9e:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102ca5:	00 00 00 
80102ca8:	e8 a3 fd ff ff       	call   80102a50 <write_head>
80102cad:	83 ec 0c             	sub    $0xc,%esp
80102cb0:	68 a0 26 11 80       	push   $0x801126a0
80102cb5:	e8 86 16 00 00       	call   80104340 <acquire>
80102cba:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cc1:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102cc8:	00 00 00 
80102ccb:	e8 70 12 00 00       	call   80103f40 <wakeup>
80102cd0:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102cd7:	e8 84 17 00 00       	call   80104460 <release>
80102cdc:	83 c4 10             	add    $0x10,%esp
80102cdf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102ce2:	5b                   	pop    %ebx
80102ce3:	5e                   	pop    %esi
80102ce4:	5f                   	pop    %edi
80102ce5:	5d                   	pop    %ebp
80102ce6:	c3                   	ret    
80102ce7:	89 f6                	mov    %esi,%esi
80102ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102cf0:	83 ec 0c             	sub    $0xc,%esp
80102cf3:	68 a0 26 11 80       	push   $0x801126a0
80102cf8:	e8 43 12 00 00       	call   80103f40 <wakeup>
80102cfd:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d04:	e8 57 17 00 00       	call   80104460 <release>
80102d09:	83 c4 10             	add    $0x10,%esp
80102d0c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d0f:	5b                   	pop    %ebx
80102d10:	5e                   	pop    %esi
80102d11:	5f                   	pop    %edi
80102d12:	5d                   	pop    %ebp
80102d13:	c3                   	ret    
80102d14:	83 ec 0c             	sub    $0xc,%esp
80102d17:	68 04 74 10 80       	push   $0x80107404
80102d1c:	e8 4f d6 ff ff       	call   80100370 <panic>
80102d21:	eb 0d                	jmp    80102d30 <log_write>
80102d23:	90                   	nop
80102d24:	90                   	nop
80102d25:	90                   	nop
80102d26:	90                   	nop
80102d27:	90                   	nop
80102d28:	90                   	nop
80102d29:	90                   	nop
80102d2a:	90                   	nop
80102d2b:	90                   	nop
80102d2c:	90                   	nop
80102d2d:	90                   	nop
80102d2e:	90                   	nop
80102d2f:	90                   	nop

80102d30 <log_write>:
80102d30:	55                   	push   %ebp
80102d31:	89 e5                	mov    %esp,%ebp
80102d33:	53                   	push   %ebx
80102d34:	83 ec 04             	sub    $0x4,%esp
80102d37:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d3d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d40:	83 fa 1d             	cmp    $0x1d,%edx
80102d43:	0f 8f 97 00 00 00    	jg     80102de0 <log_write+0xb0>
80102d49:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102d4e:	83 e8 01             	sub    $0x1,%eax
80102d51:	39 c2                	cmp    %eax,%edx
80102d53:	0f 8d 87 00 00 00    	jge    80102de0 <log_write+0xb0>
80102d59:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102d5e:	85 c0                	test   %eax,%eax
80102d60:	0f 8e 87 00 00 00    	jle    80102ded <log_write+0xbd>
80102d66:	83 ec 0c             	sub    $0xc,%esp
80102d69:	68 a0 26 11 80       	push   $0x801126a0
80102d6e:	e8 cd 15 00 00       	call   80104340 <acquire>
80102d73:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102d79:	83 c4 10             	add    $0x10,%esp
80102d7c:	83 fa 00             	cmp    $0x0,%edx
80102d7f:	7e 50                	jle    80102dd1 <log_write+0xa1>
80102d81:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102d84:	31 c0                	xor    %eax,%eax
80102d86:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102d8c:	75 0b                	jne    80102d99 <log_write+0x69>
80102d8e:	eb 38                	jmp    80102dc8 <log_write+0x98>
80102d90:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102d97:	74 2f                	je     80102dc8 <log_write+0x98>
80102d99:	83 c0 01             	add    $0x1,%eax
80102d9c:	39 d0                	cmp    %edx,%eax
80102d9e:	75 f0                	jne    80102d90 <log_write+0x60>
80102da0:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
80102da7:	83 c2 01             	add    $0x1,%edx
80102daa:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
80102db0:	83 0b 04             	orl    $0x4,(%ebx)
80102db3:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
80102dba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dbd:	c9                   	leave  
80102dbe:	e9 9d 16 00 00       	jmp    80104460 <release>
80102dc3:	90                   	nop
80102dc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102dc8:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102dcf:	eb df                	jmp    80102db0 <log_write+0x80>
80102dd1:	8b 43 08             	mov    0x8(%ebx),%eax
80102dd4:	a3 ec 26 11 80       	mov    %eax,0x801126ec
80102dd9:	75 d5                	jne    80102db0 <log_write+0x80>
80102ddb:	eb ca                	jmp    80102da7 <log_write+0x77>
80102ddd:	8d 76 00             	lea    0x0(%esi),%esi
80102de0:	83 ec 0c             	sub    $0xc,%esp
80102de3:	68 13 74 10 80       	push   $0x80107413
80102de8:	e8 83 d5 ff ff       	call   80100370 <panic>
80102ded:	83 ec 0c             	sub    $0xc,%esp
80102df0:	68 29 74 10 80       	push   $0x80107429
80102df5:	e8 76 d5 ff ff       	call   80100370 <panic>
80102dfa:	66 90                	xchg   %ax,%ax
80102dfc:	66 90                	xchg   %ax,%ax
80102dfe:	66 90                	xchg   %ax,%ax

80102e00 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102e00:	55                   	push   %ebp
80102e01:	89 e5                	mov    %esp,%ebp
80102e03:	53                   	push   %ebx
80102e04:	83 ec 04             	sub    $0x4,%esp
  cprintf("cpu%d: starting %d\n", cpuid(), cpuid());
80102e07:	e8 74 09 00 00       	call   80103780 <cpuid>
80102e0c:	89 c3                	mov    %eax,%ebx
80102e0e:	e8 6d 09 00 00       	call   80103780 <cpuid>
80102e13:	83 ec 04             	sub    $0x4,%esp
80102e16:	53                   	push   %ebx
80102e17:	50                   	push   %eax
80102e18:	68 44 74 10 80       	push   $0x80107444
80102e1d:	e8 3e d8 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102e22:	e8 49 29 00 00       	call   80105770 <idtinit>
  xchg(&(mycpu()->started), 1); // tell startothers() we're up
80102e27:	e8 d4 08 00 00       	call   80103700 <mycpu>
80102e2c:	89 c2                	mov    %eax,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102e2e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e33:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
  scheduler();     // start running processes
80102e3a:	e8 21 0c 00 00       	call   80103a60 <scheduler>
80102e3f:	90                   	nop

80102e40 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102e46:	e8 45 3a 00 00       	call   80106890 <switchkvm>
  seginit();
80102e4b:	e8 40 39 00 00       	call   80106790 <seginit>
  lapicinit();
80102e50:	e8 9b f7 ff ff       	call   801025f0 <lapicinit>
  mpmain();
80102e55:	e8 a6 ff ff ff       	call   80102e00 <mpmain>
80102e5a:	66 90                	xchg   %ax,%ax
80102e5c:	66 90                	xchg   %ax,%ax
80102e5e:	66 90                	xchg   %ax,%ax

80102e60 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102e60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102e64:	83 e4 f0             	and    $0xfffffff0,%esp
80102e67:	ff 71 fc             	pushl  -0x4(%ecx)
80102e6a:	55                   	push   %ebp
80102e6b:	89 e5                	mov    %esp,%ebp
80102e6d:	53                   	push   %ebx
80102e6e:	51                   	push   %ecx
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102e6f:	bb a0 27 11 80       	mov    $0x801127a0,%ebx
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102e74:	83 ec 08             	sub    $0x8,%esp
80102e77:	68 00 00 40 80       	push   $0x80400000
80102e7c:	68 c8 55 11 80       	push   $0x801155c8
80102e81:	e8 3a f5 ff ff       	call   801023c0 <kinit1>
  kvmalloc();      // kernel page table
80102e86:	e8 a5 3e 00 00       	call   80106d30 <kvmalloc>
  mpinit();        // detect other processors
80102e8b:	e8 70 01 00 00       	call   80103000 <mpinit>
  lapicinit();     // interrupt controller
80102e90:	e8 5b f7 ff ff       	call   801025f0 <lapicinit>
  seginit();       // segment descriptors
80102e95:	e8 f6 38 00 00       	call   80106790 <seginit>
  picinit();       // disable pic
80102e9a:	e8 31 03 00 00       	call   801031d0 <picinit>
  ioapicinit();    // another interrupt controller
80102e9f:	e8 4c f3 ff ff       	call   801021f0 <ioapicinit>
  consoleinit();   // console hardware
80102ea4:	e8 f7 da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102ea9:	e8 b2 2b 00 00       	call   80105a60 <uartinit>
  pinit();         // process table
80102eae:	e8 2d 08 00 00       	call   801036e0 <pinit>
  tvinit();        // trap vectors
80102eb3:	e8 18 28 00 00       	call   801056d0 <tvinit>
  binit();         // buffer cache
80102eb8:	e8 83 d1 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102ebd:	e8 8e de ff ff       	call   80100d50 <fileinit>
  ideinit();       // disk 
80102ec2:	e8 09 f1 ff ff       	call   80101fd0 <ideinit>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102ec7:	83 c4 0c             	add    $0xc,%esp
80102eca:	68 8a 00 00 00       	push   $0x8a
80102ecf:	68 8c a4 10 80       	push   $0x8010a48c
80102ed4:	68 00 70 00 80       	push   $0x80007000
80102ed9:	e8 82 16 00 00       	call   80104560 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102ede:	69 05 20 2d 11 80 b0 	imul   $0xb0,0x80112d20,%eax
80102ee5:	00 00 00 
80102ee8:	83 c4 10             	add    $0x10,%esp
80102eeb:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102ef0:	39 d8                	cmp    %ebx,%eax
80102ef2:	76 6f                	jbe    80102f63 <main+0x103>
80102ef4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(c == mycpu())  // We've started already.
80102ef8:	e8 03 08 00 00       	call   80103700 <mycpu>
80102efd:	39 d8                	cmp    %ebx,%eax
80102eff:	74 49                	je     80102f4a <main+0xea>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102f01:	e8 8a f5 ff ff       	call   80102490 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f06:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102f0b:	c7 05 f8 6f 00 80 40 	movl   $0x80102e40,0x80006ff8
80102f12:	2e 10 80 
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80102f15:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f1c:	90 10 00 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102f1f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102f24:	0f b6 03             	movzbl (%ebx),%eax
80102f27:	83 ec 08             	sub    $0x8,%esp
80102f2a:	68 00 70 00 00       	push   $0x7000
80102f2f:	50                   	push   %eax
80102f30:	e8 0b f8 ff ff       	call   80102740 <lapicstartap>
80102f35:	83 c4 10             	add    $0x10,%esp
80102f38:	90                   	nop
80102f39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80102f40:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f46:	85 c0                	test   %eax,%eax
80102f48:	74 f6                	je     80102f40 <main+0xe0>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
80102f4a:	69 05 20 2d 11 80 b0 	imul   $0xb0,0x80112d20,%eax
80102f51:	00 00 00 
80102f54:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f5a:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102f5f:	39 c3                	cmp    %eax,%ebx
80102f61:	72 95                	jb     80102ef8 <main+0x98>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk 
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80102f63:	83 ec 08             	sub    $0x8,%esp
80102f66:	68 00 00 00 8e       	push   $0x8e000000
80102f6b:	68 00 00 40 80       	push   $0x80400000
80102f70:	e8 bb f4 ff ff       	call   80102430 <kinit2>
  userinit();      // first user process
80102f75:	e8 56 08 00 00       	call   801037d0 <userinit>
  mpmain();        // finish this processor's setup
80102f7a:	e8 81 fe ff ff       	call   80102e00 <mpmain>
80102f7f:	90                   	nop

80102f80 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f80:	55                   	push   %ebp
80102f81:	89 e5                	mov    %esp,%ebp
80102f83:	57                   	push   %edi
80102f84:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80102f85:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f8b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
80102f8c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80102f8f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102f92:	39 de                	cmp    %ebx,%esi
80102f94:	73 48                	jae    80102fde <mpsearch1+0x5e>
80102f96:	8d 76 00             	lea    0x0(%esi),%esi
80102f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fa0:	83 ec 04             	sub    $0x4,%esp
80102fa3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fa6:	6a 04                	push   $0x4
80102fa8:	68 58 74 10 80       	push   $0x80107458
80102fad:	56                   	push   %esi
80102fae:	e8 4d 15 00 00       	call   80104500 <memcmp>
80102fb3:	83 c4 10             	add    $0x10,%esp
80102fb6:	85 c0                	test   %eax,%eax
80102fb8:	75 1e                	jne    80102fd8 <mpsearch1+0x58>
80102fba:	8d 7e 10             	lea    0x10(%esi),%edi
80102fbd:	89 f2                	mov    %esi,%edx
80102fbf:	31 c9                	xor    %ecx,%ecx
80102fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
80102fc8:	0f b6 02             	movzbl (%edx),%eax
80102fcb:	83 c2 01             	add    $0x1,%edx
80102fce:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
80102fd0:	39 fa                	cmp    %edi,%edx
80102fd2:	75 f4                	jne    80102fc8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80102fd4:	84 c9                	test   %cl,%cl
80102fd6:	74 10                	je     80102fe8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80102fd8:	39 fb                	cmp    %edi,%ebx
80102fda:	89 fe                	mov    %edi,%esi
80102fdc:	77 c2                	ja     80102fa0 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
80102fde:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
80102fe1:	31 c0                	xor    %eax,%eax
}
80102fe3:	5b                   	pop    %ebx
80102fe4:	5e                   	pop    %esi
80102fe5:	5f                   	pop    %edi
80102fe6:	5d                   	pop    %ebp
80102fe7:	c3                   	ret    
80102fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102feb:	89 f0                	mov    %esi,%eax
80102fed:	5b                   	pop    %ebx
80102fee:	5e                   	pop    %esi
80102fef:	5f                   	pop    %edi
80102ff0:	5d                   	pop    %ebp
80102ff1:	c3                   	ret    
80102ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103000 <mpinit>:
  return conf;
}

void
mpinit(void)
{
80103000:	55                   	push   %ebp
80103001:	89 e5                	mov    %esp,%ebp
80103003:	57                   	push   %edi
80103004:	56                   	push   %esi
80103005:	53                   	push   %ebx
80103006:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
80103009:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103010:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103017:	c1 e0 08             	shl    $0x8,%eax
8010301a:	09 d0                	or     %edx,%eax
8010301c:	c1 e0 04             	shl    $0x4,%eax
8010301f:	85 c0                	test   %eax,%eax
80103021:	75 1b                	jne    8010303e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103023:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010302a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103031:	c1 e0 08             	shl    $0x8,%eax
80103034:	09 d0                	or     %edx,%eax
80103036:	c1 e0 0a             	shl    $0xa,%eax
80103039:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010303e:	ba 00 04 00 00       	mov    $0x400,%edx
80103043:	e8 38 ff ff ff       	call   80102f80 <mpsearch1>
80103048:	85 c0                	test   %eax,%eax
8010304a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010304d:	0f 84 37 01 00 00    	je     8010318a <mpinit+0x18a>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103053:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103056:	8b 58 04             	mov    0x4(%eax),%ebx
80103059:	85 db                	test   %ebx,%ebx
8010305b:	0f 84 43 01 00 00    	je     801031a4 <mpinit+0x1a4>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
80103061:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
  if(memcmp(conf, "PCMP", 4) != 0)
80103067:	83 ec 04             	sub    $0x4,%esp
8010306a:	6a 04                	push   $0x4
8010306c:	68 5d 74 10 80       	push   $0x8010745d
80103071:	56                   	push   %esi
80103072:	e8 89 14 00 00       	call   80104500 <memcmp>
80103077:	83 c4 10             	add    $0x10,%esp
8010307a:	85 c0                	test   %eax,%eax
8010307c:	0f 85 22 01 00 00    	jne    801031a4 <mpinit+0x1a4>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103082:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103089:	3c 01                	cmp    $0x1,%al
8010308b:	74 08                	je     80103095 <mpinit+0x95>
8010308d:	3c 04                	cmp    $0x4,%al
8010308f:	0f 85 0f 01 00 00    	jne    801031a4 <mpinit+0x1a4>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103095:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010309c:	85 ff                	test   %edi,%edi
8010309e:	74 21                	je     801030c1 <mpinit+0xc1>
801030a0:	31 d2                	xor    %edx,%edx
801030a2:	31 c0                	xor    %eax,%eax
801030a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
801030a8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030af:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030b0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801030b3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030b5:	39 c7                	cmp    %eax,%edi
801030b7:	75 ef                	jne    801030a8 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801030b9:	84 d2                	test   %dl,%dl
801030bb:	0f 85 e3 00 00 00    	jne    801031a4 <mpinit+0x1a4>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801030c1:	85 f6                	test   %esi,%esi
801030c3:	0f 84 db 00 00 00    	je     801031a4 <mpinit+0x1a4>
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
801030c9:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801030cf:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030d4:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
801030db:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
801030e1:	bb 01 00 00 00       	mov    $0x1,%ebx
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801030e6:	01 d6                	add    %edx,%esi
801030e8:	90                   	nop
801030e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030f0:	39 c6                	cmp    %eax,%esi
801030f2:	76 23                	jbe    80103117 <mpinit+0x117>
801030f4:	0f b6 10             	movzbl (%eax),%edx
    switch(*p){
801030f7:	80 fa 04             	cmp    $0x4,%dl
801030fa:	0f 87 c0 00 00 00    	ja     801031c0 <mpinit+0x1c0>
80103100:	ff 24 95 9c 74 10 80 	jmp    *-0x7fef8b64(,%edx,4)
80103107:	89 f6                	mov    %esi,%esi
80103109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
80103110:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
80103113:	39 c6                	cmp    %eax,%esi
80103115:	77 dd                	ja     801030f4 <mpinit+0xf4>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp)
80103117:	85 db                	test   %ebx,%ebx
80103119:	0f 84 92 00 00 00    	je     801031b1 <mpinit+0x1b1>
    panic("Didn't find a suitable machine");

  if(mp->imcrp){
8010311f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103122:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103126:	74 15                	je     8010313d <mpinit+0x13d>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103128:	ba 22 00 00 00       	mov    $0x22,%edx
8010312d:	b8 70 00 00 00       	mov    $0x70,%eax
80103132:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103133:	ba 23 00 00 00       	mov    $0x23,%edx
80103138:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103139:	83 c8 01             	or     $0x1,%eax
8010313c:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010313d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103140:	5b                   	pop    %ebx
80103141:	5e                   	pop    %esi
80103142:	5f                   	pop    %edi
80103143:	5d                   	pop    %ebp
80103144:	c3                   	ret    
80103145:	8d 76 00             	lea    0x0(%esi),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103148:	8b 0d 20 2d 11 80    	mov    0x80112d20,%ecx
8010314e:	83 f9 07             	cmp    $0x7,%ecx
80103151:	7f 19                	jg     8010316c <mpinit+0x16c>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103153:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103157:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
        ncpu++;
8010315d:	83 c1 01             	add    $0x1,%ecx
80103160:	89 0d 20 2d 11 80    	mov    %ecx,0x80112d20
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
80103166:	88 97 a0 27 11 80    	mov    %dl,-0x7feed860(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
8010316c:	83 c0 14             	add    $0x14,%eax
      continue;
8010316f:	e9 7c ff ff ff       	jmp    801030f0 <mpinit+0xf0>
80103174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103178:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
8010317c:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
8010317f:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
80103185:	e9 66 ff ff ff       	jmp    801030f0 <mpinit+0xf0>
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010318a:	ba 00 00 01 00       	mov    $0x10000,%edx
8010318f:	b8 00 00 0f 00       	mov    $0xf0000,%eax
80103194:	e8 e7 fd ff ff       	call   80102f80 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103199:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
8010319b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
8010319e:	0f 85 af fe ff ff    	jne    80103053 <mpinit+0x53>
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
    panic("Expect to run on an SMP");
801031a4:	83 ec 0c             	sub    $0xc,%esp
801031a7:	68 62 74 10 80       	push   $0x80107462
801031ac:	e8 bf d1 ff ff       	call   80100370 <panic>
      ismp = 0;
      break;
    }
  }
  if(!ismp)
    panic("Didn't find a suitable machine");
801031b1:	83 ec 0c             	sub    $0xc,%esp
801031b4:	68 7c 74 10 80       	push   $0x8010747c
801031b9:	e8 b2 d1 ff ff       	call   80100370 <panic>
801031be:	66 90                	xchg   %ax,%ax
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
801031c0:	31 db                	xor    %ebx,%ebx
801031c2:	e9 30 ff ff ff       	jmp    801030f7 <mpinit+0xf7>
801031c7:	66 90                	xchg   %ax,%ax
801031c9:	66 90                	xchg   %ax,%ax
801031cb:	66 90                	xchg   %ax,%ax
801031cd:	66 90                	xchg   %ax,%ax
801031cf:	90                   	nop

801031d0 <picinit>:
801031d0:	55                   	push   %ebp
801031d1:	ba 21 00 00 00       	mov    $0x21,%edx
801031d6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801031db:	89 e5                	mov    %esp,%ebp
801031dd:	ee                   	out    %al,(%dx)
801031de:	ba a1 00 00 00       	mov    $0xa1,%edx
801031e3:	ee                   	out    %al,(%dx)
801031e4:	5d                   	pop    %ebp
801031e5:	c3                   	ret    
801031e6:	66 90                	xchg   %ax,%ax
801031e8:	66 90                	xchg   %ax,%ax
801031ea:	66 90                	xchg   %ax,%ax
801031ec:	66 90                	xchg   %ax,%ax
801031ee:	66 90                	xchg   %ax,%ax

801031f0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801031f0:	55                   	push   %ebp
801031f1:	89 e5                	mov    %esp,%ebp
801031f3:	57                   	push   %edi
801031f4:	56                   	push   %esi
801031f5:	53                   	push   %ebx
801031f6:	83 ec 0c             	sub    $0xc,%esp
801031f9:	8b 75 08             	mov    0x8(%ebp),%esi
801031fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801031ff:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103205:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
8010320b:	e8 60 db ff ff       	call   80100d70 <filealloc>
80103210:	85 c0                	test   %eax,%eax
80103212:	89 06                	mov    %eax,(%esi)
80103214:	0f 84 a8 00 00 00    	je     801032c2 <pipealloc+0xd2>
8010321a:	e8 51 db ff ff       	call   80100d70 <filealloc>
8010321f:	85 c0                	test   %eax,%eax
80103221:	89 03                	mov    %eax,(%ebx)
80103223:	0f 84 87 00 00 00    	je     801032b0 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
80103229:	e8 62 f2 ff ff       	call   80102490 <kalloc>
8010322e:	85 c0                	test   %eax,%eax
80103230:	89 c7                	mov    %eax,%edi
80103232:	0f 84 b0 00 00 00    	je     801032e8 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
80103238:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
8010323b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103242:	00 00 00 
  p->writeopen = 1;
80103245:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010324c:	00 00 00 
  p->nwrite = 0;
8010324f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103256:	00 00 00 
  p->nread = 0;
80103259:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103260:	00 00 00 
  initlock(&p->lock, "pipe");
80103263:	68 b0 74 10 80       	push   $0x801074b0
80103268:	50                   	push   %eax
80103269:	e8 d2 0f 00 00       	call   80104240 <initlock>
  (*f0)->type = FD_PIPE;
8010326e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103270:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103273:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103279:	8b 06                	mov    (%esi),%eax
8010327b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010327f:	8b 06                	mov    (%esi),%eax
80103281:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103285:	8b 06                	mov    (%esi),%eax
80103287:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010328a:	8b 03                	mov    (%ebx),%eax
8010328c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103292:	8b 03                	mov    (%ebx),%eax
80103294:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103298:	8b 03                	mov    (%ebx),%eax
8010329a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010329e:	8b 03                	mov    (%ebx),%eax
801032a0:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
801032a6:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
801032a8:	5b                   	pop    %ebx
801032a9:	5e                   	pop    %esi
801032aa:	5f                   	pop    %edi
801032ab:	5d                   	pop    %ebp
801032ac:	c3                   	ret    
801032ad:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032b0:	8b 06                	mov    (%esi),%eax
801032b2:	85 c0                	test   %eax,%eax
801032b4:	74 1e                	je     801032d4 <pipealloc+0xe4>
    fileclose(*f0);
801032b6:	83 ec 0c             	sub    $0xc,%esp
801032b9:	50                   	push   %eax
801032ba:	e8 71 db ff ff       	call   80100e30 <fileclose>
801032bf:	83 c4 10             	add    $0x10,%esp
  if(*f1)
801032c2:	8b 03                	mov    (%ebx),%eax
801032c4:	85 c0                	test   %eax,%eax
801032c6:	74 0c                	je     801032d4 <pipealloc+0xe4>
    fileclose(*f1);
801032c8:	83 ec 0c             	sub    $0xc,%esp
801032cb:	50                   	push   %eax
801032cc:	e8 5f db ff ff       	call   80100e30 <fileclose>
801032d1:	83 c4 10             	add    $0x10,%esp
  return -1;
}
801032d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
801032d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801032dc:	5b                   	pop    %ebx
801032dd:	5e                   	pop    %esi
801032de:	5f                   	pop    %edi
801032df:	5d                   	pop    %ebp
801032e0:	c3                   	ret    
801032e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
801032e8:	8b 06                	mov    (%esi),%eax
801032ea:	85 c0                	test   %eax,%eax
801032ec:	75 c8                	jne    801032b6 <pipealloc+0xc6>
801032ee:	eb d2                	jmp    801032c2 <pipealloc+0xd2>

801032f0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801032f0:	55                   	push   %ebp
801032f1:	89 e5                	mov    %esp,%ebp
801032f3:	56                   	push   %esi
801032f4:	53                   	push   %ebx
801032f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801032f8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801032fb:	83 ec 0c             	sub    $0xc,%esp
801032fe:	53                   	push   %ebx
801032ff:	e8 3c 10 00 00       	call   80104340 <acquire>
  if(writable){
80103304:	83 c4 10             	add    $0x10,%esp
80103307:	85 f6                	test   %esi,%esi
80103309:	74 45                	je     80103350 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
8010330b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103311:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
80103314:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010331b:	00 00 00 
    wakeup(&p->nread);
8010331e:	50                   	push   %eax
8010331f:	e8 1c 0c 00 00       	call   80103f40 <wakeup>
80103324:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
80103327:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010332d:	85 d2                	test   %edx,%edx
8010332f:	75 0a                	jne    8010333b <pipeclose+0x4b>
80103331:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103337:	85 c0                	test   %eax,%eax
80103339:	74 35                	je     80103370 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
8010333b:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
8010333e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103341:	5b                   	pop    %ebx
80103342:	5e                   	pop    %esi
80103343:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
80103344:	e9 17 11 00 00       	jmp    80104460 <release>
80103349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103350:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103356:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103359:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103360:	00 00 00 
    wakeup(&p->nwrite);
80103363:	50                   	push   %eax
80103364:	e8 d7 0b 00 00       	call   80103f40 <wakeup>
80103369:	83 c4 10             	add    $0x10,%esp
8010336c:	eb b9                	jmp    80103327 <pipeclose+0x37>
8010336e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103370:	83 ec 0c             	sub    $0xc,%esp
80103373:	53                   	push   %ebx
80103374:	e8 e7 10 00 00       	call   80104460 <release>
    kfree((char*)p);
80103379:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010337c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010337f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103382:	5b                   	pop    %ebx
80103383:	5e                   	pop    %esi
80103384:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103385:	e9 56 ef ff ff       	jmp    801022e0 <kfree>
8010338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103390 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103390:	55                   	push   %ebp
80103391:	89 e5                	mov    %esp,%ebp
80103393:	57                   	push   %edi
80103394:	56                   	push   %esi
80103395:	53                   	push   %ebx
80103396:	83 ec 28             	sub    $0x28,%esp
80103399:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  acquire(&p->lock);
8010339c:	53                   	push   %ebx
8010339d:	e8 9e 0f 00 00       	call   80104340 <acquire>
  for(i = 0; i < n; i++){
801033a2:	8b 45 10             	mov    0x10(%ebp),%eax
801033a5:	83 c4 10             	add    $0x10,%esp
801033a8:	85 c0                	test   %eax,%eax
801033aa:	0f 8e b9 00 00 00    	jle    80103469 <pipewrite+0xd9>
801033b0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033b3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || myproc()->killed){
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033b9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033bf:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
801033c5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801033c8:	03 4d 10             	add    0x10(%ebp),%ecx
801033cb:	89 4d e0             	mov    %ecx,-0x20(%ebp)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033ce:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
801033d4:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
801033da:	39 d0                	cmp    %edx,%eax
801033dc:	74 38                	je     80103416 <pipewrite+0x86>
801033de:	eb 59                	jmp    80103439 <pipewrite+0xa9>
      if(p->readopen == 0 || myproc()->killed){
801033e0:	e8 bb 03 00 00       	call   801037a0 <myproc>
801033e5:	8b 48 24             	mov    0x24(%eax),%ecx
801033e8:	85 c9                	test   %ecx,%ecx
801033ea:	75 34                	jne    80103420 <pipewrite+0x90>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801033ec:	83 ec 0c             	sub    $0xc,%esp
801033ef:	57                   	push   %edi
801033f0:	e8 4b 0b 00 00       	call   80103f40 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801033f5:	58                   	pop    %eax
801033f6:	5a                   	pop    %edx
801033f7:	53                   	push   %ebx
801033f8:	56                   	push   %esi
801033f9:	e8 92 09 00 00       	call   80103d90 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801033fe:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103404:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010340a:	83 c4 10             	add    $0x10,%esp
8010340d:	05 00 02 00 00       	add    $0x200,%eax
80103412:	39 c2                	cmp    %eax,%edx
80103414:	75 2a                	jne    80103440 <pipewrite+0xb0>
      if(p->readopen == 0 || myproc()->killed){
80103416:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010341c:	85 c0                	test   %eax,%eax
8010341e:	75 c0                	jne    801033e0 <pipewrite+0x50>
        release(&p->lock);
80103420:	83 ec 0c             	sub    $0xc,%esp
80103423:	53                   	push   %ebx
80103424:	e8 37 10 00 00       	call   80104460 <release>
        return -1;
80103429:	83 c4 10             	add    $0x10,%esp
8010342c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103431:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103434:	5b                   	pop    %ebx
80103435:	5e                   	pop    %esi
80103436:	5f                   	pop    %edi
80103437:	5d                   	pop    %ebp
80103438:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103439:	89 c2                	mov    %eax,%edx
8010343b:	90                   	nop
8010343c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
80103440:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103443:	8d 42 01             	lea    0x1(%edx),%eax
80103446:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010344a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103450:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103456:	0f b6 09             	movzbl (%ecx),%ecx
80103459:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010345d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
80103460:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
80103463:	0f 85 65 ff ff ff    	jne    801033ce <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103469:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
8010346f:	83 ec 0c             	sub    $0xc,%esp
80103472:	50                   	push   %eax
80103473:	e8 c8 0a 00 00       	call   80103f40 <wakeup>
  release(&p->lock);
80103478:	89 1c 24             	mov    %ebx,(%esp)
8010347b:	e8 e0 0f 00 00       	call   80104460 <release>
  return n;
80103480:	83 c4 10             	add    $0x10,%esp
80103483:	8b 45 10             	mov    0x10(%ebp),%eax
80103486:	eb a9                	jmp    80103431 <pipewrite+0xa1>
80103488:	90                   	nop
80103489:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103490 <piperead>:
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103490:	55                   	push   %ebp
80103491:	89 e5                	mov    %esp,%ebp
80103493:	57                   	push   %edi
80103494:	56                   	push   %esi
80103495:	53                   	push   %ebx
80103496:	83 ec 18             	sub    $0x18,%esp
80103499:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010349c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010349f:	53                   	push   %ebx
801034a0:	e8 9b 0e 00 00       	call   80104340 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034a5:	83 c4 10             	add    $0x10,%esp
801034a8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034ae:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034b4:	75 6a                	jne    80103520 <piperead+0x90>
801034b6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034bc:	85 f6                	test   %esi,%esi
801034be:	0f 84 cc 00 00 00    	je     80103590 <piperead+0x100>
    if(myproc()->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801034c4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801034ca:	eb 2d                	jmp    801034f9 <piperead+0x69>
801034cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034d0:	83 ec 08             	sub    $0x8,%esp
801034d3:	53                   	push   %ebx
801034d4:	56                   	push   %esi
801034d5:	e8 b6 08 00 00       	call   80103d90 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801034da:	83 c4 10             	add    $0x10,%esp
801034dd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801034e3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801034e9:	75 35                	jne    80103520 <piperead+0x90>
801034eb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801034f1:	85 d2                	test   %edx,%edx
801034f3:	0f 84 97 00 00 00    	je     80103590 <piperead+0x100>
    if(myproc()->killed){
801034f9:	e8 a2 02 00 00       	call   801037a0 <myproc>
801034fe:	8b 48 24             	mov    0x24(%eax),%ecx
80103501:	85 c9                	test   %ecx,%ecx
80103503:	74 cb                	je     801034d0 <piperead+0x40>
      release(&p->lock);
80103505:	83 ec 0c             	sub    $0xc,%esp
80103508:	53                   	push   %ebx
80103509:	e8 52 0f 00 00       	call   80104460 <release>
      return -1;
8010350e:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103511:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(myproc()->killed){
      release(&p->lock);
      return -1;
80103514:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
80103519:	5b                   	pop    %ebx
8010351a:	5e                   	pop    %esi
8010351b:	5f                   	pop    %edi
8010351c:	5d                   	pop    %ebp
8010351d:	c3                   	ret    
8010351e:	66 90                	xchg   %ax,%ax
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103520:	8b 45 10             	mov    0x10(%ebp),%eax
80103523:	85 c0                	test   %eax,%eax
80103525:	7e 69                	jle    80103590 <piperead+0x100>
    if(p->nread == p->nwrite)
80103527:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010352d:	31 c9                	xor    %ecx,%ecx
8010352f:	eb 15                	jmp    80103546 <piperead+0xb6>
80103531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103538:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010353e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103544:	74 5a                	je     801035a0 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103546:	8d 70 01             	lea    0x1(%eax),%esi
80103549:	25 ff 01 00 00       	and    $0x1ff,%eax
8010354e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103554:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103559:	88 04 0f             	mov    %al,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010355c:	83 c1 01             	add    $0x1,%ecx
8010355f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103562:	75 d4                	jne    80103538 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103564:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
8010356a:	83 ec 0c             	sub    $0xc,%esp
8010356d:	50                   	push   %eax
8010356e:	e8 cd 09 00 00       	call   80103f40 <wakeup>
  release(&p->lock);
80103573:	89 1c 24             	mov    %ebx,(%esp)
80103576:	e8 e5 0e 00 00       	call   80104460 <release>
  return i;
8010357b:	8b 45 10             	mov    0x10(%ebp),%eax
8010357e:	83 c4 10             	add    $0x10,%esp
}
80103581:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103584:	5b                   	pop    %ebx
80103585:	5e                   	pop    %esi
80103586:	5f                   	pop    %edi
80103587:	5d                   	pop    %ebp
80103588:	c3                   	ret    
80103589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103590:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103597:	eb cb                	jmp    80103564 <piperead+0xd4>
80103599:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035a0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801035a3:	eb bf                	jmp    80103564 <piperead+0xd4>
801035a5:	66 90                	xchg   %ax,%ax
801035a7:	66 90                	xchg   %ax,%ax
801035a9:	66 90                	xchg   %ax,%ax
801035ab:	66 90                	xchg   %ax,%ax
801035ad:	66 90                	xchg   %ax,%ax
801035af:	90                   	nop

801035b0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035b0:	55                   	push   %ebp
801035b1:	89 e5                	mov    %esp,%ebp
801035b3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) //recorre la tabla de procesos
801035b4:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035b9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801035bc:	68 40 2d 11 80       	push   $0x80112d40
801035c1:	e8 7a 0d 00 00       	call   80104340 <acquire>
801035c6:	83 c4 10             	add    $0x10,%esp
801035c9:	eb 14                	jmp    801035df <allocproc+0x2f>
801035cb:	90                   	nop
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) //recorre la tabla de procesos
801035d0:	83 eb 80             	sub    $0xffffff80,%ebx
801035d3:	81 fb 74 4d 11 80    	cmp    $0x80114d74,%ebx
801035d9:	0f 84 89 00 00 00    	je     80103668 <allocproc+0xb8>
    if(p->state == UNUSED)
801035df:	8b 43 0c             	mov    0xc(%ebx),%eax
801035e2:	85 c0                	test   %eax,%eax
801035e4:	75 ea                	jne    801035d0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801035e6:	a1 08 a0 10 80       	mov    0x8010a008,%eax
  p->tickets=100; //sumarle 100 tickets al proceso
  totalTickets+=100; //agregarlos al total de tickets

  release(&ptable.lock);
801035eb:	83 ec 0c             	sub    $0xc,%esp

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
  p->tickets=100; //sumarle 100 tickets al proceso
  totalTickets+=100; //agregarlos al total de tickets
801035ee:	83 05 bc a5 10 80 64 	addl   $0x64,0x8010a5bc

  release(&ptable.lock);
801035f5:	68 40 2d 11 80       	push   $0x80112d40

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801035fa:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
  p->tickets=100; //sumarle 100 tickets al proceso
80103601:	c7 43 7c 64 00 00 00 	movl   $0x64,0x7c(%ebx)
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103608:	8d 50 01             	lea    0x1(%eax),%edx
8010360b:	89 43 10             	mov    %eax,0x10(%ebx)
8010360e:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
  p->tickets=100; //sumarle 100 tickets al proceso
  totalTickets+=100; //agregarlos al total de tickets

  release(&ptable.lock);
80103614:	e8 47 0e 00 00       	call   80104460 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103619:	e8 72 ee ff ff       	call   80102490 <kalloc>
8010361e:	83 c4 10             	add    $0x10,%esp
80103621:	85 c0                	test   %eax,%eax
80103623:	89 43 08             	mov    %eax,0x8(%ebx)
80103626:	74 57                	je     8010367f <allocproc+0xcf>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103628:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
8010362e:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103631:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103636:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
80103639:	c7 40 14 c2 56 10 80 	movl   $0x801056c2,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103640:	6a 14                	push   $0x14
80103642:	6a 00                	push   $0x0
80103644:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103645:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
80103648:	e8 63 0e 00 00       	call   801044b0 <memset>
  p->context->eip = (uint)forkret;
8010364d:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103650:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103653:	c7 40 10 90 36 10 80 	movl   $0x80103690,0x10(%eax)

  return p;
8010365a:	89 d8                	mov    %ebx,%eax
}
8010365c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010365f:	c9                   	leave  
80103660:	c3                   	ret    
80103661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) //recorre la tabla de procesos
    if(p->state == UNUSED)
      goto found; //al encontrar uno no usado goto found

  release(&ptable.lock);
80103668:	83 ec 0c             	sub    $0xc,%esp
8010366b:	68 40 2d 11 80       	push   $0x80112d40
80103670:	e8 eb 0d 00 00       	call   80104460 <release>
  return 0;
80103675:	83 c4 10             	add    $0x10,%esp
80103678:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
8010367a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010367d:	c9                   	leave  
8010367e:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
8010367f:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103686:	eb d4                	jmp    8010365c <allocproc+0xac>
80103688:	90                   	nop
80103689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103690 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103690:	55                   	push   %ebp
80103691:	89 e5                	mov    %esp,%ebp
80103693:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103696:	68 40 2d 11 80       	push   $0x80112d40
8010369b:	e8 c0 0d 00 00       	call   80104460 <release>

  if (first) {
801036a0:	a1 00 a0 10 80       	mov    0x8010a000,%eax
801036a5:	83 c4 10             	add    $0x10,%esp
801036a8:	85 c0                	test   %eax,%eax
801036aa:	75 04                	jne    801036b0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036ac:	c9                   	leave  
801036ad:	c3                   	ret    
801036ae:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801036b0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801036b3:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
801036ba:	00 00 00 
    iinit(ROOTDEV);
801036bd:	6a 01                	push   $0x1
801036bf:	e8 ac dd ff ff       	call   80101470 <iinit>
    initlog(ROOTDEV);
801036c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801036cb:	e8 e0 f3 ff ff       	call   80102ab0 <initlog>
801036d0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036d3:	c9                   	leave  
801036d4:	c3                   	ret    
801036d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801036e0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801036e6:	68 b5 74 10 80       	push   $0x801074b5
801036eb:	68 40 2d 11 80       	push   $0x80112d40
801036f0:	e8 4b 0b 00 00       	call   80104240 <initlock>
}
801036f5:	83 c4 10             	add    $0x10,%esp
801036f8:	c9                   	leave  
801036f9:	c3                   	ret    
801036fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103700 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103700:	55                   	push   %ebp
80103701:	89 e5                	mov    %esp,%ebp
80103703:	56                   	push   %esi
80103704:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103705:	9c                   	pushf  
80103706:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
80103707:	f6 c4 02             	test   $0x2,%ah
8010370a:	75 5b                	jne    80103767 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010370c:	e8 df ef ff ff       	call   801026f0 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103711:	8b 35 20 2d 11 80    	mov    0x80112d20,%esi
80103717:	85 f6                	test   %esi,%esi
80103719:	7e 3f                	jle    8010375a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
8010371b:	0f b6 15 a0 27 11 80 	movzbl 0x801127a0,%edx
80103722:	39 d0                	cmp    %edx,%eax
80103724:	74 30                	je     80103756 <mycpu+0x56>
80103726:	b9 50 28 11 80       	mov    $0x80112850,%ecx
8010372b:	31 d2                	xor    %edx,%edx
8010372d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103730:	83 c2 01             	add    $0x1,%edx
80103733:	39 f2                	cmp    %esi,%edx
80103735:	74 23                	je     8010375a <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103737:	0f b6 19             	movzbl (%ecx),%ebx
8010373a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103740:	39 d8                	cmp    %ebx,%eax
80103742:	75 ec                	jne    80103730 <mycpu+0x30>
      return &cpus[i];
80103744:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010374a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010374d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010374e:	05 a0 27 11 80       	add    $0x801127a0,%eax
  }
  panic("unknown apicid\n");
}
80103753:	5e                   	pop    %esi
80103754:	5d                   	pop    %ebp
80103755:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103756:	31 d2                	xor    %edx,%edx
80103758:	eb ea                	jmp    80103744 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
8010375a:	83 ec 0c             	sub    $0xc,%esp
8010375d:	68 bc 74 10 80       	push   $0x801074bc
80103762:	e8 09 cc ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
80103767:	83 ec 0c             	sub    $0xc,%esp
8010376a:	68 98 75 10 80       	push   $0x80107598
8010376f:	e8 fc cb ff ff       	call   80100370 <panic>
80103774:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010377a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103780 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
80103780:	55                   	push   %ebp
80103781:	89 e5                	mov    %esp,%ebp
80103783:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
80103786:	e8 75 ff ff ff       	call   80103700 <mycpu>
8010378b:	2d a0 27 11 80       	sub    $0x801127a0,%eax
}
80103790:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
80103791:	c1 f8 04             	sar    $0x4,%eax
80103794:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010379a:	c3                   	ret    
8010379b:	90                   	nop
8010379c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037a0 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
801037a0:	55                   	push   %ebp
801037a1:	89 e5                	mov    %esp,%ebp
801037a3:	53                   	push   %ebx
801037a4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
801037a7:	e8 54 0b 00 00       	call   80104300 <pushcli>
  c = mycpu();
801037ac:	e8 4f ff ff ff       	call   80103700 <mycpu>
  p = c->proc;
801037b1:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801037b7:	e8 34 0c 00 00       	call   801043f0 <popcli>
  return p;
}
801037bc:	83 c4 04             	add    $0x4,%esp
801037bf:	89 d8                	mov    %ebx,%eax
801037c1:	5b                   	pop    %ebx
801037c2:	5d                   	pop    %ebp
801037c3:	c3                   	ret    
801037c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037d0 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	53                   	push   %ebx
801037d4:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
801037d7:	e8 d4 fd ff ff       	call   801035b0 <allocproc>
801037dc:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
801037de:	a3 c0 a5 10 80       	mov    %eax,0x8010a5c0
  if((p->pgdir = setupkvm()) == 0)
801037e3:	e8 c8 34 00 00       	call   80106cb0 <setupkvm>
801037e8:	85 c0                	test   %eax,%eax
801037ea:	89 43 04             	mov    %eax,0x4(%ebx)
801037ed:	0f 84 bd 00 00 00    	je     801038b0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
801037f3:	83 ec 04             	sub    $0x4,%esp
801037f6:	68 2c 00 00 00       	push   $0x2c
801037fb:	68 60 a4 10 80       	push   $0x8010a460
80103800:	50                   	push   %eax
80103801:	e8 ba 31 00 00       	call   801069c0 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103806:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103809:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010380f:	6a 4c                	push   $0x4c
80103811:	6a 00                	push   $0x0
80103813:	ff 73 18             	pushl  0x18(%ebx)
80103816:	e8 95 0c 00 00       	call   801044b0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010381b:	8b 43 18             	mov    0x18(%ebx),%eax
8010381e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103823:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103828:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010382b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010382f:	8b 43 18             	mov    0x18(%ebx),%eax
80103832:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103836:	8b 43 18             	mov    0x18(%ebx),%eax
80103839:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010383d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103841:	8b 43 18             	mov    0x18(%ebx),%eax
80103844:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103848:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010384c:	8b 43 18             	mov    0x18(%ebx),%eax
8010384f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103856:	8b 43 18             	mov    0x18(%ebx),%eax
80103859:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
80103860:	8b 43 18             	mov    0x18(%ebx),%eax
80103863:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
8010386a:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010386d:	6a 10                	push   $0x10
8010386f:	68 e5 74 10 80       	push   $0x801074e5
80103874:	50                   	push   %eax
80103875:	e8 36 0e 00 00       	call   801046b0 <safestrcpy>
  p->cwd = namei("/");
8010387a:	c7 04 24 ee 74 10 80 	movl   $0x801074ee,(%esp)
80103881:	e8 3a e6 ff ff       	call   80101ec0 <namei>
80103886:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
80103889:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103890:	e8 ab 0a 00 00       	call   80104340 <acquire>

  p->state = RUNNABLE;
80103895:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
8010389c:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
801038a3:	e8 b8 0b 00 00       	call   80104460 <release>
}
801038a8:	83 c4 10             	add    $0x10,%esp
801038ab:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038ae:	c9                   	leave  
801038af:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801038b0:	83 ec 0c             	sub    $0xc,%esp
801038b3:	68 cc 74 10 80       	push   $0x801074cc
801038b8:	e8 b3 ca ff ff       	call   80100370 <panic>
801038bd:	8d 76 00             	lea    0x0(%esi),%esi

801038c0 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
801038c0:	55                   	push   %ebp
801038c1:	89 e5                	mov    %esp,%ebp
801038c3:	56                   	push   %esi
801038c4:	53                   	push   %ebx
801038c5:	8b 75 08             	mov    0x8(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801038c8:	e8 33 0a 00 00       	call   80104300 <pushcli>
  c = mycpu();
801038cd:	e8 2e fe ff ff       	call   80103700 <mycpu>
  p = c->proc;
801038d2:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801038d8:	e8 13 0b 00 00       	call   801043f0 <popcli>
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
801038dd:	83 fe 00             	cmp    $0x0,%esi
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
801038e0:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
801038e2:	7e 34                	jle    80103918 <growproc+0x58>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
801038e4:	83 ec 04             	sub    $0x4,%esp
801038e7:	01 c6                	add    %eax,%esi
801038e9:	56                   	push   %esi
801038ea:	50                   	push   %eax
801038eb:	ff 73 04             	pushl  0x4(%ebx)
801038ee:	e8 0d 32 00 00       	call   80106b00 <allocuvm>
801038f3:	83 c4 10             	add    $0x10,%esp
801038f6:	85 c0                	test   %eax,%eax
801038f8:	74 36                	je     80103930 <growproc+0x70>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
801038fa:	83 ec 0c             	sub    $0xc,%esp
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
801038fd:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
801038ff:	53                   	push   %ebx
80103900:	e8 ab 2f 00 00       	call   801068b0 <switchuvm>
  return 0;
80103905:	83 c4 10             	add    $0x10,%esp
80103908:	31 c0                	xor    %eax,%eax
}
8010390a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010390d:	5b                   	pop    %ebx
8010390e:	5e                   	pop    %esi
8010390f:	5d                   	pop    %ebp
80103910:	c3                   	ret    
80103911:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103918:	74 e0                	je     801038fa <growproc+0x3a>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010391a:	83 ec 04             	sub    $0x4,%esp
8010391d:	01 c6                	add    %eax,%esi
8010391f:	56                   	push   %esi
80103920:	50                   	push   %eax
80103921:	ff 73 04             	pushl  0x4(%ebx)
80103924:	e8 d7 32 00 00       	call   80106c00 <deallocuvm>
80103929:	83 c4 10             	add    $0x10,%esp
8010392c:	85 c0                	test   %eax,%eax
8010392e:	75 ca                	jne    801038fa <growproc+0x3a>
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
80103930:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103935:	eb d3                	jmp    8010390a <growproc+0x4a>
80103937:	89 f6                	mov    %esi,%esi
80103939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103940 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	57                   	push   %edi
80103944:	56                   	push   %esi
80103945:	53                   	push   %ebx
80103946:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103949:	e8 b2 09 00 00       	call   80104300 <pushcli>
  c = mycpu();
8010394e:	e8 ad fd ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103953:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103959:	e8 92 0a 00 00       	call   801043f0 <popcli>
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
8010395e:	e8 4d fc ff ff       	call   801035b0 <allocproc>
80103963:	85 c0                	test   %eax,%eax
80103965:	89 c7                	mov    %eax,%edi
80103967:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010396a:	0f 84 b5 00 00 00    	je     80103a25 <fork+0xe5>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103970:	83 ec 08             	sub    $0x8,%esp
80103973:	ff 33                	pushl  (%ebx)
80103975:	ff 73 04             	pushl  0x4(%ebx)
80103978:	e8 03 34 00 00       	call   80106d80 <copyuvm>
8010397d:	83 c4 10             	add    $0x10,%esp
80103980:	85 c0                	test   %eax,%eax
80103982:	89 47 04             	mov    %eax,0x4(%edi)
80103985:	0f 84 a1 00 00 00    	je     80103a2c <fork+0xec>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
8010398b:	8b 03                	mov    (%ebx),%eax
8010398d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103990:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
80103992:	89 59 14             	mov    %ebx,0x14(%ecx)
  *np->tf = *curproc->tf;
80103995:	89 c8                	mov    %ecx,%eax
80103997:	8b 79 18             	mov    0x18(%ecx),%edi
8010399a:	8b 73 18             	mov    0x18(%ebx),%esi
8010399d:	b9 13 00 00 00       	mov    $0x13,%ecx
801039a2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039a4:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
801039a6:	8b 40 18             	mov    0x18(%eax),%eax
801039a9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
801039b0:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
801039b4:	85 c0                	test   %eax,%eax
801039b6:	74 13                	je     801039cb <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
801039b8:	83 ec 0c             	sub    $0xc,%esp
801039bb:	50                   	push   %eax
801039bc:	e8 1f d4 ff ff       	call   80100de0 <filedup>
801039c1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801039c4:	83 c4 10             	add    $0x10,%esp
801039c7:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
801039cb:	83 c6 01             	add    $0x1,%esi
801039ce:	83 fe 10             	cmp    $0x10,%esi
801039d1:	75 dd                	jne    801039b0 <fork+0x70>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039d3:	83 ec 0c             	sub    $0xc,%esp
801039d6:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039d9:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039dc:	e8 5f dc ff ff       	call   80101640 <idup>
801039e1:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039e4:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
801039e7:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
801039ea:	8d 47 6c             	lea    0x6c(%edi),%eax
801039ed:	6a 10                	push   $0x10
801039ef:	53                   	push   %ebx
801039f0:	50                   	push   %eax
801039f1:	e8 ba 0c 00 00       	call   801046b0 <safestrcpy>

  pid = np->pid;
801039f6:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
801039f9:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103a00:	e8 3b 09 00 00       	call   80104340 <acquire>

  np->state = RUNNABLE;
80103a05:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
80103a0c:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103a13:	e8 48 0a 00 00       	call   80104460 <release>

  return pid;
80103a18:	83 c4 10             	add    $0x10,%esp
80103a1b:	89 d8                	mov    %ebx,%eax
}
80103a1d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a20:	5b                   	pop    %ebx
80103a21:	5e                   	pop    %esi
80103a22:	5f                   	pop    %edi
80103a23:	5d                   	pop    %ebp
80103a24:	c3                   	ret    
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103a25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a2a:	eb f1                	jmp    80103a1d <fork+0xdd>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103a2c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103a2f:	83 ec 0c             	sub    $0xc,%esp
80103a32:	ff 77 08             	pushl  0x8(%edi)
80103a35:	e8 a6 e8 ff ff       	call   801022e0 <kfree>
    np->kstack = 0;
80103a3a:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103a41:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103a48:	83 c4 10             	add    $0x10,%esp
80103a4b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103a50:	eb cb                	jmp    80103a1d <fork+0xdd>
80103a52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a60 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103a60:	55                   	push   %ebp
80103a61:	89 e5                	mov    %esp,%ebp
80103a63:	57                   	push   %edi
80103a64:	56                   	push   %esi
80103a65:	53                   	push   %ebx
80103a66:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103a69:	e8 92 fc ff ff       	call   80103700 <mycpu>
80103a6e:	8d 78 04             	lea    0x4(%eax),%edi
80103a71:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103a73:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103a7a:	00 00 00 
80103a7d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103a80:	fb                   	sti    
  
  for(;;){
    // Enable interrupts on this processor.
    sti();
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a81:	83 ec 0c             	sub    $0xc,%esp
    int counter=0;
    int winner=random(totalTickets);

    //https://01siddharth.blogspot.com/2018/04/implementing-lottery-scheduling-on-xv6.html

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103a84:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
  
  for(;;){
    // Enable interrupts on this processor.
    sti();
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103a89:	68 40 2d 11 80       	push   $0x80112d40
80103a8e:	e8 ad 08 00 00       	call   80104340 <acquire>
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
80103a93:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
80103a99:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  srandom++;
	return (unsigned int)(x/65536)%(max+1);
80103a9e:	83 c4 10             	add    $0x10,%esp
80103aa1:	8b 0d bc a5 10 80    	mov    0x8010a5bc,%ecx
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
80103aa7:	01 d0                	add    %edx,%eax
80103aa9:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
  srandom++;
	return (unsigned int)(x/65536)%(max+1);
80103aaf:	83 c1 01             	add    $0x1,%ecx
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
80103ab2:	8d 84 02 39 30 00 00 	lea    0x3039(%edx,%eax,1),%eax
  srandom++;
80103ab9:	83 c2 01             	add    $0x1,%edx
80103abc:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
	return (unsigned int)(x/65536)%(max+1);
80103ac2:	31 d2                	xor    %edx,%edx
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
80103ac4:	a3 04 a0 10 80       	mov    %eax,0x8010a004
  srandom++;
	return (unsigned int)(x/65536)%(max+1);
80103ac9:	c1 e8 10             	shr    $0x10,%eax
80103acc:	f7 f1                	div    %ecx
    sti();
    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    //process* processes= <something>;
    //process* current=processes;
    int counter=0;
80103ace:	31 c9                	xor    %ecx,%ecx
80103ad0:	eb 11                	jmp    80103ae3 <scheduler+0x83>
80103ad2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int winner=random(totalTickets);

    //https://01siddharth.blogspot.com/2018/04/implementing-lottery-scheduling-on-xv6.html

    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ad8:	83 eb 80             	sub    $0xffffff80,%ebx
80103adb:	81 fb 74 4d 11 80    	cmp    $0x80114d74,%ebx
80103ae1:	74 40                	je     80103b23 <scheduler+0xc3>
      if(p->state != RUNNABLE)
80103ae3:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103ae7:	75 ef                	jne    80103ad8 <scheduler+0x78>
        continue;
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
    
    	counter+=p->tickets;
80103ae9:	03 4b 7c             	add    0x7c(%ebx),%ecx
    	if(counter<winner){continue;} //saltarse el proceso hasta llegar al ganador
80103aec:	39 d1                	cmp    %edx,%ecx
80103aee:	7c e8                	jl     80103ad8 <scheduler+0x78>

      c->proc = p; //proceso actual es p
      switchuvm(p);
80103af0:	83 ec 0c             	sub    $0xc,%esp
      // before jumping back to us.
    
    	counter+=p->tickets;
    	if(counter<winner){continue;} //saltarse el proceso hasta llegar al ganador

      c->proc = p; //proceso actual es p
80103af3:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103af9:	53                   	push   %ebx
80103afa:	e8 b1 2d 00 00       	call   801068b0 <switchuvm>
      p->state = RUNNING;

      swtch(&(c->scheduler), p->context); // lo corre?
80103aff:	58                   	pop    %eax
80103b00:	5a                   	pop    %edx
80103b01:	ff 73 1c             	pushl  0x1c(%ebx)
80103b04:	57                   	push   %edi
    	counter+=p->tickets;
    	if(counter<winner){continue;} //saltarse el proceso hasta llegar al ganador

      c->proc = p; //proceso actual es p
      switchuvm(p);
      p->state = RUNNING;
80103b05:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)

      swtch(&(c->scheduler), p->context); // lo corre?
80103b0c:	e8 fa 0b 00 00       	call   8010470b <swtch>
      switchkvm();
80103b11:	e8 7a 2d 00 00       	call   80106890 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103b16:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103b1d:	00 00 00 
      break; //no ejecutar el sgte al que ejecutamos
80103b20:	83 c4 10             	add    $0x10,%esp
    }
    release(&ptable.lock);
80103b23:	83 ec 0c             	sub    $0xc,%esp
80103b26:	68 40 2d 11 80       	push   $0x80112d40
80103b2b:	e8 30 09 00 00       	call   80104460 <release>

  }
80103b30:	83 c4 10             	add    $0x10,%esp
80103b33:	e9 48 ff ff ff       	jmp    80103a80 <scheduler+0x20>
80103b38:	90                   	nop
80103b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103b40 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103b40:	55                   	push   %ebp
80103b41:	89 e5                	mov    %esp,%ebp
80103b43:	56                   	push   %esi
80103b44:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103b45:	e8 b6 07 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103b4a:	e8 b1 fb ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103b4f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b55:	e8 96 08 00 00       	call   801043f0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103b5a:	83 ec 0c             	sub    $0xc,%esp
80103b5d:	68 40 2d 11 80       	push   $0x80112d40
80103b62:	e8 59 07 00 00       	call   801042c0 <holding>
80103b67:	83 c4 10             	add    $0x10,%esp
80103b6a:	85 c0                	test   %eax,%eax
80103b6c:	74 4f                	je     80103bbd <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103b6e:	e8 8d fb ff ff       	call   80103700 <mycpu>
80103b73:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103b7a:	75 68                	jne    80103be4 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103b7c:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103b80:	74 55                	je     80103bd7 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103b82:	9c                   	pushf  
80103b83:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103b84:	f6 c4 02             	test   $0x2,%ah
80103b87:	75 41                	jne    80103bca <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b89:	e8 72 fb ff ff       	call   80103700 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103b8e:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103b91:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103b97:	e8 64 fb ff ff       	call   80103700 <mycpu>
80103b9c:	83 ec 08             	sub    $0x8,%esp
80103b9f:	ff 70 04             	pushl  0x4(%eax)
80103ba2:	53                   	push   %ebx
80103ba3:	e8 63 0b 00 00       	call   8010470b <swtch>
  mycpu()->intena = intena;
80103ba8:	e8 53 fb ff ff       	call   80103700 <mycpu>
}
80103bad:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103bb0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103bb6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103bb9:	5b                   	pop    %ebx
80103bba:	5e                   	pop    %esi
80103bbb:	5d                   	pop    %ebp
80103bbc:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103bbd:	83 ec 0c             	sub    $0xc,%esp
80103bc0:	68 f0 74 10 80       	push   $0x801074f0
80103bc5:	e8 a6 c7 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103bca:	83 ec 0c             	sub    $0xc,%esp
80103bcd:	68 1c 75 10 80       	push   $0x8010751c
80103bd2:	e8 99 c7 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103bd7:	83 ec 0c             	sub    $0xc,%esp
80103bda:	68 0e 75 10 80       	push   $0x8010750e
80103bdf:	e8 8c c7 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103be4:	83 ec 0c             	sub    $0xc,%esp
80103be7:	68 02 75 10 80       	push   $0x80107502
80103bec:	e8 7f c7 ff ff       	call   80100370 <panic>
80103bf1:	eb 0d                	jmp    80103c00 <exit>
80103bf3:	90                   	nop
80103bf4:	90                   	nop
80103bf5:	90                   	nop
80103bf6:	90                   	nop
80103bf7:	90                   	nop
80103bf8:	90                   	nop
80103bf9:	90                   	nop
80103bfa:	90                   	nop
80103bfb:	90                   	nop
80103bfc:	90                   	nop
80103bfd:	90                   	nop
80103bfe:	90                   	nop
80103bff:	90                   	nop

80103c00 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103c00:	55                   	push   %ebp
80103c01:	89 e5                	mov    %esp,%ebp
80103c03:	57                   	push   %edi
80103c04:	56                   	push   %esi
80103c05:	53                   	push   %ebx
80103c06:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103c09:	e8 f2 06 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103c0e:	e8 ed fa ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103c13:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c19:	e8 d2 07 00 00       	call   801043f0 <popcli>
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;
  totalTickets-=100; //al terminar el proceso, restar del total de tickets
80103c1e:	83 2d bc a5 10 80 64 	subl   $0x64,0x8010a5bc

  if(curproc == initproc)
80103c25:	39 35 c0 a5 10 80    	cmp    %esi,0x8010a5c0
80103c2b:	8d 5e 28             	lea    0x28(%esi),%ebx
80103c2e:	8d 7e 68             	lea    0x68(%esi),%edi
80103c31:	0f 84 f0 00 00 00    	je     80103d27 <exit+0x127>
80103c37:	89 f6                	mov    %esi,%esi
80103c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103c40:	8b 03                	mov    (%ebx),%eax
80103c42:	85 c0                	test   %eax,%eax
80103c44:	74 12                	je     80103c58 <exit+0x58>
      fileclose(curproc->ofile[fd]);
80103c46:	83 ec 0c             	sub    $0xc,%esp
80103c49:	50                   	push   %eax
80103c4a:	e8 e1 d1 ff ff       	call   80100e30 <fileclose>
      curproc->ofile[fd] = 0;
80103c4f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c55:	83 c4 10             	add    $0x10,%esp
80103c58:	83 c3 04             	add    $0x4,%ebx

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103c5b:	39 df                	cmp    %ebx,%edi
80103c5d:	75 e1                	jne    80103c40 <exit+0x40>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
80103c5f:	e8 ec ee ff ff       	call   80102b50 <begin_op>
  iput(curproc->cwd);
80103c64:	83 ec 0c             	sub    $0xc,%esp
80103c67:	ff 76 68             	pushl  0x68(%esi)
80103c6a:	e8 31 db ff ff       	call   801017a0 <iput>
  end_op();
80103c6f:	e8 4c ef ff ff       	call   80102bc0 <end_op>
  curproc->cwd = 0;
80103c74:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103c7b:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103c82:	e8 b9 06 00 00       	call   80104340 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103c87:	8b 56 14             	mov    0x14(%esi),%edx
80103c8a:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103c8d:	b8 74 2d 11 80       	mov    $0x80112d74,%eax
80103c92:	eb 0e                	jmp    80103ca2 <exit+0xa2>
80103c94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c98:	83 e8 80             	sub    $0xffffff80,%eax
80103c9b:	3d 74 4d 11 80       	cmp    $0x80114d74,%eax
80103ca0:	74 1c                	je     80103cbe <exit+0xbe>
    if(p->state == SLEEPING && p->chan == chan)
80103ca2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ca6:	75 f0                	jne    80103c98 <exit+0x98>
80103ca8:	3b 50 20             	cmp    0x20(%eax),%edx
80103cab:	75 eb                	jne    80103c98 <exit+0x98>
      p->state = RUNNABLE;
80103cad:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cb4:	83 e8 80             	sub    $0xffffff80,%eax
80103cb7:	3d 74 4d 11 80       	cmp    $0x80114d74,%eax
80103cbc:	75 e4                	jne    80103ca2 <exit+0xa2>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103cbe:	8b 0d c0 a5 10 80    	mov    0x8010a5c0,%ecx
80103cc4:	ba 74 2d 11 80       	mov    $0x80112d74,%edx
80103cc9:	eb 10                	jmp    80103cdb <exit+0xdb>
80103ccb:	90                   	nop
80103ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103cd0:	83 ea 80             	sub    $0xffffff80,%edx
80103cd3:	81 fa 74 4d 11 80    	cmp    $0x80114d74,%edx
80103cd9:	74 33                	je     80103d0e <exit+0x10e>
    if(p->parent == curproc){
80103cdb:	39 72 14             	cmp    %esi,0x14(%edx)
80103cde:	75 f0                	jne    80103cd0 <exit+0xd0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ce0:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103ce4:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103ce7:	75 e7                	jne    80103cd0 <exit+0xd0>
80103ce9:	b8 74 2d 11 80       	mov    $0x80112d74,%eax
80103cee:	eb 0a                	jmp    80103cfa <exit+0xfa>
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cf0:	83 e8 80             	sub    $0xffffff80,%eax
80103cf3:	3d 74 4d 11 80       	cmp    $0x80114d74,%eax
80103cf8:	74 d6                	je     80103cd0 <exit+0xd0>
    if(p->state == SLEEPING && p->chan == chan)
80103cfa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cfe:	75 f0                	jne    80103cf0 <exit+0xf0>
80103d00:	3b 48 20             	cmp    0x20(%eax),%ecx
80103d03:	75 eb                	jne    80103cf0 <exit+0xf0>
      p->state = RUNNABLE;
80103d05:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d0c:	eb e2                	jmp    80103cf0 <exit+0xf0>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103d0e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103d15:	e8 26 fe ff ff       	call   80103b40 <sched>
  panic("zombie exit");
80103d1a:	83 ec 0c             	sub    $0xc,%esp
80103d1d:	68 3d 75 10 80       	push   $0x8010753d
80103d22:	e8 49 c6 ff ff       	call   80100370 <panic>
  struct proc *p;
  int fd;
  totalTickets-=100; //al terminar el proceso, restar del total de tickets

  if(curproc == initproc)
    panic("init exiting");
80103d27:	83 ec 0c             	sub    $0xc,%esp
80103d2a:	68 30 75 10 80       	push   $0x80107530
80103d2f:	e8 3c c6 ff ff       	call   80100370 <panic>
80103d34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d40 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103d40:	55                   	push   %ebp
80103d41:	89 e5                	mov    %esp,%ebp
80103d43:	53                   	push   %ebx
80103d44:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d47:	68 40 2d 11 80       	push   $0x80112d40
80103d4c:	e8 ef 05 00 00       	call   80104340 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d51:	e8 aa 05 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103d56:	e8 a5 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103d5b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d61:	e8 8a 06 00 00       	call   801043f0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103d66:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d6d:	e8 ce fd ff ff       	call   80103b40 <sched>
  release(&ptable.lock);
80103d72:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103d79:	e8 e2 06 00 00       	call   80104460 <release>
}
80103d7e:	83 c4 10             	add    $0x10,%esp
80103d81:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103d84:	c9                   	leave  
80103d85:	c3                   	ret    
80103d86:	8d 76 00             	lea    0x0(%esi),%esi
80103d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103d90 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103d90:	55                   	push   %ebp
80103d91:	89 e5                	mov    %esp,%ebp
80103d93:	57                   	push   %edi
80103d94:	56                   	push   %esi
80103d95:	53                   	push   %ebx
80103d96:	83 ec 0c             	sub    $0xc,%esp
80103d99:	8b 7d 08             	mov    0x8(%ebp),%edi
80103d9c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d9f:	e8 5c 05 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103da4:	e8 57 f9 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103da9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103daf:	e8 3c 06 00 00       	call   801043f0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103db4:	85 db                	test   %ebx,%ebx
80103db6:	0f 84 87 00 00 00    	je     80103e43 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103dbc:	85 f6                	test   %esi,%esi
80103dbe:	74 76                	je     80103e36 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103dc0:	81 fe 40 2d 11 80    	cmp    $0x80112d40,%esi
80103dc6:	74 50                	je     80103e18 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103dc8:	83 ec 0c             	sub    $0xc,%esp
80103dcb:	68 40 2d 11 80       	push   $0x80112d40
80103dd0:	e8 6b 05 00 00       	call   80104340 <acquire>
    release(lk);
80103dd5:	89 34 24             	mov    %esi,(%esp)
80103dd8:	e8 83 06 00 00       	call   80104460 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103ddd:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103de0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103de7:	e8 54 fd ff ff       	call   80103b40 <sched>

  // Tidy up.
  p->chan = 0;
80103dec:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103df3:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103dfa:	e8 61 06 00 00       	call   80104460 <release>
    acquire(lk);
80103dff:	89 75 08             	mov    %esi,0x8(%ebp)
80103e02:	83 c4 10             	add    $0x10,%esp
  }
}
80103e05:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e08:	5b                   	pop    %ebx
80103e09:	5e                   	pop    %esi
80103e0a:	5f                   	pop    %edi
80103e0b:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103e0c:	e9 2f 05 00 00       	jmp    80104340 <acquire>
80103e11:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103e18:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e1b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103e22:	e8 19 fd ff ff       	call   80103b40 <sched>

  // Tidy up.
  p->chan = 0;
80103e27:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103e2e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e31:	5b                   	pop    %ebx
80103e32:	5e                   	pop    %esi
80103e33:	5f                   	pop    %edi
80103e34:	5d                   	pop    %ebp
80103e35:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103e36:	83 ec 0c             	sub    $0xc,%esp
80103e39:	68 4f 75 10 80       	push   $0x8010754f
80103e3e:	e8 2d c5 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80103e43:	83 ec 0c             	sub    $0xc,%esp
80103e46:	68 49 75 10 80       	push   $0x80107549
80103e4b:	e8 20 c5 ff ff       	call   80100370 <panic>

80103e50 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103e50:	55                   	push   %ebp
80103e51:	89 e5                	mov    %esp,%ebp
80103e53:	56                   	push   %esi
80103e54:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103e55:	e8 a6 04 00 00       	call   80104300 <pushcli>
  c = mycpu();
80103e5a:	e8 a1 f8 ff ff       	call   80103700 <mycpu>
  p = c->proc;
80103e5f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e65:	e8 86 05 00 00       	call   801043f0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
80103e6a:	83 ec 0c             	sub    $0xc,%esp
80103e6d:	68 40 2d 11 80       	push   $0x80112d40
80103e72:	e8 c9 04 00 00       	call   80104340 <acquire>
80103e77:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103e7a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e7c:	bb 74 2d 11 80       	mov    $0x80112d74,%ebx
80103e81:	eb 10                	jmp    80103e93 <wait+0x43>
80103e83:	90                   	nop
80103e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e88:	83 eb 80             	sub    $0xffffff80,%ebx
80103e8b:	81 fb 74 4d 11 80    	cmp    $0x80114d74,%ebx
80103e91:	74 1d                	je     80103eb0 <wait+0x60>
      if(p->parent != curproc)
80103e93:	39 73 14             	cmp    %esi,0x14(%ebx)
80103e96:	75 f0                	jne    80103e88 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103e98:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103e9c:	74 30                	je     80103ece <wait+0x7e>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e9e:	83 eb 80             	sub    $0xffffff80,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80103ea1:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ea6:	81 fb 74 4d 11 80    	cmp    $0x80114d74,%ebx
80103eac:	75 e5                	jne    80103e93 <wait+0x43>
80103eae:	66 90                	xchg   %ax,%ax
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80103eb0:	85 c0                	test   %eax,%eax
80103eb2:	74 70                	je     80103f24 <wait+0xd4>
80103eb4:	8b 46 24             	mov    0x24(%esi),%eax
80103eb7:	85 c0                	test   %eax,%eax
80103eb9:	75 69                	jne    80103f24 <wait+0xd4>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103ebb:	83 ec 08             	sub    $0x8,%esp
80103ebe:	68 40 2d 11 80       	push   $0x80112d40
80103ec3:	56                   	push   %esi
80103ec4:	e8 c7 fe ff ff       	call   80103d90 <sleep>
  }
80103ec9:	83 c4 10             	add    $0x10,%esp
80103ecc:	eb ac                	jmp    80103e7a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103ece:	83 ec 0c             	sub    $0xc,%esp
80103ed1:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103ed4:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103ed7:	e8 04 e4 ff ff       	call   801022e0 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103edc:	5a                   	pop    %edx
80103edd:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103ee0:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103ee7:	e8 44 2d 00 00       	call   80106c30 <freevm>
        p->pid = 0;
80103eec:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103ef3:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103efa:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103efe:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103f05:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103f0c:	c7 04 24 40 2d 11 80 	movl   $0x80112d40,(%esp)
80103f13:	e8 48 05 00 00       	call   80104460 <release>
        return pid;
80103f18:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f1b:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80103f1e:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f20:	5b                   	pop    %ebx
80103f21:	5e                   	pop    %esi
80103f22:	5d                   	pop    %ebp
80103f23:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
80103f24:	83 ec 0c             	sub    $0xc,%esp
80103f27:	68 40 2d 11 80       	push   $0x80112d40
80103f2c:	e8 2f 05 00 00       	call   80104460 <release>
      return -1;
80103f31:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f34:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
80103f37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80103f3c:	5b                   	pop    %ebx
80103f3d:	5e                   	pop    %esi
80103f3e:	5d                   	pop    %ebp
80103f3f:	c3                   	ret    

80103f40 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f40:	55                   	push   %ebp
80103f41:	89 e5                	mov    %esp,%ebp
80103f43:	53                   	push   %ebx
80103f44:	83 ec 10             	sub    $0x10,%esp
80103f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f4a:	68 40 2d 11 80       	push   $0x80112d40
80103f4f:	e8 ec 03 00 00       	call   80104340 <acquire>
80103f54:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f57:	b8 74 2d 11 80       	mov    $0x80112d74,%eax
80103f5c:	eb 0c                	jmp    80103f6a <wakeup+0x2a>
80103f5e:	66 90                	xchg   %ax,%ax
80103f60:	83 e8 80             	sub    $0xffffff80,%eax
80103f63:	3d 74 4d 11 80       	cmp    $0x80114d74,%eax
80103f68:	74 1c                	je     80103f86 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f6a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f6e:	75 f0                	jne    80103f60 <wakeup+0x20>
80103f70:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f73:	75 eb                	jne    80103f60 <wakeup+0x20>
      p->state = RUNNABLE;
80103f75:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f7c:	83 e8 80             	sub    $0xffffff80,%eax
80103f7f:	3d 74 4d 11 80       	cmp    $0x80114d74,%eax
80103f84:	75 e4                	jne    80103f6a <wakeup+0x2a>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f86:	c7 45 08 40 2d 11 80 	movl   $0x80112d40,0x8(%ebp)
}
80103f8d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f90:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80103f91:	e9 ca 04 00 00       	jmp    80104460 <release>
80103f96:	8d 76 00             	lea    0x0(%esi),%esi
80103f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fa0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103fa0:	55                   	push   %ebp
80103fa1:	89 e5                	mov    %esp,%ebp
80103fa3:	53                   	push   %ebx
80103fa4:	83 ec 10             	sub    $0x10,%esp
80103fa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103faa:	68 40 2d 11 80       	push   $0x80112d40
80103faf:	e8 8c 03 00 00       	call   80104340 <acquire>
80103fb4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fb7:	b8 74 2d 11 80       	mov    $0x80112d74,%eax
80103fbc:	eb 0c                	jmp    80103fca <kill+0x2a>
80103fbe:	66 90                	xchg   %ax,%ax
80103fc0:	83 e8 80             	sub    $0xffffff80,%eax
80103fc3:	3d 74 4d 11 80       	cmp    $0x80114d74,%eax
80103fc8:	74 3e                	je     80104008 <kill+0x68>
    if(p->pid == pid){
80103fca:	39 58 10             	cmp    %ebx,0x10(%eax)
80103fcd:	75 f1                	jne    80103fc0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fcf:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
80103fd3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fda:	74 1c                	je     80103ff8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
80103fdc:	83 ec 0c             	sub    $0xc,%esp
80103fdf:	68 40 2d 11 80       	push   $0x80112d40
80103fe4:	e8 77 04 00 00       	call   80104460 <release>
      return 0;
80103fe9:	83 c4 10             	add    $0x10,%esp
80103fec:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80103fee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ff1:	c9                   	leave  
80103ff2:	c3                   	ret    
80103ff3:	90                   	nop
80103ff4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
80103ff8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103fff:	eb db                	jmp    80103fdc <kill+0x3c>
80104001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104008:	83 ec 0c             	sub    $0xc,%esp
8010400b:	68 40 2d 11 80       	push   $0x80112d40
80104010:	e8 4b 04 00 00       	call   80104460 <release>
  return -1;
80104015:	83 c4 10             	add    $0x10,%esp
80104018:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010401d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104020:	c9                   	leave  
80104021:	c3                   	ret    
80104022:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104030 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104030:	55                   	push   %ebp
80104031:	89 e5                	mov    %esp,%ebp
80104033:	57                   	push   %edi
80104034:	56                   	push   %esi
80104035:	53                   	push   %ebx
80104036:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104039:	bb e0 2d 11 80       	mov    $0x80112de0,%ebx
8010403e:	83 ec 3c             	sub    $0x3c,%esp
80104041:	eb 24                	jmp    80104067 <procdump+0x37>
80104043:	90                   	nop
80104044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104048:	83 ec 0c             	sub    $0xc,%esp
8010404b:	68 d7 78 10 80       	push   $0x801078d7
80104050:	e8 0b c6 ff ff       	call   80100660 <cprintf>
80104055:	83 c4 10             	add    $0x10,%esp
80104058:	83 eb 80             	sub    $0xffffff80,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010405b:	81 fb e0 4d 11 80    	cmp    $0x80114de0,%ebx
80104061:	0f 84 81 00 00 00    	je     801040e8 <procdump+0xb8>
    if(p->state == UNUSED)
80104067:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010406a:	85 c0                	test   %eax,%eax
8010406c:	74 ea                	je     80104058 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010406e:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104071:	ba 60 75 10 80       	mov    $0x80107560,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104076:	77 11                	ja     80104089 <procdump+0x59>
80104078:	8b 14 85 c0 75 10 80 	mov    -0x7fef8a40(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
8010407f:	b8 60 75 10 80       	mov    $0x80107560,%eax
80104084:	85 d2                	test   %edx,%edx
80104086:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104089:	53                   	push   %ebx
8010408a:	52                   	push   %edx
8010408b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010408e:	68 64 75 10 80       	push   $0x80107564
80104093:	e8 c8 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
80104098:	83 c4 10             	add    $0x10,%esp
8010409b:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
8010409f:	75 a7                	jne    80104048 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801040a1:	8d 45 c0             	lea    -0x40(%ebp),%eax
801040a4:	83 ec 08             	sub    $0x8,%esp
801040a7:	8d 7d c0             	lea    -0x40(%ebp),%edi
801040aa:	50                   	push   %eax
801040ab:	8b 43 b0             	mov    -0x50(%ebx),%eax
801040ae:	8b 40 0c             	mov    0xc(%eax),%eax
801040b1:	83 c0 08             	add    $0x8,%eax
801040b4:	50                   	push   %eax
801040b5:	e8 a6 01 00 00       	call   80104260 <getcallerpcs>
801040ba:	83 c4 10             	add    $0x10,%esp
801040bd:	8d 76 00             	lea    0x0(%esi),%esi
      for(i=0; i<10 && pc[i] != 0; i++)
801040c0:	8b 17                	mov    (%edi),%edx
801040c2:	85 d2                	test   %edx,%edx
801040c4:	74 82                	je     80104048 <procdump+0x18>
        cprintf(" %p", pc[i]);
801040c6:	83 ec 08             	sub    $0x8,%esp
801040c9:	83 c7 04             	add    $0x4,%edi
801040cc:	52                   	push   %edx
801040cd:	68 a1 6f 10 80       	push   $0x80106fa1
801040d2:	e8 89 c5 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801040d7:	83 c4 10             	add    $0x10,%esp
801040da:	39 f7                	cmp    %esi,%edi
801040dc:	75 e2                	jne    801040c0 <procdump+0x90>
801040de:	e9 65 ff ff ff       	jmp    80104048 <procdump+0x18>
801040e3:	90                   	nop
801040e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801040e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040eb:	5b                   	pop    %ebx
801040ec:	5e                   	pop    %esi
801040ed:	5f                   	pop    %edi
801040ee:	5d                   	pop    %ebp
801040ef:	c3                   	ret    

801040f0 <random>:
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
801040f0:	8b 15 b8 a5 10 80    	mov    0x8010a5b8,%edx
801040f6:	a1 04 a0 10 80       	mov    0x8010a004,%eax
//generate random number

static unsigned long x = 1;
int srandom=0;

int random(int max){
801040fb:	55                   	push   %ebp
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
801040fc:	01 d0                	add    %edx,%eax
//generate random number

static unsigned long x = 1;
int srandom=0;

int random(int max){
801040fe:	89 e5                	mov    %esp,%ebp
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
80104100:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
  srandom++;
	return (unsigned int)(x/65536)%(max+1);
80104106:	8b 4d 08             	mov    0x8(%ebp),%ecx
}
80104109:	5d                   	pop    %ebp
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
8010410a:	8d 84 02 39 30 00 00 	lea    0x3039(%edx,%eax,1),%eax
  srandom++;
80104111:	83 c2 01             	add    $0x1,%edx
	return (unsigned int)(x/65536)%(max+1);
80104114:	83 c1 01             	add    $0x1,%ecx
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
  srandom++;
80104117:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
	return (unsigned int)(x/65536)%(max+1);
8010411d:	31 d2                	xor    %edx,%edx
static unsigned long x = 1;
int srandom=0;

int random(int max){
	unsigned long a = 1103515245, c = 12345;
	x = a*(x+srandom)+c+srandom; //intento de crear numero random que vaya variando
8010411f:	a3 04 a0 10 80       	mov    %eax,0x8010a004
  srandom++;
	return (unsigned int)(x/65536)%(max+1);
80104124:	c1 e8 10             	shr    $0x10,%eax
80104127:	f7 f1                	div    %ecx
}
80104129:	89 d0                	mov    %edx,%eax
8010412b:	c3                   	ret    
8010412c:	66 90                	xchg   %ax,%ax
8010412e:	66 90                	xchg   %ax,%ax

80104130 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	53                   	push   %ebx
80104134:	83 ec 0c             	sub    $0xc,%esp
80104137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010413a:	68 d8 75 10 80       	push   $0x801075d8
8010413f:	8d 43 04             	lea    0x4(%ebx),%eax
80104142:	50                   	push   %eax
80104143:	e8 f8 00 00 00       	call   80104240 <initlock>
  lk->name = name;
80104148:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010414b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104151:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
80104154:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010415b:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
8010415e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104161:	c9                   	leave  
80104162:	c3                   	ret    
80104163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104170 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	56                   	push   %esi
80104174:	53                   	push   %ebx
80104175:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104178:	83 ec 0c             	sub    $0xc,%esp
8010417b:	8d 73 04             	lea    0x4(%ebx),%esi
8010417e:	56                   	push   %esi
8010417f:	e8 bc 01 00 00       	call   80104340 <acquire>
  while (lk->locked) {
80104184:	8b 13                	mov    (%ebx),%edx
80104186:	83 c4 10             	add    $0x10,%esp
80104189:	85 d2                	test   %edx,%edx
8010418b:	74 16                	je     801041a3 <acquiresleep+0x33>
8010418d:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
80104190:	83 ec 08             	sub    $0x8,%esp
80104193:	56                   	push   %esi
80104194:	53                   	push   %ebx
80104195:	e8 f6 fb ff ff       	call   80103d90 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
8010419a:	8b 03                	mov    (%ebx),%eax
8010419c:	83 c4 10             	add    $0x10,%esp
8010419f:	85 c0                	test   %eax,%eax
801041a1:	75 ed                	jne    80104190 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
801041a3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = myproc()->pid;
801041a9:	e8 f2 f5 ff ff       	call   801037a0 <myproc>
801041ae:	8b 40 10             	mov    0x10(%eax),%eax
801041b1:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801041b4:	89 75 08             	mov    %esi,0x8(%ebp)
}
801041b7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801041ba:	5b                   	pop    %ebx
801041bb:	5e                   	pop    %esi
801041bc:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = myproc()->pid;
  release(&lk->lk);
801041bd:	e9 9e 02 00 00       	jmp    80104460 <release>
801041c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801041d0 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	56                   	push   %esi
801041d4:	53                   	push   %ebx
801041d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801041d8:	83 ec 0c             	sub    $0xc,%esp
801041db:	8d 73 04             	lea    0x4(%ebx),%esi
801041de:	56                   	push   %esi
801041df:	e8 5c 01 00 00       	call   80104340 <acquire>
  lk->locked = 0;
801041e4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
801041ea:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
801041f1:	89 1c 24             	mov    %ebx,(%esp)
801041f4:	e8 47 fd ff ff       	call   80103f40 <wakeup>
  release(&lk->lk);
801041f9:	89 75 08             	mov    %esi,0x8(%ebp)
801041fc:	83 c4 10             	add    $0x10,%esp
}
801041ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104202:	5b                   	pop    %ebx
80104203:	5e                   	pop    %esi
80104204:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104205:	e9 56 02 00 00       	jmp    80104460 <release>
8010420a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104210 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104210:	55                   	push   %ebp
80104211:	89 e5                	mov    %esp,%ebp
80104213:	56                   	push   %esi
80104214:	53                   	push   %ebx
80104215:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104218:	83 ec 0c             	sub    $0xc,%esp
8010421b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010421e:	53                   	push   %ebx
8010421f:	e8 1c 01 00 00       	call   80104340 <acquire>
  r = lk->locked;
80104224:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104226:	89 1c 24             	mov    %ebx,(%esp)
80104229:	e8 32 02 00 00       	call   80104460 <release>
  return r;
}
8010422e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104231:	89 f0                	mov    %esi,%eax
80104233:	5b                   	pop    %ebx
80104234:	5e                   	pop    %esi
80104235:	5d                   	pop    %ebp
80104236:	c3                   	ret    
80104237:	66 90                	xchg   %ax,%ax
80104239:	66 90                	xchg   %ax,%ax
8010423b:	66 90                	xchg   %ax,%ax
8010423d:	66 90                	xchg   %ax,%ax
8010423f:	90                   	nop

80104240 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104240:	55                   	push   %ebp
80104241:	89 e5                	mov    %esp,%ebp
80104243:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104246:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104249:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010424f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104252:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104259:	5d                   	pop    %ebp
8010425a:	c3                   	ret    
8010425b:	90                   	nop
8010425c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104260 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104264:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104267:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010426a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010426d:	31 c0                	xor    %eax,%eax
8010426f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104270:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104276:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010427c:	77 1a                	ja     80104298 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010427e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104281:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104284:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104287:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104289:	83 f8 0a             	cmp    $0xa,%eax
8010428c:	75 e2                	jne    80104270 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010428e:	5b                   	pop    %ebx
8010428f:	5d                   	pop    %ebp
80104290:	c3                   	ret    
80104291:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104298:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010429f:	83 c0 01             	add    $0x1,%eax
801042a2:	83 f8 0a             	cmp    $0xa,%eax
801042a5:	74 e7                	je     8010428e <getcallerpcs+0x2e>
    pcs[i] = 0;
801042a7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801042ae:	83 c0 01             	add    $0x1,%eax
801042b1:	83 f8 0a             	cmp    $0xa,%eax
801042b4:	75 e2                	jne    80104298 <getcallerpcs+0x38>
801042b6:	eb d6                	jmp    8010428e <getcallerpcs+0x2e>
801042b8:	90                   	nop
801042b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801042c0 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	53                   	push   %ebx
801042c4:	83 ec 04             	sub    $0x4,%esp
801042c7:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == mycpu();
801042ca:	8b 02                	mov    (%edx),%eax
801042cc:	85 c0                	test   %eax,%eax
801042ce:	75 10                	jne    801042e0 <holding+0x20>
}
801042d0:	83 c4 04             	add    $0x4,%esp
801042d3:	31 c0                	xor    %eax,%eax
801042d5:	5b                   	pop    %ebx
801042d6:	5d                   	pop    %ebp
801042d7:	c3                   	ret    
801042d8:	90                   	nop
801042d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801042e0:	8b 5a 08             	mov    0x8(%edx),%ebx
801042e3:	e8 18 f4 ff ff       	call   80103700 <mycpu>
801042e8:	39 c3                	cmp    %eax,%ebx
801042ea:	0f 94 c0             	sete   %al
}
801042ed:	83 c4 04             	add    $0x4,%esp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801042f0:	0f b6 c0             	movzbl %al,%eax
}
801042f3:	5b                   	pop    %ebx
801042f4:	5d                   	pop    %ebp
801042f5:	c3                   	ret    
801042f6:	8d 76 00             	lea    0x0(%esi),%esi
801042f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104300 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	53                   	push   %ebx
80104304:	83 ec 04             	sub    $0x4,%esp
80104307:	9c                   	pushf  
80104308:	5b                   	pop    %ebx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104309:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(mycpu()->ncli == 0)
8010430a:	e8 f1 f3 ff ff       	call   80103700 <mycpu>
8010430f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104315:	85 c0                	test   %eax,%eax
80104317:	75 11                	jne    8010432a <pushcli+0x2a>
    mycpu()->intena = eflags & FL_IF;
80104319:	81 e3 00 02 00 00    	and    $0x200,%ebx
8010431f:	e8 dc f3 ff ff       	call   80103700 <mycpu>
80104324:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
  mycpu()->ncli += 1;
8010432a:	e8 d1 f3 ff ff       	call   80103700 <mycpu>
8010432f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
}
80104336:	83 c4 04             	add    $0x4,%esp
80104339:	5b                   	pop    %ebx
8010433a:	5d                   	pop    %ebp
8010433b:	c3                   	ret    
8010433c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104340 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104340:	55                   	push   %ebp
80104341:	89 e5                	mov    %esp,%ebp
80104343:	56                   	push   %esi
80104344:	53                   	push   %ebx
  pushcli(); // disable interrupts to avoid deadlock.
80104345:	e8 b6 ff ff ff       	call   80104300 <pushcli>
  if(holding(lk))
8010434a:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
8010434d:	8b 03                	mov    (%ebx),%eax
8010434f:	85 c0                	test   %eax,%eax
80104351:	75 7d                	jne    801043d0 <acquire+0x90>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80104353:	ba 01 00 00 00       	mov    $0x1,%edx
80104358:	eb 09                	jmp    80104363 <acquire+0x23>
8010435a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104360:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104363:	89 d0                	mov    %edx,%eax
80104365:	f0 87 03             	lock xchg %eax,(%ebx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
80104368:	85 c0                	test   %eax,%eax
8010436a:	75 f4                	jne    80104360 <acquire+0x20>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
8010436c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
80104371:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104374:	e8 87 f3 ff ff       	call   80103700 <mycpu>
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104379:	89 ea                	mov    %ebp,%edx
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
8010437b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
8010437e:	89 43 08             	mov    %eax,0x8(%ebx)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104381:	31 c0                	xor    %eax,%eax
80104383:	90                   	nop
80104384:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104388:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
8010438e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104394:	77 1a                	ja     801043b0 <acquire+0x70>
      break;
    pcs[i] = ebp[1];     // saved %eip
80104396:	8b 5a 04             	mov    0x4(%edx),%ebx
80104399:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
8010439c:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
8010439f:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801043a1:	83 f8 0a             	cmp    $0xa,%eax
801043a4:	75 e2                	jne    80104388 <acquire+0x48>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = mycpu();
  getcallerpcs(&lk, lk->pcs);
}
801043a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043a9:	5b                   	pop    %ebx
801043aa:	5e                   	pop    %esi
801043ab:	5d                   	pop    %ebp
801043ac:	c3                   	ret    
801043ad:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
801043b0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801043b7:	83 c0 01             	add    $0x1,%eax
801043ba:	83 f8 0a             	cmp    $0xa,%eax
801043bd:	74 e7                	je     801043a6 <acquire+0x66>
    pcs[i] = 0;
801043bf:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801043c6:	83 c0 01             	add    $0x1,%eax
801043c9:	83 f8 0a             	cmp    $0xa,%eax
801043cc:	75 e2                	jne    801043b0 <acquire+0x70>
801043ce:	eb d6                	jmp    801043a6 <acquire+0x66>

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
801043d0:	8b 73 08             	mov    0x8(%ebx),%esi
801043d3:	e8 28 f3 ff ff       	call   80103700 <mycpu>
801043d8:	39 c6                	cmp    %eax,%esi
801043da:	0f 85 73 ff ff ff    	jne    80104353 <acquire+0x13>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
801043e0:	83 ec 0c             	sub    $0xc,%esp
801043e3:	68 e3 75 10 80       	push   $0x801075e3
801043e8:	e8 83 bf ff ff       	call   80100370 <panic>
801043ed:	8d 76 00             	lea    0x0(%esi),%esi

801043f0 <popcli>:
  mycpu()->ncli += 1;
}

void
popcli(void)
{
801043f0:	55                   	push   %ebp
801043f1:	89 e5                	mov    %esp,%ebp
801043f3:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801043f6:	9c                   	pushf  
801043f7:	58                   	pop    %eax
  if(readeflags()&FL_IF)
801043f8:	f6 c4 02             	test   $0x2,%ah
801043fb:	75 52                	jne    8010444f <popcli+0x5f>
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
801043fd:	e8 fe f2 ff ff       	call   80103700 <mycpu>
80104402:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104408:	8d 51 ff             	lea    -0x1(%ecx),%edx
8010440b:	85 d2                	test   %edx,%edx
8010440d:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104413:	78 2d                	js     80104442 <popcli+0x52>
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104415:	e8 e6 f2 ff ff       	call   80103700 <mycpu>
8010441a:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104420:	85 d2                	test   %edx,%edx
80104422:	74 0c                	je     80104430 <popcli+0x40>
    sti();
}
80104424:	c9                   	leave  
80104425:	c3                   	ret    
80104426:	8d 76 00             	lea    0x0(%esi),%esi
80104429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
  if(mycpu()->ncli == 0 && mycpu()->intena)
80104430:	e8 cb f2 ff ff       	call   80103700 <mycpu>
80104435:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010443b:	85 c0                	test   %eax,%eax
8010443d:	74 e5                	je     80104424 <popcli+0x34>
}

static inline void
sti(void)
{
  asm volatile("sti");
8010443f:	fb                   	sti    
    sti();
}
80104440:	c9                   	leave  
80104441:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--mycpu()->ncli < 0)
    panic("popcli");
80104442:	83 ec 0c             	sub    $0xc,%esp
80104445:	68 02 76 10 80       	push   $0x80107602
8010444a:	e8 21 bf ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
8010444f:	83 ec 0c             	sub    $0xc,%esp
80104452:	68 eb 75 10 80       	push   $0x801075eb
80104457:	e8 14 bf ff ff       	call   80100370 <panic>
8010445c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104460 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104460:	55                   	push   %ebp
80104461:	89 e5                	mov    %esp,%ebp
80104463:	56                   	push   %esi
80104464:	53                   	push   %ebx
80104465:	8b 5d 08             	mov    0x8(%ebp),%ebx

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104468:	8b 03                	mov    (%ebx),%eax
8010446a:	85 c0                	test   %eax,%eax
8010446c:	75 12                	jne    80104480 <release+0x20>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010446e:	83 ec 0c             	sub    $0xc,%esp
80104471:	68 09 76 10 80       	push   $0x80107609
80104476:	e8 f5 be ff ff       	call   80100370 <panic>
8010447b:	90                   	nop
8010447c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == mycpu();
80104480:	8b 73 08             	mov    0x8(%ebx),%esi
80104483:	e8 78 f2 ff ff       	call   80103700 <mycpu>
80104488:	39 c6                	cmp    %eax,%esi
8010448a:	75 e2                	jne    8010446e <release+0xe>
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");

  lk->pcs[0] = 0;
8010448c:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  lk->cpu = 0;
80104493:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
8010449a:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
8010449f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)

  popcli();
}
801044a5:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044a8:	5b                   	pop    %ebx
801044a9:	5e                   	pop    %esi
801044aa:	5d                   	pop    %ebp
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
801044ab:	e9 40 ff ff ff       	jmp    801043f0 <popcli>

801044b0 <memset>:
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	57                   	push   %edi
801044b4:	53                   	push   %ebx
801044b5:	8b 55 08             	mov    0x8(%ebp),%edx
801044b8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801044bb:	f6 c2 03             	test   $0x3,%dl
801044be:	75 05                	jne    801044c5 <memset+0x15>
801044c0:	f6 c1 03             	test   $0x3,%cl
801044c3:	74 13                	je     801044d8 <memset+0x28>
801044c5:	89 d7                	mov    %edx,%edi
801044c7:	8b 45 0c             	mov    0xc(%ebp),%eax
801044ca:	fc                   	cld    
801044cb:	f3 aa                	rep stos %al,%es:(%edi)
801044cd:	5b                   	pop    %ebx
801044ce:	89 d0                	mov    %edx,%eax
801044d0:	5f                   	pop    %edi
801044d1:	5d                   	pop    %ebp
801044d2:	c3                   	ret    
801044d3:	90                   	nop
801044d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801044dc:	c1 e9 02             	shr    $0x2,%ecx
801044df:	89 fb                	mov    %edi,%ebx
801044e1:	89 f8                	mov    %edi,%eax
801044e3:	c1 e3 18             	shl    $0x18,%ebx
801044e6:	c1 e0 10             	shl    $0x10,%eax
801044e9:	09 d8                	or     %ebx,%eax
801044eb:	09 f8                	or     %edi,%eax
801044ed:	c1 e7 08             	shl    $0x8,%edi
801044f0:	09 f8                	or     %edi,%eax
801044f2:	89 d7                	mov    %edx,%edi
801044f4:	fc                   	cld    
801044f5:	f3 ab                	rep stos %eax,%es:(%edi)
801044f7:	5b                   	pop    %ebx
801044f8:	89 d0                	mov    %edx,%eax
801044fa:	5f                   	pop    %edi
801044fb:	5d                   	pop    %ebp
801044fc:	c3                   	ret    
801044fd:	8d 76 00             	lea    0x0(%esi),%esi

80104500 <memcmp>:
80104500:	55                   	push   %ebp
80104501:	89 e5                	mov    %esp,%ebp
80104503:	57                   	push   %edi
80104504:	56                   	push   %esi
80104505:	8b 45 10             	mov    0x10(%ebp),%eax
80104508:	53                   	push   %ebx
80104509:	8b 75 0c             	mov    0xc(%ebp),%esi
8010450c:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010450f:	85 c0                	test   %eax,%eax
80104511:	74 29                	je     8010453c <memcmp+0x3c>
80104513:	0f b6 13             	movzbl (%ebx),%edx
80104516:	0f b6 0e             	movzbl (%esi),%ecx
80104519:	38 d1                	cmp    %dl,%cl
8010451b:	75 2b                	jne    80104548 <memcmp+0x48>
8010451d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104520:	31 c0                	xor    %eax,%eax
80104522:	eb 14                	jmp    80104538 <memcmp+0x38>
80104524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104528:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010452d:	83 c0 01             	add    $0x1,%eax
80104530:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104534:	38 ca                	cmp    %cl,%dl
80104536:	75 10                	jne    80104548 <memcmp+0x48>
80104538:	39 f8                	cmp    %edi,%eax
8010453a:	75 ec                	jne    80104528 <memcmp+0x28>
8010453c:	5b                   	pop    %ebx
8010453d:	31 c0                	xor    %eax,%eax
8010453f:	5e                   	pop    %esi
80104540:	5f                   	pop    %edi
80104541:	5d                   	pop    %ebp
80104542:	c3                   	ret    
80104543:	90                   	nop
80104544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104548:	0f b6 c2             	movzbl %dl,%eax
8010454b:	5b                   	pop    %ebx
8010454c:	29 c8                	sub    %ecx,%eax
8010454e:	5e                   	pop    %esi
8010454f:	5f                   	pop    %edi
80104550:	5d                   	pop    %ebp
80104551:	c3                   	ret    
80104552:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104560 <memmove>:
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	56                   	push   %esi
80104564:	53                   	push   %ebx
80104565:	8b 45 08             	mov    0x8(%ebp),%eax
80104568:	8b 75 0c             	mov    0xc(%ebp),%esi
8010456b:	8b 5d 10             	mov    0x10(%ebp),%ebx
8010456e:	39 c6                	cmp    %eax,%esi
80104570:	73 2e                	jae    801045a0 <memmove+0x40>
80104572:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104575:	39 c8                	cmp    %ecx,%eax
80104577:	73 27                	jae    801045a0 <memmove+0x40>
80104579:	85 db                	test   %ebx,%ebx
8010457b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010457e:	74 17                	je     80104597 <memmove+0x37>
80104580:	29 d9                	sub    %ebx,%ecx
80104582:	89 cb                	mov    %ecx,%ebx
80104584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104588:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010458c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
8010458f:	83 ea 01             	sub    $0x1,%edx
80104592:	83 fa ff             	cmp    $0xffffffff,%edx
80104595:	75 f1                	jne    80104588 <memmove+0x28>
80104597:	5b                   	pop    %ebx
80104598:	5e                   	pop    %esi
80104599:	5d                   	pop    %ebp
8010459a:	c3                   	ret    
8010459b:	90                   	nop
8010459c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045a0:	31 d2                	xor    %edx,%edx
801045a2:	85 db                	test   %ebx,%ebx
801045a4:	74 f1                	je     80104597 <memmove+0x37>
801045a6:	8d 76 00             	lea    0x0(%esi),%esi
801045a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801045b0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801045b4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801045b7:	83 c2 01             	add    $0x1,%edx
801045ba:	39 d3                	cmp    %edx,%ebx
801045bc:	75 f2                	jne    801045b0 <memmove+0x50>
801045be:	5b                   	pop    %ebx
801045bf:	5e                   	pop    %esi
801045c0:	5d                   	pop    %ebp
801045c1:	c3                   	ret    
801045c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801045c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045d0 <memcpy>:
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	5d                   	pop    %ebp
801045d4:	eb 8a                	jmp    80104560 <memmove>
801045d6:	8d 76 00             	lea    0x0(%esi),%esi
801045d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801045e0 <strncmp>:
801045e0:	55                   	push   %ebp
801045e1:	89 e5                	mov    %esp,%ebp
801045e3:	57                   	push   %edi
801045e4:	56                   	push   %esi
801045e5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045e8:	53                   	push   %ebx
801045e9:	8b 7d 08             	mov    0x8(%ebp),%edi
801045ec:	8b 75 0c             	mov    0xc(%ebp),%esi
801045ef:	85 c9                	test   %ecx,%ecx
801045f1:	74 37                	je     8010462a <strncmp+0x4a>
801045f3:	0f b6 17             	movzbl (%edi),%edx
801045f6:	0f b6 1e             	movzbl (%esi),%ebx
801045f9:	84 d2                	test   %dl,%dl
801045fb:	74 3f                	je     8010463c <strncmp+0x5c>
801045fd:	38 d3                	cmp    %dl,%bl
801045ff:	75 3b                	jne    8010463c <strncmp+0x5c>
80104601:	8d 47 01             	lea    0x1(%edi),%eax
80104604:	01 cf                	add    %ecx,%edi
80104606:	eb 1b                	jmp    80104623 <strncmp+0x43>
80104608:	90                   	nop
80104609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104610:	0f b6 10             	movzbl (%eax),%edx
80104613:	84 d2                	test   %dl,%dl
80104615:	74 21                	je     80104638 <strncmp+0x58>
80104617:	0f b6 19             	movzbl (%ecx),%ebx
8010461a:	83 c0 01             	add    $0x1,%eax
8010461d:	89 ce                	mov    %ecx,%esi
8010461f:	38 da                	cmp    %bl,%dl
80104621:	75 19                	jne    8010463c <strncmp+0x5c>
80104623:	39 c7                	cmp    %eax,%edi
80104625:	8d 4e 01             	lea    0x1(%esi),%ecx
80104628:	75 e6                	jne    80104610 <strncmp+0x30>
8010462a:	5b                   	pop    %ebx
8010462b:	31 c0                	xor    %eax,%eax
8010462d:	5e                   	pop    %esi
8010462e:	5f                   	pop    %edi
8010462f:	5d                   	pop    %ebp
80104630:	c3                   	ret    
80104631:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104638:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
8010463c:	0f b6 c2             	movzbl %dl,%eax
8010463f:	29 d8                	sub    %ebx,%eax
80104641:	5b                   	pop    %ebx
80104642:	5e                   	pop    %esi
80104643:	5f                   	pop    %edi
80104644:	5d                   	pop    %ebp
80104645:	c3                   	ret    
80104646:	8d 76 00             	lea    0x0(%esi),%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104650 <strncpy>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	56                   	push   %esi
80104654:	53                   	push   %ebx
80104655:	8b 45 08             	mov    0x8(%ebp),%eax
80104658:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010465b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010465e:	89 c2                	mov    %eax,%edx
80104660:	eb 19                	jmp    8010467b <strncpy+0x2b>
80104662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104668:	83 c3 01             	add    $0x1,%ebx
8010466b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010466f:	83 c2 01             	add    $0x1,%edx
80104672:	84 c9                	test   %cl,%cl
80104674:	88 4a ff             	mov    %cl,-0x1(%edx)
80104677:	74 09                	je     80104682 <strncpy+0x32>
80104679:	89 f1                	mov    %esi,%ecx
8010467b:	85 c9                	test   %ecx,%ecx
8010467d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104680:	7f e6                	jg     80104668 <strncpy+0x18>
80104682:	31 c9                	xor    %ecx,%ecx
80104684:	85 f6                	test   %esi,%esi
80104686:	7e 17                	jle    8010469f <strncpy+0x4f>
80104688:	90                   	nop
80104689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104690:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104694:	89 f3                	mov    %esi,%ebx
80104696:	83 c1 01             	add    $0x1,%ecx
80104699:	29 cb                	sub    %ecx,%ebx
8010469b:	85 db                	test   %ebx,%ebx
8010469d:	7f f1                	jg     80104690 <strncpy+0x40>
8010469f:	5b                   	pop    %ebx
801046a0:	5e                   	pop    %esi
801046a1:	5d                   	pop    %ebp
801046a2:	c3                   	ret    
801046a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046b0 <safestrcpy>:
801046b0:	55                   	push   %ebp
801046b1:	89 e5                	mov    %esp,%ebp
801046b3:	56                   	push   %esi
801046b4:	53                   	push   %ebx
801046b5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801046b8:	8b 45 08             	mov    0x8(%ebp),%eax
801046bb:	8b 55 0c             	mov    0xc(%ebp),%edx
801046be:	85 c9                	test   %ecx,%ecx
801046c0:	7e 26                	jle    801046e8 <safestrcpy+0x38>
801046c2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801046c6:	89 c1                	mov    %eax,%ecx
801046c8:	eb 17                	jmp    801046e1 <safestrcpy+0x31>
801046ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046d0:	83 c2 01             	add    $0x1,%edx
801046d3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801046d7:	83 c1 01             	add    $0x1,%ecx
801046da:	84 db                	test   %bl,%bl
801046dc:	88 59 ff             	mov    %bl,-0x1(%ecx)
801046df:	74 04                	je     801046e5 <safestrcpy+0x35>
801046e1:	39 f2                	cmp    %esi,%edx
801046e3:	75 eb                	jne    801046d0 <safestrcpy+0x20>
801046e5:	c6 01 00             	movb   $0x0,(%ecx)
801046e8:	5b                   	pop    %ebx
801046e9:	5e                   	pop    %esi
801046ea:	5d                   	pop    %ebp
801046eb:	c3                   	ret    
801046ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801046f0 <strlen>:
801046f0:	55                   	push   %ebp
801046f1:	31 c0                	xor    %eax,%eax
801046f3:	89 e5                	mov    %esp,%ebp
801046f5:	8b 55 08             	mov    0x8(%ebp),%edx
801046f8:	80 3a 00             	cmpb   $0x0,(%edx)
801046fb:	74 0c                	je     80104709 <strlen+0x19>
801046fd:	8d 76 00             	lea    0x0(%esi),%esi
80104700:	83 c0 01             	add    $0x1,%eax
80104703:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104707:	75 f7                	jne    80104700 <strlen+0x10>
80104709:	5d                   	pop    %ebp
8010470a:	c3                   	ret    

8010470b <swtch>:
8010470b:	8b 44 24 04          	mov    0x4(%esp),%eax
8010470f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104713:	55                   	push   %ebp
80104714:	53                   	push   %ebx
80104715:	56                   	push   %esi
80104716:	57                   	push   %edi
80104717:	89 20                	mov    %esp,(%eax)
80104719:	89 d4                	mov    %edx,%esp
8010471b:	5f                   	pop    %edi
8010471c:	5e                   	pop    %esi
8010471d:	5b                   	pop    %ebx
8010471e:	5d                   	pop    %ebp
8010471f:	c3                   	ret    

80104720 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	53                   	push   %ebx
80104724:	83 ec 04             	sub    $0x4,%esp
80104727:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
8010472a:	e8 71 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
8010472f:	8b 00                	mov    (%eax),%eax
80104731:	39 d8                	cmp    %ebx,%eax
80104733:	76 1b                	jbe    80104750 <fetchint+0x30>
80104735:	8d 53 04             	lea    0x4(%ebx),%edx
80104738:	39 d0                	cmp    %edx,%eax
8010473a:	72 14                	jb     80104750 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010473c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010473f:	8b 13                	mov    (%ebx),%edx
80104741:	89 10                	mov    %edx,(%eax)
  return 0;
80104743:	31 c0                	xor    %eax,%eax
}
80104745:	83 c4 04             	add    $0x4,%esp
80104748:	5b                   	pop    %ebx
80104749:	5d                   	pop    %ebp
8010474a:	c3                   	ret    
8010474b:	90                   	nop
8010474c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104750:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104755:	eb ee                	jmp    80104745 <fetchint+0x25>
80104757:	89 f6                	mov    %esi,%esi
80104759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104760 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104760:	55                   	push   %ebp
80104761:	89 e5                	mov    %esp,%ebp
80104763:	53                   	push   %ebx
80104764:	83 ec 04             	sub    $0x4,%esp
80104767:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010476a:	e8 31 f0 ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz)
8010476f:	39 18                	cmp    %ebx,(%eax)
80104771:	76 29                	jbe    8010479c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104773:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104776:	89 da                	mov    %ebx,%edx
80104778:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010477a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010477c:	39 c3                	cmp    %eax,%ebx
8010477e:	73 1c                	jae    8010479c <fetchstr+0x3c>
    if(*s == 0)
80104780:	80 3b 00             	cmpb   $0x0,(%ebx)
80104783:	75 10                	jne    80104795 <fetchstr+0x35>
80104785:	eb 29                	jmp    801047b0 <fetchstr+0x50>
80104787:	89 f6                	mov    %esi,%esi
80104789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104790:	80 3a 00             	cmpb   $0x0,(%edx)
80104793:	74 1b                	je     801047b0 <fetchstr+0x50>

  if(addr >= curproc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
80104795:	83 c2 01             	add    $0x1,%edx
80104798:	39 d0                	cmp    %edx,%eax
8010479a:	77 f4                	ja     80104790 <fetchstr+0x30>
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
8010479c:	83 c4 04             	add    $0x4,%esp
{
  char *s, *ep;
  struct proc *curproc = myproc();

  if(addr >= curproc->sz)
    return -1;
8010479f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
  }
  return -1;
}
801047a4:	5b                   	pop    %ebx
801047a5:	5d                   	pop    %ebp
801047a6:	c3                   	ret    
801047a7:	89 f6                	mov    %esi,%esi
801047a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801047b0:	83 c4 04             	add    $0x4,%esp
    return -1;
  *pp = (char*)addr;
  ep = (char*)curproc->sz;
  for(s = *pp; s < ep; s++){
    if(*s == 0)
      return s - *pp;
801047b3:	89 d0                	mov    %edx,%eax
801047b5:	29 d8                	sub    %ebx,%eax
  }
  return -1;
}
801047b7:	5b                   	pop    %ebx
801047b8:	5d                   	pop    %ebp
801047b9:	c3                   	ret    
801047ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801047c0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801047c0:	55                   	push   %ebp
801047c1:	89 e5                	mov    %esp,%ebp
801047c3:	56                   	push   %esi
801047c4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047c5:	e8 d6 ef ff ff       	call   801037a0 <myproc>
801047ca:	8b 40 18             	mov    0x18(%eax),%eax
801047cd:	8b 55 08             	mov    0x8(%ebp),%edx
801047d0:	8b 40 44             	mov    0x44(%eax),%eax
801047d3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();
801047d6:	e8 c5 ef ff ff       	call   801037a0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047db:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801047dd:	8d 73 04             	lea    0x4(%ebx),%esi
int
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047e0:	39 c6                	cmp    %eax,%esi
801047e2:	73 1c                	jae    80104800 <argint+0x40>
801047e4:	8d 53 08             	lea    0x8(%ebx),%edx
801047e7:	39 d0                	cmp    %edx,%eax
801047e9:	72 15                	jb     80104800 <argint+0x40>
    return -1;
  *ip = *(int*)(addr);
801047eb:	8b 45 0c             	mov    0xc(%ebp),%eax
801047ee:	8b 53 04             	mov    0x4(%ebx),%edx
801047f1:	89 10                	mov    %edx,(%eax)
  return 0;
801047f3:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
}
801047f5:	5b                   	pop    %ebx
801047f6:	5e                   	pop    %esi
801047f7:	5d                   	pop    %ebp
801047f8:	c3                   	ret    
801047f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
fetchint(uint addr, int *ip)
{
  struct proc *curproc = myproc();

  if(addr >= curproc->sz || addr+4 > curproc->sz)
    return -1;
80104800:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104805:	eb ee                	jmp    801047f5 <argint+0x35>
80104807:	89 f6                	mov    %esi,%esi
80104809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104810 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104810:	55                   	push   %ebp
80104811:	89 e5                	mov    %esp,%ebp
80104813:	56                   	push   %esi
80104814:	53                   	push   %ebx
80104815:	83 ec 10             	sub    $0x10,%esp
80104818:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
8010481b:	e8 80 ef ff ff       	call   801037a0 <myproc>
80104820:	89 c6                	mov    %eax,%esi
 
  if(argint(n, &i) < 0)
80104822:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104825:	83 ec 08             	sub    $0x8,%esp
80104828:	50                   	push   %eax
80104829:	ff 75 08             	pushl  0x8(%ebp)
8010482c:	e8 8f ff ff ff       	call   801047c0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104831:	c1 e8 1f             	shr    $0x1f,%eax
80104834:	83 c4 10             	add    $0x10,%esp
80104837:	84 c0                	test   %al,%al
80104839:	75 2d                	jne    80104868 <argptr+0x58>
8010483b:	89 d8                	mov    %ebx,%eax
8010483d:	c1 e8 1f             	shr    $0x1f,%eax
80104840:	84 c0                	test   %al,%al
80104842:	75 24                	jne    80104868 <argptr+0x58>
80104844:	8b 16                	mov    (%esi),%edx
80104846:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104849:	39 c2                	cmp    %eax,%edx
8010484b:	76 1b                	jbe    80104868 <argptr+0x58>
8010484d:	01 c3                	add    %eax,%ebx
8010484f:	39 da                	cmp    %ebx,%edx
80104851:	72 15                	jb     80104868 <argptr+0x58>
    return -1;
  *pp = (char*)i;
80104853:	8b 55 0c             	mov    0xc(%ebp),%edx
80104856:	89 02                	mov    %eax,(%edx)
  return 0;
80104858:	31 c0                	xor    %eax,%eax
}
8010485a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010485d:	5b                   	pop    %ebx
8010485e:	5e                   	pop    %esi
8010485f:	5d                   	pop    %ebp
80104860:	c3                   	ret    
80104861:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct proc *curproc = myproc();
 
  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
    return -1;
80104868:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010486d:	eb eb                	jmp    8010485a <argptr+0x4a>
8010486f:	90                   	nop

80104870 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104870:	55                   	push   %ebp
80104871:	89 e5                	mov    %esp,%ebp
80104873:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104876:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104879:	50                   	push   %eax
8010487a:	ff 75 08             	pushl  0x8(%ebp)
8010487d:	e8 3e ff ff ff       	call   801047c0 <argint>
80104882:	83 c4 10             	add    $0x10,%esp
80104885:	85 c0                	test   %eax,%eax
80104887:	78 17                	js     801048a0 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104889:	83 ec 08             	sub    $0x8,%esp
8010488c:	ff 75 0c             	pushl  0xc(%ebp)
8010488f:	ff 75 f4             	pushl  -0xc(%ebp)
80104892:	e8 c9 fe ff ff       	call   80104760 <fetchstr>
80104897:	83 c4 10             	add    $0x10,%esp
}
8010489a:	c9                   	leave  
8010489b:	c3                   	ret    
8010489c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
801048a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
801048a5:	c9                   	leave  
801048a6:	c3                   	ret    
801048a7:	89 f6                	mov    %esi,%esi
801048a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048b0 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	56                   	push   %esi
801048b4:	53                   	push   %ebx
  int num;
  struct proc *curproc = myproc();
801048b5:	e8 e6 ee ff ff       	call   801037a0 <myproc>

  num = curproc->tf->eax;
801048ba:	8b 70 18             	mov    0x18(%eax),%esi

void
syscall(void)
{
  int num;
  struct proc *curproc = myproc();
801048bd:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
801048bf:	8b 46 1c             	mov    0x1c(%esi),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801048c2:	8d 50 ff             	lea    -0x1(%eax),%edx
801048c5:	83 fa 14             	cmp    $0x14,%edx
801048c8:	77 1e                	ja     801048e8 <syscall+0x38>
801048ca:	8b 14 85 40 76 10 80 	mov    -0x7fef89c0(,%eax,4),%edx
801048d1:	85 d2                	test   %edx,%edx
801048d3:	74 13                	je     801048e8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
801048d5:	ff d2                	call   *%edx
801048d7:	89 46 1c             	mov    %eax,0x1c(%esi)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
801048da:	8d 65 f8             	lea    -0x8(%ebp),%esp
801048dd:	5b                   	pop    %ebx
801048de:	5e                   	pop    %esi
801048df:	5d                   	pop    %ebp
801048e0:	c3                   	ret    
801048e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801048e8:	50                   	push   %eax
            curproc->pid, curproc->name, num);
801048e9:	8d 43 6c             	lea    0x6c(%ebx),%eax

  num = curproc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    curproc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
801048ec:	50                   	push   %eax
801048ed:	ff 73 10             	pushl  0x10(%ebx)
801048f0:	68 11 76 10 80       	push   $0x80107611
801048f5:	e8 66 bd ff ff       	call   80100660 <cprintf>
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
801048fa:	8b 43 18             	mov    0x18(%ebx),%eax
801048fd:	83 c4 10             	add    $0x10,%esp
80104900:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104907:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010490a:	5b                   	pop    %ebx
8010490b:	5e                   	pop    %esi
8010490c:	5d                   	pop    %ebp
8010490d:	c3                   	ret    
8010490e:	66 90                	xchg   %ax,%ax

80104910 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	57                   	push   %edi
80104914:	56                   	push   %esi
80104915:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104916:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104919:	83 ec 44             	sub    $0x44,%esp
8010491c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
8010491f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104922:	56                   	push   %esi
80104923:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104924:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104927:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
8010492a:	e8 b1 d5 ff ff       	call   80101ee0 <nameiparent>
8010492f:	83 c4 10             	add    $0x10,%esp
80104932:	85 c0                	test   %eax,%eax
80104934:	0f 84 f6 00 00 00    	je     80104a30 <create+0x120>
    return 0;
  ilock(dp);
8010493a:	83 ec 0c             	sub    $0xc,%esp
8010493d:	89 c7                	mov    %eax,%edi
8010493f:	50                   	push   %eax
80104940:	e8 2b cd ff ff       	call   80101670 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104945:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104948:	83 c4 0c             	add    $0xc,%esp
8010494b:	50                   	push   %eax
8010494c:	56                   	push   %esi
8010494d:	57                   	push   %edi
8010494e:	e8 4d d2 ff ff       	call   80101ba0 <dirlookup>
80104953:	83 c4 10             	add    $0x10,%esp
80104956:	85 c0                	test   %eax,%eax
80104958:	89 c3                	mov    %eax,%ebx
8010495a:	74 54                	je     801049b0 <create+0xa0>
    iunlockput(dp);
8010495c:	83 ec 0c             	sub    $0xc,%esp
8010495f:	57                   	push   %edi
80104960:	e8 9b cf ff ff       	call   80101900 <iunlockput>
    ilock(ip);
80104965:	89 1c 24             	mov    %ebx,(%esp)
80104968:	e8 03 cd ff ff       	call   80101670 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
8010496d:	83 c4 10             	add    $0x10,%esp
80104970:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104975:	75 19                	jne    80104990 <create+0x80>
80104977:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010497c:	89 d8                	mov    %ebx,%eax
8010497e:	75 10                	jne    80104990 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104980:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104983:	5b                   	pop    %ebx
80104984:	5e                   	pop    %esi
80104985:	5f                   	pop    %edi
80104986:	5d                   	pop    %ebp
80104987:	c3                   	ret    
80104988:	90                   	nop
80104989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104990:	83 ec 0c             	sub    $0xc,%esp
80104993:	53                   	push   %ebx
80104994:	e8 67 cf ff ff       	call   80101900 <iunlockput>
    return 0;
80104999:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
8010499c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
8010499f:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
801049a1:	5b                   	pop    %ebx
801049a2:	5e                   	pop    %esi
801049a3:	5f                   	pop    %edi
801049a4:	5d                   	pop    %ebp
801049a5:	c3                   	ret    
801049a6:	8d 76 00             	lea    0x0(%esi),%esi
801049a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
801049b0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
801049b4:	83 ec 08             	sub    $0x8,%esp
801049b7:	50                   	push   %eax
801049b8:	ff 37                	pushl  (%edi)
801049ba:	e8 41 cb ff ff       	call   80101500 <ialloc>
801049bf:	83 c4 10             	add    $0x10,%esp
801049c2:	85 c0                	test   %eax,%eax
801049c4:	89 c3                	mov    %eax,%ebx
801049c6:	0f 84 cc 00 00 00    	je     80104a98 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
801049cc:	83 ec 0c             	sub    $0xc,%esp
801049cf:	50                   	push   %eax
801049d0:	e8 9b cc ff ff       	call   80101670 <ilock>
  ip->major = major;
801049d5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
801049d9:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
801049dd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
801049e1:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
801049e5:	b8 01 00 00 00       	mov    $0x1,%eax
801049ea:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
801049ee:	89 1c 24             	mov    %ebx,(%esp)
801049f1:	e8 ca cb ff ff       	call   801015c0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
801049f6:	83 c4 10             	add    $0x10,%esp
801049f9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
801049fe:	74 40                	je     80104a40 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104a00:	83 ec 04             	sub    $0x4,%esp
80104a03:	ff 73 04             	pushl  0x4(%ebx)
80104a06:	56                   	push   %esi
80104a07:	57                   	push   %edi
80104a08:	e8 f3 d3 ff ff       	call   80101e00 <dirlink>
80104a0d:	83 c4 10             	add    $0x10,%esp
80104a10:	85 c0                	test   %eax,%eax
80104a12:	78 77                	js     80104a8b <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104a14:	83 ec 0c             	sub    $0xc,%esp
80104a17:	57                   	push   %edi
80104a18:	e8 e3 ce ff ff       	call   80101900 <iunlockput>

  return ip;
80104a1d:	83 c4 10             	add    $0x10,%esp
}
80104a20:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104a23:	89 d8                	mov    %ebx,%eax
}
80104a25:	5b                   	pop    %ebx
80104a26:	5e                   	pop    %esi
80104a27:	5f                   	pop    %edi
80104a28:	5d                   	pop    %ebp
80104a29:	c3                   	ret    
80104a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104a30:	31 c0                	xor    %eax,%eax
80104a32:	e9 49 ff ff ff       	jmp    80104980 <create+0x70>
80104a37:	89 f6                	mov    %esi,%esi
80104a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104a40:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104a45:	83 ec 0c             	sub    $0xc,%esp
80104a48:	57                   	push   %edi
80104a49:	e8 72 cb ff ff       	call   801015c0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104a4e:	83 c4 0c             	add    $0xc,%esp
80104a51:	ff 73 04             	pushl  0x4(%ebx)
80104a54:	68 b4 76 10 80       	push   $0x801076b4
80104a59:	53                   	push   %ebx
80104a5a:	e8 a1 d3 ff ff       	call   80101e00 <dirlink>
80104a5f:	83 c4 10             	add    $0x10,%esp
80104a62:	85 c0                	test   %eax,%eax
80104a64:	78 18                	js     80104a7e <create+0x16e>
80104a66:	83 ec 04             	sub    $0x4,%esp
80104a69:	ff 77 04             	pushl  0x4(%edi)
80104a6c:	68 b3 76 10 80       	push   $0x801076b3
80104a71:	53                   	push   %ebx
80104a72:	e8 89 d3 ff ff       	call   80101e00 <dirlink>
80104a77:	83 c4 10             	add    $0x10,%esp
80104a7a:	85 c0                	test   %eax,%eax
80104a7c:	79 82                	jns    80104a00 <create+0xf0>
      panic("create dots");
80104a7e:	83 ec 0c             	sub    $0xc,%esp
80104a81:	68 a7 76 10 80       	push   $0x801076a7
80104a86:	e8 e5 b8 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104a8b:	83 ec 0c             	sub    $0xc,%esp
80104a8e:	68 b6 76 10 80       	push   $0x801076b6
80104a93:	e8 d8 b8 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104a98:	83 ec 0c             	sub    $0xc,%esp
80104a9b:	68 98 76 10 80       	push   $0x80107698
80104aa0:	e8 cb b8 ff ff       	call   80100370 <panic>
80104aa5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ab0 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104ab0:	55                   	push   %ebp
80104ab1:	89 e5                	mov    %esp,%ebp
80104ab3:	56                   	push   %esi
80104ab4:	53                   	push   %ebx
80104ab5:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104ab7:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104aba:	89 d3                	mov    %edx,%ebx
80104abc:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104abf:	50                   	push   %eax
80104ac0:	6a 00                	push   $0x0
80104ac2:	e8 f9 fc ff ff       	call   801047c0 <argint>
80104ac7:	83 c4 10             	add    $0x10,%esp
80104aca:	85 c0                	test   %eax,%eax
80104acc:	78 32                	js     80104b00 <argfd.constprop.0+0x50>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
80104ace:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104ad2:	77 2c                	ja     80104b00 <argfd.constprop.0+0x50>
80104ad4:	e8 c7 ec ff ff       	call   801037a0 <myproc>
80104ad9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104adc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104ae0:	85 c0                	test   %eax,%eax
80104ae2:	74 1c                	je     80104b00 <argfd.constprop.0+0x50>
    return -1;
  if(pfd)
80104ae4:	85 f6                	test   %esi,%esi
80104ae6:	74 02                	je     80104aea <argfd.constprop.0+0x3a>
    *pfd = fd;
80104ae8:	89 16                	mov    %edx,(%esi)
  if(pf)
80104aea:	85 db                	test   %ebx,%ebx
80104aec:	74 22                	je     80104b10 <argfd.constprop.0+0x60>
    *pf = f;
80104aee:	89 03                	mov    %eax,(%ebx)
  return 0;
80104af0:	31 c0                	xor    %eax,%eax
}
80104af2:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104af5:	5b                   	pop    %ebx
80104af6:	5e                   	pop    %esi
80104af7:	5d                   	pop    %ebp
80104af8:	c3                   	ret    
80104af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b00:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104b03:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
}
80104b08:	5b                   	pop    %ebx
80104b09:	5e                   	pop    %esi
80104b0a:	5d                   	pop    %ebp
80104b0b:	c3                   	ret    
80104b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104b10:	31 c0                	xor    %eax,%eax
80104b12:	eb de                	jmp    80104af2 <argfd.constprop.0+0x42>
80104b14:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b1a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104b20 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104b20:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104b21:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104b23:	89 e5                	mov    %esp,%ebp
80104b25:	56                   	push   %esi
80104b26:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104b27:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104b2a:	83 ec 10             	sub    $0x10,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104b2d:	e8 7e ff ff ff       	call   80104ab0 <argfd.constprop.0>
80104b32:	85 c0                	test   %eax,%eax
80104b34:	78 1a                	js     80104b50 <sys_dup+0x30>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104b36:	31 db                	xor    %ebx,%ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
80104b38:	8b 75 f4             	mov    -0xc(%ebp),%esi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80104b3b:	e8 60 ec ff ff       	call   801037a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80104b40:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104b44:	85 d2                	test   %edx,%edx
80104b46:	74 18                	je     80104b60 <sys_dup+0x40>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80104b48:	83 c3 01             	add    $0x1,%ebx
80104b4b:	83 fb 10             	cmp    $0x10,%ebx
80104b4e:	75 f0                	jne    80104b40 <sys_dup+0x20>
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104b50:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104b53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104b58:	5b                   	pop    %ebx
80104b59:	5e                   	pop    %esi
80104b5a:	5d                   	pop    %ebp
80104b5b:	c3                   	ret    
80104b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80104b60:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104b64:	83 ec 0c             	sub    $0xc,%esp
80104b67:	ff 75 f4             	pushl  -0xc(%ebp)
80104b6a:	e8 71 c2 ff ff       	call   80100de0 <filedup>
  return fd;
80104b6f:	83 c4 10             	add    $0x10,%esp
}
80104b72:	8d 65 f8             	lea    -0x8(%ebp),%esp
  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
80104b75:	89 d8                	mov    %ebx,%eax
}
80104b77:	5b                   	pop    %ebx
80104b78:	5e                   	pop    %esi
80104b79:	5d                   	pop    %ebp
80104b7a:	c3                   	ret    
80104b7b:	90                   	nop
80104b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b80 <sys_read>:

int
sys_read(void)
{
80104b80:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b81:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104b83:	89 e5                	mov    %esp,%ebp
80104b85:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104b88:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104b8b:	e8 20 ff ff ff       	call   80104ab0 <argfd.constprop.0>
80104b90:	85 c0                	test   %eax,%eax
80104b92:	78 4c                	js     80104be0 <sys_read+0x60>
80104b94:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104b97:	83 ec 08             	sub    $0x8,%esp
80104b9a:	50                   	push   %eax
80104b9b:	6a 02                	push   $0x2
80104b9d:	e8 1e fc ff ff       	call   801047c0 <argint>
80104ba2:	83 c4 10             	add    $0x10,%esp
80104ba5:	85 c0                	test   %eax,%eax
80104ba7:	78 37                	js     80104be0 <sys_read+0x60>
80104ba9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104bac:	83 ec 04             	sub    $0x4,%esp
80104baf:	ff 75 f0             	pushl  -0x10(%ebp)
80104bb2:	50                   	push   %eax
80104bb3:	6a 01                	push   $0x1
80104bb5:	e8 56 fc ff ff       	call   80104810 <argptr>
80104bba:	83 c4 10             	add    $0x10,%esp
80104bbd:	85 c0                	test   %eax,%eax
80104bbf:	78 1f                	js     80104be0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104bc1:	83 ec 04             	sub    $0x4,%esp
80104bc4:	ff 75 f0             	pushl  -0x10(%ebp)
80104bc7:	ff 75 f4             	pushl  -0xc(%ebp)
80104bca:	ff 75 ec             	pushl  -0x14(%ebp)
80104bcd:	e8 7e c3 ff ff       	call   80100f50 <fileread>
80104bd2:	83 c4 10             	add    $0x10,%esp
}
80104bd5:	c9                   	leave  
80104bd6:	c3                   	ret    
80104bd7:	89 f6                	mov    %esi,%esi
80104bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104be0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104be5:	c9                   	leave  
80104be6:	c3                   	ret    
80104be7:	89 f6                	mov    %esi,%esi
80104be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104bf0 <sys_write>:

int
sys_write(void)
{
80104bf0:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104bf1:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104bf3:	89 e5                	mov    %esp,%ebp
80104bf5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104bf8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104bfb:	e8 b0 fe ff ff       	call   80104ab0 <argfd.constprop.0>
80104c00:	85 c0                	test   %eax,%eax
80104c02:	78 4c                	js     80104c50 <sys_write+0x60>
80104c04:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c07:	83 ec 08             	sub    $0x8,%esp
80104c0a:	50                   	push   %eax
80104c0b:	6a 02                	push   $0x2
80104c0d:	e8 ae fb ff ff       	call   801047c0 <argint>
80104c12:	83 c4 10             	add    $0x10,%esp
80104c15:	85 c0                	test   %eax,%eax
80104c17:	78 37                	js     80104c50 <sys_write+0x60>
80104c19:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c1c:	83 ec 04             	sub    $0x4,%esp
80104c1f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c22:	50                   	push   %eax
80104c23:	6a 01                	push   $0x1
80104c25:	e8 e6 fb ff ff       	call   80104810 <argptr>
80104c2a:	83 c4 10             	add    $0x10,%esp
80104c2d:	85 c0                	test   %eax,%eax
80104c2f:	78 1f                	js     80104c50 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104c31:	83 ec 04             	sub    $0x4,%esp
80104c34:	ff 75 f0             	pushl  -0x10(%ebp)
80104c37:	ff 75 f4             	pushl  -0xc(%ebp)
80104c3a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c3d:	e8 9e c3 ff ff       	call   80100fe0 <filewrite>
80104c42:	83 c4 10             	add    $0x10,%esp
}
80104c45:	c9                   	leave  
80104c46:	c3                   	ret    
80104c47:	89 f6                	mov    %esi,%esi
80104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104c50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104c55:	c9                   	leave  
80104c56:	c3                   	ret    
80104c57:	89 f6                	mov    %esi,%esi
80104c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c60 <sys_close>:

int
sys_close(void)
{
80104c60:	55                   	push   %ebp
80104c61:	89 e5                	mov    %esp,%ebp
80104c63:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104c66:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104c69:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c6c:	e8 3f fe ff ff       	call   80104ab0 <argfd.constprop.0>
80104c71:	85 c0                	test   %eax,%eax
80104c73:	78 2b                	js     80104ca0 <sys_close+0x40>
    return -1;
  myproc()->ofile[fd] = 0;
80104c75:	e8 26 eb ff ff       	call   801037a0 <myproc>
80104c7a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  fileclose(f);
80104c7d:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  myproc()->ofile[fd] = 0;
80104c80:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104c87:	00 
  fileclose(f);
80104c88:	ff 75 f4             	pushl  -0xc(%ebp)
80104c8b:	e8 a0 c1 ff ff       	call   80100e30 <fileclose>
  return 0;
80104c90:	83 c4 10             	add    $0x10,%esp
80104c93:	31 c0                	xor    %eax,%eax
}
80104c95:	c9                   	leave  
80104c96:	c3                   	ret    
80104c97:	89 f6                	mov    %esi,%esi
80104c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  myproc()->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104ca5:	c9                   	leave  
80104ca6:	c3                   	ret    
80104ca7:	89 f6                	mov    %esi,%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cb0 <sys_fstat>:

int
sys_fstat(void)
{
80104cb0:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104cb1:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104cb3:	89 e5                	mov    %esp,%ebp
80104cb5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104cb8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104cbb:	e8 f0 fd ff ff       	call   80104ab0 <argfd.constprop.0>
80104cc0:	85 c0                	test   %eax,%eax
80104cc2:	78 2c                	js     80104cf0 <sys_fstat+0x40>
80104cc4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cc7:	83 ec 04             	sub    $0x4,%esp
80104cca:	6a 14                	push   $0x14
80104ccc:	50                   	push   %eax
80104ccd:	6a 01                	push   $0x1
80104ccf:	e8 3c fb ff ff       	call   80104810 <argptr>
80104cd4:	83 c4 10             	add    $0x10,%esp
80104cd7:	85 c0                	test   %eax,%eax
80104cd9:	78 15                	js     80104cf0 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104cdb:	83 ec 08             	sub    $0x8,%esp
80104cde:	ff 75 f4             	pushl  -0xc(%ebp)
80104ce1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ce4:	e8 17 c2 ff ff       	call   80100f00 <filestat>
80104ce9:	83 c4 10             	add    $0x10,%esp
}
80104cec:	c9                   	leave  
80104ced:	c3                   	ret    
80104cee:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104cf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104cf5:	c9                   	leave  
80104cf6:	c3                   	ret    
80104cf7:	89 f6                	mov    %esi,%esi
80104cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d00 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104d00:	55                   	push   %ebp
80104d01:	89 e5                	mov    %esp,%ebp
80104d03:	57                   	push   %edi
80104d04:	56                   	push   %esi
80104d05:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d06:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104d09:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104d0c:	50                   	push   %eax
80104d0d:	6a 00                	push   $0x0
80104d0f:	e8 5c fb ff ff       	call   80104870 <argstr>
80104d14:	83 c4 10             	add    $0x10,%esp
80104d17:	85 c0                	test   %eax,%eax
80104d19:	0f 88 fb 00 00 00    	js     80104e1a <sys_link+0x11a>
80104d1f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104d22:	83 ec 08             	sub    $0x8,%esp
80104d25:	50                   	push   %eax
80104d26:	6a 01                	push   $0x1
80104d28:	e8 43 fb ff ff       	call   80104870 <argstr>
80104d2d:	83 c4 10             	add    $0x10,%esp
80104d30:	85 c0                	test   %eax,%eax
80104d32:	0f 88 e2 00 00 00    	js     80104e1a <sys_link+0x11a>
    return -1;

  begin_op();
80104d38:	e8 13 de ff ff       	call   80102b50 <begin_op>
  if((ip = namei(old)) == 0){
80104d3d:	83 ec 0c             	sub    $0xc,%esp
80104d40:	ff 75 d4             	pushl  -0x2c(%ebp)
80104d43:	e8 78 d1 ff ff       	call   80101ec0 <namei>
80104d48:	83 c4 10             	add    $0x10,%esp
80104d4b:	85 c0                	test   %eax,%eax
80104d4d:	89 c3                	mov    %eax,%ebx
80104d4f:	0f 84 f3 00 00 00    	je     80104e48 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104d55:	83 ec 0c             	sub    $0xc,%esp
80104d58:	50                   	push   %eax
80104d59:	e8 12 c9 ff ff       	call   80101670 <ilock>
  if(ip->type == T_DIR){
80104d5e:	83 c4 10             	add    $0x10,%esp
80104d61:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104d66:	0f 84 c4 00 00 00    	je     80104e30 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104d6c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104d71:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104d74:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104d77:	53                   	push   %ebx
80104d78:	e8 43 c8 ff ff       	call   801015c0 <iupdate>
  iunlock(ip);
80104d7d:	89 1c 24             	mov    %ebx,(%esp)
80104d80:	e8 cb c9 ff ff       	call   80101750 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104d85:	58                   	pop    %eax
80104d86:	5a                   	pop    %edx
80104d87:	57                   	push   %edi
80104d88:	ff 75 d0             	pushl  -0x30(%ebp)
80104d8b:	e8 50 d1 ff ff       	call   80101ee0 <nameiparent>
80104d90:	83 c4 10             	add    $0x10,%esp
80104d93:	85 c0                	test   %eax,%eax
80104d95:	89 c6                	mov    %eax,%esi
80104d97:	74 5b                	je     80104df4 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104d99:	83 ec 0c             	sub    $0xc,%esp
80104d9c:	50                   	push   %eax
80104d9d:	e8 ce c8 ff ff       	call   80101670 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104da2:	83 c4 10             	add    $0x10,%esp
80104da5:	8b 03                	mov    (%ebx),%eax
80104da7:	39 06                	cmp    %eax,(%esi)
80104da9:	75 3d                	jne    80104de8 <sys_link+0xe8>
80104dab:	83 ec 04             	sub    $0x4,%esp
80104dae:	ff 73 04             	pushl  0x4(%ebx)
80104db1:	57                   	push   %edi
80104db2:	56                   	push   %esi
80104db3:	e8 48 d0 ff ff       	call   80101e00 <dirlink>
80104db8:	83 c4 10             	add    $0x10,%esp
80104dbb:	85 c0                	test   %eax,%eax
80104dbd:	78 29                	js     80104de8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104dbf:	83 ec 0c             	sub    $0xc,%esp
80104dc2:	56                   	push   %esi
80104dc3:	e8 38 cb ff ff       	call   80101900 <iunlockput>
  iput(ip);
80104dc8:	89 1c 24             	mov    %ebx,(%esp)
80104dcb:	e8 d0 c9 ff ff       	call   801017a0 <iput>

  end_op();
80104dd0:	e8 eb dd ff ff       	call   80102bc0 <end_op>

  return 0;
80104dd5:	83 c4 10             	add    $0x10,%esp
80104dd8:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104dda:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ddd:	5b                   	pop    %ebx
80104dde:	5e                   	pop    %esi
80104ddf:	5f                   	pop    %edi
80104de0:	5d                   	pop    %ebp
80104de1:	c3                   	ret    
80104de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104de8:	83 ec 0c             	sub    $0xc,%esp
80104deb:	56                   	push   %esi
80104dec:	e8 0f cb ff ff       	call   80101900 <iunlockput>
    goto bad;
80104df1:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80104df4:	83 ec 0c             	sub    $0xc,%esp
80104df7:	53                   	push   %ebx
80104df8:	e8 73 c8 ff ff       	call   80101670 <ilock>
  ip->nlink--;
80104dfd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104e02:	89 1c 24             	mov    %ebx,(%esp)
80104e05:	e8 b6 c7 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
80104e0a:	89 1c 24             	mov    %ebx,(%esp)
80104e0d:	e8 ee ca ff ff       	call   80101900 <iunlockput>
  end_op();
80104e12:	e8 a9 dd ff ff       	call   80102bc0 <end_op>
  return -1;
80104e17:	83 c4 10             	add    $0x10,%esp
}
80104e1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
80104e1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104e22:	5b                   	pop    %ebx
80104e23:	5e                   	pop    %esi
80104e24:	5f                   	pop    %edi
80104e25:	5d                   	pop    %ebp
80104e26:	c3                   	ret    
80104e27:	89 f6                	mov    %esi,%esi
80104e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80104e30:	83 ec 0c             	sub    $0xc,%esp
80104e33:	53                   	push   %ebx
80104e34:	e8 c7 ca ff ff       	call   80101900 <iunlockput>
    end_op();
80104e39:	e8 82 dd ff ff       	call   80102bc0 <end_op>
    return -1;
80104e3e:	83 c4 10             	add    $0x10,%esp
80104e41:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e46:	eb 92                	jmp    80104dda <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80104e48:	e8 73 dd ff ff       	call   80102bc0 <end_op>
    return -1;
80104e4d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104e52:	eb 86                	jmp    80104dda <sys_link+0xda>
80104e54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104e60 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104e60:	55                   	push   %ebp
80104e61:	89 e5                	mov    %esp,%ebp
80104e63:	57                   	push   %edi
80104e64:	56                   	push   %esi
80104e65:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104e66:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80104e69:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80104e6c:	50                   	push   %eax
80104e6d:	6a 00                	push   $0x0
80104e6f:	e8 fc f9 ff ff       	call   80104870 <argstr>
80104e74:	83 c4 10             	add    $0x10,%esp
80104e77:	85 c0                	test   %eax,%eax
80104e79:	0f 88 82 01 00 00    	js     80105001 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
80104e7f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80104e82:	e8 c9 dc ff ff       	call   80102b50 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80104e87:	83 ec 08             	sub    $0x8,%esp
80104e8a:	53                   	push   %ebx
80104e8b:	ff 75 c0             	pushl  -0x40(%ebp)
80104e8e:	e8 4d d0 ff ff       	call   80101ee0 <nameiparent>
80104e93:	83 c4 10             	add    $0x10,%esp
80104e96:	85 c0                	test   %eax,%eax
80104e98:	89 45 b4             	mov    %eax,-0x4c(%ebp)
80104e9b:	0f 84 6a 01 00 00    	je     8010500b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
80104ea1:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80104ea4:	83 ec 0c             	sub    $0xc,%esp
80104ea7:	56                   	push   %esi
80104ea8:	e8 c3 c7 ff ff       	call   80101670 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
80104ead:	58                   	pop    %eax
80104eae:	5a                   	pop    %edx
80104eaf:	68 b4 76 10 80       	push   $0x801076b4
80104eb4:	53                   	push   %ebx
80104eb5:	e8 c6 cc ff ff       	call   80101b80 <namecmp>
80104eba:	83 c4 10             	add    $0x10,%esp
80104ebd:	85 c0                	test   %eax,%eax
80104ebf:	0f 84 fc 00 00 00    	je     80104fc1 <sys_unlink+0x161>
80104ec5:	83 ec 08             	sub    $0x8,%esp
80104ec8:	68 b3 76 10 80       	push   $0x801076b3
80104ecd:	53                   	push   %ebx
80104ece:	e8 ad cc ff ff       	call   80101b80 <namecmp>
80104ed3:	83 c4 10             	add    $0x10,%esp
80104ed6:	85 c0                	test   %eax,%eax
80104ed8:	0f 84 e3 00 00 00    	je     80104fc1 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
80104ede:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104ee1:	83 ec 04             	sub    $0x4,%esp
80104ee4:	50                   	push   %eax
80104ee5:	53                   	push   %ebx
80104ee6:	56                   	push   %esi
80104ee7:	e8 b4 cc ff ff       	call   80101ba0 <dirlookup>
80104eec:	83 c4 10             	add    $0x10,%esp
80104eef:	85 c0                	test   %eax,%eax
80104ef1:	89 c3                	mov    %eax,%ebx
80104ef3:	0f 84 c8 00 00 00    	je     80104fc1 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80104ef9:	83 ec 0c             	sub    $0xc,%esp
80104efc:	50                   	push   %eax
80104efd:	e8 6e c7 ff ff       	call   80101670 <ilock>

  if(ip->nlink < 1)
80104f02:	83 c4 10             	add    $0x10,%esp
80104f05:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104f0a:	0f 8e 24 01 00 00    	jle    80105034 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80104f10:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f15:	8d 75 d8             	lea    -0x28(%ebp),%esi
80104f18:	74 66                	je     80104f80 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
80104f1a:	83 ec 04             	sub    $0x4,%esp
80104f1d:	6a 10                	push   $0x10
80104f1f:	6a 00                	push   $0x0
80104f21:	56                   	push   %esi
80104f22:	e8 89 f5 ff ff       	call   801044b0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f27:	6a 10                	push   $0x10
80104f29:	ff 75 c4             	pushl  -0x3c(%ebp)
80104f2c:	56                   	push   %esi
80104f2d:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f30:	e8 1b cb ff ff       	call   80101a50 <writei>
80104f35:	83 c4 20             	add    $0x20,%esp
80104f38:	83 f8 10             	cmp    $0x10,%eax
80104f3b:	0f 85 e6 00 00 00    	jne    80105027 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80104f41:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f46:	0f 84 9c 00 00 00    	je     80104fe8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
80104f4c:	83 ec 0c             	sub    $0xc,%esp
80104f4f:	ff 75 b4             	pushl  -0x4c(%ebp)
80104f52:	e8 a9 c9 ff ff       	call   80101900 <iunlockput>

  ip->nlink--;
80104f57:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f5c:	89 1c 24             	mov    %ebx,(%esp)
80104f5f:	e8 5c c6 ff ff       	call   801015c0 <iupdate>
  iunlockput(ip);
80104f64:	89 1c 24             	mov    %ebx,(%esp)
80104f67:	e8 94 c9 ff ff       	call   80101900 <iunlockput>

  end_op();
80104f6c:	e8 4f dc ff ff       	call   80102bc0 <end_op>

  return 0;
80104f71:	83 c4 10             	add    $0x10,%esp
80104f74:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80104f76:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104f79:	5b                   	pop    %ebx
80104f7a:	5e                   	pop    %esi
80104f7b:	5f                   	pop    %edi
80104f7c:	5d                   	pop    %ebp
80104f7d:	c3                   	ret    
80104f7e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80104f80:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80104f84:	76 94                	jbe    80104f1a <sys_unlink+0xba>
80104f86:	bf 20 00 00 00       	mov    $0x20,%edi
80104f8b:	eb 0f                	jmp    80104f9c <sys_unlink+0x13c>
80104f8d:	8d 76 00             	lea    0x0(%esi),%esi
80104f90:	83 c7 10             	add    $0x10,%edi
80104f93:	3b 7b 58             	cmp    0x58(%ebx),%edi
80104f96:	0f 83 7e ff ff ff    	jae    80104f1a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80104f9c:	6a 10                	push   $0x10
80104f9e:	57                   	push   %edi
80104f9f:	56                   	push   %esi
80104fa0:	53                   	push   %ebx
80104fa1:	e8 aa c9 ff ff       	call   80101950 <readi>
80104fa6:	83 c4 10             	add    $0x10,%esp
80104fa9:	83 f8 10             	cmp    $0x10,%eax
80104fac:	75 6c                	jne    8010501a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
80104fae:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80104fb3:	74 db                	je     80104f90 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
80104fb5:	83 ec 0c             	sub    $0xc,%esp
80104fb8:	53                   	push   %ebx
80104fb9:	e8 42 c9 ff ff       	call   80101900 <iunlockput>
    goto bad;
80104fbe:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
80104fc1:	83 ec 0c             	sub    $0xc,%esp
80104fc4:	ff 75 b4             	pushl  -0x4c(%ebp)
80104fc7:	e8 34 c9 ff ff       	call   80101900 <iunlockput>
  end_op();
80104fcc:	e8 ef db ff ff       	call   80102bc0 <end_op>
  return -1;
80104fd1:	83 c4 10             	add    $0x10,%esp
}
80104fd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
80104fd7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104fdc:	5b                   	pop    %ebx
80104fdd:	5e                   	pop    %esi
80104fde:	5f                   	pop    %edi
80104fdf:	5d                   	pop    %ebp
80104fe0:	c3                   	ret    
80104fe1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104fe8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
80104feb:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
80104fee:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80104ff3:	50                   	push   %eax
80104ff4:	e8 c7 c5 ff ff       	call   801015c0 <iupdate>
80104ff9:	83 c4 10             	add    $0x10,%esp
80104ffc:	e9 4b ff ff ff       	jmp    80104f4c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80105001:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105006:	e9 6b ff ff ff       	jmp    80104f76 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
8010500b:	e8 b0 db ff ff       	call   80102bc0 <end_op>
    return -1;
80105010:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105015:	e9 5c ff ff ff       	jmp    80104f76 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
8010501a:	83 ec 0c             	sub    $0xc,%esp
8010501d:	68 d8 76 10 80       	push   $0x801076d8
80105022:	e8 49 b3 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80105027:	83 ec 0c             	sub    $0xc,%esp
8010502a:	68 ea 76 10 80       	push   $0x801076ea
8010502f:	e8 3c b3 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80105034:	83 ec 0c             	sub    $0xc,%esp
80105037:	68 c6 76 10 80       	push   $0x801076c6
8010503c:	e8 2f b3 ff ff       	call   80100370 <panic>
80105041:	eb 0d                	jmp    80105050 <sys_open>
80105043:	90                   	nop
80105044:	90                   	nop
80105045:	90                   	nop
80105046:	90                   	nop
80105047:	90                   	nop
80105048:	90                   	nop
80105049:	90                   	nop
8010504a:	90                   	nop
8010504b:	90                   	nop
8010504c:	90                   	nop
8010504d:	90                   	nop
8010504e:	90                   	nop
8010504f:	90                   	nop

80105050 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105050:	55                   	push   %ebp
80105051:	89 e5                	mov    %esp,%ebp
80105053:	57                   	push   %edi
80105054:	56                   	push   %esi
80105055:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105056:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105059:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010505c:	50                   	push   %eax
8010505d:	6a 00                	push   $0x0
8010505f:	e8 0c f8 ff ff       	call   80104870 <argstr>
80105064:	83 c4 10             	add    $0x10,%esp
80105067:	85 c0                	test   %eax,%eax
80105069:	0f 88 9e 00 00 00    	js     8010510d <sys_open+0xbd>
8010506f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105072:	83 ec 08             	sub    $0x8,%esp
80105075:	50                   	push   %eax
80105076:	6a 01                	push   $0x1
80105078:	e8 43 f7 ff ff       	call   801047c0 <argint>
8010507d:	83 c4 10             	add    $0x10,%esp
80105080:	85 c0                	test   %eax,%eax
80105082:	0f 88 85 00 00 00    	js     8010510d <sys_open+0xbd>
    return -1;

  begin_op();
80105088:	e8 c3 da ff ff       	call   80102b50 <begin_op>

  if(omode & O_CREATE){
8010508d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105091:	0f 85 89 00 00 00    	jne    80105120 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
80105097:	83 ec 0c             	sub    $0xc,%esp
8010509a:	ff 75 e0             	pushl  -0x20(%ebp)
8010509d:	e8 1e ce ff ff       	call   80101ec0 <namei>
801050a2:	83 c4 10             	add    $0x10,%esp
801050a5:	85 c0                	test   %eax,%eax
801050a7:	89 c6                	mov    %eax,%esi
801050a9:	0f 84 8e 00 00 00    	je     8010513d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
801050af:	83 ec 0c             	sub    $0xc,%esp
801050b2:	50                   	push   %eax
801050b3:	e8 b8 c5 ff ff       	call   80101670 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801050b8:	83 c4 10             	add    $0x10,%esp
801050bb:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
801050c0:	0f 84 d2 00 00 00    	je     80105198 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801050c6:	e8 a5 bc ff ff       	call   80100d70 <filealloc>
801050cb:	85 c0                	test   %eax,%eax
801050cd:	89 c7                	mov    %eax,%edi
801050cf:	74 2b                	je     801050fc <sys_open+0xac>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801050d1:	31 db                	xor    %ebx,%ebx
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801050d3:	e8 c8 e6 ff ff       	call   801037a0 <myproc>
801050d8:	90                   	nop
801050d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
801050e0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801050e4:	85 d2                	test   %edx,%edx
801050e6:	74 68                	je     80105150 <sys_open+0x100>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801050e8:	83 c3 01             	add    $0x1,%ebx
801050eb:	83 fb 10             	cmp    $0x10,%ebx
801050ee:	75 f0                	jne    801050e0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
801050f0:	83 ec 0c             	sub    $0xc,%esp
801050f3:	57                   	push   %edi
801050f4:	e8 37 bd ff ff       	call   80100e30 <fileclose>
801050f9:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
801050fc:	83 ec 0c             	sub    $0xc,%esp
801050ff:	56                   	push   %esi
80105100:	e8 fb c7 ff ff       	call   80101900 <iunlockput>
    end_op();
80105105:	e8 b6 da ff ff       	call   80102bc0 <end_op>
    return -1;
8010510a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010510d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105110:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105115:	5b                   	pop    %ebx
80105116:	5e                   	pop    %esi
80105117:	5f                   	pop    %edi
80105118:	5d                   	pop    %ebp
80105119:	c3                   	ret    
8010511a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105120:	83 ec 0c             	sub    $0xc,%esp
80105123:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105126:	31 c9                	xor    %ecx,%ecx
80105128:	6a 00                	push   $0x0
8010512a:	ba 02 00 00 00       	mov    $0x2,%edx
8010512f:	e8 dc f7 ff ff       	call   80104910 <create>
    if(ip == 0){
80105134:	83 c4 10             	add    $0x10,%esp
80105137:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105139:	89 c6                	mov    %eax,%esi
    if(ip == 0){
8010513b:	75 89                	jne    801050c6 <sys_open+0x76>
      end_op();
8010513d:	e8 7e da ff ff       	call   80102bc0 <end_op>
      return -1;
80105142:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105147:	eb 43                	jmp    8010518c <sys_open+0x13c>
80105149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105150:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
80105153:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105157:	56                   	push   %esi
80105158:	e8 f3 c5 ff ff       	call   80101750 <iunlock>
  end_op();
8010515d:	e8 5e da ff ff       	call   80102bc0 <end_op>

  f->type = FD_INODE;
80105162:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105168:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010516b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010516e:	89 77 10             	mov    %esi,0x10(%edi)
  f->off = 0;
80105171:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
  f->readable = !(omode & O_WRONLY);
80105178:	89 d0                	mov    %edx,%eax
8010517a:	83 e0 01             	and    $0x1,%eax
8010517d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105180:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105183:	88 47 08             	mov    %al,0x8(%edi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105186:	0f 95 47 09          	setne  0x9(%edi)
  return fd;
8010518a:	89 d8                	mov    %ebx,%eax
}
8010518c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010518f:	5b                   	pop    %ebx
80105190:	5e                   	pop    %esi
80105191:	5f                   	pop    %edi
80105192:	5d                   	pop    %ebp
80105193:	c3                   	ret    
80105194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
80105198:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010519b:	85 c9                	test   %ecx,%ecx
8010519d:	0f 84 23 ff ff ff    	je     801050c6 <sys_open+0x76>
801051a3:	e9 54 ff ff ff       	jmp    801050fc <sys_open+0xac>
801051a8:	90                   	nop
801051a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801051b0 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
801051b0:	55                   	push   %ebp
801051b1:	89 e5                	mov    %esp,%ebp
801051b3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801051b6:	e8 95 d9 ff ff       	call   80102b50 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801051bb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801051be:	83 ec 08             	sub    $0x8,%esp
801051c1:	50                   	push   %eax
801051c2:	6a 00                	push   $0x0
801051c4:	e8 a7 f6 ff ff       	call   80104870 <argstr>
801051c9:	83 c4 10             	add    $0x10,%esp
801051cc:	85 c0                	test   %eax,%eax
801051ce:	78 30                	js     80105200 <sys_mkdir+0x50>
801051d0:	83 ec 0c             	sub    $0xc,%esp
801051d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801051d6:	31 c9                	xor    %ecx,%ecx
801051d8:	6a 00                	push   $0x0
801051da:	ba 01 00 00 00       	mov    $0x1,%edx
801051df:	e8 2c f7 ff ff       	call   80104910 <create>
801051e4:	83 c4 10             	add    $0x10,%esp
801051e7:	85 c0                	test   %eax,%eax
801051e9:	74 15                	je     80105200 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801051eb:	83 ec 0c             	sub    $0xc,%esp
801051ee:	50                   	push   %eax
801051ef:	e8 0c c7 ff ff       	call   80101900 <iunlockput>
  end_op();
801051f4:	e8 c7 d9 ff ff       	call   80102bc0 <end_op>
  return 0;
801051f9:	83 c4 10             	add    $0x10,%esp
801051fc:	31 c0                	xor    %eax,%eax
}
801051fe:	c9                   	leave  
801051ff:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105200:	e8 bb d9 ff ff       	call   80102bc0 <end_op>
    return -1;
80105205:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010520a:	c9                   	leave  
8010520b:	c3                   	ret    
8010520c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105210 <sys_mknod>:

int
sys_mknod(void)
{
80105210:	55                   	push   %ebp
80105211:	89 e5                	mov    %esp,%ebp
80105213:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105216:	e8 35 d9 ff ff       	call   80102b50 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010521b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010521e:	83 ec 08             	sub    $0x8,%esp
80105221:	50                   	push   %eax
80105222:	6a 00                	push   $0x0
80105224:	e8 47 f6 ff ff       	call   80104870 <argstr>
80105229:	83 c4 10             	add    $0x10,%esp
8010522c:	85 c0                	test   %eax,%eax
8010522e:	78 60                	js     80105290 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105230:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105233:	83 ec 08             	sub    $0x8,%esp
80105236:	50                   	push   %eax
80105237:	6a 01                	push   $0x1
80105239:	e8 82 f5 ff ff       	call   801047c0 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
8010523e:	83 c4 10             	add    $0x10,%esp
80105241:	85 c0                	test   %eax,%eax
80105243:	78 4b                	js     80105290 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105245:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105248:	83 ec 08             	sub    $0x8,%esp
8010524b:	50                   	push   %eax
8010524c:	6a 02                	push   $0x2
8010524e:	e8 6d f5 ff ff       	call   801047c0 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105253:	83 c4 10             	add    $0x10,%esp
80105256:	85 c0                	test   %eax,%eax
80105258:	78 36                	js     80105290 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
8010525a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010525e:	83 ec 0c             	sub    $0xc,%esp
80105261:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105265:	ba 03 00 00 00       	mov    $0x3,%edx
8010526a:	50                   	push   %eax
8010526b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010526e:	e8 9d f6 ff ff       	call   80104910 <create>
80105273:	83 c4 10             	add    $0x10,%esp
80105276:	85 c0                	test   %eax,%eax
80105278:	74 16                	je     80105290 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010527a:	83 ec 0c             	sub    $0xc,%esp
8010527d:	50                   	push   %eax
8010527e:	e8 7d c6 ff ff       	call   80101900 <iunlockput>
  end_op();
80105283:	e8 38 d9 ff ff       	call   80102bc0 <end_op>
  return 0;
80105288:	83 c4 10             	add    $0x10,%esp
8010528b:	31 c0                	xor    %eax,%eax
}
8010528d:	c9                   	leave  
8010528e:	c3                   	ret    
8010528f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
80105290:	e8 2b d9 ff ff       	call   80102bc0 <end_op>
    return -1;
80105295:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010529a:	c9                   	leave  
8010529b:	c3                   	ret    
8010529c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052a0 <sys_chdir>:

int
sys_chdir(void)
{
801052a0:	55                   	push   %ebp
801052a1:	89 e5                	mov    %esp,%ebp
801052a3:	56                   	push   %esi
801052a4:	53                   	push   %ebx
801052a5:	83 ec 10             	sub    $0x10,%esp
  char *path;
  struct inode *ip;
  struct proc *curproc = myproc();
801052a8:	e8 f3 e4 ff ff       	call   801037a0 <myproc>
801052ad:	89 c6                	mov    %eax,%esi
  
  begin_op();
801052af:	e8 9c d8 ff ff       	call   80102b50 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801052b4:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052b7:	83 ec 08             	sub    $0x8,%esp
801052ba:	50                   	push   %eax
801052bb:	6a 00                	push   $0x0
801052bd:	e8 ae f5 ff ff       	call   80104870 <argstr>
801052c2:	83 c4 10             	add    $0x10,%esp
801052c5:	85 c0                	test   %eax,%eax
801052c7:	78 77                	js     80105340 <sys_chdir+0xa0>
801052c9:	83 ec 0c             	sub    $0xc,%esp
801052cc:	ff 75 f4             	pushl  -0xc(%ebp)
801052cf:	e8 ec cb ff ff       	call   80101ec0 <namei>
801052d4:	83 c4 10             	add    $0x10,%esp
801052d7:	85 c0                	test   %eax,%eax
801052d9:	89 c3                	mov    %eax,%ebx
801052db:	74 63                	je     80105340 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801052dd:	83 ec 0c             	sub    $0xc,%esp
801052e0:	50                   	push   %eax
801052e1:	e8 8a c3 ff ff       	call   80101670 <ilock>
  if(ip->type != T_DIR){
801052e6:	83 c4 10             	add    $0x10,%esp
801052e9:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801052ee:	75 30                	jne    80105320 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801052f0:	83 ec 0c             	sub    $0xc,%esp
801052f3:	53                   	push   %ebx
801052f4:	e8 57 c4 ff ff       	call   80101750 <iunlock>
  iput(curproc->cwd);
801052f9:	58                   	pop    %eax
801052fa:	ff 76 68             	pushl  0x68(%esi)
801052fd:	e8 9e c4 ff ff       	call   801017a0 <iput>
  end_op();
80105302:	e8 b9 d8 ff ff       	call   80102bc0 <end_op>
  curproc->cwd = ip;
80105307:	89 5e 68             	mov    %ebx,0x68(%esi)
  return 0;
8010530a:	83 c4 10             	add    $0x10,%esp
8010530d:	31 c0                	xor    %eax,%eax
}
8010530f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105312:	5b                   	pop    %ebx
80105313:	5e                   	pop    %esi
80105314:	5d                   	pop    %ebp
80105315:	c3                   	ret    
80105316:	8d 76 00             	lea    0x0(%esi),%esi
80105319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105320:	83 ec 0c             	sub    $0xc,%esp
80105323:	53                   	push   %ebx
80105324:	e8 d7 c5 ff ff       	call   80101900 <iunlockput>
    end_op();
80105329:	e8 92 d8 ff ff       	call   80102bc0 <end_op>
    return -1;
8010532e:	83 c4 10             	add    $0x10,%esp
80105331:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105336:	eb d7                	jmp    8010530f <sys_chdir+0x6f>
80105338:	90                   	nop
80105339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct inode *ip;
  struct proc *curproc = myproc();
  
  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105340:	e8 7b d8 ff ff       	call   80102bc0 <end_op>
    return -1;
80105345:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010534a:	eb c3                	jmp    8010530f <sys_chdir+0x6f>
8010534c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105350 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105350:	55                   	push   %ebp
80105351:	89 e5                	mov    %esp,%ebp
80105353:	57                   	push   %edi
80105354:	56                   	push   %esi
80105355:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105356:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010535c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105362:	50                   	push   %eax
80105363:	6a 00                	push   $0x0
80105365:	e8 06 f5 ff ff       	call   80104870 <argstr>
8010536a:	83 c4 10             	add    $0x10,%esp
8010536d:	85 c0                	test   %eax,%eax
8010536f:	78 7f                	js     801053f0 <sys_exec+0xa0>
80105371:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105377:	83 ec 08             	sub    $0x8,%esp
8010537a:	50                   	push   %eax
8010537b:	6a 01                	push   $0x1
8010537d:	e8 3e f4 ff ff       	call   801047c0 <argint>
80105382:	83 c4 10             	add    $0x10,%esp
80105385:	85 c0                	test   %eax,%eax
80105387:	78 67                	js     801053f0 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105389:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010538f:	83 ec 04             	sub    $0x4,%esp
80105392:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105398:	68 80 00 00 00       	push   $0x80
8010539d:	6a 00                	push   $0x0
8010539f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801053a5:	50                   	push   %eax
801053a6:	31 db                	xor    %ebx,%ebx
801053a8:	e8 03 f1 ff ff       	call   801044b0 <memset>
801053ad:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801053b0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801053b6:	83 ec 08             	sub    $0x8,%esp
801053b9:	57                   	push   %edi
801053ba:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801053bd:	50                   	push   %eax
801053be:	e8 5d f3 ff ff       	call   80104720 <fetchint>
801053c3:	83 c4 10             	add    $0x10,%esp
801053c6:	85 c0                	test   %eax,%eax
801053c8:	78 26                	js     801053f0 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
801053ca:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801053d0:	85 c0                	test   %eax,%eax
801053d2:	74 2c                	je     80105400 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801053d4:	83 ec 08             	sub    $0x8,%esp
801053d7:	56                   	push   %esi
801053d8:	50                   	push   %eax
801053d9:	e8 82 f3 ff ff       	call   80104760 <fetchstr>
801053de:	83 c4 10             	add    $0x10,%esp
801053e1:	85 c0                	test   %eax,%eax
801053e3:	78 0b                	js     801053f0 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801053e5:	83 c3 01             	add    $0x1,%ebx
801053e8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801053eb:	83 fb 20             	cmp    $0x20,%ebx
801053ee:	75 c0                	jne    801053b0 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801053f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
801053f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
801053f8:	5b                   	pop    %ebx
801053f9:	5e                   	pop    %esi
801053fa:	5f                   	pop    %edi
801053fb:	5d                   	pop    %ebp
801053fc:	c3                   	ret    
801053fd:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105400:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105406:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105409:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105410:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105414:	50                   	push   %eax
80105415:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010541b:	e8 d0 b5 ff ff       	call   801009f0 <exec>
80105420:	83 c4 10             	add    $0x10,%esp
}
80105423:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105426:	5b                   	pop    %ebx
80105427:	5e                   	pop    %esi
80105428:	5f                   	pop    %edi
80105429:	5d                   	pop    %ebp
8010542a:	c3                   	ret    
8010542b:	90                   	nop
8010542c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105430 <sys_pipe>:

int
sys_pipe(void)
{
80105430:	55                   	push   %ebp
80105431:	89 e5                	mov    %esp,%ebp
80105433:	57                   	push   %edi
80105434:	56                   	push   %esi
80105435:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105436:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105439:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010543c:	6a 08                	push   $0x8
8010543e:	50                   	push   %eax
8010543f:	6a 00                	push   $0x0
80105441:	e8 ca f3 ff ff       	call   80104810 <argptr>
80105446:	83 c4 10             	add    $0x10,%esp
80105449:	85 c0                	test   %eax,%eax
8010544b:	78 4a                	js     80105497 <sys_pipe+0x67>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010544d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105450:	83 ec 08             	sub    $0x8,%esp
80105453:	50                   	push   %eax
80105454:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105457:	50                   	push   %eax
80105458:	e8 93 dd ff ff       	call   801031f0 <pipealloc>
8010545d:	83 c4 10             	add    $0x10,%esp
80105460:	85 c0                	test   %eax,%eax
80105462:	78 33                	js     80105497 <sys_pipe+0x67>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105464:	31 db                	xor    %ebx,%ebx
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105466:	8b 7d e0             	mov    -0x20(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
80105469:	e8 32 e3 ff ff       	call   801037a0 <myproc>
8010546e:	66 90                	xchg   %ax,%ax

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
80105470:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105474:	85 f6                	test   %esi,%esi
80105476:	74 30                	je     801054a8 <sys_pipe+0x78>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
80105478:	83 c3 01             	add    $0x1,%ebx
8010547b:	83 fb 10             	cmp    $0x10,%ebx
8010547e:	75 f0                	jne    80105470 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
80105480:	83 ec 0c             	sub    $0xc,%esp
80105483:	ff 75 e0             	pushl  -0x20(%ebp)
80105486:	e8 a5 b9 ff ff       	call   80100e30 <fileclose>
    fileclose(wf);
8010548b:	58                   	pop    %eax
8010548c:	ff 75 e4             	pushl  -0x1c(%ebp)
8010548f:	e8 9c b9 ff ff       	call   80100e30 <fileclose>
    return -1;
80105494:	83 c4 10             	add    $0x10,%esp
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
80105497:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
8010549a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
}
8010549f:	5b                   	pop    %ebx
801054a0:	5e                   	pop    %esi
801054a1:	5f                   	pop    %edi
801054a2:	5d                   	pop    %ebp
801054a3:	c3                   	ret    
801054a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801054a8:	8d 73 08             	lea    0x8(%ebx),%esi
801054ab:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801054af:	8b 7d e4             	mov    -0x1c(%ebp),%edi
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();
801054b2:	e8 e9 e2 ff ff       	call   801037a0 <myproc>

  for(fd = 0; fd < NOFILE; fd++){
801054b7:	31 d2                	xor    %edx,%edx
801054b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[fd] == 0){
801054c0:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
801054c4:	85 c9                	test   %ecx,%ecx
801054c6:	74 18                	je     801054e0 <sys_pipe+0xb0>
fdalloc(struct file *f)
{
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
801054c8:	83 c2 01             	add    $0x1,%edx
801054cb:	83 fa 10             	cmp    $0x10,%edx
801054ce:	75 f0                	jne    801054c0 <sys_pipe+0x90>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      myproc()->ofile[fd0] = 0;
801054d0:	e8 cb e2 ff ff       	call   801037a0 <myproc>
801054d5:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801054dc:	00 
801054dd:	eb a1                	jmp    80105480 <sys_pipe+0x50>
801054df:	90                   	nop
  int fd;
  struct proc *curproc = myproc();

  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd] == 0){
      curproc->ofile[fd] = f;
801054e0:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
      myproc()->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801054e4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054e7:	89 18                	mov    %ebx,(%eax)
  fd[1] = fd1;
801054e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801054ec:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
}
801054ef:	8d 65 f4             	lea    -0xc(%ebp),%esp
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
  fd[1] = fd1;
  return 0;
801054f2:	31 c0                	xor    %eax,%eax
}
801054f4:	5b                   	pop    %ebx
801054f5:	5e                   	pop    %esi
801054f6:	5f                   	pop    %edi
801054f7:	5d                   	pop    %ebp
801054f8:	c3                   	ret    
801054f9:	66 90                	xchg   %ax,%ax
801054fb:	66 90                	xchg   %ax,%ax
801054fd:	66 90                	xchg   %ax,%ax
801054ff:	90                   	nop

80105500 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105500:	55                   	push   %ebp
80105501:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105503:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105504:	e9 37 e4 ff ff       	jmp    80103940 <fork>
80105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105510 <sys_exit>:
}

int
sys_exit(void)
{
80105510:	55                   	push   %ebp
80105511:	89 e5                	mov    %esp,%ebp
80105513:	83 ec 08             	sub    $0x8,%esp
  exit();
80105516:	e8 e5 e6 ff ff       	call   80103c00 <exit>
  return 0;  // not reached
}
8010551b:	31 c0                	xor    %eax,%eax
8010551d:	c9                   	leave  
8010551e:	c3                   	ret    
8010551f:	90                   	nop

80105520 <sys_wait>:

int
sys_wait(void)
{
80105520:	55                   	push   %ebp
80105521:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105523:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105524:	e9 27 e9 ff ff       	jmp    80103e50 <wait>
80105529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105530 <sys_kill>:
}

int
sys_kill(void)
{
80105530:	55                   	push   %ebp
80105531:	89 e5                	mov    %esp,%ebp
80105533:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105536:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105539:	50                   	push   %eax
8010553a:	6a 00                	push   $0x0
8010553c:	e8 7f f2 ff ff       	call   801047c0 <argint>
80105541:	83 c4 10             	add    $0x10,%esp
80105544:	85 c0                	test   %eax,%eax
80105546:	78 18                	js     80105560 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105548:	83 ec 0c             	sub    $0xc,%esp
8010554b:	ff 75 f4             	pushl  -0xc(%ebp)
8010554e:	e8 4d ea ff ff       	call   80103fa0 <kill>
80105553:	83 c4 10             	add    $0x10,%esp
}
80105556:	c9                   	leave  
80105557:	c3                   	ret    
80105558:	90                   	nop
80105559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105560:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105565:	c9                   	leave  
80105566:	c3                   	ret    
80105567:	89 f6                	mov    %esi,%esi
80105569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105570 <sys_getpid>:

int
sys_getpid(void)
{
80105570:	55                   	push   %ebp
80105571:	89 e5                	mov    %esp,%ebp
80105573:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105576:	e8 25 e2 ff ff       	call   801037a0 <myproc>
8010557b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010557e:	c9                   	leave  
8010557f:	c3                   	ret    

80105580 <sys_sbrk>:

int
sys_sbrk(void)
{
80105580:	55                   	push   %ebp
80105581:	89 e5                	mov    %esp,%ebp
80105583:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105584:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return myproc()->pid;
}

int
sys_sbrk(void)
{
80105587:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010558a:	50                   	push   %eax
8010558b:	6a 00                	push   $0x0
8010558d:	e8 2e f2 ff ff       	call   801047c0 <argint>
80105592:	83 c4 10             	add    $0x10,%esp
80105595:	85 c0                	test   %eax,%eax
80105597:	78 27                	js     801055c0 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105599:	e8 02 e2 ff ff       	call   801037a0 <myproc>
  if(growproc(n) < 0)
8010559e:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
801055a1:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801055a3:	ff 75 f4             	pushl  -0xc(%ebp)
801055a6:	e8 15 e3 ff ff       	call   801038c0 <growproc>
801055ab:	83 c4 10             	add    $0x10,%esp
801055ae:	85 c0                	test   %eax,%eax
801055b0:	78 0e                	js     801055c0 <sys_sbrk+0x40>
    return -1;
  return addr;
801055b2:	89 d8                	mov    %ebx,%eax
}
801055b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801055b7:	c9                   	leave  
801055b8:	c3                   	ret    
801055b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801055c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055c5:	eb ed                	jmp    801055b4 <sys_sbrk+0x34>
801055c7:	89 f6                	mov    %esi,%esi
801055c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801055d0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
801055d3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
801055d7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801055da:	50                   	push   %eax
801055db:	6a 00                	push   $0x0
801055dd:	e8 de f1 ff ff       	call   801047c0 <argint>
801055e2:	83 c4 10             	add    $0x10,%esp
801055e5:	85 c0                	test   %eax,%eax
801055e7:	0f 88 8a 00 00 00    	js     80105677 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801055ed:	83 ec 0c             	sub    $0xc,%esp
801055f0:	68 80 4d 11 80       	push   $0x80114d80
801055f5:	e8 46 ed ff ff       	call   80104340 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801055fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801055fd:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105600:	8b 1d c0 55 11 80    	mov    0x801155c0,%ebx
  while(ticks - ticks0 < n){
80105606:	85 d2                	test   %edx,%edx
80105608:	75 27                	jne    80105631 <sys_sleep+0x61>
8010560a:	eb 54                	jmp    80105660 <sys_sleep+0x90>
8010560c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105610:	83 ec 08             	sub    $0x8,%esp
80105613:	68 80 4d 11 80       	push   $0x80114d80
80105618:	68 c0 55 11 80       	push   $0x801155c0
8010561d:	e8 6e e7 ff ff       	call   80103d90 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105622:	a1 c0 55 11 80       	mov    0x801155c0,%eax
80105627:	83 c4 10             	add    $0x10,%esp
8010562a:	29 d8                	sub    %ebx,%eax
8010562c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010562f:	73 2f                	jae    80105660 <sys_sleep+0x90>
    if(myproc()->killed){
80105631:	e8 6a e1 ff ff       	call   801037a0 <myproc>
80105636:	8b 40 24             	mov    0x24(%eax),%eax
80105639:	85 c0                	test   %eax,%eax
8010563b:	74 d3                	je     80105610 <sys_sleep+0x40>
      release(&tickslock);
8010563d:	83 ec 0c             	sub    $0xc,%esp
80105640:	68 80 4d 11 80       	push   $0x80114d80
80105645:	e8 16 ee ff ff       	call   80104460 <release>
      return -1;
8010564a:	83 c4 10             	add    $0x10,%esp
8010564d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105652:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105655:	c9                   	leave  
80105656:	c3                   	ret    
80105657:	89 f6                	mov    %esi,%esi
80105659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105660:	83 ec 0c             	sub    $0xc,%esp
80105663:	68 80 4d 11 80       	push   $0x80114d80
80105668:	e8 f3 ed ff ff       	call   80104460 <release>
  return 0;
8010566d:	83 c4 10             	add    $0x10,%esp
80105670:	31 c0                	xor    %eax,%eax
}
80105672:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105675:	c9                   	leave  
80105676:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105677:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010567c:	eb d4                	jmp    80105652 <sys_sleep+0x82>
8010567e:	66 90                	xchg   %ax,%ax

80105680 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105680:	55                   	push   %ebp
80105681:	89 e5                	mov    %esp,%ebp
80105683:	53                   	push   %ebx
80105684:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105687:	68 80 4d 11 80       	push   $0x80114d80
8010568c:	e8 af ec ff ff       	call   80104340 <acquire>
  xticks = ticks;
80105691:	8b 1d c0 55 11 80    	mov    0x801155c0,%ebx
  release(&tickslock);
80105697:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
8010569e:	e8 bd ed ff ff       	call   80104460 <release>
  return xticks;
}
801056a3:	89 d8                	mov    %ebx,%eax
801056a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801056a8:	c9                   	leave  
801056a9:	c3                   	ret    

801056aa <alltraps>:
801056aa:	1e                   	push   %ds
801056ab:	06                   	push   %es
801056ac:	0f a0                	push   %fs
801056ae:	0f a8                	push   %gs
801056b0:	60                   	pusha  
801056b1:	66 b8 10 00          	mov    $0x10,%ax
801056b5:	8e d8                	mov    %eax,%ds
801056b7:	8e c0                	mov    %eax,%es
801056b9:	54                   	push   %esp
801056ba:	e8 e1 00 00 00       	call   801057a0 <trap>
801056bf:	83 c4 04             	add    $0x4,%esp

801056c2 <trapret>:
801056c2:	61                   	popa   
801056c3:	0f a9                	pop    %gs
801056c5:	0f a1                	pop    %fs
801056c7:	07                   	pop    %es
801056c8:	1f                   	pop    %ds
801056c9:	83 c4 08             	add    $0x8,%esp
801056cc:	cf                   	iret   
801056cd:	66 90                	xchg   %ax,%ax
801056cf:	90                   	nop

801056d0 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
801056d0:	31 c0                	xor    %eax,%eax
801056d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
801056d8:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
801056df:	b9 08 00 00 00       	mov    $0x8,%ecx
801056e4:	c6 04 c5 c4 4d 11 80 	movb   $0x0,-0x7feeb23c(,%eax,8)
801056eb:	00 
801056ec:	66 89 0c c5 c2 4d 11 	mov    %cx,-0x7feeb23e(,%eax,8)
801056f3:	80 
801056f4:	c6 04 c5 c5 4d 11 80 	movb   $0x8e,-0x7feeb23b(,%eax,8)
801056fb:	8e 
801056fc:	66 89 14 c5 c0 4d 11 	mov    %dx,-0x7feeb240(,%eax,8)
80105703:	80 
80105704:	c1 ea 10             	shr    $0x10,%edx
80105707:	66 89 14 c5 c6 4d 11 	mov    %dx,-0x7feeb23a(,%eax,8)
8010570e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
8010570f:	83 c0 01             	add    $0x1,%eax
80105712:	3d 00 01 00 00       	cmp    $0x100,%eax
80105717:	75 bf                	jne    801056d8 <tvinit+0x8>
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
80105719:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
8010571a:	ba 08 00 00 00       	mov    $0x8,%edx
struct spinlock tickslock;
uint ticks;

void
tvinit(void)
{
8010571f:	89 e5                	mov    %esp,%ebp
80105721:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105724:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105729:	68 f9 76 10 80       	push   $0x801076f9
8010572e:	68 80 4d 11 80       	push   $0x80114d80
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105733:	66 89 15 c2 4f 11 80 	mov    %dx,0x80114fc2
8010573a:	c6 05 c4 4f 11 80 00 	movb   $0x0,0x80114fc4
80105741:	66 a3 c0 4f 11 80    	mov    %ax,0x80114fc0
80105747:	c1 e8 10             	shr    $0x10,%eax
8010574a:	c6 05 c5 4f 11 80 ef 	movb   $0xef,0x80114fc5
80105751:	66 a3 c6 4f 11 80    	mov    %ax,0x80114fc6

  initlock(&tickslock, "time");
80105757:	e8 e4 ea ff ff       	call   80104240 <initlock>
}
8010575c:	83 c4 10             	add    $0x10,%esp
8010575f:	c9                   	leave  
80105760:	c3                   	ret    
80105761:	eb 0d                	jmp    80105770 <idtinit>
80105763:	90                   	nop
80105764:	90                   	nop
80105765:	90                   	nop
80105766:	90                   	nop
80105767:	90                   	nop
80105768:	90                   	nop
80105769:	90                   	nop
8010576a:	90                   	nop
8010576b:	90                   	nop
8010576c:	90                   	nop
8010576d:	90                   	nop
8010576e:	90                   	nop
8010576f:	90                   	nop

80105770 <idtinit>:

void
idtinit(void)
{
80105770:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105771:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105776:	89 e5                	mov    %esp,%ebp
80105778:	83 ec 10             	sub    $0x10,%esp
8010577b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
8010577f:	b8 c0 4d 11 80       	mov    $0x80114dc0,%eax
80105784:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105788:	c1 e8 10             	shr    $0x10,%eax
8010578b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
8010578f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105792:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105795:	c9                   	leave  
80105796:	c3                   	ret    
80105797:	89 f6                	mov    %esi,%esi
80105799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057a0 <trap>:

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
801057a0:	55                   	push   %ebp
801057a1:	89 e5                	mov    %esp,%ebp
801057a3:	57                   	push   %edi
801057a4:	56                   	push   %esi
801057a5:	53                   	push   %ebx
801057a6:	83 ec 1c             	sub    $0x1c,%esp
801057a9:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(tf->trapno == T_SYSCALL){
801057ac:	8b 47 30             	mov    0x30(%edi),%eax
801057af:	83 f8 40             	cmp    $0x40,%eax
801057b2:	0f 84 88 01 00 00    	je     80105940 <trap+0x1a0>
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
801057b8:	83 e8 20             	sub    $0x20,%eax
801057bb:	83 f8 1f             	cmp    $0x1f,%eax
801057be:	77 10                	ja     801057d0 <trap+0x30>
801057c0:	ff 24 85 a0 77 10 80 	jmp    *-0x7fef8860(,%eax,4)
801057c7:	89 f6                	mov    %esi,%esi
801057c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
801057d0:	e8 cb df ff ff       	call   801037a0 <myproc>
801057d5:	85 c0                	test   %eax,%eax
801057d7:	0f 84 d7 01 00 00    	je     801059b4 <trap+0x214>
801057dd:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
801057e1:	0f 84 cd 01 00 00    	je     801059b4 <trap+0x214>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
801057e7:	0f 20 d1             	mov    %cr2,%ecx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
801057ea:	8b 57 38             	mov    0x38(%edi),%edx
801057ed:	89 4d d8             	mov    %ecx,-0x28(%ebp)
801057f0:	89 55 dc             	mov    %edx,-0x24(%ebp)
801057f3:	e8 88 df ff ff       	call   80103780 <cpuid>
801057f8:	8b 77 34             	mov    0x34(%edi),%esi
801057fb:	8b 5f 30             	mov    0x30(%edi),%ebx
801057fe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105801:	e8 9a df ff ff       	call   801037a0 <myproc>
80105806:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105809:	e8 92 df ff ff       	call   801037a0 <myproc>
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
8010580e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105811:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105814:	51                   	push   %ecx
80105815:	52                   	push   %edx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
80105816:	8b 55 e0             	mov    -0x20(%ebp),%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105819:	ff 75 e4             	pushl  -0x1c(%ebp)
8010581c:	56                   	push   %esi
8010581d:	53                   	push   %ebx
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
8010581e:	83 c2 6c             	add    $0x6c,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105821:	52                   	push   %edx
80105822:	ff 70 10             	pushl  0x10(%eax)
80105825:	68 5c 77 10 80       	push   $0x8010775c
8010582a:	e8 31 ae ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
8010582f:	83 c4 20             	add    $0x20,%esp
80105832:	e8 69 df ff ff       	call   801037a0 <myproc>
80105837:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010583e:	66 90                	xchg   %ax,%ax
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105840:	e8 5b df ff ff       	call   801037a0 <myproc>
80105845:	85 c0                	test   %eax,%eax
80105847:	74 0c                	je     80105855 <trap+0xb5>
80105849:	e8 52 df ff ff       	call   801037a0 <myproc>
8010584e:	8b 50 24             	mov    0x24(%eax),%edx
80105851:	85 d2                	test   %edx,%edx
80105853:	75 4b                	jne    801058a0 <trap+0x100>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
80105855:	e8 46 df ff ff       	call   801037a0 <myproc>
8010585a:	85 c0                	test   %eax,%eax
8010585c:	74 0b                	je     80105869 <trap+0xc9>
8010585e:	e8 3d df ff ff       	call   801037a0 <myproc>
80105863:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105867:	74 4f                	je     801058b8 <trap+0x118>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
80105869:	e8 32 df ff ff       	call   801037a0 <myproc>
8010586e:	85 c0                	test   %eax,%eax
80105870:	74 1d                	je     8010588f <trap+0xef>
80105872:	e8 29 df ff ff       	call   801037a0 <myproc>
80105877:	8b 40 24             	mov    0x24(%eax),%eax
8010587a:	85 c0                	test   %eax,%eax
8010587c:	74 11                	je     8010588f <trap+0xef>
8010587e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105882:	83 e0 03             	and    $0x3,%eax
80105885:	66 83 f8 03          	cmp    $0x3,%ax
80105889:	0f 84 da 00 00 00    	je     80105969 <trap+0x1c9>
    exit();
}
8010588f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105892:	5b                   	pop    %ebx
80105893:	5e                   	pop    %esi
80105894:	5f                   	pop    %edi
80105895:	5d                   	pop    %ebp
80105896:	c3                   	ret    
80105897:	89 f6                	mov    %esi,%esi
80105899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
801058a0:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801058a4:	83 e0 03             	and    $0x3,%eax
801058a7:	66 83 f8 03          	cmp    $0x3,%ax
801058ab:	75 a8                	jne    80105855 <trap+0xb5>
    exit();
801058ad:	e8 4e e3 ff ff       	call   80103c00 <exit>
801058b2:	eb a1                	jmp    80105855 <trap+0xb5>
801058b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(myproc() && myproc()->state == RUNNING &&
801058b8:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
801058bc:	75 ab                	jne    80105869 <trap+0xc9>
     tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();
801058be:	e8 7d e4 ff ff       	call   80103d40 <yield>
801058c3:	eb a4                	jmp    80105869 <trap+0xc9>
801058c5:	8d 76 00             	lea    0x0(%esi),%esi
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
801058c8:	e8 b3 de ff ff       	call   80103780 <cpuid>
801058cd:	85 c0                	test   %eax,%eax
801058cf:	0f 84 ab 00 00 00    	je     80105980 <trap+0x1e0>
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
801058d5:	e8 36 ce ff ff       	call   80102710 <lapiceoi>
    break;
801058da:	e9 61 ff ff ff       	jmp    80105840 <trap+0xa0>
801058df:	90                   	nop
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
801058e0:	e8 eb cc ff ff       	call   801025d0 <kbdintr>
    lapiceoi();
801058e5:	e8 26 ce ff ff       	call   80102710 <lapiceoi>
    break;
801058ea:	e9 51 ff ff ff       	jmp    80105840 <trap+0xa0>
801058ef:	90                   	nop
  case T_IRQ0 + IRQ_COM1:
    uartintr();
801058f0:	e8 5b 02 00 00       	call   80105b50 <uartintr>
    lapiceoi();
801058f5:	e8 16 ce ff ff       	call   80102710 <lapiceoi>
    break;
801058fa:	e9 41 ff ff ff       	jmp    80105840 <trap+0xa0>
801058ff:	90                   	nop
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105900:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105904:	8b 77 38             	mov    0x38(%edi),%esi
80105907:	e8 74 de ff ff       	call   80103780 <cpuid>
8010590c:	56                   	push   %esi
8010590d:	53                   	push   %ebx
8010590e:	50                   	push   %eax
8010590f:	68 04 77 10 80       	push   $0x80107704
80105914:	e8 47 ad ff ff       	call   80100660 <cprintf>
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
80105919:	e8 f2 cd ff ff       	call   80102710 <lapiceoi>
    break;
8010591e:	83 c4 10             	add    $0x10,%esp
80105921:	e9 1a ff ff ff       	jmp    80105840 <trap+0xa0>
80105926:	8d 76 00             	lea    0x0(%esi),%esi
80105929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105930:	e8 1b c7 ff ff       	call   80102050 <ideintr>
80105935:	eb 9e                	jmp    801058d5 <trap+0x135>
80105937:	89 f6                	mov    %esi,%esi
80105939:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
80105940:	e8 5b de ff ff       	call   801037a0 <myproc>
80105945:	8b 58 24             	mov    0x24(%eax),%ebx
80105948:	85 db                	test   %ebx,%ebx
8010594a:	75 2c                	jne    80105978 <trap+0x1d8>
      exit();
    myproc()->tf = tf;
8010594c:	e8 4f de ff ff       	call   801037a0 <myproc>
80105951:	89 78 18             	mov    %edi,0x18(%eax)
    syscall();
80105954:	e8 57 ef ff ff       	call   801048b0 <syscall>
    if(myproc()->killed)
80105959:	e8 42 de ff ff       	call   801037a0 <myproc>
8010595e:	8b 48 24             	mov    0x24(%eax),%ecx
80105961:	85 c9                	test   %ecx,%ecx
80105963:	0f 84 26 ff ff ff    	je     8010588f <trap+0xef>
    yield();

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105969:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010596c:	5b                   	pop    %ebx
8010596d:	5e                   	pop    %esi
8010596e:	5f                   	pop    %edi
8010596f:	5d                   	pop    %ebp
    if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
80105970:	e9 8b e2 ff ff       	jmp    80103c00 <exit>
80105975:	8d 76 00             	lea    0x0(%esi),%esi
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(myproc()->killed)
      exit();
80105978:	e8 83 e2 ff ff       	call   80103c00 <exit>
8010597d:	eb cd                	jmp    8010594c <trap+0x1ac>
8010597f:	90                   	nop
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
80105980:	83 ec 0c             	sub    $0xc,%esp
80105983:	68 80 4d 11 80       	push   $0x80114d80
80105988:	e8 b3 e9 ff ff       	call   80104340 <acquire>
      ticks++;
      wakeup(&ticks);
8010598d:	c7 04 24 c0 55 11 80 	movl   $0x801155c0,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
80105994:	83 05 c0 55 11 80 01 	addl   $0x1,0x801155c0
      wakeup(&ticks);
8010599b:	e8 a0 e5 ff ff       	call   80103f40 <wakeup>
      release(&tickslock);
801059a0:	c7 04 24 80 4d 11 80 	movl   $0x80114d80,(%esp)
801059a7:	e8 b4 ea ff ff       	call   80104460 <release>
801059ac:	83 c4 10             	add    $0x10,%esp
801059af:	e9 21 ff ff ff       	jmp    801058d5 <trap+0x135>
801059b4:	0f 20 d6             	mov    %cr2,%esi

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
801059b7:	8b 5f 38             	mov    0x38(%edi),%ebx
801059ba:	e8 c1 dd ff ff       	call   80103780 <cpuid>
801059bf:	83 ec 0c             	sub    $0xc,%esp
801059c2:	56                   	push   %esi
801059c3:	53                   	push   %ebx
801059c4:	50                   	push   %eax
801059c5:	ff 77 30             	pushl  0x30(%edi)
801059c8:	68 28 77 10 80       	push   $0x80107728
801059cd:	e8 8e ac ff ff       	call   80100660 <cprintf>
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
801059d2:	83 c4 14             	add    $0x14,%esp
801059d5:	68 fe 76 10 80       	push   $0x801076fe
801059da:	e8 91 a9 ff ff       	call   80100370 <panic>
801059df:	90                   	nop

801059e0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
801059e0:	a1 c4 a5 10 80       	mov    0x8010a5c4,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
801059e5:	55                   	push   %ebp
801059e6:	89 e5                	mov    %esp,%ebp
  if(!uart)
801059e8:	85 c0                	test   %eax,%eax
801059ea:	74 1c                	je     80105a08 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801059ec:	ba fd 03 00 00       	mov    $0x3fd,%edx
801059f1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
801059f2:	a8 01                	test   $0x1,%al
801059f4:	74 12                	je     80105a08 <uartgetc+0x28>
801059f6:	ba f8 03 00 00       	mov    $0x3f8,%edx
801059fb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
801059fc:	0f b6 c0             	movzbl %al,%eax
}
801059ff:	5d                   	pop    %ebp
80105a00:	c3                   	ret    
80105a01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105a08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105a0d:	5d                   	pop    %ebp
80105a0e:	c3                   	ret    
80105a0f:	90                   	nop

80105a10 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105a10:	55                   	push   %ebp
80105a11:	89 e5                	mov    %esp,%ebp
80105a13:	57                   	push   %edi
80105a14:	56                   	push   %esi
80105a15:	53                   	push   %ebx
80105a16:	89 c7                	mov    %eax,%edi
80105a18:	bb 80 00 00 00       	mov    $0x80,%ebx
80105a1d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105a22:	83 ec 0c             	sub    $0xc,%esp
80105a25:	eb 1b                	jmp    80105a42 <uartputc.part.0+0x32>
80105a27:	89 f6                	mov    %esi,%esi
80105a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105a30:	83 ec 0c             	sub    $0xc,%esp
80105a33:	6a 0a                	push   $0xa
80105a35:	e8 f6 cc ff ff       	call   80102730 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105a3a:	83 c4 10             	add    $0x10,%esp
80105a3d:	83 eb 01             	sub    $0x1,%ebx
80105a40:	74 07                	je     80105a49 <uartputc.part.0+0x39>
80105a42:	89 f2                	mov    %esi,%edx
80105a44:	ec                   	in     (%dx),%al
80105a45:	a8 20                	test   $0x20,%al
80105a47:	74 e7                	je     80105a30 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105a49:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a4e:	89 f8                	mov    %edi,%eax
80105a50:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a54:	5b                   	pop    %ebx
80105a55:	5e                   	pop    %esi
80105a56:	5f                   	pop    %edi
80105a57:	5d                   	pop    %ebp
80105a58:	c3                   	ret    
80105a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105a60 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105a60:	55                   	push   %ebp
80105a61:	31 c9                	xor    %ecx,%ecx
80105a63:	89 c8                	mov    %ecx,%eax
80105a65:	89 e5                	mov    %esp,%ebp
80105a67:	57                   	push   %edi
80105a68:	56                   	push   %esi
80105a69:	53                   	push   %ebx
80105a6a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105a6f:	89 da                	mov    %ebx,%edx
80105a71:	83 ec 0c             	sub    $0xc,%esp
80105a74:	ee                   	out    %al,(%dx)
80105a75:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105a7a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105a7f:	89 fa                	mov    %edi,%edx
80105a81:	ee                   	out    %al,(%dx)
80105a82:	b8 0c 00 00 00       	mov    $0xc,%eax
80105a87:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105a8c:	ee                   	out    %al,(%dx)
80105a8d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105a92:	89 c8                	mov    %ecx,%eax
80105a94:	89 f2                	mov    %esi,%edx
80105a96:	ee                   	out    %al,(%dx)
80105a97:	b8 03 00 00 00       	mov    $0x3,%eax
80105a9c:	89 fa                	mov    %edi,%edx
80105a9e:	ee                   	out    %al,(%dx)
80105a9f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105aa4:	89 c8                	mov    %ecx,%eax
80105aa6:	ee                   	out    %al,(%dx)
80105aa7:	b8 01 00 00 00       	mov    $0x1,%eax
80105aac:	89 f2                	mov    %esi,%edx
80105aae:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105aaf:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ab4:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105ab5:	3c ff                	cmp    $0xff,%al
80105ab7:	74 5a                	je     80105b13 <uartinit+0xb3>
    return;
  uart = 1;
80105ab9:	c7 05 c4 a5 10 80 01 	movl   $0x1,0x8010a5c4
80105ac0:	00 00 00 
80105ac3:	89 da                	mov    %ebx,%edx
80105ac5:	ec                   	in     (%dx),%al
80105ac6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105acb:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);
80105acc:	83 ec 08             	sub    $0x8,%esp
80105acf:	bb 20 78 10 80       	mov    $0x80107820,%ebx
80105ad4:	6a 00                	push   $0x0
80105ad6:	6a 04                	push   $0x4
80105ad8:	e8 c3 c7 ff ff       	call   801022a0 <ioapicenable>
80105add:	83 c4 10             	add    $0x10,%esp
80105ae0:	b8 78 00 00 00       	mov    $0x78,%eax
80105ae5:	eb 13                	jmp    80105afa <uartinit+0x9a>
80105ae7:	89 f6                	mov    %esi,%esi
80105ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105af0:	83 c3 01             	add    $0x1,%ebx
80105af3:	0f be 03             	movsbl (%ebx),%eax
80105af6:	84 c0                	test   %al,%al
80105af8:	74 19                	je     80105b13 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105afa:	8b 15 c4 a5 10 80    	mov    0x8010a5c4,%edx
80105b00:	85 d2                	test   %edx,%edx
80105b02:	74 ec                	je     80105af0 <uartinit+0x90>
  inb(COM1+2);
  inb(COM1+0);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105b04:	83 c3 01             	add    $0x1,%ebx
80105b07:	e8 04 ff ff ff       	call   80105a10 <uartputc.part.0>
80105b0c:	0f be 03             	movsbl (%ebx),%eax
80105b0f:	84 c0                	test   %al,%al
80105b11:	75 e7                	jne    80105afa <uartinit+0x9a>
    uartputc(*p);
}
80105b13:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b16:	5b                   	pop    %ebx
80105b17:	5e                   	pop    %esi
80105b18:	5f                   	pop    %edi
80105b19:	5d                   	pop    %ebp
80105b1a:	c3                   	ret    
80105b1b:	90                   	nop
80105b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b20 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80105b20:	8b 15 c4 a5 10 80    	mov    0x8010a5c4,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105b26:	55                   	push   %ebp
80105b27:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80105b29:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80105b2b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
80105b2e:	74 10                	je     80105b40 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80105b30:	5d                   	pop    %ebp
80105b31:	e9 da fe ff ff       	jmp    80105a10 <uartputc.part.0>
80105b36:	8d 76 00             	lea    0x0(%esi),%esi
80105b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105b40:	5d                   	pop    %ebp
80105b41:	c3                   	ret    
80105b42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105b50 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80105b50:	55                   	push   %ebp
80105b51:	89 e5                	mov    %esp,%ebp
80105b53:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80105b56:	68 e0 59 10 80       	push   $0x801059e0
80105b5b:	e8 90 ac ff ff       	call   801007f0 <consoleintr>
}
80105b60:	83 c4 10             	add    $0x10,%esp
80105b63:	c9                   	leave  
80105b64:	c3                   	ret    

80105b65 <vector0>:
80105b65:	6a 00                	push   $0x0
80105b67:	6a 00                	push   $0x0
80105b69:	e9 3c fb ff ff       	jmp    801056aa <alltraps>

80105b6e <vector1>:
80105b6e:	6a 00                	push   $0x0
80105b70:	6a 01                	push   $0x1
80105b72:	e9 33 fb ff ff       	jmp    801056aa <alltraps>

80105b77 <vector2>:
80105b77:	6a 00                	push   $0x0
80105b79:	6a 02                	push   $0x2
80105b7b:	e9 2a fb ff ff       	jmp    801056aa <alltraps>

80105b80 <vector3>:
80105b80:	6a 00                	push   $0x0
80105b82:	6a 03                	push   $0x3
80105b84:	e9 21 fb ff ff       	jmp    801056aa <alltraps>

80105b89 <vector4>:
80105b89:	6a 00                	push   $0x0
80105b8b:	6a 04                	push   $0x4
80105b8d:	e9 18 fb ff ff       	jmp    801056aa <alltraps>

80105b92 <vector5>:
80105b92:	6a 00                	push   $0x0
80105b94:	6a 05                	push   $0x5
80105b96:	e9 0f fb ff ff       	jmp    801056aa <alltraps>

80105b9b <vector6>:
80105b9b:	6a 00                	push   $0x0
80105b9d:	6a 06                	push   $0x6
80105b9f:	e9 06 fb ff ff       	jmp    801056aa <alltraps>

80105ba4 <vector7>:
80105ba4:	6a 00                	push   $0x0
80105ba6:	6a 07                	push   $0x7
80105ba8:	e9 fd fa ff ff       	jmp    801056aa <alltraps>

80105bad <vector8>:
80105bad:	6a 08                	push   $0x8
80105baf:	e9 f6 fa ff ff       	jmp    801056aa <alltraps>

80105bb4 <vector9>:
80105bb4:	6a 00                	push   $0x0
80105bb6:	6a 09                	push   $0x9
80105bb8:	e9 ed fa ff ff       	jmp    801056aa <alltraps>

80105bbd <vector10>:
80105bbd:	6a 0a                	push   $0xa
80105bbf:	e9 e6 fa ff ff       	jmp    801056aa <alltraps>

80105bc4 <vector11>:
80105bc4:	6a 0b                	push   $0xb
80105bc6:	e9 df fa ff ff       	jmp    801056aa <alltraps>

80105bcb <vector12>:
80105bcb:	6a 0c                	push   $0xc
80105bcd:	e9 d8 fa ff ff       	jmp    801056aa <alltraps>

80105bd2 <vector13>:
80105bd2:	6a 0d                	push   $0xd
80105bd4:	e9 d1 fa ff ff       	jmp    801056aa <alltraps>

80105bd9 <vector14>:
80105bd9:	6a 0e                	push   $0xe
80105bdb:	e9 ca fa ff ff       	jmp    801056aa <alltraps>

80105be0 <vector15>:
80105be0:	6a 00                	push   $0x0
80105be2:	6a 0f                	push   $0xf
80105be4:	e9 c1 fa ff ff       	jmp    801056aa <alltraps>

80105be9 <vector16>:
80105be9:	6a 00                	push   $0x0
80105beb:	6a 10                	push   $0x10
80105bed:	e9 b8 fa ff ff       	jmp    801056aa <alltraps>

80105bf2 <vector17>:
80105bf2:	6a 11                	push   $0x11
80105bf4:	e9 b1 fa ff ff       	jmp    801056aa <alltraps>

80105bf9 <vector18>:
80105bf9:	6a 00                	push   $0x0
80105bfb:	6a 12                	push   $0x12
80105bfd:	e9 a8 fa ff ff       	jmp    801056aa <alltraps>

80105c02 <vector19>:
80105c02:	6a 00                	push   $0x0
80105c04:	6a 13                	push   $0x13
80105c06:	e9 9f fa ff ff       	jmp    801056aa <alltraps>

80105c0b <vector20>:
80105c0b:	6a 00                	push   $0x0
80105c0d:	6a 14                	push   $0x14
80105c0f:	e9 96 fa ff ff       	jmp    801056aa <alltraps>

80105c14 <vector21>:
80105c14:	6a 00                	push   $0x0
80105c16:	6a 15                	push   $0x15
80105c18:	e9 8d fa ff ff       	jmp    801056aa <alltraps>

80105c1d <vector22>:
80105c1d:	6a 00                	push   $0x0
80105c1f:	6a 16                	push   $0x16
80105c21:	e9 84 fa ff ff       	jmp    801056aa <alltraps>

80105c26 <vector23>:
80105c26:	6a 00                	push   $0x0
80105c28:	6a 17                	push   $0x17
80105c2a:	e9 7b fa ff ff       	jmp    801056aa <alltraps>

80105c2f <vector24>:
80105c2f:	6a 00                	push   $0x0
80105c31:	6a 18                	push   $0x18
80105c33:	e9 72 fa ff ff       	jmp    801056aa <alltraps>

80105c38 <vector25>:
80105c38:	6a 00                	push   $0x0
80105c3a:	6a 19                	push   $0x19
80105c3c:	e9 69 fa ff ff       	jmp    801056aa <alltraps>

80105c41 <vector26>:
80105c41:	6a 00                	push   $0x0
80105c43:	6a 1a                	push   $0x1a
80105c45:	e9 60 fa ff ff       	jmp    801056aa <alltraps>

80105c4a <vector27>:
80105c4a:	6a 00                	push   $0x0
80105c4c:	6a 1b                	push   $0x1b
80105c4e:	e9 57 fa ff ff       	jmp    801056aa <alltraps>

80105c53 <vector28>:
80105c53:	6a 00                	push   $0x0
80105c55:	6a 1c                	push   $0x1c
80105c57:	e9 4e fa ff ff       	jmp    801056aa <alltraps>

80105c5c <vector29>:
80105c5c:	6a 00                	push   $0x0
80105c5e:	6a 1d                	push   $0x1d
80105c60:	e9 45 fa ff ff       	jmp    801056aa <alltraps>

80105c65 <vector30>:
80105c65:	6a 00                	push   $0x0
80105c67:	6a 1e                	push   $0x1e
80105c69:	e9 3c fa ff ff       	jmp    801056aa <alltraps>

80105c6e <vector31>:
80105c6e:	6a 00                	push   $0x0
80105c70:	6a 1f                	push   $0x1f
80105c72:	e9 33 fa ff ff       	jmp    801056aa <alltraps>

80105c77 <vector32>:
80105c77:	6a 00                	push   $0x0
80105c79:	6a 20                	push   $0x20
80105c7b:	e9 2a fa ff ff       	jmp    801056aa <alltraps>

80105c80 <vector33>:
80105c80:	6a 00                	push   $0x0
80105c82:	6a 21                	push   $0x21
80105c84:	e9 21 fa ff ff       	jmp    801056aa <alltraps>

80105c89 <vector34>:
80105c89:	6a 00                	push   $0x0
80105c8b:	6a 22                	push   $0x22
80105c8d:	e9 18 fa ff ff       	jmp    801056aa <alltraps>

80105c92 <vector35>:
80105c92:	6a 00                	push   $0x0
80105c94:	6a 23                	push   $0x23
80105c96:	e9 0f fa ff ff       	jmp    801056aa <alltraps>

80105c9b <vector36>:
80105c9b:	6a 00                	push   $0x0
80105c9d:	6a 24                	push   $0x24
80105c9f:	e9 06 fa ff ff       	jmp    801056aa <alltraps>

80105ca4 <vector37>:
80105ca4:	6a 00                	push   $0x0
80105ca6:	6a 25                	push   $0x25
80105ca8:	e9 fd f9 ff ff       	jmp    801056aa <alltraps>

80105cad <vector38>:
80105cad:	6a 00                	push   $0x0
80105caf:	6a 26                	push   $0x26
80105cb1:	e9 f4 f9 ff ff       	jmp    801056aa <alltraps>

80105cb6 <vector39>:
80105cb6:	6a 00                	push   $0x0
80105cb8:	6a 27                	push   $0x27
80105cba:	e9 eb f9 ff ff       	jmp    801056aa <alltraps>

80105cbf <vector40>:
80105cbf:	6a 00                	push   $0x0
80105cc1:	6a 28                	push   $0x28
80105cc3:	e9 e2 f9 ff ff       	jmp    801056aa <alltraps>

80105cc8 <vector41>:
80105cc8:	6a 00                	push   $0x0
80105cca:	6a 29                	push   $0x29
80105ccc:	e9 d9 f9 ff ff       	jmp    801056aa <alltraps>

80105cd1 <vector42>:
80105cd1:	6a 00                	push   $0x0
80105cd3:	6a 2a                	push   $0x2a
80105cd5:	e9 d0 f9 ff ff       	jmp    801056aa <alltraps>

80105cda <vector43>:
80105cda:	6a 00                	push   $0x0
80105cdc:	6a 2b                	push   $0x2b
80105cde:	e9 c7 f9 ff ff       	jmp    801056aa <alltraps>

80105ce3 <vector44>:
80105ce3:	6a 00                	push   $0x0
80105ce5:	6a 2c                	push   $0x2c
80105ce7:	e9 be f9 ff ff       	jmp    801056aa <alltraps>

80105cec <vector45>:
80105cec:	6a 00                	push   $0x0
80105cee:	6a 2d                	push   $0x2d
80105cf0:	e9 b5 f9 ff ff       	jmp    801056aa <alltraps>

80105cf5 <vector46>:
80105cf5:	6a 00                	push   $0x0
80105cf7:	6a 2e                	push   $0x2e
80105cf9:	e9 ac f9 ff ff       	jmp    801056aa <alltraps>

80105cfe <vector47>:
80105cfe:	6a 00                	push   $0x0
80105d00:	6a 2f                	push   $0x2f
80105d02:	e9 a3 f9 ff ff       	jmp    801056aa <alltraps>

80105d07 <vector48>:
80105d07:	6a 00                	push   $0x0
80105d09:	6a 30                	push   $0x30
80105d0b:	e9 9a f9 ff ff       	jmp    801056aa <alltraps>

80105d10 <vector49>:
80105d10:	6a 00                	push   $0x0
80105d12:	6a 31                	push   $0x31
80105d14:	e9 91 f9 ff ff       	jmp    801056aa <alltraps>

80105d19 <vector50>:
80105d19:	6a 00                	push   $0x0
80105d1b:	6a 32                	push   $0x32
80105d1d:	e9 88 f9 ff ff       	jmp    801056aa <alltraps>

80105d22 <vector51>:
80105d22:	6a 00                	push   $0x0
80105d24:	6a 33                	push   $0x33
80105d26:	e9 7f f9 ff ff       	jmp    801056aa <alltraps>

80105d2b <vector52>:
80105d2b:	6a 00                	push   $0x0
80105d2d:	6a 34                	push   $0x34
80105d2f:	e9 76 f9 ff ff       	jmp    801056aa <alltraps>

80105d34 <vector53>:
80105d34:	6a 00                	push   $0x0
80105d36:	6a 35                	push   $0x35
80105d38:	e9 6d f9 ff ff       	jmp    801056aa <alltraps>

80105d3d <vector54>:
80105d3d:	6a 00                	push   $0x0
80105d3f:	6a 36                	push   $0x36
80105d41:	e9 64 f9 ff ff       	jmp    801056aa <alltraps>

80105d46 <vector55>:
80105d46:	6a 00                	push   $0x0
80105d48:	6a 37                	push   $0x37
80105d4a:	e9 5b f9 ff ff       	jmp    801056aa <alltraps>

80105d4f <vector56>:
80105d4f:	6a 00                	push   $0x0
80105d51:	6a 38                	push   $0x38
80105d53:	e9 52 f9 ff ff       	jmp    801056aa <alltraps>

80105d58 <vector57>:
80105d58:	6a 00                	push   $0x0
80105d5a:	6a 39                	push   $0x39
80105d5c:	e9 49 f9 ff ff       	jmp    801056aa <alltraps>

80105d61 <vector58>:
80105d61:	6a 00                	push   $0x0
80105d63:	6a 3a                	push   $0x3a
80105d65:	e9 40 f9 ff ff       	jmp    801056aa <alltraps>

80105d6a <vector59>:
80105d6a:	6a 00                	push   $0x0
80105d6c:	6a 3b                	push   $0x3b
80105d6e:	e9 37 f9 ff ff       	jmp    801056aa <alltraps>

80105d73 <vector60>:
80105d73:	6a 00                	push   $0x0
80105d75:	6a 3c                	push   $0x3c
80105d77:	e9 2e f9 ff ff       	jmp    801056aa <alltraps>

80105d7c <vector61>:
80105d7c:	6a 00                	push   $0x0
80105d7e:	6a 3d                	push   $0x3d
80105d80:	e9 25 f9 ff ff       	jmp    801056aa <alltraps>

80105d85 <vector62>:
80105d85:	6a 00                	push   $0x0
80105d87:	6a 3e                	push   $0x3e
80105d89:	e9 1c f9 ff ff       	jmp    801056aa <alltraps>

80105d8e <vector63>:
80105d8e:	6a 00                	push   $0x0
80105d90:	6a 3f                	push   $0x3f
80105d92:	e9 13 f9 ff ff       	jmp    801056aa <alltraps>

80105d97 <vector64>:
80105d97:	6a 00                	push   $0x0
80105d99:	6a 40                	push   $0x40
80105d9b:	e9 0a f9 ff ff       	jmp    801056aa <alltraps>

80105da0 <vector65>:
80105da0:	6a 00                	push   $0x0
80105da2:	6a 41                	push   $0x41
80105da4:	e9 01 f9 ff ff       	jmp    801056aa <alltraps>

80105da9 <vector66>:
80105da9:	6a 00                	push   $0x0
80105dab:	6a 42                	push   $0x42
80105dad:	e9 f8 f8 ff ff       	jmp    801056aa <alltraps>

80105db2 <vector67>:
80105db2:	6a 00                	push   $0x0
80105db4:	6a 43                	push   $0x43
80105db6:	e9 ef f8 ff ff       	jmp    801056aa <alltraps>

80105dbb <vector68>:
80105dbb:	6a 00                	push   $0x0
80105dbd:	6a 44                	push   $0x44
80105dbf:	e9 e6 f8 ff ff       	jmp    801056aa <alltraps>

80105dc4 <vector69>:
80105dc4:	6a 00                	push   $0x0
80105dc6:	6a 45                	push   $0x45
80105dc8:	e9 dd f8 ff ff       	jmp    801056aa <alltraps>

80105dcd <vector70>:
80105dcd:	6a 00                	push   $0x0
80105dcf:	6a 46                	push   $0x46
80105dd1:	e9 d4 f8 ff ff       	jmp    801056aa <alltraps>

80105dd6 <vector71>:
80105dd6:	6a 00                	push   $0x0
80105dd8:	6a 47                	push   $0x47
80105dda:	e9 cb f8 ff ff       	jmp    801056aa <alltraps>

80105ddf <vector72>:
80105ddf:	6a 00                	push   $0x0
80105de1:	6a 48                	push   $0x48
80105de3:	e9 c2 f8 ff ff       	jmp    801056aa <alltraps>

80105de8 <vector73>:
80105de8:	6a 00                	push   $0x0
80105dea:	6a 49                	push   $0x49
80105dec:	e9 b9 f8 ff ff       	jmp    801056aa <alltraps>

80105df1 <vector74>:
80105df1:	6a 00                	push   $0x0
80105df3:	6a 4a                	push   $0x4a
80105df5:	e9 b0 f8 ff ff       	jmp    801056aa <alltraps>

80105dfa <vector75>:
80105dfa:	6a 00                	push   $0x0
80105dfc:	6a 4b                	push   $0x4b
80105dfe:	e9 a7 f8 ff ff       	jmp    801056aa <alltraps>

80105e03 <vector76>:
80105e03:	6a 00                	push   $0x0
80105e05:	6a 4c                	push   $0x4c
80105e07:	e9 9e f8 ff ff       	jmp    801056aa <alltraps>

80105e0c <vector77>:
80105e0c:	6a 00                	push   $0x0
80105e0e:	6a 4d                	push   $0x4d
80105e10:	e9 95 f8 ff ff       	jmp    801056aa <alltraps>

80105e15 <vector78>:
80105e15:	6a 00                	push   $0x0
80105e17:	6a 4e                	push   $0x4e
80105e19:	e9 8c f8 ff ff       	jmp    801056aa <alltraps>

80105e1e <vector79>:
80105e1e:	6a 00                	push   $0x0
80105e20:	6a 4f                	push   $0x4f
80105e22:	e9 83 f8 ff ff       	jmp    801056aa <alltraps>

80105e27 <vector80>:
80105e27:	6a 00                	push   $0x0
80105e29:	6a 50                	push   $0x50
80105e2b:	e9 7a f8 ff ff       	jmp    801056aa <alltraps>

80105e30 <vector81>:
80105e30:	6a 00                	push   $0x0
80105e32:	6a 51                	push   $0x51
80105e34:	e9 71 f8 ff ff       	jmp    801056aa <alltraps>

80105e39 <vector82>:
80105e39:	6a 00                	push   $0x0
80105e3b:	6a 52                	push   $0x52
80105e3d:	e9 68 f8 ff ff       	jmp    801056aa <alltraps>

80105e42 <vector83>:
80105e42:	6a 00                	push   $0x0
80105e44:	6a 53                	push   $0x53
80105e46:	e9 5f f8 ff ff       	jmp    801056aa <alltraps>

80105e4b <vector84>:
80105e4b:	6a 00                	push   $0x0
80105e4d:	6a 54                	push   $0x54
80105e4f:	e9 56 f8 ff ff       	jmp    801056aa <alltraps>

80105e54 <vector85>:
80105e54:	6a 00                	push   $0x0
80105e56:	6a 55                	push   $0x55
80105e58:	e9 4d f8 ff ff       	jmp    801056aa <alltraps>

80105e5d <vector86>:
80105e5d:	6a 00                	push   $0x0
80105e5f:	6a 56                	push   $0x56
80105e61:	e9 44 f8 ff ff       	jmp    801056aa <alltraps>

80105e66 <vector87>:
80105e66:	6a 00                	push   $0x0
80105e68:	6a 57                	push   $0x57
80105e6a:	e9 3b f8 ff ff       	jmp    801056aa <alltraps>

80105e6f <vector88>:
80105e6f:	6a 00                	push   $0x0
80105e71:	6a 58                	push   $0x58
80105e73:	e9 32 f8 ff ff       	jmp    801056aa <alltraps>

80105e78 <vector89>:
80105e78:	6a 00                	push   $0x0
80105e7a:	6a 59                	push   $0x59
80105e7c:	e9 29 f8 ff ff       	jmp    801056aa <alltraps>

80105e81 <vector90>:
80105e81:	6a 00                	push   $0x0
80105e83:	6a 5a                	push   $0x5a
80105e85:	e9 20 f8 ff ff       	jmp    801056aa <alltraps>

80105e8a <vector91>:
80105e8a:	6a 00                	push   $0x0
80105e8c:	6a 5b                	push   $0x5b
80105e8e:	e9 17 f8 ff ff       	jmp    801056aa <alltraps>

80105e93 <vector92>:
80105e93:	6a 00                	push   $0x0
80105e95:	6a 5c                	push   $0x5c
80105e97:	e9 0e f8 ff ff       	jmp    801056aa <alltraps>

80105e9c <vector93>:
80105e9c:	6a 00                	push   $0x0
80105e9e:	6a 5d                	push   $0x5d
80105ea0:	e9 05 f8 ff ff       	jmp    801056aa <alltraps>

80105ea5 <vector94>:
80105ea5:	6a 00                	push   $0x0
80105ea7:	6a 5e                	push   $0x5e
80105ea9:	e9 fc f7 ff ff       	jmp    801056aa <alltraps>

80105eae <vector95>:
80105eae:	6a 00                	push   $0x0
80105eb0:	6a 5f                	push   $0x5f
80105eb2:	e9 f3 f7 ff ff       	jmp    801056aa <alltraps>

80105eb7 <vector96>:
80105eb7:	6a 00                	push   $0x0
80105eb9:	6a 60                	push   $0x60
80105ebb:	e9 ea f7 ff ff       	jmp    801056aa <alltraps>

80105ec0 <vector97>:
80105ec0:	6a 00                	push   $0x0
80105ec2:	6a 61                	push   $0x61
80105ec4:	e9 e1 f7 ff ff       	jmp    801056aa <alltraps>

80105ec9 <vector98>:
80105ec9:	6a 00                	push   $0x0
80105ecb:	6a 62                	push   $0x62
80105ecd:	e9 d8 f7 ff ff       	jmp    801056aa <alltraps>

80105ed2 <vector99>:
80105ed2:	6a 00                	push   $0x0
80105ed4:	6a 63                	push   $0x63
80105ed6:	e9 cf f7 ff ff       	jmp    801056aa <alltraps>

80105edb <vector100>:
80105edb:	6a 00                	push   $0x0
80105edd:	6a 64                	push   $0x64
80105edf:	e9 c6 f7 ff ff       	jmp    801056aa <alltraps>

80105ee4 <vector101>:
80105ee4:	6a 00                	push   $0x0
80105ee6:	6a 65                	push   $0x65
80105ee8:	e9 bd f7 ff ff       	jmp    801056aa <alltraps>

80105eed <vector102>:
80105eed:	6a 00                	push   $0x0
80105eef:	6a 66                	push   $0x66
80105ef1:	e9 b4 f7 ff ff       	jmp    801056aa <alltraps>

80105ef6 <vector103>:
80105ef6:	6a 00                	push   $0x0
80105ef8:	6a 67                	push   $0x67
80105efa:	e9 ab f7 ff ff       	jmp    801056aa <alltraps>

80105eff <vector104>:
80105eff:	6a 00                	push   $0x0
80105f01:	6a 68                	push   $0x68
80105f03:	e9 a2 f7 ff ff       	jmp    801056aa <alltraps>

80105f08 <vector105>:
80105f08:	6a 00                	push   $0x0
80105f0a:	6a 69                	push   $0x69
80105f0c:	e9 99 f7 ff ff       	jmp    801056aa <alltraps>

80105f11 <vector106>:
80105f11:	6a 00                	push   $0x0
80105f13:	6a 6a                	push   $0x6a
80105f15:	e9 90 f7 ff ff       	jmp    801056aa <alltraps>

80105f1a <vector107>:
80105f1a:	6a 00                	push   $0x0
80105f1c:	6a 6b                	push   $0x6b
80105f1e:	e9 87 f7 ff ff       	jmp    801056aa <alltraps>

80105f23 <vector108>:
80105f23:	6a 00                	push   $0x0
80105f25:	6a 6c                	push   $0x6c
80105f27:	e9 7e f7 ff ff       	jmp    801056aa <alltraps>

80105f2c <vector109>:
80105f2c:	6a 00                	push   $0x0
80105f2e:	6a 6d                	push   $0x6d
80105f30:	e9 75 f7 ff ff       	jmp    801056aa <alltraps>

80105f35 <vector110>:
80105f35:	6a 00                	push   $0x0
80105f37:	6a 6e                	push   $0x6e
80105f39:	e9 6c f7 ff ff       	jmp    801056aa <alltraps>

80105f3e <vector111>:
80105f3e:	6a 00                	push   $0x0
80105f40:	6a 6f                	push   $0x6f
80105f42:	e9 63 f7 ff ff       	jmp    801056aa <alltraps>

80105f47 <vector112>:
80105f47:	6a 00                	push   $0x0
80105f49:	6a 70                	push   $0x70
80105f4b:	e9 5a f7 ff ff       	jmp    801056aa <alltraps>

80105f50 <vector113>:
80105f50:	6a 00                	push   $0x0
80105f52:	6a 71                	push   $0x71
80105f54:	e9 51 f7 ff ff       	jmp    801056aa <alltraps>

80105f59 <vector114>:
80105f59:	6a 00                	push   $0x0
80105f5b:	6a 72                	push   $0x72
80105f5d:	e9 48 f7 ff ff       	jmp    801056aa <alltraps>

80105f62 <vector115>:
80105f62:	6a 00                	push   $0x0
80105f64:	6a 73                	push   $0x73
80105f66:	e9 3f f7 ff ff       	jmp    801056aa <alltraps>

80105f6b <vector116>:
80105f6b:	6a 00                	push   $0x0
80105f6d:	6a 74                	push   $0x74
80105f6f:	e9 36 f7 ff ff       	jmp    801056aa <alltraps>

80105f74 <vector117>:
80105f74:	6a 00                	push   $0x0
80105f76:	6a 75                	push   $0x75
80105f78:	e9 2d f7 ff ff       	jmp    801056aa <alltraps>

80105f7d <vector118>:
80105f7d:	6a 00                	push   $0x0
80105f7f:	6a 76                	push   $0x76
80105f81:	e9 24 f7 ff ff       	jmp    801056aa <alltraps>

80105f86 <vector119>:
80105f86:	6a 00                	push   $0x0
80105f88:	6a 77                	push   $0x77
80105f8a:	e9 1b f7 ff ff       	jmp    801056aa <alltraps>

80105f8f <vector120>:
80105f8f:	6a 00                	push   $0x0
80105f91:	6a 78                	push   $0x78
80105f93:	e9 12 f7 ff ff       	jmp    801056aa <alltraps>

80105f98 <vector121>:
80105f98:	6a 00                	push   $0x0
80105f9a:	6a 79                	push   $0x79
80105f9c:	e9 09 f7 ff ff       	jmp    801056aa <alltraps>

80105fa1 <vector122>:
80105fa1:	6a 00                	push   $0x0
80105fa3:	6a 7a                	push   $0x7a
80105fa5:	e9 00 f7 ff ff       	jmp    801056aa <alltraps>

80105faa <vector123>:
80105faa:	6a 00                	push   $0x0
80105fac:	6a 7b                	push   $0x7b
80105fae:	e9 f7 f6 ff ff       	jmp    801056aa <alltraps>

80105fb3 <vector124>:
80105fb3:	6a 00                	push   $0x0
80105fb5:	6a 7c                	push   $0x7c
80105fb7:	e9 ee f6 ff ff       	jmp    801056aa <alltraps>

80105fbc <vector125>:
80105fbc:	6a 00                	push   $0x0
80105fbe:	6a 7d                	push   $0x7d
80105fc0:	e9 e5 f6 ff ff       	jmp    801056aa <alltraps>

80105fc5 <vector126>:
80105fc5:	6a 00                	push   $0x0
80105fc7:	6a 7e                	push   $0x7e
80105fc9:	e9 dc f6 ff ff       	jmp    801056aa <alltraps>

80105fce <vector127>:
80105fce:	6a 00                	push   $0x0
80105fd0:	6a 7f                	push   $0x7f
80105fd2:	e9 d3 f6 ff ff       	jmp    801056aa <alltraps>

80105fd7 <vector128>:
80105fd7:	6a 00                	push   $0x0
80105fd9:	68 80 00 00 00       	push   $0x80
80105fde:	e9 c7 f6 ff ff       	jmp    801056aa <alltraps>

80105fe3 <vector129>:
80105fe3:	6a 00                	push   $0x0
80105fe5:	68 81 00 00 00       	push   $0x81
80105fea:	e9 bb f6 ff ff       	jmp    801056aa <alltraps>

80105fef <vector130>:
80105fef:	6a 00                	push   $0x0
80105ff1:	68 82 00 00 00       	push   $0x82
80105ff6:	e9 af f6 ff ff       	jmp    801056aa <alltraps>

80105ffb <vector131>:
80105ffb:	6a 00                	push   $0x0
80105ffd:	68 83 00 00 00       	push   $0x83
80106002:	e9 a3 f6 ff ff       	jmp    801056aa <alltraps>

80106007 <vector132>:
80106007:	6a 00                	push   $0x0
80106009:	68 84 00 00 00       	push   $0x84
8010600e:	e9 97 f6 ff ff       	jmp    801056aa <alltraps>

80106013 <vector133>:
80106013:	6a 00                	push   $0x0
80106015:	68 85 00 00 00       	push   $0x85
8010601a:	e9 8b f6 ff ff       	jmp    801056aa <alltraps>

8010601f <vector134>:
8010601f:	6a 00                	push   $0x0
80106021:	68 86 00 00 00       	push   $0x86
80106026:	e9 7f f6 ff ff       	jmp    801056aa <alltraps>

8010602b <vector135>:
8010602b:	6a 00                	push   $0x0
8010602d:	68 87 00 00 00       	push   $0x87
80106032:	e9 73 f6 ff ff       	jmp    801056aa <alltraps>

80106037 <vector136>:
80106037:	6a 00                	push   $0x0
80106039:	68 88 00 00 00       	push   $0x88
8010603e:	e9 67 f6 ff ff       	jmp    801056aa <alltraps>

80106043 <vector137>:
80106043:	6a 00                	push   $0x0
80106045:	68 89 00 00 00       	push   $0x89
8010604a:	e9 5b f6 ff ff       	jmp    801056aa <alltraps>

8010604f <vector138>:
8010604f:	6a 00                	push   $0x0
80106051:	68 8a 00 00 00       	push   $0x8a
80106056:	e9 4f f6 ff ff       	jmp    801056aa <alltraps>

8010605b <vector139>:
8010605b:	6a 00                	push   $0x0
8010605d:	68 8b 00 00 00       	push   $0x8b
80106062:	e9 43 f6 ff ff       	jmp    801056aa <alltraps>

80106067 <vector140>:
80106067:	6a 00                	push   $0x0
80106069:	68 8c 00 00 00       	push   $0x8c
8010606e:	e9 37 f6 ff ff       	jmp    801056aa <alltraps>

80106073 <vector141>:
80106073:	6a 00                	push   $0x0
80106075:	68 8d 00 00 00       	push   $0x8d
8010607a:	e9 2b f6 ff ff       	jmp    801056aa <alltraps>

8010607f <vector142>:
8010607f:	6a 00                	push   $0x0
80106081:	68 8e 00 00 00       	push   $0x8e
80106086:	e9 1f f6 ff ff       	jmp    801056aa <alltraps>

8010608b <vector143>:
8010608b:	6a 00                	push   $0x0
8010608d:	68 8f 00 00 00       	push   $0x8f
80106092:	e9 13 f6 ff ff       	jmp    801056aa <alltraps>

80106097 <vector144>:
80106097:	6a 00                	push   $0x0
80106099:	68 90 00 00 00       	push   $0x90
8010609e:	e9 07 f6 ff ff       	jmp    801056aa <alltraps>

801060a3 <vector145>:
801060a3:	6a 00                	push   $0x0
801060a5:	68 91 00 00 00       	push   $0x91
801060aa:	e9 fb f5 ff ff       	jmp    801056aa <alltraps>

801060af <vector146>:
801060af:	6a 00                	push   $0x0
801060b1:	68 92 00 00 00       	push   $0x92
801060b6:	e9 ef f5 ff ff       	jmp    801056aa <alltraps>

801060bb <vector147>:
801060bb:	6a 00                	push   $0x0
801060bd:	68 93 00 00 00       	push   $0x93
801060c2:	e9 e3 f5 ff ff       	jmp    801056aa <alltraps>

801060c7 <vector148>:
801060c7:	6a 00                	push   $0x0
801060c9:	68 94 00 00 00       	push   $0x94
801060ce:	e9 d7 f5 ff ff       	jmp    801056aa <alltraps>

801060d3 <vector149>:
801060d3:	6a 00                	push   $0x0
801060d5:	68 95 00 00 00       	push   $0x95
801060da:	e9 cb f5 ff ff       	jmp    801056aa <alltraps>

801060df <vector150>:
801060df:	6a 00                	push   $0x0
801060e1:	68 96 00 00 00       	push   $0x96
801060e6:	e9 bf f5 ff ff       	jmp    801056aa <alltraps>

801060eb <vector151>:
801060eb:	6a 00                	push   $0x0
801060ed:	68 97 00 00 00       	push   $0x97
801060f2:	e9 b3 f5 ff ff       	jmp    801056aa <alltraps>

801060f7 <vector152>:
801060f7:	6a 00                	push   $0x0
801060f9:	68 98 00 00 00       	push   $0x98
801060fe:	e9 a7 f5 ff ff       	jmp    801056aa <alltraps>

80106103 <vector153>:
80106103:	6a 00                	push   $0x0
80106105:	68 99 00 00 00       	push   $0x99
8010610a:	e9 9b f5 ff ff       	jmp    801056aa <alltraps>

8010610f <vector154>:
8010610f:	6a 00                	push   $0x0
80106111:	68 9a 00 00 00       	push   $0x9a
80106116:	e9 8f f5 ff ff       	jmp    801056aa <alltraps>

8010611b <vector155>:
8010611b:	6a 00                	push   $0x0
8010611d:	68 9b 00 00 00       	push   $0x9b
80106122:	e9 83 f5 ff ff       	jmp    801056aa <alltraps>

80106127 <vector156>:
80106127:	6a 00                	push   $0x0
80106129:	68 9c 00 00 00       	push   $0x9c
8010612e:	e9 77 f5 ff ff       	jmp    801056aa <alltraps>

80106133 <vector157>:
80106133:	6a 00                	push   $0x0
80106135:	68 9d 00 00 00       	push   $0x9d
8010613a:	e9 6b f5 ff ff       	jmp    801056aa <alltraps>

8010613f <vector158>:
8010613f:	6a 00                	push   $0x0
80106141:	68 9e 00 00 00       	push   $0x9e
80106146:	e9 5f f5 ff ff       	jmp    801056aa <alltraps>

8010614b <vector159>:
8010614b:	6a 00                	push   $0x0
8010614d:	68 9f 00 00 00       	push   $0x9f
80106152:	e9 53 f5 ff ff       	jmp    801056aa <alltraps>

80106157 <vector160>:
80106157:	6a 00                	push   $0x0
80106159:	68 a0 00 00 00       	push   $0xa0
8010615e:	e9 47 f5 ff ff       	jmp    801056aa <alltraps>

80106163 <vector161>:
80106163:	6a 00                	push   $0x0
80106165:	68 a1 00 00 00       	push   $0xa1
8010616a:	e9 3b f5 ff ff       	jmp    801056aa <alltraps>

8010616f <vector162>:
8010616f:	6a 00                	push   $0x0
80106171:	68 a2 00 00 00       	push   $0xa2
80106176:	e9 2f f5 ff ff       	jmp    801056aa <alltraps>

8010617b <vector163>:
8010617b:	6a 00                	push   $0x0
8010617d:	68 a3 00 00 00       	push   $0xa3
80106182:	e9 23 f5 ff ff       	jmp    801056aa <alltraps>

80106187 <vector164>:
80106187:	6a 00                	push   $0x0
80106189:	68 a4 00 00 00       	push   $0xa4
8010618e:	e9 17 f5 ff ff       	jmp    801056aa <alltraps>

80106193 <vector165>:
80106193:	6a 00                	push   $0x0
80106195:	68 a5 00 00 00       	push   $0xa5
8010619a:	e9 0b f5 ff ff       	jmp    801056aa <alltraps>

8010619f <vector166>:
8010619f:	6a 00                	push   $0x0
801061a1:	68 a6 00 00 00       	push   $0xa6
801061a6:	e9 ff f4 ff ff       	jmp    801056aa <alltraps>

801061ab <vector167>:
801061ab:	6a 00                	push   $0x0
801061ad:	68 a7 00 00 00       	push   $0xa7
801061b2:	e9 f3 f4 ff ff       	jmp    801056aa <alltraps>

801061b7 <vector168>:
801061b7:	6a 00                	push   $0x0
801061b9:	68 a8 00 00 00       	push   $0xa8
801061be:	e9 e7 f4 ff ff       	jmp    801056aa <alltraps>

801061c3 <vector169>:
801061c3:	6a 00                	push   $0x0
801061c5:	68 a9 00 00 00       	push   $0xa9
801061ca:	e9 db f4 ff ff       	jmp    801056aa <alltraps>

801061cf <vector170>:
801061cf:	6a 00                	push   $0x0
801061d1:	68 aa 00 00 00       	push   $0xaa
801061d6:	e9 cf f4 ff ff       	jmp    801056aa <alltraps>

801061db <vector171>:
801061db:	6a 00                	push   $0x0
801061dd:	68 ab 00 00 00       	push   $0xab
801061e2:	e9 c3 f4 ff ff       	jmp    801056aa <alltraps>

801061e7 <vector172>:
801061e7:	6a 00                	push   $0x0
801061e9:	68 ac 00 00 00       	push   $0xac
801061ee:	e9 b7 f4 ff ff       	jmp    801056aa <alltraps>

801061f3 <vector173>:
801061f3:	6a 00                	push   $0x0
801061f5:	68 ad 00 00 00       	push   $0xad
801061fa:	e9 ab f4 ff ff       	jmp    801056aa <alltraps>

801061ff <vector174>:
801061ff:	6a 00                	push   $0x0
80106201:	68 ae 00 00 00       	push   $0xae
80106206:	e9 9f f4 ff ff       	jmp    801056aa <alltraps>

8010620b <vector175>:
8010620b:	6a 00                	push   $0x0
8010620d:	68 af 00 00 00       	push   $0xaf
80106212:	e9 93 f4 ff ff       	jmp    801056aa <alltraps>

80106217 <vector176>:
80106217:	6a 00                	push   $0x0
80106219:	68 b0 00 00 00       	push   $0xb0
8010621e:	e9 87 f4 ff ff       	jmp    801056aa <alltraps>

80106223 <vector177>:
80106223:	6a 00                	push   $0x0
80106225:	68 b1 00 00 00       	push   $0xb1
8010622a:	e9 7b f4 ff ff       	jmp    801056aa <alltraps>

8010622f <vector178>:
8010622f:	6a 00                	push   $0x0
80106231:	68 b2 00 00 00       	push   $0xb2
80106236:	e9 6f f4 ff ff       	jmp    801056aa <alltraps>

8010623b <vector179>:
8010623b:	6a 00                	push   $0x0
8010623d:	68 b3 00 00 00       	push   $0xb3
80106242:	e9 63 f4 ff ff       	jmp    801056aa <alltraps>

80106247 <vector180>:
80106247:	6a 00                	push   $0x0
80106249:	68 b4 00 00 00       	push   $0xb4
8010624e:	e9 57 f4 ff ff       	jmp    801056aa <alltraps>

80106253 <vector181>:
80106253:	6a 00                	push   $0x0
80106255:	68 b5 00 00 00       	push   $0xb5
8010625a:	e9 4b f4 ff ff       	jmp    801056aa <alltraps>

8010625f <vector182>:
8010625f:	6a 00                	push   $0x0
80106261:	68 b6 00 00 00       	push   $0xb6
80106266:	e9 3f f4 ff ff       	jmp    801056aa <alltraps>

8010626b <vector183>:
8010626b:	6a 00                	push   $0x0
8010626d:	68 b7 00 00 00       	push   $0xb7
80106272:	e9 33 f4 ff ff       	jmp    801056aa <alltraps>

80106277 <vector184>:
80106277:	6a 00                	push   $0x0
80106279:	68 b8 00 00 00       	push   $0xb8
8010627e:	e9 27 f4 ff ff       	jmp    801056aa <alltraps>

80106283 <vector185>:
80106283:	6a 00                	push   $0x0
80106285:	68 b9 00 00 00       	push   $0xb9
8010628a:	e9 1b f4 ff ff       	jmp    801056aa <alltraps>

8010628f <vector186>:
8010628f:	6a 00                	push   $0x0
80106291:	68 ba 00 00 00       	push   $0xba
80106296:	e9 0f f4 ff ff       	jmp    801056aa <alltraps>

8010629b <vector187>:
8010629b:	6a 00                	push   $0x0
8010629d:	68 bb 00 00 00       	push   $0xbb
801062a2:	e9 03 f4 ff ff       	jmp    801056aa <alltraps>

801062a7 <vector188>:
801062a7:	6a 00                	push   $0x0
801062a9:	68 bc 00 00 00       	push   $0xbc
801062ae:	e9 f7 f3 ff ff       	jmp    801056aa <alltraps>

801062b3 <vector189>:
801062b3:	6a 00                	push   $0x0
801062b5:	68 bd 00 00 00       	push   $0xbd
801062ba:	e9 eb f3 ff ff       	jmp    801056aa <alltraps>

801062bf <vector190>:
801062bf:	6a 00                	push   $0x0
801062c1:	68 be 00 00 00       	push   $0xbe
801062c6:	e9 df f3 ff ff       	jmp    801056aa <alltraps>

801062cb <vector191>:
801062cb:	6a 00                	push   $0x0
801062cd:	68 bf 00 00 00       	push   $0xbf
801062d2:	e9 d3 f3 ff ff       	jmp    801056aa <alltraps>

801062d7 <vector192>:
801062d7:	6a 00                	push   $0x0
801062d9:	68 c0 00 00 00       	push   $0xc0
801062de:	e9 c7 f3 ff ff       	jmp    801056aa <alltraps>

801062e3 <vector193>:
801062e3:	6a 00                	push   $0x0
801062e5:	68 c1 00 00 00       	push   $0xc1
801062ea:	e9 bb f3 ff ff       	jmp    801056aa <alltraps>

801062ef <vector194>:
801062ef:	6a 00                	push   $0x0
801062f1:	68 c2 00 00 00       	push   $0xc2
801062f6:	e9 af f3 ff ff       	jmp    801056aa <alltraps>

801062fb <vector195>:
801062fb:	6a 00                	push   $0x0
801062fd:	68 c3 00 00 00       	push   $0xc3
80106302:	e9 a3 f3 ff ff       	jmp    801056aa <alltraps>

80106307 <vector196>:
80106307:	6a 00                	push   $0x0
80106309:	68 c4 00 00 00       	push   $0xc4
8010630e:	e9 97 f3 ff ff       	jmp    801056aa <alltraps>

80106313 <vector197>:
80106313:	6a 00                	push   $0x0
80106315:	68 c5 00 00 00       	push   $0xc5
8010631a:	e9 8b f3 ff ff       	jmp    801056aa <alltraps>

8010631f <vector198>:
8010631f:	6a 00                	push   $0x0
80106321:	68 c6 00 00 00       	push   $0xc6
80106326:	e9 7f f3 ff ff       	jmp    801056aa <alltraps>

8010632b <vector199>:
8010632b:	6a 00                	push   $0x0
8010632d:	68 c7 00 00 00       	push   $0xc7
80106332:	e9 73 f3 ff ff       	jmp    801056aa <alltraps>

80106337 <vector200>:
80106337:	6a 00                	push   $0x0
80106339:	68 c8 00 00 00       	push   $0xc8
8010633e:	e9 67 f3 ff ff       	jmp    801056aa <alltraps>

80106343 <vector201>:
80106343:	6a 00                	push   $0x0
80106345:	68 c9 00 00 00       	push   $0xc9
8010634a:	e9 5b f3 ff ff       	jmp    801056aa <alltraps>

8010634f <vector202>:
8010634f:	6a 00                	push   $0x0
80106351:	68 ca 00 00 00       	push   $0xca
80106356:	e9 4f f3 ff ff       	jmp    801056aa <alltraps>

8010635b <vector203>:
8010635b:	6a 00                	push   $0x0
8010635d:	68 cb 00 00 00       	push   $0xcb
80106362:	e9 43 f3 ff ff       	jmp    801056aa <alltraps>

80106367 <vector204>:
80106367:	6a 00                	push   $0x0
80106369:	68 cc 00 00 00       	push   $0xcc
8010636e:	e9 37 f3 ff ff       	jmp    801056aa <alltraps>

80106373 <vector205>:
80106373:	6a 00                	push   $0x0
80106375:	68 cd 00 00 00       	push   $0xcd
8010637a:	e9 2b f3 ff ff       	jmp    801056aa <alltraps>

8010637f <vector206>:
8010637f:	6a 00                	push   $0x0
80106381:	68 ce 00 00 00       	push   $0xce
80106386:	e9 1f f3 ff ff       	jmp    801056aa <alltraps>

8010638b <vector207>:
8010638b:	6a 00                	push   $0x0
8010638d:	68 cf 00 00 00       	push   $0xcf
80106392:	e9 13 f3 ff ff       	jmp    801056aa <alltraps>

80106397 <vector208>:
80106397:	6a 00                	push   $0x0
80106399:	68 d0 00 00 00       	push   $0xd0
8010639e:	e9 07 f3 ff ff       	jmp    801056aa <alltraps>

801063a3 <vector209>:
801063a3:	6a 00                	push   $0x0
801063a5:	68 d1 00 00 00       	push   $0xd1
801063aa:	e9 fb f2 ff ff       	jmp    801056aa <alltraps>

801063af <vector210>:
801063af:	6a 00                	push   $0x0
801063b1:	68 d2 00 00 00       	push   $0xd2
801063b6:	e9 ef f2 ff ff       	jmp    801056aa <alltraps>

801063bb <vector211>:
801063bb:	6a 00                	push   $0x0
801063bd:	68 d3 00 00 00       	push   $0xd3
801063c2:	e9 e3 f2 ff ff       	jmp    801056aa <alltraps>

801063c7 <vector212>:
801063c7:	6a 00                	push   $0x0
801063c9:	68 d4 00 00 00       	push   $0xd4
801063ce:	e9 d7 f2 ff ff       	jmp    801056aa <alltraps>

801063d3 <vector213>:
801063d3:	6a 00                	push   $0x0
801063d5:	68 d5 00 00 00       	push   $0xd5
801063da:	e9 cb f2 ff ff       	jmp    801056aa <alltraps>

801063df <vector214>:
801063df:	6a 00                	push   $0x0
801063e1:	68 d6 00 00 00       	push   $0xd6
801063e6:	e9 bf f2 ff ff       	jmp    801056aa <alltraps>

801063eb <vector215>:
801063eb:	6a 00                	push   $0x0
801063ed:	68 d7 00 00 00       	push   $0xd7
801063f2:	e9 b3 f2 ff ff       	jmp    801056aa <alltraps>

801063f7 <vector216>:
801063f7:	6a 00                	push   $0x0
801063f9:	68 d8 00 00 00       	push   $0xd8
801063fe:	e9 a7 f2 ff ff       	jmp    801056aa <alltraps>

80106403 <vector217>:
80106403:	6a 00                	push   $0x0
80106405:	68 d9 00 00 00       	push   $0xd9
8010640a:	e9 9b f2 ff ff       	jmp    801056aa <alltraps>

8010640f <vector218>:
8010640f:	6a 00                	push   $0x0
80106411:	68 da 00 00 00       	push   $0xda
80106416:	e9 8f f2 ff ff       	jmp    801056aa <alltraps>

8010641b <vector219>:
8010641b:	6a 00                	push   $0x0
8010641d:	68 db 00 00 00       	push   $0xdb
80106422:	e9 83 f2 ff ff       	jmp    801056aa <alltraps>

80106427 <vector220>:
80106427:	6a 00                	push   $0x0
80106429:	68 dc 00 00 00       	push   $0xdc
8010642e:	e9 77 f2 ff ff       	jmp    801056aa <alltraps>

80106433 <vector221>:
80106433:	6a 00                	push   $0x0
80106435:	68 dd 00 00 00       	push   $0xdd
8010643a:	e9 6b f2 ff ff       	jmp    801056aa <alltraps>

8010643f <vector222>:
8010643f:	6a 00                	push   $0x0
80106441:	68 de 00 00 00       	push   $0xde
80106446:	e9 5f f2 ff ff       	jmp    801056aa <alltraps>

8010644b <vector223>:
8010644b:	6a 00                	push   $0x0
8010644d:	68 df 00 00 00       	push   $0xdf
80106452:	e9 53 f2 ff ff       	jmp    801056aa <alltraps>

80106457 <vector224>:
80106457:	6a 00                	push   $0x0
80106459:	68 e0 00 00 00       	push   $0xe0
8010645e:	e9 47 f2 ff ff       	jmp    801056aa <alltraps>

80106463 <vector225>:
80106463:	6a 00                	push   $0x0
80106465:	68 e1 00 00 00       	push   $0xe1
8010646a:	e9 3b f2 ff ff       	jmp    801056aa <alltraps>

8010646f <vector226>:
8010646f:	6a 00                	push   $0x0
80106471:	68 e2 00 00 00       	push   $0xe2
80106476:	e9 2f f2 ff ff       	jmp    801056aa <alltraps>

8010647b <vector227>:
8010647b:	6a 00                	push   $0x0
8010647d:	68 e3 00 00 00       	push   $0xe3
80106482:	e9 23 f2 ff ff       	jmp    801056aa <alltraps>

80106487 <vector228>:
80106487:	6a 00                	push   $0x0
80106489:	68 e4 00 00 00       	push   $0xe4
8010648e:	e9 17 f2 ff ff       	jmp    801056aa <alltraps>

80106493 <vector229>:
80106493:	6a 00                	push   $0x0
80106495:	68 e5 00 00 00       	push   $0xe5
8010649a:	e9 0b f2 ff ff       	jmp    801056aa <alltraps>

8010649f <vector230>:
8010649f:	6a 00                	push   $0x0
801064a1:	68 e6 00 00 00       	push   $0xe6
801064a6:	e9 ff f1 ff ff       	jmp    801056aa <alltraps>

801064ab <vector231>:
801064ab:	6a 00                	push   $0x0
801064ad:	68 e7 00 00 00       	push   $0xe7
801064b2:	e9 f3 f1 ff ff       	jmp    801056aa <alltraps>

801064b7 <vector232>:
801064b7:	6a 00                	push   $0x0
801064b9:	68 e8 00 00 00       	push   $0xe8
801064be:	e9 e7 f1 ff ff       	jmp    801056aa <alltraps>

801064c3 <vector233>:
801064c3:	6a 00                	push   $0x0
801064c5:	68 e9 00 00 00       	push   $0xe9
801064ca:	e9 db f1 ff ff       	jmp    801056aa <alltraps>

801064cf <vector234>:
801064cf:	6a 00                	push   $0x0
801064d1:	68 ea 00 00 00       	push   $0xea
801064d6:	e9 cf f1 ff ff       	jmp    801056aa <alltraps>

801064db <vector235>:
801064db:	6a 00                	push   $0x0
801064dd:	68 eb 00 00 00       	push   $0xeb
801064e2:	e9 c3 f1 ff ff       	jmp    801056aa <alltraps>

801064e7 <vector236>:
801064e7:	6a 00                	push   $0x0
801064e9:	68 ec 00 00 00       	push   $0xec
801064ee:	e9 b7 f1 ff ff       	jmp    801056aa <alltraps>

801064f3 <vector237>:
801064f3:	6a 00                	push   $0x0
801064f5:	68 ed 00 00 00       	push   $0xed
801064fa:	e9 ab f1 ff ff       	jmp    801056aa <alltraps>

801064ff <vector238>:
801064ff:	6a 00                	push   $0x0
80106501:	68 ee 00 00 00       	push   $0xee
80106506:	e9 9f f1 ff ff       	jmp    801056aa <alltraps>

8010650b <vector239>:
8010650b:	6a 00                	push   $0x0
8010650d:	68 ef 00 00 00       	push   $0xef
80106512:	e9 93 f1 ff ff       	jmp    801056aa <alltraps>

80106517 <vector240>:
80106517:	6a 00                	push   $0x0
80106519:	68 f0 00 00 00       	push   $0xf0
8010651e:	e9 87 f1 ff ff       	jmp    801056aa <alltraps>

80106523 <vector241>:
80106523:	6a 00                	push   $0x0
80106525:	68 f1 00 00 00       	push   $0xf1
8010652a:	e9 7b f1 ff ff       	jmp    801056aa <alltraps>

8010652f <vector242>:
8010652f:	6a 00                	push   $0x0
80106531:	68 f2 00 00 00       	push   $0xf2
80106536:	e9 6f f1 ff ff       	jmp    801056aa <alltraps>

8010653b <vector243>:
8010653b:	6a 00                	push   $0x0
8010653d:	68 f3 00 00 00       	push   $0xf3
80106542:	e9 63 f1 ff ff       	jmp    801056aa <alltraps>

80106547 <vector244>:
80106547:	6a 00                	push   $0x0
80106549:	68 f4 00 00 00       	push   $0xf4
8010654e:	e9 57 f1 ff ff       	jmp    801056aa <alltraps>

80106553 <vector245>:
80106553:	6a 00                	push   $0x0
80106555:	68 f5 00 00 00       	push   $0xf5
8010655a:	e9 4b f1 ff ff       	jmp    801056aa <alltraps>

8010655f <vector246>:
8010655f:	6a 00                	push   $0x0
80106561:	68 f6 00 00 00       	push   $0xf6
80106566:	e9 3f f1 ff ff       	jmp    801056aa <alltraps>

8010656b <vector247>:
8010656b:	6a 00                	push   $0x0
8010656d:	68 f7 00 00 00       	push   $0xf7
80106572:	e9 33 f1 ff ff       	jmp    801056aa <alltraps>

80106577 <vector248>:
80106577:	6a 00                	push   $0x0
80106579:	68 f8 00 00 00       	push   $0xf8
8010657e:	e9 27 f1 ff ff       	jmp    801056aa <alltraps>

80106583 <vector249>:
80106583:	6a 00                	push   $0x0
80106585:	68 f9 00 00 00       	push   $0xf9
8010658a:	e9 1b f1 ff ff       	jmp    801056aa <alltraps>

8010658f <vector250>:
8010658f:	6a 00                	push   $0x0
80106591:	68 fa 00 00 00       	push   $0xfa
80106596:	e9 0f f1 ff ff       	jmp    801056aa <alltraps>

8010659b <vector251>:
8010659b:	6a 00                	push   $0x0
8010659d:	68 fb 00 00 00       	push   $0xfb
801065a2:	e9 03 f1 ff ff       	jmp    801056aa <alltraps>

801065a7 <vector252>:
801065a7:	6a 00                	push   $0x0
801065a9:	68 fc 00 00 00       	push   $0xfc
801065ae:	e9 f7 f0 ff ff       	jmp    801056aa <alltraps>

801065b3 <vector253>:
801065b3:	6a 00                	push   $0x0
801065b5:	68 fd 00 00 00       	push   $0xfd
801065ba:	e9 eb f0 ff ff       	jmp    801056aa <alltraps>

801065bf <vector254>:
801065bf:	6a 00                	push   $0x0
801065c1:	68 fe 00 00 00       	push   $0xfe
801065c6:	e9 df f0 ff ff       	jmp    801056aa <alltraps>

801065cb <vector255>:
801065cb:	6a 00                	push   $0x0
801065cd:	68 ff 00 00 00       	push   $0xff
801065d2:	e9 d3 f0 ff ff       	jmp    801056aa <alltraps>
801065d7:	66 90                	xchg   %ax,%ax
801065d9:	66 90                	xchg   %ax,%ax
801065db:	66 90                	xchg   %ax,%ax
801065dd:	66 90                	xchg   %ax,%ax
801065df:	90                   	nop

801065e0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801065e0:	55                   	push   %ebp
801065e1:	89 e5                	mov    %esp,%ebp
801065e3:	57                   	push   %edi
801065e4:	56                   	push   %esi
801065e5:	53                   	push   %ebx
801065e6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
801065e8:	c1 ea 16             	shr    $0x16,%edx
801065eb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
801065ee:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
801065f1:	8b 07                	mov    (%edi),%eax
801065f3:	a8 01                	test   $0x1,%al
801065f5:	74 29                	je     80106620 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
801065f7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801065fc:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106602:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106605:	c1 eb 0a             	shr    $0xa,%ebx
80106608:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
8010660e:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106611:	5b                   	pop    %ebx
80106612:	5e                   	pop    %esi
80106613:	5f                   	pop    %edi
80106614:	5d                   	pop    %ebp
80106615:	c3                   	ret    
80106616:	8d 76 00             	lea    0x0(%esi),%esi
80106619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106620:	85 c9                	test   %ecx,%ecx
80106622:	74 2c                	je     80106650 <walkpgdir+0x70>
80106624:	e8 67 be ff ff       	call   80102490 <kalloc>
80106629:	85 c0                	test   %eax,%eax
8010662b:	89 c6                	mov    %eax,%esi
8010662d:	74 21                	je     80106650 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
8010662f:	83 ec 04             	sub    $0x4,%esp
80106632:	68 00 10 00 00       	push   $0x1000
80106637:	6a 00                	push   $0x0
80106639:	50                   	push   %eax
8010663a:	e8 71 de ff ff       	call   801044b0 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
8010663f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106645:	83 c4 10             	add    $0x10,%esp
80106648:	83 c8 07             	or     $0x7,%eax
8010664b:	89 07                	mov    %eax,(%edi)
8010664d:	eb b3                	jmp    80106602 <walkpgdir+0x22>
8010664f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106650:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106653:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106655:	5b                   	pop    %ebx
80106656:	5e                   	pop    %esi
80106657:	5f                   	pop    %edi
80106658:	5d                   	pop    %ebp
80106659:	c3                   	ret    
8010665a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106660 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106660:	55                   	push   %ebp
80106661:	89 e5                	mov    %esp,%ebp
80106663:	57                   	push   %edi
80106664:	56                   	push   %esi
80106665:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106666:	89 d3                	mov    %edx,%ebx
80106668:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
8010666e:	83 ec 1c             	sub    $0x1c,%esp
80106671:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106674:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106678:	8b 7d 08             	mov    0x8(%ebp),%edi
8010667b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106680:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106683:	8b 45 0c             	mov    0xc(%ebp),%eax
80106686:	29 df                	sub    %ebx,%edi
80106688:	83 c8 01             	or     $0x1,%eax
8010668b:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010668e:	eb 15                	jmp    801066a5 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106690:	f6 00 01             	testb  $0x1,(%eax)
80106693:	75 45                	jne    801066da <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106695:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106698:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
8010669b:	89 30                	mov    %esi,(%eax)
    if(a == last)
8010669d:	74 31                	je     801066d0 <mappages+0x70>
      break;
    a += PGSIZE;
8010669f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
801066a5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801066a8:	b9 01 00 00 00       	mov    $0x1,%ecx
801066ad:	89 da                	mov    %ebx,%edx
801066af:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
801066b2:	e8 29 ff ff ff       	call   801065e0 <walkpgdir>
801066b7:	85 c0                	test   %eax,%eax
801066b9:	75 d5                	jne    80106690 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801066bb:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
801066be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
801066c3:	5b                   	pop    %ebx
801066c4:	5e                   	pop    %esi
801066c5:	5f                   	pop    %edi
801066c6:	5d                   	pop    %ebp
801066c7:	c3                   	ret    
801066c8:	90                   	nop
801066c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801066d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
801066d3:	31 c0                	xor    %eax,%eax
}
801066d5:	5b                   	pop    %ebx
801066d6:	5e                   	pop    %esi
801066d7:	5f                   	pop    %edi
801066d8:	5d                   	pop    %ebp
801066d9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
801066da:	83 ec 0c             	sub    $0xc,%esp
801066dd:	68 28 78 10 80       	push   $0x80107828
801066e2:	e8 89 9c ff ff       	call   80100370 <panic>
801066e7:	89 f6                	mov    %esi,%esi
801066e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801066f0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801066f0:	55                   	push   %ebp
801066f1:	89 e5                	mov    %esp,%ebp
801066f3:	57                   	push   %edi
801066f4:	56                   	push   %esi
801066f5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801066f6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
801066fc:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
801066fe:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106704:	83 ec 1c             	sub    $0x1c,%esp
80106707:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010670a:	39 d3                	cmp    %edx,%ebx
8010670c:	73 66                	jae    80106774 <deallocuvm.part.0+0x84>
8010670e:	89 d6                	mov    %edx,%esi
80106710:	eb 3d                	jmp    8010674f <deallocuvm.part.0+0x5f>
80106712:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
80106718:	8b 10                	mov    (%eax),%edx
8010671a:	f6 c2 01             	test   $0x1,%dl
8010671d:	74 26                	je     80106745 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
8010671f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106725:	74 58                	je     8010677f <deallocuvm.part.0+0x8f>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106727:	83 ec 0c             	sub    $0xc,%esp
8010672a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106730:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106733:	52                   	push   %edx
80106734:	e8 a7 bb ff ff       	call   801022e0 <kfree>
      *pte = 0;
80106739:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010673c:	83 c4 10             	add    $0x10,%esp
8010673f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106745:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010674b:	39 f3                	cmp    %esi,%ebx
8010674d:	73 25                	jae    80106774 <deallocuvm.part.0+0x84>
    pte = walkpgdir(pgdir, (char*)a, 0);
8010674f:	31 c9                	xor    %ecx,%ecx
80106751:	89 da                	mov    %ebx,%edx
80106753:	89 f8                	mov    %edi,%eax
80106755:	e8 86 fe ff ff       	call   801065e0 <walkpgdir>
    if(!pte)
8010675a:	85 c0                	test   %eax,%eax
8010675c:	75 ba                	jne    80106718 <deallocuvm.part.0+0x28>
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
8010675e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106764:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
8010676a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106770:	39 f3                	cmp    %esi,%ebx
80106772:	72 db                	jb     8010674f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106774:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106777:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010677a:	5b                   	pop    %ebx
8010677b:	5e                   	pop    %esi
8010677c:	5f                   	pop    %edi
8010677d:	5d                   	pop    %ebp
8010677e:	c3                   	ret    
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
8010677f:	83 ec 0c             	sub    $0xc,%esp
80106782:	68 c6 71 10 80       	push   $0x801071c6
80106787:	e8 e4 9b ff ff       	call   80100370 <panic>
8010678c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106790 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106790:	55                   	push   %ebp
80106791:	89 e5                	mov    %esp,%ebp
80106793:	83 ec 18             	sub    $0x18,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
80106796:	e8 e5 cf ff ff       	call   80103780 <cpuid>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
8010679b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
801067a1:	31 c9                	xor    %ecx,%ecx
801067a3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067a8:	66 89 90 18 28 11 80 	mov    %dx,-0x7feed7e8(%eax)
801067af:	66 89 88 1a 28 11 80 	mov    %cx,-0x7feed7e6(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801067b6:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067bb:	31 c9                	xor    %ecx,%ecx
801067bd:	66 89 90 20 28 11 80 	mov    %dx,-0x7feed7e0(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801067c4:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
801067c9:	66 89 88 22 28 11 80 	mov    %cx,-0x7feed7de(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
801067d0:	31 c9                	xor    %ecx,%ecx
801067d2:	66 89 90 28 28 11 80 	mov    %dx,-0x7feed7d8(%eax)
801067d9:	66 89 88 2a 28 11 80 	mov    %cx,-0x7feed7d6(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
801067e0:	ba ff ff ff ff       	mov    $0xffffffff,%edx
801067e5:	31 c9                	xor    %ecx,%ecx
801067e7:	66 89 90 30 28 11 80 	mov    %dx,-0x7feed7d0(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
801067ee:	c6 80 1c 28 11 80 00 	movb   $0x0,-0x7feed7e4(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
801067f5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801067fa:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106801:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
80106808:	c6 80 1f 28 11 80 00 	movb   $0x0,-0x7feed7e1(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
8010680f:	c6 80 24 28 11 80 00 	movb   $0x0,-0x7feed7dc(%eax)
80106816:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
8010681d:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
80106824:	c6 80 27 28 11 80 00 	movb   $0x0,-0x7feed7d9(%eax)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
8010682b:	c6 80 2c 28 11 80 00 	movb   $0x0,-0x7feed7d4(%eax)
80106832:	c6 80 2d 28 11 80 fa 	movb   $0xfa,-0x7feed7d3(%eax)
80106839:	c6 80 2e 28 11 80 cf 	movb   $0xcf,-0x7feed7d2(%eax)
80106840:	c6 80 2f 28 11 80 00 	movb   $0x0,-0x7feed7d1(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106847:	66 89 88 32 28 11 80 	mov    %cx,-0x7feed7ce(%eax)
8010684e:	c6 80 34 28 11 80 00 	movb   $0x0,-0x7feed7cc(%eax)
80106855:	c6 80 35 28 11 80 f2 	movb   $0xf2,-0x7feed7cb(%eax)
8010685c:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
80106863:	c6 80 37 28 11 80 00 	movb   $0x0,-0x7feed7c9(%eax)
  lgdt(c->gdt, sizeof(c->gdt));
8010686a:	05 10 28 11 80       	add    $0x80112810,%eax
8010686f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  pd[1] = (uint)p;
80106873:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106877:	c1 e8 10             	shr    $0x10,%eax
8010687a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
8010687e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106881:	0f 01 10             	lgdtl  (%eax)
}
80106884:	c9                   	leave  
80106885:	c3                   	ret    
80106886:	8d 76 00             	lea    0x0(%esi),%esi
80106889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106890 <switchkvm>:
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106890:	a1 c4 55 11 80       	mov    0x801155c4,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106895:	55                   	push   %ebp
80106896:	89 e5                	mov    %esp,%ebp
80106898:	05 00 00 00 80       	add    $0x80000000,%eax
8010689d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
801068a0:	5d                   	pop    %ebp
801068a1:	c3                   	ret    
801068a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801068a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801068b0 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
801068b0:	55                   	push   %ebp
801068b1:	89 e5                	mov    %esp,%ebp
801068b3:	57                   	push   %edi
801068b4:	56                   	push   %esi
801068b5:	53                   	push   %ebx
801068b6:	83 ec 1c             	sub    $0x1c,%esp
801068b9:	8b 75 08             	mov    0x8(%ebp),%esi
  if(p == 0)
801068bc:	85 f6                	test   %esi,%esi
801068be:	0f 84 cd 00 00 00    	je     80106991 <switchuvm+0xe1>
    panic("switchuvm: no process");
  if(p->kstack == 0)
801068c4:	8b 46 08             	mov    0x8(%esi),%eax
801068c7:	85 c0                	test   %eax,%eax
801068c9:	0f 84 dc 00 00 00    	je     801069ab <switchuvm+0xfb>
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
801068cf:	8b 7e 04             	mov    0x4(%esi),%edi
801068d2:	85 ff                	test   %edi,%edi
801068d4:	0f 84 c4 00 00 00    	je     8010699e <switchuvm+0xee>
    panic("switchuvm: no pgdir");

  pushcli();
801068da:	e8 21 da ff ff       	call   80104300 <pushcli>
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
801068df:	e8 1c ce ff ff       	call   80103700 <mycpu>
801068e4:	89 c3                	mov    %eax,%ebx
801068e6:	e8 15 ce ff ff       	call   80103700 <mycpu>
801068eb:	89 c7                	mov    %eax,%edi
801068ed:	e8 0e ce ff ff       	call   80103700 <mycpu>
801068f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068f5:	83 c7 08             	add    $0x8,%edi
801068f8:	e8 03 ce ff ff       	call   80103700 <mycpu>
801068fd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106900:	83 c0 08             	add    $0x8,%eax
80106903:	ba 67 00 00 00       	mov    $0x67,%edx
80106908:	c1 e8 18             	shr    $0x18,%eax
8010690b:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
80106912:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
80106919:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
80106920:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
80106927:	83 c1 08             	add    $0x8,%ecx
8010692a:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
80106930:	c1 e9 10             	shr    $0x10,%ecx
80106933:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106939:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
8010693e:	e8 bd cd ff ff       	call   80103700 <mycpu>
80106943:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
  mycpu()->ts.ss0 = SEG_KDATA << 3;
8010694a:	e8 b1 cd ff ff       	call   80103700 <mycpu>
8010694f:	b9 10 00 00 00       	mov    $0x10,%ecx
80106954:	66 89 48 10          	mov    %cx,0x10(%eax)
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
80106958:	e8 a3 cd ff ff       	call   80103700 <mycpu>
8010695d:	8b 56 08             	mov    0x8(%esi),%edx
80106960:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80106966:	89 48 0c             	mov    %ecx,0xc(%eax)
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
80106969:	e8 92 cd ff ff       	call   80103700 <mycpu>
8010696e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106972:	b8 28 00 00 00       	mov    $0x28,%eax
80106977:	0f 00 d8             	ltr    %ax
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
8010697a:	8b 46 04             	mov    0x4(%esi),%eax
8010697d:	05 00 00 00 80       	add    $0x80000000,%eax
80106982:	0f 22 d8             	mov    %eax,%cr3
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106985:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106988:	5b                   	pop    %ebx
80106989:	5e                   	pop    %esi
8010698a:	5f                   	pop    %edi
8010698b:	5d                   	pop    %ebp
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
8010698c:	e9 5f da ff ff       	jmp    801043f0 <popcli>
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
80106991:	83 ec 0c             	sub    $0xc,%esp
80106994:	68 2e 78 10 80       	push   $0x8010782e
80106999:	e8 d2 99 ff ff       	call   80100370 <panic>
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
8010699e:	83 ec 0c             	sub    $0xc,%esp
801069a1:	68 59 78 10 80       	push   $0x80107859
801069a6:	e8 c5 99 ff ff       	call   80100370 <panic>
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
801069ab:	83 ec 0c             	sub    $0xc,%esp
801069ae:	68 44 78 10 80       	push   $0x80107844
801069b3:	e8 b8 99 ff ff       	call   80100370 <panic>
801069b8:	90                   	nop
801069b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801069c0 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801069c0:	55                   	push   %ebp
801069c1:	89 e5                	mov    %esp,%ebp
801069c3:	57                   	push   %edi
801069c4:	56                   	push   %esi
801069c5:	53                   	push   %ebx
801069c6:	83 ec 1c             	sub    $0x1c,%esp
801069c9:	8b 75 10             	mov    0x10(%ebp),%esi
801069cc:	8b 45 08             	mov    0x8(%ebp),%eax
801069cf:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
801069d2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
801069d8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
801069db:	77 49                	ja     80106a26 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
801069dd:	e8 ae ba ff ff       	call   80102490 <kalloc>
  memset(mem, 0, PGSIZE);
801069e2:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
801069e5:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
801069e7:	68 00 10 00 00       	push   $0x1000
801069ec:	6a 00                	push   $0x0
801069ee:	50                   	push   %eax
801069ef:	e8 bc da ff ff       	call   801044b0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
801069f4:	58                   	pop    %eax
801069f5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801069fb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106a00:	5a                   	pop    %edx
80106a01:	6a 06                	push   $0x6
80106a03:	50                   	push   %eax
80106a04:	31 d2                	xor    %edx,%edx
80106a06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106a09:	e8 52 fc ff ff       	call   80106660 <mappages>
  memmove(mem, init, sz);
80106a0e:	89 75 10             	mov    %esi,0x10(%ebp)
80106a11:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106a14:	83 c4 10             	add    $0x10,%esp
80106a17:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106a1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a1d:	5b                   	pop    %ebx
80106a1e:	5e                   	pop    %esi
80106a1f:	5f                   	pop    %edi
80106a20:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106a21:	e9 3a db ff ff       	jmp    80104560 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106a26:	83 ec 0c             	sub    $0xc,%esp
80106a29:	68 6d 78 10 80       	push   $0x8010786d
80106a2e:	e8 3d 99 ff ff       	call   80100370 <panic>
80106a33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106a40 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106a40:	55                   	push   %ebp
80106a41:	89 e5                	mov    %esp,%ebp
80106a43:	57                   	push   %edi
80106a44:	56                   	push   %esi
80106a45:	53                   	push   %ebx
80106a46:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106a49:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106a50:	0f 85 91 00 00 00    	jne    80106ae7 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106a56:	8b 75 18             	mov    0x18(%ebp),%esi
80106a59:	31 db                	xor    %ebx,%ebx
80106a5b:	85 f6                	test   %esi,%esi
80106a5d:	75 1a                	jne    80106a79 <loaduvm+0x39>
80106a5f:	eb 6f                	jmp    80106ad0 <loaduvm+0x90>
80106a61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106a68:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106a6e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106a74:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106a77:	76 57                	jbe    80106ad0 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106a79:	8b 55 0c             	mov    0xc(%ebp),%edx
80106a7c:	8b 45 08             	mov    0x8(%ebp),%eax
80106a7f:	31 c9                	xor    %ecx,%ecx
80106a81:	01 da                	add    %ebx,%edx
80106a83:	e8 58 fb ff ff       	call   801065e0 <walkpgdir>
80106a88:	85 c0                	test   %eax,%eax
80106a8a:	74 4e                	je     80106ada <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106a8c:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106a8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106a91:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106a96:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106a9b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106aa1:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106aa4:	01 d9                	add    %ebx,%ecx
80106aa6:	05 00 00 00 80       	add    $0x80000000,%eax
80106aab:	57                   	push   %edi
80106aac:	51                   	push   %ecx
80106aad:	50                   	push   %eax
80106aae:	ff 75 10             	pushl  0x10(%ebp)
80106ab1:	e8 9a ae ff ff       	call   80101950 <readi>
80106ab6:	83 c4 10             	add    $0x10,%esp
80106ab9:	39 c7                	cmp    %eax,%edi
80106abb:	74 ab                	je     80106a68 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
80106abd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80106ac0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80106ac5:	5b                   	pop    %ebx
80106ac6:	5e                   	pop    %esi
80106ac7:	5f                   	pop    %edi
80106ac8:	5d                   	pop    %ebp
80106ac9:	c3                   	ret    
80106aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ad0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80106ad3:	31 c0                	xor    %eax,%eax
}
80106ad5:	5b                   	pop    %ebx
80106ad6:	5e                   	pop    %esi
80106ad7:	5f                   	pop    %edi
80106ad8:	5d                   	pop    %ebp
80106ad9:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
80106ada:	83 ec 0c             	sub    $0xc,%esp
80106add:	68 87 78 10 80       	push   $0x80107887
80106ae2:	e8 89 98 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80106ae7:	83 ec 0c             	sub    $0xc,%esp
80106aea:	68 28 79 10 80       	push   $0x80107928
80106aef:	e8 7c 98 ff ff       	call   80100370 <panic>
80106af4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106afa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106b00 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106b00:	55                   	push   %ebp
80106b01:	89 e5                	mov    %esp,%ebp
80106b03:	57                   	push   %edi
80106b04:	56                   	push   %esi
80106b05:	53                   	push   %ebx
80106b06:	83 ec 0c             	sub    $0xc,%esp
80106b09:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
80106b0c:	85 ff                	test   %edi,%edi
80106b0e:	0f 88 ca 00 00 00    	js     80106bde <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80106b14:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80106b17:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
80106b1a:	0f 82 82 00 00 00    	jb     80106ba2 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80106b20:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106b26:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
80106b2c:	39 df                	cmp    %ebx,%edi
80106b2e:	77 43                	ja     80106b73 <allocuvm+0x73>
80106b30:	e9 bb 00 00 00       	jmp    80106bf0 <allocuvm+0xf0>
80106b35:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80106b38:	83 ec 04             	sub    $0x4,%esp
80106b3b:	68 00 10 00 00       	push   $0x1000
80106b40:	6a 00                	push   $0x0
80106b42:	50                   	push   %eax
80106b43:	e8 68 d9 ff ff       	call   801044b0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
80106b48:	58                   	pop    %eax
80106b49:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b4f:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b54:	5a                   	pop    %edx
80106b55:	6a 06                	push   $0x6
80106b57:	50                   	push   %eax
80106b58:	89 da                	mov    %ebx,%edx
80106b5a:	8b 45 08             	mov    0x8(%ebp),%eax
80106b5d:	e8 fe fa ff ff       	call   80106660 <mappages>
80106b62:	83 c4 10             	add    $0x10,%esp
80106b65:	85 c0                	test   %eax,%eax
80106b67:	78 47                	js     80106bb0 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106b69:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b6f:	39 df                	cmp    %ebx,%edi
80106b71:	76 7d                	jbe    80106bf0 <allocuvm+0xf0>
    mem = kalloc();
80106b73:	e8 18 b9 ff ff       	call   80102490 <kalloc>
    if(mem == 0){
80106b78:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
80106b7a:	89 c6                	mov    %eax,%esi
    if(mem == 0){
80106b7c:	75 ba                	jne    80106b38 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
80106b7e:	83 ec 0c             	sub    $0xc,%esp
80106b81:	68 a5 78 10 80       	push   $0x801078a5
80106b86:	e8 d5 9a ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106b8b:	83 c4 10             	add    $0x10,%esp
80106b8e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106b91:	76 4b                	jbe    80106bde <allocuvm+0xde>
80106b93:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106b96:	8b 45 08             	mov    0x8(%ebp),%eax
80106b99:	89 fa                	mov    %edi,%edx
80106b9b:	e8 50 fb ff ff       	call   801066f0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80106ba0:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106ba2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ba5:	5b                   	pop    %ebx
80106ba6:	5e                   	pop    %esi
80106ba7:	5f                   	pop    %edi
80106ba8:	5d                   	pop    %ebp
80106ba9:	c3                   	ret    
80106baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80106bb0:	83 ec 0c             	sub    $0xc,%esp
80106bb3:	68 bd 78 10 80       	push   $0x801078bd
80106bb8:	e8 a3 9a ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106bbd:	83 c4 10             	add    $0x10,%esp
80106bc0:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106bc3:	76 0d                	jbe    80106bd2 <allocuvm+0xd2>
80106bc5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106bc8:	8b 45 08             	mov    0x8(%ebp),%eax
80106bcb:	89 fa                	mov    %edi,%edx
80106bcd:	e8 1e fb ff ff       	call   801066f0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80106bd2:	83 ec 0c             	sub    $0xc,%esp
80106bd5:	56                   	push   %esi
80106bd6:	e8 05 b7 ff ff       	call   801022e0 <kfree>
      return 0;
80106bdb:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
80106bde:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80106be1:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80106be3:	5b                   	pop    %ebx
80106be4:	5e                   	pop    %esi
80106be5:	5f                   	pop    %edi
80106be6:	5d                   	pop    %ebp
80106be7:	c3                   	ret    
80106be8:	90                   	nop
80106be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bf0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80106bf3:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80106bf5:	5b                   	pop    %ebx
80106bf6:	5e                   	pop    %esi
80106bf7:	5f                   	pop    %edi
80106bf8:	5d                   	pop    %ebp
80106bf9:	c3                   	ret    
80106bfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106c00 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	8b 55 0c             	mov    0xc(%ebp),%edx
80106c06:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106c09:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
80106c0c:	39 d1                	cmp    %edx,%ecx
80106c0e:	73 10                	jae    80106c20 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106c10:	5d                   	pop    %ebp
80106c11:	e9 da fa ff ff       	jmp    801066f0 <deallocuvm.part.0>
80106c16:	8d 76 00             	lea    0x0(%esi),%esi
80106c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106c20:	89 d0                	mov    %edx,%eax
80106c22:	5d                   	pop    %ebp
80106c23:	c3                   	ret    
80106c24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106c2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c30 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80106c30:	55                   	push   %ebp
80106c31:	89 e5                	mov    %esp,%ebp
80106c33:	57                   	push   %edi
80106c34:	56                   	push   %esi
80106c35:	53                   	push   %ebx
80106c36:	83 ec 0c             	sub    $0xc,%esp
80106c39:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
80106c3c:	85 f6                	test   %esi,%esi
80106c3e:	74 59                	je     80106c99 <freevm+0x69>
80106c40:	31 c9                	xor    %ecx,%ecx
80106c42:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106c47:	89 f0                	mov    %esi,%eax
80106c49:	e8 a2 fa ff ff       	call   801066f0 <deallocuvm.part.0>
80106c4e:	89 f3                	mov    %esi,%ebx
80106c50:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106c56:	eb 0f                	jmp    80106c67 <freevm+0x37>
80106c58:	90                   	nop
80106c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c60:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106c63:	39 fb                	cmp    %edi,%ebx
80106c65:	74 23                	je     80106c8a <freevm+0x5a>
    if(pgdir[i] & PTE_P){
80106c67:	8b 03                	mov    (%ebx),%eax
80106c69:	a8 01                	test   $0x1,%al
80106c6b:	74 f3                	je     80106c60 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
80106c6d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106c72:	83 ec 0c             	sub    $0xc,%esp
80106c75:	83 c3 04             	add    $0x4,%ebx
80106c78:	05 00 00 00 80       	add    $0x80000000,%eax
80106c7d:	50                   	push   %eax
80106c7e:	e8 5d b6 ff ff       	call   801022e0 <kfree>
80106c83:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
80106c86:	39 fb                	cmp    %edi,%ebx
80106c88:	75 dd                	jne    80106c67 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106c8a:	89 75 08             	mov    %esi,0x8(%ebp)
}
80106c8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c90:	5b                   	pop    %ebx
80106c91:	5e                   	pop    %esi
80106c92:	5f                   	pop    %edi
80106c93:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
80106c94:	e9 47 b6 ff ff       	jmp    801022e0 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
80106c99:	83 ec 0c             	sub    $0xc,%esp
80106c9c:	68 d9 78 10 80       	push   $0x801078d9
80106ca1:	e8 ca 96 ff ff       	call   80100370 <panic>
80106ca6:	8d 76 00             	lea    0x0(%esi),%esi
80106ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cb0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106cb0:	55                   	push   %ebp
80106cb1:	89 e5                	mov    %esp,%ebp
80106cb3:	56                   	push   %esi
80106cb4:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106cb5:	e8 d6 b7 ff ff       	call   80102490 <kalloc>
80106cba:	85 c0                	test   %eax,%eax
80106cbc:	74 6a                	je     80106d28 <setupkvm+0x78>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106cbe:	83 ec 04             	sub    $0x4,%esp
80106cc1:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106cc3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106cc8:	68 00 10 00 00       	push   $0x1000
80106ccd:	6a 00                	push   $0x0
80106ccf:	50                   	push   %eax
80106cd0:	e8 db d7 ff ff       	call   801044b0 <memset>
80106cd5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106cd8:	8b 43 04             	mov    0x4(%ebx),%eax
80106cdb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106cde:	83 ec 08             	sub    $0x8,%esp
80106ce1:	8b 13                	mov    (%ebx),%edx
80106ce3:	ff 73 0c             	pushl  0xc(%ebx)
80106ce6:	50                   	push   %eax
80106ce7:	29 c1                	sub    %eax,%ecx
80106ce9:	89 f0                	mov    %esi,%eax
80106ceb:	e8 70 f9 ff ff       	call   80106660 <mappages>
80106cf0:	83 c4 10             	add    $0x10,%esp
80106cf3:	85 c0                	test   %eax,%eax
80106cf5:	78 19                	js     80106d10 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106cf7:	83 c3 10             	add    $0x10,%ebx
80106cfa:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106d00:	75 d6                	jne    80106cd8 <setupkvm+0x28>
80106d02:	89 f0                	mov    %esi,%eax
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}
80106d04:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106d07:	5b                   	pop    %ebx
80106d08:	5e                   	pop    %esi
80106d09:	5d                   	pop    %ebp
80106d0a:	c3                   	ret    
80106d0b:	90                   	nop
80106d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
80106d10:	83 ec 0c             	sub    $0xc,%esp
80106d13:	56                   	push   %esi
80106d14:	e8 17 ff ff ff       	call   80106c30 <freevm>
      return 0;
80106d19:	83 c4 10             	add    $0x10,%esp
    }
  return pgdir;
}
80106d1c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
80106d1f:	31 c0                	xor    %eax,%eax
    }
  return pgdir;
}
80106d21:	5b                   	pop    %ebx
80106d22:	5e                   	pop    %esi
80106d23:	5d                   	pop    %ebp
80106d24:	c3                   	ret    
80106d25:	8d 76 00             	lea    0x0(%esi),%esi
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106d28:	31 c0                	xor    %eax,%eax
80106d2a:	eb d8                	jmp    80106d04 <setupkvm+0x54>
80106d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106d30 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106d30:	55                   	push   %ebp
80106d31:	89 e5                	mov    %esp,%ebp
80106d33:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106d36:	e8 75 ff ff ff       	call   80106cb0 <setupkvm>
80106d3b:	a3 c4 55 11 80       	mov    %eax,0x801155c4
80106d40:	05 00 00 00 80       	add    $0x80000000,%eax
80106d45:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106d48:	c9                   	leave  
80106d49:	c3                   	ret    
80106d4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106d50 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106d50:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106d51:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80106d53:	89 e5                	mov    %esp,%ebp
80106d55:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106d58:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d5b:	8b 45 08             	mov    0x8(%ebp),%eax
80106d5e:	e8 7d f8 ff ff       	call   801065e0 <walkpgdir>
  if(pte == 0)
80106d63:	85 c0                	test   %eax,%eax
80106d65:	74 05                	je     80106d6c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80106d67:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
80106d6a:	c9                   	leave  
80106d6b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
80106d6c:	83 ec 0c             	sub    $0xc,%esp
80106d6f:	68 ea 78 10 80       	push   $0x801078ea
80106d74:	e8 f7 95 ff ff       	call   80100370 <panic>
80106d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106d80 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80106d80:	55                   	push   %ebp
80106d81:	89 e5                	mov    %esp,%ebp
80106d83:	57                   	push   %edi
80106d84:	56                   	push   %esi
80106d85:	53                   	push   %ebx
80106d86:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80106d89:	e8 22 ff ff ff       	call   80106cb0 <setupkvm>
80106d8e:	85 c0                	test   %eax,%eax
80106d90:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106d93:	0f 84 b2 00 00 00    	je     80106e4b <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106d99:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106d9c:	85 c9                	test   %ecx,%ecx
80106d9e:	0f 84 9c 00 00 00    	je     80106e40 <copyuvm+0xc0>
80106da4:	31 f6                	xor    %esi,%esi
80106da6:	eb 4a                	jmp    80106df2 <copyuvm+0x72>
80106da8:	90                   	nop
80106da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80106db0:	83 ec 04             	sub    $0x4,%esp
80106db3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106db9:	68 00 10 00 00       	push   $0x1000
80106dbe:	57                   	push   %edi
80106dbf:	50                   	push   %eax
80106dc0:	e8 9b d7 ff ff       	call   80104560 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80106dc5:	58                   	pop    %eax
80106dc6:	5a                   	pop    %edx
80106dc7:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
80106dcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106dd0:	ff 75 e4             	pushl  -0x1c(%ebp)
80106dd3:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106dd8:	52                   	push   %edx
80106dd9:	89 f2                	mov    %esi,%edx
80106ddb:	e8 80 f8 ff ff       	call   80106660 <mappages>
80106de0:	83 c4 10             	add    $0x10,%esp
80106de3:	85 c0                	test   %eax,%eax
80106de5:	78 3e                	js     80106e25 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106de7:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106ded:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106df0:	76 4e                	jbe    80106e40 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
80106df2:	8b 45 08             	mov    0x8(%ebp),%eax
80106df5:	31 c9                	xor    %ecx,%ecx
80106df7:	89 f2                	mov    %esi,%edx
80106df9:	e8 e2 f7 ff ff       	call   801065e0 <walkpgdir>
80106dfe:	85 c0                	test   %eax,%eax
80106e00:	74 5a                	je     80106e5c <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
80106e02:	8b 18                	mov    (%eax),%ebx
80106e04:	f6 c3 01             	test   $0x1,%bl
80106e07:	74 46                	je     80106e4f <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e09:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
80106e0b:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106e11:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
80106e14:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
80106e1a:	e8 71 b6 ff ff       	call   80102490 <kalloc>
80106e1f:	85 c0                	test   %eax,%eax
80106e21:	89 c3                	mov    %eax,%ebx
80106e23:	75 8b                	jne    80106db0 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
80106e25:	83 ec 0c             	sub    $0xc,%esp
80106e28:	ff 75 e0             	pushl  -0x20(%ebp)
80106e2b:	e8 00 fe ff ff       	call   80106c30 <freevm>
  return 0;
80106e30:	83 c4 10             	add    $0x10,%esp
80106e33:	31 c0                	xor    %eax,%eax
}
80106e35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e38:	5b                   	pop    %ebx
80106e39:	5e                   	pop    %esi
80106e3a:	5f                   	pop    %edi
80106e3b:	5d                   	pop    %ebp
80106e3c:	c3                   	ret    
80106e3d:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80106e40:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80106e43:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e46:	5b                   	pop    %ebx
80106e47:	5e                   	pop    %esi
80106e48:	5f                   	pop    %edi
80106e49:	5d                   	pop    %ebp
80106e4a:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
80106e4b:	31 c0                	xor    %eax,%eax
80106e4d:	eb e6                	jmp    80106e35 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
80106e4f:	83 ec 0c             	sub    $0xc,%esp
80106e52:	68 0e 79 10 80       	push   $0x8010790e
80106e57:	e8 14 95 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
80106e5c:	83 ec 0c             	sub    $0xc,%esp
80106e5f:	68 f4 78 10 80       	push   $0x801078f4
80106e64:	e8 07 95 ff ff       	call   80100370 <panic>
80106e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e70 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106e70:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e71:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80106e73:	89 e5                	mov    %esp,%ebp
80106e75:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80106e78:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e7b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e7e:	e8 5d f7 ff ff       	call   801065e0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80106e83:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80106e85:	89 c2                	mov    %eax,%edx
80106e87:	83 e2 05             	and    $0x5,%edx
80106e8a:	83 fa 05             	cmp    $0x5,%edx
80106e8d:	75 11                	jne    80106ea0 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106e8f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80106e94:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80106e95:	05 00 00 00 80       	add    $0x80000000,%eax
}
80106e9a:	c3                   	ret    
80106e9b:	90                   	nop
80106e9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80106ea0:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80106ea2:	c9                   	leave  
80106ea3:	c3                   	ret    
80106ea4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106eaa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106eb0 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80106eb0:	55                   	push   %ebp
80106eb1:	89 e5                	mov    %esp,%ebp
80106eb3:	57                   	push   %edi
80106eb4:	56                   	push   %esi
80106eb5:	53                   	push   %ebx
80106eb6:	83 ec 1c             	sub    $0x1c,%esp
80106eb9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106ebc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106ebf:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106ec2:	85 db                	test   %ebx,%ebx
80106ec4:	75 40                	jne    80106f06 <copyout+0x56>
80106ec6:	eb 70                	jmp    80106f38 <copyout+0x88>
80106ec8:	90                   	nop
80106ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80106ed0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ed3:	89 f1                	mov    %esi,%ecx
80106ed5:	29 d1                	sub    %edx,%ecx
80106ed7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106edd:	39 d9                	cmp    %ebx,%ecx
80106edf:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
80106ee2:	29 f2                	sub    %esi,%edx
80106ee4:	83 ec 04             	sub    $0x4,%esp
80106ee7:	01 d0                	add    %edx,%eax
80106ee9:	51                   	push   %ecx
80106eea:	57                   	push   %edi
80106eeb:	50                   	push   %eax
80106eec:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80106eef:	e8 6c d6 ff ff       	call   80104560 <memmove>
    len -= n;
    buf += n;
80106ef4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106ef7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
80106efa:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
80106f00:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80106f02:	29 cb                	sub    %ecx,%ebx
80106f04:	74 32                	je     80106f38 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
80106f06:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f08:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
80106f0b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80106f0e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
80106f14:	56                   	push   %esi
80106f15:	ff 75 08             	pushl  0x8(%ebp)
80106f18:	e8 53 ff ff ff       	call   80106e70 <uva2ka>
    if(pa0 == 0)
80106f1d:	83 c4 10             	add    $0x10,%esp
80106f20:	85 c0                	test   %eax,%eax
80106f22:	75 ac                	jne    80106ed0 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106f24:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
80106f27:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
80106f2c:	5b                   	pop    %ebx
80106f2d:	5e                   	pop    %esi
80106f2e:	5f                   	pop    %edi
80106f2f:	5d                   	pop    %ebp
80106f30:	c3                   	ret    
80106f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f38:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
80106f3b:	31 c0                	xor    %eax,%eax
}
80106f3d:	5b                   	pop    %ebx
80106f3e:	5e                   	pop    %esi
80106f3f:	5f                   	pop    %edi
80106f40:	5d                   	pop    %ebp
80106f41:	c3                   	ret    
