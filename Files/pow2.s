	.text
	.file	"pow.c"
	.globl	power
	.p2align	4, 0x90
	.type	power,@function
power:
	.cfi_startproc
	testl	%esi, %esi
	je	.LBB0_1
	leal	-1(%rsi), %eax
	movl	%esi, %ecx
	andl	$7, %ecx
	cmpl	$7, %eax
	jae	.LBB0_4
	movl	$1, %eax
	testl	%ecx, %ecx
	jne	.LBB0_7
	jmp	.LBB0_8
.LBB0_1:
	movl	$1, %eax
	retq
.LBB0_4:
	movl	%ecx, %edx
	subl	%esi, %edx
	movl	$1, %eax
	.p2align	4, 0x90
.LBB0_5:
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	imulq	%rdi, %rax
	addl	$8, %edx
	jne	.LBB0_5
	testl	%ecx, %ecx
	je	.LBB0_8
	.p2align	4, 0x90
.LBB0_7:
	imulq	%rdi, %rax
	addl	$-1, %ecx
	jne	.LBB0_7
.LBB0_8:
	retq
.Lfunc_end0:
	.size	power, .Lfunc_end0-power
	.cfi_endproc


	.ident	"clang version 9.0.0 (Fedora 9.0.0-1.fc31)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
