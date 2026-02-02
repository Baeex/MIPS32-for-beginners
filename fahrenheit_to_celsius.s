# From Farenheit to Celsius calculator
        .data
str1:   .asciiz "Enter a temperature in Farenheit: "
str2:   .asciiz "Temperature in Celsius is: "

# Formula: (F - 32) * 5 /9 = C

        .data 0x10010080
dgF:    .word 0
dgC:    .word 0


        .text
        .globl main
main:   la $a0, str1
        li $v0, 4
        syscall

        li $v0, 5
        syscall

        sw $v0, dgF

		addi $t0, $v0, -32
		
        mulo $t0, $t0, 5

        div $t0, $t0, 9

        sw $t0, dgC

        la  $a0, str2
        li  $v0, 4
        syscall

        add $a0, $t0, $zero
        li  $v0,  1
        syscall

        li $v0, 10
        syscall
