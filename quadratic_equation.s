# Quadratic equation (A·X^2 + B·X + C) solver
		.data
c1:   .asciiz	"\nThis program do the quadratic equation A·X^2 + B·X + C"
c2:   .asciiz 	"\nIntroduce A value: "
c3:   .asciiz 	"\nIntroduce B value: "
c4:   .asciiz 	"\nIntroduce C value: "
c5:	  .asciiz 	"\nIntroduce X value: "
c6:   .asciiz 	"\nResult of doing A·X^2 + B·X + C = "
			
		.data 0x100100f0
# Define memory assignment
A:    .word 0
B:    .word 0
C:    .word 0
X:    .word 0
Op:   .word 0

        .text
	    .globl main
main:   la $a0, c1    		# print c1
        li $v0, 4
        syscall

        la $a0, c2    		# print c2
        li $v0, 4
        syscall

        li $v0, 5     		# input
        syscall

        sw $v0, A     		# store in A's memory addres

        la $a0, c3    		# print c3
        li $v0, 4
        syscall

        li $v0, 5     		# input
        syscall

        sw $v0, B     		# store in B's memory addres

        la $a0, c4    		# print c4
        li $v0, 4
        syscall

        li $v0, 5     		# input
        syscall

        sw $v0, C    		# store in C's memory addres

        la $a0, c5    		# print c5
        li $v0, 4
        syscall

        li $v0, 5     		# input
        syscall

        sw $v0, X     		# store in X's memory addres

        #Operations 
        lw $t0, X
        mulo $t0, $t0, $t0  # X*X

        lw $t1, A
        mulo $t1, $t1, $t0  # A*X*X

        lw $t2, X
        lw $t3, B
        mulo $t2, $t3, $t2  # B*X

        add $t4, $t1, $t2   # A*X*X + B*X

        lw $t5, C

        add $t4, $t4, $t5   # A*X*X + B*X + C

        sw $t4, Op			# store in Op's memory addres

        la $a0, c6    		# print c6
        li $v0, 4
        syscall

        lw $a0, Op			# print result
        li $v0, 1     		
        syscall

        li $v0, 10    		# exit 
        syscall
