
_hello:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int args, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
	if(args > 1)
  11:	83 39 01             	cmpl   $0x1,(%ecx)
{
  14:	8b 41 04             	mov    0x4(%ecx),%eax
	if(args > 1)
  17:	7e 18                	jle    31 <main+0x31>
		printf(1, "Hello, %s!\n", argv[1]);
  19:	52                   	push   %edx
  1a:	ff 70 04             	push   0x4(%eax)
  1d:	68 e8 06 00 00       	push   $0x6e8
  22:	6a 01                	push   $0x1
  24:	e8 b7 03 00 00       	call   3e0 <printf>
  29:	83 c4 10             	add    $0x10,%esp
	else
		printf(1,"Hello, xv6 User!\n");
	exit();
  2c:	e8 62 02 00 00       	call   293 <exit>
		printf(1,"Hello, xv6 User!\n");
  31:	50                   	push   %eax
  32:	50                   	push   %eax
  33:	68 f4 06 00 00       	push   $0x6f4
  38:	6a 01                	push   $0x1
  3a:	e8 a1 03 00 00       	call   3e0 <printf>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	eb e8                	jmp    2c <main+0x2c>
  44:	66 90                	xchg   %ax,%ax
  46:	66 90                	xchg   %ax,%ax
  48:	66 90                	xchg   %ax,%ax
  4a:	66 90                	xchg   %ax,%ax
  4c:	66 90                	xchg   %ax,%ax
  4e:	66 90                	xchg   %ax,%ax

00000050 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  50:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  51:	31 c0                	xor    %eax,%eax
{
  53:	89 e5                	mov    %esp,%ebp
  55:	53                   	push   %ebx
  56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  59:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  60:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  64:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  67:	83 c0 01             	add    $0x1,%eax
  6a:	84 d2                	test   %dl,%dl
  6c:	75 f2                	jne    60 <strcpy+0x10>
    ;
  return os;
}
  6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  71:	89 c8                	mov    %ecx,%eax
  73:	c9                   	leave
  74:	c3                   	ret
  75:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  7c:	00 
  7d:	8d 76 00             	lea    0x0(%esi),%esi

00000080 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 55 08             	mov    0x8(%ebp),%edx
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  8a:	0f b6 02             	movzbl (%edx),%eax
  8d:	84 c0                	test   %al,%al
  8f:	75 17                	jne    a8 <strcmp+0x28>
  91:	eb 3a                	jmp    cd <strcmp+0x4d>
  93:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
  98:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  9c:	83 c2 01             	add    $0x1,%edx
  9f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  a2:	84 c0                	test   %al,%al
  a4:	74 1a                	je     c0 <strcmp+0x40>
  a6:	89 d9                	mov    %ebx,%ecx
  a8:	0f b6 19             	movzbl (%ecx),%ebx
  ab:	38 c3                	cmp    %al,%bl
  ad:	74 e9                	je     98 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  af:	29 d8                	sub    %ebx,%eax
}
  b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b4:	c9                   	leave
  b5:	c3                   	ret
  b6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  bd:	00 
  be:	66 90                	xchg   %ax,%ax
  return (uchar)*p - (uchar)*q;
  c0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  c4:	31 c0                	xor    %eax,%eax
  c6:	29 d8                	sub    %ebx,%eax
}
  c8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  cb:	c9                   	leave
  cc:	c3                   	ret
  return (uchar)*p - (uchar)*q;
  cd:	0f b6 19             	movzbl (%ecx),%ebx
  d0:	31 c0                	xor    %eax,%eax
  d2:	eb db                	jmp    af <strcmp+0x2f>
  d4:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  db:	00 
  dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 3a 00             	cmpb   $0x0,(%edx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 c0                	xor    %eax,%eax
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c0 01             	add    $0x1,%eax
  f3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  f7:	89 c1                	mov    %eax,%ecx
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	89 c8                	mov    %ecx,%eax
  fd:	5d                   	pop    %ebp
  fe:	c3                   	ret
  ff:	90                   	nop
  for(n = 0; s[n]; n++)
 100:	31 c9                	xor    %ecx,%ecx
}
 102:	5d                   	pop    %ebp
 103:	89 c8                	mov    %ecx,%eax
 105:	c3                   	ret
 106:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 10d:	00 
 10e:	66 90                	xchg   %ax,%ax

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	8b 7d fc             	mov    -0x4(%ebp),%edi
 125:	89 d0                	mov    %edx,%eax
 127:	c9                   	leave
 128:	c3                   	ret
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	8b 45 08             	mov    0x8(%ebp),%eax
 136:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	75 12                	jne    153 <strchr+0x23>
 141:	eb 1d                	jmp    160 <strchr+0x30>
 143:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 148:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 14c:	83 c0 01             	add    $0x1,%eax
 14f:	84 d2                	test   %dl,%dl
 151:	74 0d                	je     160 <strchr+0x30>
    if(*s == c)
 153:	38 d1                	cmp    %dl,%cl
 155:	75 f1                	jne    148 <strchr+0x18>
      return (char*)s;
  return 0;
}
 157:	5d                   	pop    %ebp
 158:	c3                   	ret
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 160:	31 c0                	xor    %eax,%eax
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret
 164:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 16b:	00 
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 175:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
 178:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 179:	31 db                	xor    %ebx,%ebx
{
 17b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 17e:	eb 27                	jmp    1a7 <gets+0x37>
    cc = read(0, &c, 1);
 180:	83 ec 04             	sub    $0x4,%esp
 183:	6a 01                	push   $0x1
 185:	56                   	push   %esi
 186:	6a 00                	push   $0x0
 188:	e8 1e 01 00 00       	call   2ab <read>
    if(cc < 1)
 18d:	83 c4 10             	add    $0x10,%esp
 190:	85 c0                	test   %eax,%eax
 192:	7e 1d                	jle    1b1 <gets+0x41>
      break;
    buf[i++] = c;
 194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 198:	8b 55 08             	mov    0x8(%ebp),%edx
 19b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 19f:	3c 0a                	cmp    $0xa,%al
 1a1:	74 10                	je     1b3 <gets+0x43>
 1a3:	3c 0d                	cmp    $0xd,%al
 1a5:	74 0c                	je     1b3 <gets+0x43>
  for(i=0; i+1 < max; ){
 1a7:	89 df                	mov    %ebx,%edi
 1a9:	83 c3 01             	add    $0x1,%ebx
 1ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1af:	7c cf                	jl     180 <gets+0x10>
 1b1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
 1ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bd:	5b                   	pop    %ebx
 1be:	5e                   	pop    %esi
 1bf:	5f                   	pop    %edi
 1c0:	5d                   	pop    %ebp
 1c1:	c3                   	ret
 1c2:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 1c9:	00 
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d5:	83 ec 08             	sub    $0x8,%esp
 1d8:	6a 00                	push   $0x0
 1da:	ff 75 08             	push   0x8(%ebp)
 1dd:	e8 f1 00 00 00       	call   2d3 <open>
  if(fd < 0)
 1e2:	83 c4 10             	add    $0x10,%esp
 1e5:	85 c0                	test   %eax,%eax
 1e7:	78 27                	js     210 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1e9:	83 ec 08             	sub    $0x8,%esp
 1ec:	ff 75 0c             	push   0xc(%ebp)
 1ef:	89 c3                	mov    %eax,%ebx
 1f1:	50                   	push   %eax
 1f2:	e8 f4 00 00 00       	call   2eb <fstat>
  close(fd);
 1f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1fa:	89 c6                	mov    %eax,%esi
  close(fd);
 1fc:	e8 ba 00 00 00       	call   2bb <close>
  return r;
 201:	83 c4 10             	add    $0x10,%esp
}
 204:	8d 65 f8             	lea    -0x8(%ebp),%esp
 207:	89 f0                	mov    %esi,%eax
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret
 20d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 210:	be ff ff ff ff       	mov    $0xffffffff,%esi
 215:	eb ed                	jmp    204 <stat+0x34>
 217:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 21e:	00 
 21f:	90                   	nop

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	53                   	push   %ebx
 224:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 227:	0f be 02             	movsbl (%edx),%eax
 22a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 22d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 230:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 235:	77 1e                	ja     255 <atoi+0x35>
 237:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 23e:	00 
 23f:	90                   	nop
    n = n*10 + *s++ - '0';
 240:	83 c2 01             	add    $0x1,%edx
 243:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 246:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 24a:	0f be 02             	movsbl (%edx),%eax
 24d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 250:	80 fb 09             	cmp    $0x9,%bl
 253:	76 eb                	jbe    240 <atoi+0x20>
  return n;
}
 255:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 258:	89 c8                	mov    %ecx,%eax
 25a:	c9                   	leave
 25b:	c3                   	ret
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 45 10             	mov    0x10(%ebp),%eax
 267:	8b 55 08             	mov    0x8(%ebp),%edx
 26a:	56                   	push   %esi
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 c0                	test   %eax,%eax
 270:	7e 13                	jle    285 <memmove+0x25>
 272:	01 d0                	add    %edx,%eax
  dst = vdst;
 274:	89 d7                	mov    %edx,%edi
 276:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 27d:	00 
 27e:	66 90                	xchg   %ax,%ax
    *dst++ = *src++;
 280:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 281:	39 f8                	cmp    %edi,%eax
 283:	75 fb                	jne    280 <memmove+0x20>
  return vdst;
}
 285:	5e                   	pop    %esi
 286:	89 d0                	mov    %edx,%eax
 288:	5f                   	pop    %edi
 289:	5d                   	pop    %ebp
 28a:	c3                   	ret

