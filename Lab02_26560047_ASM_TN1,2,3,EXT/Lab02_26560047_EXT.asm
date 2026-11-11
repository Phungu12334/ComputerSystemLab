# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Store marks X (1) at cell (1, 2) and O (2) at cell (2, 0) of a 3x3 board in memory.

# Register plan:
# Variable   Register   Description
# board      $s0        base address of the 3x3 board array
# r          $s1        row index (0 to 2)
# c          $s2        column index (0 to 2)
# idx        $t0        linear word index (3 * r + c)
# addr       $t1        effective byte address: board + 4 * (3 * r + c)
# mark       $t2        value to store (1 for X, 2 for O)

.data
board: .word 0, 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main
main:
    la   $s0, board           # $s0 = base address of board

    # Store 1 (mark X) into cell (r = 1, c = 2)
    addi $s1, $zero, 1        # r = 1
    addi $s2, $zero, 2        # c = 2
    sll  $t0, $s1, 1          # $t0 = 2 * r
    add  $t0, $t0, $s1        # $t0 = 3 * r
    add  $t0, $t0, $s2        # $t0 = 3 * r + c
    sll  $t1, $t0, 2          # $t1 = 4 * (3 * r + c)
    add  $t1, $t1, $s0        # $t1 = board + 4 * (3 * r + c)
    addi $t2, $zero, 1        # mark X = 1
    sw   $t2, 0($t1)          # board[1][2] = 1

    # Store 2 (mark O) into cell (r = 2, c = 0)
    addi $s1, $zero, 2        # r = 2
    addi $s2, $zero, 0        # c = 0
    sll  $t0, $s1, 1          # $t0 = 2 * r
    add  $t0, $t0, $s1        # $t0 = 3 * r
    add  $t0, $t0, $s2        # $t0 = 3 * r + c
    sll  $t1, $t0, 2          # $t1 = 4 * (3 * r + c)
    add  $t1, $t1, $s0        # $t1 = board + 4 * (3 * r + c)
    addi $t2, $zero, 2        # mark O = 2
    sw   $t2, 0($t1)          # board[2][0] = 2

    li   $v0, 10              # service 10: exit
    syscall
