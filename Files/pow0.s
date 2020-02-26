	.text
	.file	"pow.c"
	.globl	power
	.p2align	4, 0x90
	.type	power,@function
power:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -16(%rbp)
	movl	%esi, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jne	.LBB0_2
	movq	$1, -8(%rbp)
	jmp	.LBB0_3
.LBB0_2:
	movq	-16(%rbp), %rax
	movq	-16(%rbp), %rdi
	movl	-20(%rbp), %ecx
	subl	$1, %ecx
	movl	%ecx, %esi
	movq	%rax, -32(%rbp)
	callq	power
	movq	-32(%rbp), %rdx
	imulq	%rax, %rdx
	movq	%rdx, -8(%rbp)
.LBB0_3:
	movq	-8(%rbp), %rax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	power, .Lfunc_end0-power
	.cfi_endproc


	.ident	"clang version 9.0.0 (Fedora 9.0.0-1.fc31)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym power