0000028b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28b:	b8 01 00 00 00       	mov    $0x1,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret

00000293 <exit>:
SYSCALL(exit)
 293:	b8 02 00 00 00       	mov    $0x2,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret

0000029b <wait>:
SYSCALL(wait)
 29b:	b8 03 00 00 00       	mov    $0x3,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret

000002a3 <pipe>:
SYSCALL(pipe)
 2a3:	b8 04 00 00 00       	mov    $0x4,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret

000002ab <read>:
SYSCALL(read)
 2ab:	b8 05 00 00 00       	mov    $0x5,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret

000002b3 <write>:
SYSCALL(write)
 2b3:	b8 10 00 00 00       	mov    $0x10,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret

000002bb <close>:
SYSCALL(close)
 2bb:	b8 15 00 00 00       	mov    $0x15,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret

000002c3 <kill>:
SYSCALL(kill)
 2c3:	b8 06 00 00 00       	mov    $0x6,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret

000002cb <exec>:
SYSCALL(exec)
 2cb:	b8 07 00 00 00       	mov    $0x7,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret

000002d3 <open>:
SYSCALL(open)
 2d3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret

000002db <mknod>:
SYSCALL(mknod)
 2db:	b8 11 00 00 00       	mov    $0x11,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret

