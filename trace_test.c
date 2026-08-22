#include "types.h"
#include "stat.h"
#include "user.h"

int
main(void)
{
  int pid;

  trace(1);

  pid = getpid();
  printf(1, "My PID is %d\n", pid);

  trace(0);

  printf(1, "Tracing is now disabled\n");

  exit();
}
