# Sum array
      .data
V:    .word   0x6,0x7,0x5,0x3,0x5,0x0,0x5,0x2,0x0,0x1
res:  .space  4

      .text
      .globl main
main: li $t0, 0           # initialize counter to 0
      li $t1, 0           # initialize sum to 0
      la $t2, 10          # initialize max of iterations to 10
      la $t3, V           # load V

loop: beq $t0, $t2, end   # condition
      lw $t4, 0($t3)      # load dir. 0 from V in $t4
      add $t1, $t4, $t1   # sum current value
      addi $t3, $t3, 4    # advance to the next vector value
      addi $t0, $t0, 1    # counter += 1
      j loop

end:  sw $t1, res         # store result
      li $v0, 10          # exit
      syscall