000002e3 <unlink>:
SYSCALL(unlink)
 2e3:	b8 12 00 00 00       	mov    $0x12,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret

000002eb <fstat>:
SYSCALL(fstat)
 2eb:	b8 08 00 00 00       	mov    $0x8,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret

000002f3 <link>:
SYSCALL(link)
 2f3:	b8 13 00 00 00       	mov    $0x13,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret

000002fb <mkdir>:
SYSCALL(mkdir)
 2fb:	b8 14 00 00 00       	mov    $0x14,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret

00000303 <chdir>:
SYSCALL(chdir)
 303:	b8 09 00 00 00       	mov    $0x9,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret

0000030b <dup>:
SYSCALL(dup)
 30b:	b8 0a 00 00 00       	mov    $0xa,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret

00000313 <getpid>:
SYSCALL(getpid)
 313:	b8 0b 00 00 00       	mov    $0xb,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret

0000031b <sbrk>:
SYSCALL(sbrk)
 31b:	b8 0c 00 00 00       	mov    $0xc,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret

00000323 <sleep>:
SYSCALL(sleep)
 323:	b8 0d 00 00 00       	mov    $0xd,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret

0000032b <uptime>:
SYSCALL(uptime)
 32b:	b8 0e 00 00 00       	mov    $0xe,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret

