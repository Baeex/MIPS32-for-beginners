# This program do the fibonacci sequence from 0 to 8 without using loops

		.data
# Define the data segment at the default addres (0x10010000)
str: 	.asciiz "This is the fibonacci sequence: \n"
step:	.asciiz " \n" 

# Declare space 1 because we will use 8 bits 
# One space means two memory digits
fib_0:	.space 1
fib_1:	.space 1
fib_2:	.space 1
fib_3:	.space 1
fib_4:	.space 1
fib_5:	.space 1
fib_6:	.space 1

# Define the text segment
		.text
		.globl main		
		
main: 	addi $t0, $t0, 0  # 0 
		addi $s1, $s0, 1  # 1
		add $s2, $s1, $s0 # 1
		add $s3, $s2, $s1 # 2
		add $s4, $s3, $s2 # 3
		add $s5, $s4, $s3 # 5
		add $s6, $s5, $s4 # 8	
		
		# Store byte 
		sb $s0, fib_0
		sb $s1, fib_1
		sb $s2, fib_2
		sb $s3, fib_3
		sb $s4, fib_4
		sb $s5, fib_5
		sb $s6, fib_6
		
		# print string
		la $a0, str
		li $v0, 4		  
		syscall
		
		# print sequence		
		# Add $s0 in $a0 to print it 
		add $a0, $zero ,$s0
		li $v0, 1	  		# $v0 charge the system call cod. 1 to print int
		syscall
		
		# print jump line 
		la $a0, step
		li $v0, 4		  
		syscall
		
		# Add $s1 in $a0 to print it
		add $a0, $zero ,$s1
		li $v0, 1	  
		syscall
		
		# print jump line  
		la $a0, step
		li $v0, 4		  
		syscall
		
		add $a0, $zero ,$s2
		li $v0,	1	  
		syscall

		la $a0, step
		li $v0, 4		  
		syscall
		
		add $a0, $zero ,$s3
		li $v0, 1	  
		syscall

		la $a0, step
		li $v0, 4		  
		syscall
		
		add $a0, $zero ,$s4
		li $v0, 1	  
		syscall

		la $a0, step
		li $v0, 4		  
		syscall
		
		add $a0, $zero ,$s5
		li $v0, 1	  
		syscall

		la $a0, step
		li $v0, 4		  
		syscall
		
		add $a0, $zero ,$s6
		li $v0, 1	  
		syscall
		
		# cod. 10 to exit or jr $31
		li $v0, 10				
		syscall
