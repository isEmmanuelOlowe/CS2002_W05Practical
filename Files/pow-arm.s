	.syntax unified
	.cpu	arm7tdmi
	.eabi_attribute	6, 2
	.eabi_attribute	8, 1
	.eabi_attribute	20, 1
	.eabi_attribute	21, 1
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.file	"pow.c"
	.text
	.globl	power
	.align	2
	.type	power,%function
power:
	push	{r11, lr}
	mov	r11, sp
	sub	sp, sp, #24
	str	r0, [r11, #-8]
	str	r1, [sp, #12]
	mov	r2, r1
	cmp	r1, #0
	str	r0, [sp, #8]
	str	r2, [sp, #4]
	bne	.LBB0_2
	b	.LBB0_1
.LBB0_1:
	mov	r0, #1
	str	r0, [r11, #-4]
	b	.LBB0_3
.LBB0_2:
	ldr	r0, [r11, #-8]
	ldr	r1, [sp, #12]
	sub	r1, r1, #1
	str	r0, [sp]
	bl	power
	ldr	r2, [sp]
	mul	r1, r2, r0
	str	r1, [r11, #-4]
.LBB0_3:
	ldr	r0, [r11, #-4]
	mov	sp, r11
	pop	{r11, lr}
	bx	lr
.Ltmp0:
	.size	power, .Ltmp0-power


	.ident	"clang version 3.4.2 (tags/RELEASE_34/dot2-final)"
