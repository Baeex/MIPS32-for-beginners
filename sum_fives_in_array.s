# value = 5 counter
        .data
V:      .byte   0x6,0x7,0x5,0x3,0x5,0x0,0x5,0x2,0x0,0x1
        .align  2
res:    .space  4

        .text
        .globl main
main:   li $t0, 0           # initialize counter to 0
        li $t1, 0           # initialize value = 5 to 0
        la $t2, 10          # initialize max of iterations to 10
        la $t3, V           # load V
        li $t5, 5           # initialize 5 for compare

loop:   beq $t0, $t2, end   # condition
        lb $t4, 0($t3)      # load dir. 0 from V in $t4

        bne $t4, $t5, no    # NOT 5
yes:    addi $t1, $t1, 1    # num of 5s += 1

no:     addi $t3, $t3, 1    # advance to the next vector value
        addi $t0, $t0, 1    # counter += 1
        j loop

end:    sb $t1, res         # store result
        li $v0, 10          # exit
        syscall
