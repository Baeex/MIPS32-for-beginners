# Count the numbers between the limits (both included)
		.data
c1:		.asciiz "\nIn this array exists "
c2:		.asciiz " elements between "	
c3:		.asciiz " and "
V:		.byte 	0x6, -0x7, 0x8, 0x3, 0x5, 0x0, 0x5, 0x2, 0x4, 0x1
		.align 	2
res:	.space	4
	
		.text
		.globl main
main:
		la $t0, V			# load mem
		li $t1, 4			# lim inf = 4
		li $t2, 8			# lim sup = 8
		li $t3, 0			# iteration counter
		li $t4, 0			# nums between 4 and 8
		li $t5, 9			# V length - 1
		
loop:	beq $t3, $t5, end
		lb $t6, 0($t0)
		
		blt $t6, $t1, yes	# n < 4 ?
		bgt $t6, $t2, yes	# n > 8 ?
		
		addi $t4, $t4, 1	# n > 4 & n < 8 ++
		addi $t0, $t0, 1	# advance 1 byte in memory
		addi $t3, $t3, 1	# iterate
		
		j loop

yes:	addi $t0, $t0, 1	# advance 1 byte in memory
		addi $t3, $t3, 1	# iterate

		j loop
		
end:
		sw $t4, res			# store result in memory	
		
		la $a0, c1			# print c1
		li $v0, 4
		syscall
		
		addi $a0, $t4, 0	# parameter $a0 = result
		li $v0, 1
		syscall
		
		la $a0, c2			# print c2
		li $v0, 4
		syscall
		
		addi $a0, $t1, 0	# parameter $a0 = 4
		li $v0, 1
		syscall
		
		la $a0, c3			# print c3
		li $v0, 4
		syscall
		
		addi $a0, $t2, 0	# parameter $a0 = 8
		li $v0, 1
		syscall
		
		li $v0, 10			# end
		syscall
