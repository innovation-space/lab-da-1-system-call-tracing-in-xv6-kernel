# xv6 System Call Tracer

## Objective

The goal of this task was to understand how xv6 handles system calls and to build a small `strace`-like tracer.

The tracer lets a user program turn syscall logging on or off using:

```c
trace(1);   // enable tracing
trace(0);   // disable tracing
```

When tracing is enabled, xv6 prints the system calls made by that process.

---

## 1. Understanding the xv6 syscall path

Before changing the code, we looked at how a normal system call travels through xv6.

The basic path is:

```text
User program
    |
    | system call
    v
usys.S
    |
    v
trap into kernel
    |
    v
syscall()
    |
    v
syscalls[number]
    |
    v
system call handler
```

For example, `getpid()` eventually reaches `sys_getpid()` through the syscall table.

The syscall numbers are stored in `syscall.h`.

---

## 2. Adding a new syscall number

The existing xv6-public version had system calls numbered from 1 to 21.

The last existing syscall was:

```c
#define SYS_close 21
```

So we added:

```c
#define SYS_trace 22
```

in `syscall.h`.

This gives the new syscall its kernel-visible number.

---

## 3. Adding a tracing flag to each process

The tracing state should belong to a process, not to the whole CPU or kernel.

So we added this field to `struct proc` in `proc.h`:

```c
int tracing;
```

This means every process has its own tracing state.

We also initialized it to zero in `allocproc()` in `proc.c`:

```c
p->tracing = 0;
```

Therefore, tracing is disabled by default.

---

## 4. Implementing `sys_trace()`

The actual kernel implementation was added to `sysproc.c`.

```c
int
sys_trace(void)
{
  int on;

  if(argint(0, &on) < 0)
    return -1;

  myproc()->tracing = on;

  return 0;
}
```

The syscall accepts one integer:

```text
trace(1) -> enable tracing
trace(0) -> disable tracing
```

`myproc()` gives us the currently running process, so only that process's tracing flag is changed.

---

## 5. Registering the syscall

The kernel needs to know which function belongs to syscall number 22.

In `syscall.c`, we added:

```c
extern int sys_trace(void);
```

and added the function to the syscall table:

```c
[SYS_trace] sys_trace,
```

Now the kernel can do:

```text
22
 |
 v
syscalls[22]
 |
 v
sys_trace()
```

---

## 6. Making `trace()` available to user programs

A user program needs to be able to call:

```c
trace(1);
```

So we added this declaration to `user.h`:

```c
int trace(int);
```

We also added the syscall stub to `usys.S`:

```asm
SYSCALL(trace)
```

This connects the normal C function call to the kernel syscall mechanism.

The complete path is now:

```text
trace(1)
   |
   v
user.h
   |
   v
usys.S
   |
   v
SYS_trace = 22
   |
   v
syscall()
   |
   v
sys_trace()
```

---

## 7. Giving syscalls readable names

The kernel knows syscalls by number, but numbers are not very useful when reading logs.

For example:

```text
16
```

is less useful than:

```text
write
```

So we created a syscall-name table in `syscall.c`.

For example:

```c
[SYS_fork]   "fork",
[SYS_read]   "read",
[SYS_write]  "write",
[SYS_getpid] "getpid",
[SYS_trace]  "trace",
```

This lets the tracer print the syscall name.

---

## 8. Instrumenting `syscall()`

The main tracing logic was added to `syscall()` in `syscall.c`.

Normally xv6 does:

```c
curproc->tf->eax = syscalls[num]();
```

We changed it so that after the syscall runs, xv6 checks whether tracing is enabled:

```c
curproc->tf->eax = syscalls[num]();

if(curproc->tracing){
  cprintf("%d: syscall %s -> %d\n",
          curproc->pid,
          syscallnames[num],
          curproc->tf->eax);
}
```

The output contains:

1. Process ID
2. Syscall name
3. Return value

For example:

```text
3: syscall getpid -> 3
```

This means process 3 called `getpid()` and it returned 3.

