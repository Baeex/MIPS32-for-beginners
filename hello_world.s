# Hello World program
		.data
# Define the data segment at the default addres (0x10010000)
str:	.asciiz "Hello World! \n"
		
# Define the text(code) segment
		.text
		.globl main
		
main:	la $a0, str # Load str addres on $a0 register					
		li $v0, 4	# $v0 charge the system call cod. 4 for print string
		syscall		# syscall to execute the $v0 function
		
		
		li $v0, 10	# cod. 10 to exit or jr $31
		syscall		# syscall to execute the $v0 function
