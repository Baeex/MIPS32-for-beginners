# This program sum two input values 
		.data
str1:.asciiz "\nIntroducir dato A = "
str2:.asciiz "\nIntroducir dato B = "
str3:.asciiz "\nEl valor de A+B es = "

		.data 0x10010103
# Define the data segment at 0x10010103 addres: A, B and Sum
# Declare word type because we will use 32 bits
A:		.word 	0
B:		.word	0
Sum:	.word 	0

        .text
        .globl main
main:   la $a0, str1	 	# load str1 addres in $a0
        li $v0, 4			# $v0 charge the system call cod. 4 to print string
        syscall

        li $v0, 5			# input int
        syscall
							# $v0 store the input 
		sw $v0, A			# store in A's memory addres

        la $a0, str2		# load str2 addres in $a0
        li $v0, 4			# $v0 charge the system call cod. 4 to print string
        syscall

        li $v0, 5			# input int
        syscall

        sw $v0, B			# store in B's memory addres
		
		lw $t0, A			# load A value in $t0
        add $t0, $v0, $t0	# Sum in $t0
		
		sw $t0, Sum

        la $a0, str3		# load str3 addres in $a0
        li $v0, 4			# $v0 charge the system call cod. 4 to print string
        syscall

        lw  $a0, Sum		# load the sum in $a0
        li $v0, 1			# $v0 charge the system call cod. 1 to print int
        syscall

        li $v0, 10			# cod. 10 to exit or jr $31
        syscall
