# Lower to capital converter if not 'a' or ' '
        .data
str:    .asciiz "convert this string from lower to capital "

        .text
        .globl main
main:   la $t0, str
        lbu $t1, 0($t0)   		# iterate str
        li  $t2, 0x61			# char 'a' in ASCII code
        li  $t3, 0x20			# char ' ' in ASCII code

loop:  	beqz $t1, end     		# condition if str is empty		
		
        beq $t1, $t2, itera
        beq $t1, $t3, itera

        addi $a0, $t1, -32		# sub 32 to convert it 

        li $v0, 11
        syscall

itera:  addi $t0, $t0, 1
		lbu $t1, 0($t0)   		# iterate str
        j loop

end:    li $v0, 10
        syscall
