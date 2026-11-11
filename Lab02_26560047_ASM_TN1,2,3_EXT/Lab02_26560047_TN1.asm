# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Load words from an array using base and offset.
# Register plan: $s0 = base, $s1 = $s0 + 8, $t0-$t4 = loaded scores

.data
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    la   $s0, scores      # $s0 = base address
    lw   $t0, 0($s0)      # $t0 = scores[0]
    lw   $t1, 4($s0)      # $t1 = scores[1]
    lw   $t2, 16($s0)     # $t2 = scores[4]
    addi $s1, $s0, 8      # $s1 = $s0 + 8
    lw   $t3, 0($s1)      # $t3 = scores[2]
    lw   $t4, -4($s1)     # $t4 = scores[1]
    li   $v0, 10          # exit
    syscall
