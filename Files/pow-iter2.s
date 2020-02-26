	.text
	.file	"pow-iter2.c"
	.globl	power
	.p2align	4, 0x90
	.type	power,@function
power:
	.cfi_startproc
	movl	$1, %eax
	cmpl	$8, %esi
	jl	.LBB0_4
	movq	%rdi, %rcx
	imulq	%rdi, %rcx
	imulq	%rcx, %rcx
	imulq	%rcx, %rcx
	movl	$1, %eax
	movl	%esi, %edx
	.p2align	4, 0x90
.LBB0_2:
	imulq	%rcx, %rax
	addl	$-8, %edx
	cmpl	$7, %edx
	jg	.LBB0_2
	andl	$7, %esi
.LBB0_4:
	testl	%esi, %esi
	je	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:
	imulq	%rdi, %rax
	addl	$-1, %esi
	jne	.LBB0_5
.LBB0_6:
	retq
.Lfunc_end0:
	.size	power, .Lfunc_end0-power
	.cfi_endproc


	.ident	"clang version 8.0.0 (Fedora 8.0.0-3.fc30)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
