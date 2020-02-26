	.text
	.file	"pow.c"
	.globl	power
	.p2align	4, 0x90
	.type	power,@function
power:
	.cfi_startproc
	movl	$1, %eax
	testl	%esi, %esi
	je	.LBB0_2
	.p2align	4, 0x90
.LBB0_1:
	imulq	%rdi, %rax
	addl	$-1, %esi
	jne	.LBB0_1
.LBB0_2:
	retq
.Lfunc_end0:
	.size	power, .Lfunc_end0-power
	.cfi_endproc


	.ident	"clang version 9.0.0 (Fedora 9.0.0-1.fc31)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
