# Sum if num = 5 or num % 3 == 0
          .data
vector:	  .space	10            # 10 elements of 1 byte
          .align 2
result:	  .space 4                # Sum values with conditions
str1:	  .asciiz	"\nIntroduce element("
str2:	  .asciiz ") of array[]: "
str3: 	  .asciiz "\nSum: "

          .text
          .globl main
main:
          li $t0, 1               # initialize loops counter
          li $t1, 10              # initialize vector length
          la $t3, vector          # load vector
          li $t4, 0               # initialize sum
          li $t5, 5               # initialize num 5
          li $t6, 3               # initialize num 3

loop:     bgt $t0, $t1, end

          la $a0,str1             # print str1
          li $v0, 4
          syscall

          add $a0, $t0, $zero     # print num
          li $v0, 1
          syscall

          la $a0,str2             # print str2
          li $v0, 4
          syscall

          li $v0, 5               # read int
          syscall

          sb $v0  0($t3)          # store value
          addi $t3, $t3, 1        # advance 1 byte in memory

          beq $v0, $t5, yes       # if num == 5

          div $v0, $t6
          mfhi  $t7
          beqz  $t7, yes          # if num % 3 == 0
          addi $t0, $t0, 1        # iteration
          j loop

yes:
          add $t4, $t4, $v0       # sum

          addi $t0, $t0, 1        # iteration
          j loop

end:
          sw $t4, result          # store result in memory
          la $a0,str3             # print str3
          li $v0, 4
          syscall

          add $a0, $t4, $zero     # print sum
          li $v0, 1
          syscall

          li $v0, 10
          syscall                 # exit