---

## 9. Creating a test program

We created `trace_test.c` to test the feature.

The test enables tracing, performs some system calls, and then disables tracing.

The important part is:

```c
trace(1);

pid = getpid();
printf(1, "My PID is %d\n", pid);

trace(0);

printf(1, "Tracing is now disabled\n");
```

We also added `_trace_test` to `UPROGS` in the `Makefile`.

This makes the program part of the xv6 filesystem.

---

## 10. Building and testing

After making the changes, xv6 was rebuilt successfully with:

```bash
make clean
make
```

We then booted xv6 using:

```bash
make qemu-nox
```

Inside xv6, we ran:

```text
$ trace_test
```

The tracer produced output similar to:

```text
3: syscall trace -> 0
3: syscall getpid -> 3
3: syscall write -> 1
...
Tracing is now disabled
$
```

---

## 11. What the output proves

The output shows that the implementation is working.

### `trace(1)` enables tracing

```text
3: syscall trace -> 0
```

The process enabled tracing successfully.

### Normal system calls are logged

For example:

```text
3: syscall getpid -> 3
3: syscall write -> 1
```

The process's system calls are being intercepted by the kernel's `syscall()` function.

### `trace(0)` disables tracing

After tracing is disabled, the following output:

```text
Tracing is now disabled
```

does not generate another tracer line.

This proves that tracing can be turned off again.

---

## 12. Complete syscall interface

The original xv6 system calls were:

| Number | Syscall | Handler |
|---:|---|---|
| 1 | fork | sys_fork |
| 2 | exit | sys_exit |
| 3 | wait | sys_wait |
| 4 | pipe | sys_pipe |
| 5 | read | sys_read |
| 6 | kill | sys_kill |
| 7 | exec | sys_exec |
| 8 | fstat | sys_fstat |
| 9 | chdir | sys_chdir |
| 10 | dup | sys_dup |
| 11 | getpid | sys_getpid |
| 12 | sbrk | sys_sbrk |
| 13 | sleep | sys_sleep |
| 14 | uptime | sys_uptime |
| 15 | open | sys_open |
| 16 | write | sys_write |
| 17 | mknod | sys_mknod |
| 18 | unlink | sys_unlink |
| 19 | link | sys_link |
| 20 | mkdir | sys_mkdir |
| 21 | close | sys_close |
| 22 | trace | sys_trace |

---

## 13. Files changed

The following files were modified:

```text
syscall.h   -> added SYS_trace
proc.h      -> added per-process tracing flag
proc.c      -> initialized tracing to 0
sysproc.c   -> implemented sys_trace()
syscall.c   -> registered trace and added logging
user.h      -> added trace() declaration
usys.S      -> added trace syscall stub
Makefile    -> added trace_test
trace_test.c -> test program
```

---

## 14. Final design

The final design is:

```text
                  USER PROGRAM
                       |
                    trace(1)
                       |
                       v
                    usys.S
                       |
                       v
                  syscall number
                       |
                       v
                +--------------+
                |  syscall()   |
                +--------------+
                       |
                       v
                syscalls[num]
                       |
                       v
                  syscall runs
                       |
                       v
              tracing == 1 ?
                  /       \
                yes        no
                 |          |
                 v          |
              cprintf()     |
                 |          |
                 +----------+
                       |
                       v
                  return to user
```

The important idea is that **all user-space system calls pass through the same `syscall()` dispatcher**. By adding the tracing check there, we can observe every system call without modifying each individual syscall implementation.

---

## Conclusion

The task showed how xv6 provides a narrow interface between user programs and the kernel.

We added a new `trace(int on)` system call and used the existing `syscall()` dispatcher as the single point for logging.

The result is a minimal syscall tracer that:

- Works on a per-process basis
- Can be enabled with `trace(1)`
- Can be disabled with `trace(0)`
- Prints the syscall name
- Prints the process ID
- Prints the syscall return value
- Uses the existing xv6 syscall dispatch mechanism
