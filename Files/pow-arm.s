	.text
	.file	"pow.c"
	.globl	power
	.align	2
	.type	power,@function
power:
	stp	x29, x30, [sp, #-16]! // Stores the pair of registers in the provided address - (pre-index)
	mov	 x29, sp // changes the address in frame pointer to be that of stack pointer.
	sub	sp, sp, #32 // creates 32 bytes of space for the stack frame.
	str	x0, [sp, #16] // moves the value of long a to the stack frame - giving it 8 byte of space.
	str	w1, [sp, #12] // moves the value of int b to the stack frame - giving it 4 bytes of space
	ldr	w1, [sp, #12] // loads the value of the [stack pointer + 12] to
	cbnz	w1, .LBB0_2 //branches to label ".LBB0_2" if w1 (int b) is not equal to zero
	orr	x8, xzr, #0x1 // bitwise operation. Comperes zero to 1 and sets it 1 as 1 is true. Fastest encoding of setting something to 1.
	stur	x8, [x29, #-8] // sets the value of x8 to return address of function.
	b	.LBB0_3 // branches to the label ".LBB0_3"
.LBB0_2:
	ldr	x8, [sp, #16] // Sets value of register to a
	ldr	x0, [sp, #16] // Sets the value of register to be arguement for next function call
	ldr	w9, [sp, #12] // Sets the value of b register ecx
	sub	w1, w9, #1 // Subtract 1 from the register
	str		x8, [sp] // saves the value a in the stack frame.
	bl	power // Pushes return address to stack and jumps to the label power.
	ldr		x8, [sp] // Loads the value stored at the address found in stack pointer (long a) in to register x8.
	mul		x8, x8, x0 //multiplies the (long a) x8 by the output of function call (x0)
	stur	x8, [x29, #-8] // stores the output in the return address of the stack frame - unscaled offset.
.LBB0_3:
	ldur	x0, [x29, #-8] // loads the value from the return address and sets it to the value of the return of the function. - unscaled offset.
	mov	 sp, x29 //changes the frame pointer back to address before call
	ldp	x29, x30, [sp], #16 // gets values stored in the following addresses and stores them in the following address
	ret //returns caller address
.Lfunc_end0:
	.size	power, .Lfunc_end0-power


	.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
	.section	".note.GNU-stack","",@progbits
