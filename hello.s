	.text
_syscall:
	int $0x80
	ret

	.globl start
start:
	pushl len		# nbyte = len
	pushl $msg		# cbuf = msg
	pushl $1		# fd = STDOUT = 1
	movl $4,%eax		# write = 4
	call _syscall		# write(fd=1,cbuf=&msg,nbyte=len)
	addl $12,%esp		# restore stack (3 * 4 = 12)
	pushl $0		# rval = 0
	movl $1,%eax		# exit = 1
	call _syscall		# exit(0)

	.data
msg:
	.ascii "Hello World!\n"
len:
	.long . - msg
