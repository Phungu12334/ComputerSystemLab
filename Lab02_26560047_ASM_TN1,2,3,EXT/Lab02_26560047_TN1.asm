# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Load words from an array in main memory using base-plus-offset addressing.

# Register plan:
# Variable   Register   Description
# scores     $s0        base address of scores[0]
# ptr        $s1        shifted base pointer ($s0 + 8)
# val0       $t0        scores[0]
# val1       $t1        scores[1]
# val4       $t2        scores[4]
# val2       $t3        scores[2] loaded via $s1
# val1_b     $t4        scores[1] loaded via negative offset from $s1

.data
scores: .word 40, 55, 70, 85, 100

.text
.globl main
main:
    la   $s0, scores          # $s0 = address of scores[0]
    lw   $t0, 0($s0)          # (1) $t0 = scores[0] = 40
    lw   $t1, 4($s0)          # (2) $t1 = scores[1] = 55
    lw   $t2, 16($s0)         # (3) $t2 = scores[4] = 100
    addi $s1, $s0, 8          # (4) $s1 = $s0 + 8 (address of scores[2])
    lw   $t3, 0($s1)          # (5) $t3 = scores[2] = 70
    lw   $t4, -4($s1)         # (6) $t4 = scores[1] = 55
    li   $v0, 10              # service 10: exit
    syscall
