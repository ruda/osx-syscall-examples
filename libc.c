/*
 * libc.c - a tiny C library by means of syscall().
 */

#include <sys/syscall.h>
#include <unistd.h>

void
exit(int status)
{
	syscall(SYS_exit, status);
}

void
sync(void)
{
	syscall(SYS_sync);
}

ssize_t
write(int fildes, const void *buf, size_t nbyte)
{
	return syscall(SYS_write, fildes, buf, nbyte);
}
