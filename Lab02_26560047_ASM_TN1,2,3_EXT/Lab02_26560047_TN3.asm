# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Capitalize letters at offsets 0, 7, 11 and print string.
# Register plan: $s0 = address of str1, $t0 = character byte

.data
str1: .asciiz "nguyen van an\n"
tag:  .asciiz " [end]"

.text
.globl main
main:
    la   $s0, str1        # $s0 = address of str1

    lb   $t0, 0($s0)      # offset 0 ('n' -> 'N')
    addi $t0, $t0, -32
    sb   $t0, 0($s0)

    lb   $t0, 7($s0)      # offset 7 ('v' -> 'V')
    addi $t0, $t0, -32
    sb   $t0, 7($s0)

    lb   $t0, 11($s0)     # offset 11 ('a' -> 'A')
    addi $t0, $t0, -32
    sb   $t0, 11($s0)

    li   $v0, 4           # print str1
    add  $a0, $s0, $zero
    syscall

    li   $v0, 10          # exit
    syscall
