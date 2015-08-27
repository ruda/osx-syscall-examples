	.text
_syscall:
	int $0x80
	ret

	.globl start
start:
	movl $36, %eax		# sync = 36
	call _syscall		# sync()
	pushl $0		# rval = 0
	movl $1, %eax		# exit = 1
	call _syscall		# exit(0)