00000333 <trace>:
SYSCALL(trace)
 333:	b8 16 00 00 00       	mov    $0x16,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret
 33b:	66 90                	xchg   %ax,%ax
 33d:	66 90                	xchg   %ax,%ax
 33f:	90                   	nop

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
 346:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 348:	89 d1                	mov    %edx,%ecx
{
 34a:	83 ec 3c             	sub    $0x3c,%esp
 34d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
 350:	85 d2                	test   %edx,%edx
 352:	0f 89 80 00 00 00    	jns    3d8 <printint+0x98>
 358:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 35c:	74 7a                	je     3d8 <printint+0x98>
    x = -xx;
 35e:	f7 d9                	neg    %ecx
    neg = 1;
 360:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
 365:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 368:	31 f6                	xor    %esi,%esi
 36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 370:	89 c8                	mov    %ecx,%eax
 372:	31 d2                	xor    %edx,%edx
 374:	89 f7                	mov    %esi,%edi
 376:	f7 f3                	div    %ebx
 378:	8d 76 01             	lea    0x1(%esi),%esi
 37b:	0f b6 92 68 07 00 00 	movzbl 0x768(%edx),%edx
 382:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
 386:	89 ca                	mov    %ecx,%edx
 388:	89 c1                	mov    %eax,%ecx
 38a:	39 da                	cmp    %ebx,%edx
 38c:	73 e2                	jae    370 <printint+0x30>
  if(neg)
 38e:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 391:	85 c0                	test   %eax,%eax
 393:	74 07                	je     39c <printint+0x5c>
    buf[i++] = '-';
 395:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)

  while(--i >= 0)
 39a:	89 f7                	mov    %esi,%edi
 39c:	8d 5d d8             	lea    -0x28(%ebp),%ebx
 39f:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3a2:	01 df                	add    %ebx,%edi
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    putc(fd, buf[i]);
 3a8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
 3ab:	83 ec 04             	sub    $0x4,%esp
 3ae:	88 45 d7             	mov    %al,-0x29(%ebp)
 3b1:	8d 45 d7             	lea    -0x29(%ebp),%eax
 3b4:	6a 01                	push   $0x1
 3b6:	50                   	push   %eax
 3b7:	56                   	push   %esi
 3b8:	e8 f6 fe ff ff       	call   2b3 <write>
  while(--i >= 0)
 3bd:	89 f8                	mov    %edi,%eax
 3bf:	83 c4 10             	add    $0x10,%esp
 3c2:	83 ef 01             	sub    $0x1,%edi
 3c5:	39 c3                	cmp    %eax,%ebx
 3c7:	75 df                	jne    3a8 <printint+0x68>
}
 3c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3cc:	5b                   	pop    %ebx
 3cd:	5e                   	pop    %esi
 3ce:	5f                   	pop    %edi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3d8:	31 c0                	xor    %eax,%eax
 3da:	eb 89                	jmp    365 <printint+0x25>
 3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3e9:	8b 75 0c             	mov    0xc(%ebp),%esi
{
 3ec:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
 3ef:	0f b6 1e             	movzbl (%esi),%ebx
 3f2:	83 c6 01             	add    $0x1,%esi
 3f5:	84 db                	test   %bl,%bl
 3f7:	74 67                	je     460 <printf+0x80>
 3f9:	8d 4d 10             	lea    0x10(%ebp),%ecx
 3fc:	31 d2                	xor    %edx,%edx
 3fe:	89 4d d0             	mov    %ecx,-0x30(%ebp)
 401:	eb 34                	jmp    437 <printf+0x57>
 403:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
 408:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 40b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 410:	83 f8 25             	cmp    $0x25,%eax
 413:	74 18                	je     42d <printf+0x4d>
  write(fd, &c, 1);
 415:	83 ec 04             	sub    $0x4,%esp
 418:	8d 45 e7             	lea    -0x19(%ebp),%eax
 41b:	88 5d e7             	mov    %bl,-0x19(%ebp)
 41e:	6a 01                	push   $0x1
 420:	50                   	push   %eax
 421:	57                   	push   %edi
 422:	e8 8c fe ff ff       	call   2b3 <write>
 427:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 42a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 42d:	0f b6 1e             	movzbl (%esi),%ebx
 430:	83 c6 01             	add    $0x1,%esi
 433:	84 db                	test   %bl,%bl
 435:	74 29                	je     460 <printf+0x80>
    c = fmt[i] & 0xff;
 437:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 43a:	85 d2                	test   %edx,%edx
 43c:	74 ca                	je     408 <printf+0x28>
      }
    } else if(state == '%'){
 43e:	83 fa 25             	cmp    $0x25,%edx
 441:	75 ea                	jne    42d <printf+0x4d>
      if(c == 'd'){
 443:	83 f8 25             	cmp    $0x25,%eax
 446:	0f 84 04 01 00 00    	je     550 <printf+0x170>
 44c:	83 e8 63             	sub    $0x63,%eax
 44f:	83 f8 15             	cmp    $0x15,%eax
 452:	77 1c                	ja     470 <printf+0x90>
 454:	ff 24 85 10 07 00 00 	jmp    *0x710(,%eax,4)
 45b:	2e 8d 74 26 00       	lea    %cs:0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 460:	8d 65 f4             	lea    -0xc(%ebp),%esp
 463:	5b                   	pop    %ebx
 464:	5e                   	pop    %esi
 465:	5f                   	pop    %edi
 466:	5d                   	pop    %ebp
 467:	c3                   	ret
 468:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 46f:	00 
  write(fd, &c, 1);
 470:	83 ec 04             	sub    $0x4,%esp
 473:	8d 55 e7             	lea    -0x19(%ebp),%edx
 476:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 47a:	6a 01                	push   $0x1
 47c:	52                   	push   %edx
 47d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 480:	57                   	push   %edi
 481:	e8 2d fe ff ff       	call   2b3 <write>
 486:	83 c4 0c             	add    $0xc,%esp
 489:	88 5d e7             	mov    %bl,-0x19(%ebp)
 48c:	6a 01                	push   $0x1
 48e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 491:	52                   	push   %edx
 492:	57                   	push   %edi
 493:	e8 1b fe ff ff       	call   2b3 <write>
        putc(fd, c);
 498:	83 c4 10             	add    $0x10,%esp
      state = 0;
 49b:	31 d2                	xor    %edx,%edx
 49d:	eb 8e                	jmp    42d <printf+0x4d>
 49f:	90                   	nop
        printint(fd, *ap, 16, 0);
 4a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4a3:	83 ec 0c             	sub    $0xc,%esp
 4a6:	b9 10 00 00 00       	mov    $0x10,%ecx
 4ab:	8b 13                	mov    (%ebx),%edx
 4ad:	6a 00                	push   $0x0
 4af:	89 f8                	mov    %edi,%eax
        ap++;
 4b1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
 4b4:	e8 87 fe ff ff       	call   340 <printint>
        ap++;
 4b9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 4bc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4bf:	31 d2                	xor    %edx,%edx
 4c1:	e9 67 ff ff ff       	jmp    42d <printf+0x4d>
        s = (char*)*ap;
 4c6:	8b 45 d0             	mov    -0x30(%ebp),%eax
 4c9:	8b 18                	mov    (%eax),%ebx
        ap++;
 4cb:	83 c0 04             	add    $0x4,%eax
 4ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 4d1:	85 db                	test   %ebx,%ebx
 4d3:	0f 84 87 00 00 00    	je     560 <printf+0x180>
        while(*s != 0){
 4d9:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 4dc:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 4de:	84 c0                	test   %al,%al
 4e0:	0f 84 47 ff ff ff    	je     42d <printf+0x4d>
 4e6:	8d 55 e7             	lea    -0x19(%ebp),%edx
 4e9:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 4ec:	89 de                	mov    %ebx,%esi
 4ee:	89 d3                	mov    %edx,%ebx
  write(fd, &c, 1);
 4f0:	83 ec 04             	sub    $0x4,%esp
 4f3:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
 4f6:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4f9:	6a 01                	push   $0x1
 4fb:	53                   	push   %ebx
 4fc:	57                   	push   %edi
 4fd:	e8 b1 fd ff ff       	call   2b3 <write>
        while(*s != 0){
 502:	0f b6 06             	movzbl (%esi),%eax
 505:	83 c4 10             	add    $0x10,%esp
 508:	84 c0                	test   %al,%al
 50a:	75 e4                	jne    4f0 <printf+0x110>
      state = 0;
 50c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
 50f:	31 d2                	xor    %edx,%edx
 511:	e9 17 ff ff ff       	jmp    42d <printf+0x4d>
        printint(fd, *ap, 10, 1);
 516:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 519:	83 ec 0c             	sub    $0xc,%esp
 51c:	b9 0a 00 00 00       	mov    $0xa,%ecx
 521:	8b 13                	mov    (%ebx),%edx
 523:	6a 01                	push   $0x1
 525:	eb 88                	jmp    4af <printf+0xcf>
        putc(fd, *ap);
 527:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 52a:	83 ec 04             	sub    $0x4,%esp
 52d:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
 530:	8b 03                	mov    (%ebx),%eax
        ap++;
 532:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
 535:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 538:	6a 01                	push   $0x1
 53a:	52                   	push   %edx
 53b:	57                   	push   %edi
 53c:	e8 72 fd ff ff       	call   2b3 <write>
        ap++;
 541:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 544:	83 c4 10             	add    $0x10,%esp
      state = 0;
 547:	31 d2                	xor    %edx,%edx
 549:	e9 df fe ff ff       	jmp    42d <printf+0x4d>
 54e:	66 90                	xchg   %ax,%ax
  write(fd, &c, 1);
 550:	83 ec 04             	sub    $0x4,%esp
 553:	88 5d e7             	mov    %bl,-0x19(%ebp)
 556:	8d 55 e7             	lea    -0x19(%ebp),%edx
 559:	6a 01                	push   $0x1
 55b:	e9 31 ff ff ff       	jmp    491 <printf+0xb1>
 560:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
 565:	bb 06 07 00 00       	mov    $0x706,%ebx
 56a:	e9 77 ff ff ff       	jmp    4e6 <printf+0x106>
 56f:	90                   	nop

00000570 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 570:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 571:	a1 04 0a 00 00       	mov    0xa04,%eax
{
 576:	89 e5                	mov    %esp,%ebp
 578:	57                   	push   %edi
 579:	56                   	push   %esi
 57a:	53                   	push   %ebx
 57b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 57e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 581:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 588:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 58a:	39 c8                	cmp    %ecx,%eax
 58c:	73 32                	jae    5c0 <free+0x50>
 58e:	39 d1                	cmp    %edx,%ecx
 590:	72 04                	jb     596 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 592:	39 d0                	cmp    %edx,%eax
 594:	72 32                	jb     5c8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 596:	8b 73 fc             	mov    -0x4(%ebx),%esi
 599:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 59c:	39 fa                	cmp    %edi,%edx
 59e:	74 30                	je     5d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 5a0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 5a3:	8b 50 04             	mov    0x4(%eax),%edx
 5a6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5a9:	39 f1                	cmp    %esi,%ecx
 5ab:	74 3a                	je     5e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 5ad:	89 08                	mov    %ecx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 5af:	5b                   	pop    %ebx
  freep = p;
 5b0:	a3 04 0a 00 00       	mov    %eax,0xa04
}
 5b5:	5e                   	pop    %esi
 5b6:	5f                   	pop    %edi
 5b7:	5d                   	pop    %ebp
 5b8:	c3                   	ret
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c0:	39 d0                	cmp    %edx,%eax
 5c2:	72 04                	jb     5c8 <free+0x58>
 5c4:	39 d1                	cmp    %edx,%ecx
 5c6:	72 ce                	jb     596 <free+0x26>
{
 5c8:	89 d0                	mov    %edx,%eax
 5ca:	eb bc                	jmp    588 <free+0x18>
 5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 5d0:	03 72 04             	add    0x4(%edx),%esi
 5d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5d6:	8b 10                	mov    (%eax),%edx
 5d8:	8b 12                	mov    (%edx),%edx
 5da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5dd:	8b 50 04             	mov    0x4(%eax),%edx
 5e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5e3:	39 f1                	cmp    %esi,%ecx
 5e5:	75 c6                	jne    5ad <free+0x3d>
    p->s.size += bp->s.size;
 5e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 5ea:	a3 04 0a 00 00       	mov    %eax,0xa04
    p->s.size += bp->s.size;
 5ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 5f2:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 5f5:	89 08                	mov    %ecx,(%eax)
}
 5f7:	5b                   	pop    %ebx
 5f8:	5e                   	pop    %esi
 5f9:	5f                   	pop    %edi
 5fa:	5d                   	pop    %ebp
 5fb:	c3                   	ret
 5fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000600 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	57                   	push   %edi
 604:	56                   	push   %esi
 605:	53                   	push   %ebx
 606:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 609:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 60c:	8b 15 04 0a 00 00    	mov    0xa04,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 612:	8d 78 07             	lea    0x7(%eax),%edi
 615:	c1 ef 03             	shr    $0x3,%edi
 618:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 61b:	85 d2                	test   %edx,%edx
 61d:	0f 84 8d 00 00 00    	je     6b0 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 623:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 625:	8b 48 04             	mov    0x4(%eax),%ecx
 628:	39 f9                	cmp    %edi,%ecx
 62a:	73 64                	jae    690 <malloc+0x90>
  if(nu < 4096)
 62c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 631:	39 df                	cmp    %ebx,%edi
 633:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 636:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 63d:	eb 0a                	jmp    649 <malloc+0x49>
 63f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 640:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 642:	8b 48 04             	mov    0x4(%eax),%ecx
 645:	39 f9                	cmp    %edi,%ecx
 647:	73 47                	jae    690 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 649:	89 c2                	mov    %eax,%edx
 64b:	3b 05 04 0a 00 00    	cmp    0xa04,%eax
 651:	75 ed                	jne    640 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
 653:	83 ec 0c             	sub    $0xc,%esp
 656:	56                   	push   %esi
 657:	e8 bf fc ff ff       	call   31b <sbrk>
  if(p == (char*)-1)
 65c:	83 c4 10             	add    $0x10,%esp
 65f:	83 f8 ff             	cmp    $0xffffffff,%eax
 662:	74 1c                	je     680 <malloc+0x80>
  hp->s.size = nu;
 664:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 667:	83 ec 0c             	sub    $0xc,%esp
 66a:	83 c0 08             	add    $0x8,%eax
 66d:	50                   	push   %eax
 66e:	e8 fd fe ff ff       	call   570 <free>
  return freep;
 673:	8b 15 04 0a 00 00    	mov    0xa04,%edx
      if((p = morecore(nunits)) == 0)
 679:	83 c4 10             	add    $0x10,%esp
 67c:	85 d2                	test   %edx,%edx
 67e:	75 c0                	jne    640 <malloc+0x40>
        return 0;
  }
}
 680:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 683:	31 c0                	xor    %eax,%eax
}
 685:	5b                   	pop    %ebx
 686:	5e                   	pop    %esi
 687:	5f                   	pop    %edi
 688:	5d                   	pop    %ebp
 689:	c3                   	ret
 68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 690:	39 cf                	cmp    %ecx,%edi
 692:	74 4c                	je     6e0 <malloc+0xe0>
        p->s.size -= nunits;
 694:	29 f9                	sub    %edi,%ecx
 696:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 699:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 69c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 69f:	89 15 04 0a 00 00    	mov    %edx,0xa04
}
 6a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6a8:	83 c0 08             	add    $0x8,%eax
}
 6ab:	5b                   	pop    %ebx
 6ac:	5e                   	pop    %esi
 6ad:	5f                   	pop    %edi
 6ae:	5d                   	pop    %ebp
 6af:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
 6b0:	c7 05 04 0a 00 00 08 	movl   $0xa08,0xa04
 6b7:	0a 00 00 
    base.s.size = 0;
 6ba:	b8 08 0a 00 00       	mov    $0xa08,%eax
    base.s.ptr = freep = prevp = &base;
 6bf:	c7 05 08 0a 00 00 08 	movl   $0xa08,0xa08
 6c6:	0a 00 00 
    base.s.size = 0;
 6c9:	c7 05 0c 0a 00 00 00 	movl   $0x0,0xa0c
 6d0:	00 00 00 
    if(p->s.size >= nunits){
 6d3:	e9 54 ff ff ff       	jmp    62c <malloc+0x2c>
 6d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
 6df:	00 
        prevp->s.ptr = p->s.ptr;
 6e0:	8b 08                	mov    (%eax),%ecx
 6e2:	89 0a                	mov    %ecx,(%edx)
 6e4:	eb b9                	jmp    69f <malloc+0x9f>
