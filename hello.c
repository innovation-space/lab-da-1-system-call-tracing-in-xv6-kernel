#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int args, char *argv[])
{
	if(args > 1)
		printf(1, "Hello, %s!\n", argv[1]);
	else
		printf(1,"Hello, xv6 User!\n");
	exit();
}
