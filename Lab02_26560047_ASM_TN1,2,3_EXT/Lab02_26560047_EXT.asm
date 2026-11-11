# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Store X (1) at (1, 2) and O (2) at (2, 0) in 3x3 board.
# Register plan: $s0 = base, $s1 = r, $s2 = c, $t0 = index, $t1 = addr, $t2 = mark

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board       # $s0 = base address

    addi $s1, $zero, 1    # r = 1, c = 2
    addi $s2, $zero, 2
    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c
    sll  $t1, $t0, 2      # $t1 = 4 * index
    add  $t1, $t1, $s0    # $t1 = cell address
    addi $t2, $zero, 1    # mark X = 1
    sw   $t2, 0($t1)

    addi $s1, $zero, 2    # r = 2, c = 0
    addi $s2, $zero, 0
    sll  $t0, $s1, 1      # $t0 = 2 * r
    add  $t0, $t0, $s1    # $t0 = 3 * r
    add  $t0, $t0, $s2    # $t0 = 3 * r + c
    sll  $t1, $t0, 2      # $t1 = 4 * index
    add  $t1, $t1, $s0    # $t1 = cell address
    addi $t2, $zero, 2    # mark O = 2
    sw   $t2, 0($t1)

    li   $v0, 10          # exit
    syscall
