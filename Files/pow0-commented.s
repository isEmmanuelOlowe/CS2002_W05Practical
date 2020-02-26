	.text
	.file	"pow.c"
	.globl	power
	.p2align	4, 0x90
	.type	power,@function
power:
	.cfi_startproc
	pushq	%rbp # pushes the current value of base pointer to stack.
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp # changes the address in base pointer to be address in stack pointer- setting up new stack frame.
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp # creates 32 bytes of space for stack frame.
	movq	%rdi, -16(%rbp) # moves the value of the long a to the stack frame - giving 8 bytes of space
	movl	%esi, -20(%rbp) # move sthe value of the int b to the stack frame - giving it 4 bytes of space
	cmpl	$0, -20(%rbp) # Subtracts 0 from b - value not stored but flag set
	jne	.LBB0_2 # Jump to the label ".LBB0_2" if comparison was not equal to.
	movq	$1, -8(%rbp) # sets the value of return address in first 8 bytes of stack frame to 1.
	jmp	.LBB0_3 # Jumps to label ".LBB0_3"
.LBB0_2:
	movq	-16(%rbp), %rax # Sets value of register rax to a
	movq	-16(%rbp), %rdi # Sets the value of a to be the argument for next function call
	movl	-20(%rbp), %ecx # Sets the value of b register ecx
	subl	$1, %ecx # subtracts 1 from the register ecx storing value of b
	movl	%ecx, %esi # Sets the b - 1 to be argument of next function call
	movq	%rax, -32(%rbp) # saves the value a in the stack frame.
	callq	power # Pushes return address to stack and jumps to the label power.
	movq	-32(%rbp), %rdx # recalls the saved value of a from the stack frame.
	imulq	%rax, %rdx # output_of_power_function_call *= a. multiplies the output of function by a.
	movq	%rdx, -8(%rbp) # moves result to return address of function stack frame
.LBB0_3:
	movq	-8(%rbp), %rax # Sets the contents of the return address to the output of function
	addq	$32, %rsp # increments stack pointer back to original value before function call
	popq	%rbp #pops the top of the stack into rbp - return its original value before function.
	.cfi_def_cfa %rsp, 8
	retq # pops return address from stack and jumps there
.Lfunc_end0:
	.size	power, .Lfunc_end0-power
	.cfi_endproc


	.ident	"clang version 9.0.0 (Fedora 9.0.0-1.fc31)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym power
