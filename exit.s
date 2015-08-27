	.text
_syscall:
	int $0x80
	ret

	.globl start
start:
	pushl $42		# rval = 42
	movl $1,%eax		# exit = 1
	call _syscall		# exit(42)
