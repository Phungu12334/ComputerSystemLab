# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Update scores[2] = 84 and print total of 5 scores.
# Register plan: $s0 = base, $s1 = k, $s2 = V, $s3 = total, $t0-$t1 = temp

.data
scores:   .word 40, 55, 70, 85, 100
tongcong: .asciiz "Total: "

.text
.globl main
main:
    la   $s0, scores      # $s0 = base address

    addi $s1, $zero, 2    # k = 2
    addi $s2, $zero, 84   # V = 84
    sll  $t1, $s1, 2      # $t1 = 4 * k
    add  $t1, $t1, $s0    # $t1 = address of scores[k]
    sw   $s2, 0($t1)      # scores[2] = 84

    lw   $s3, 0($s0)      # $s3 = scores[0]
    lw   $t0, 4($s0)      # $t0 = scores[1]
    add  $s3, $s3, $t0
    lw   $t0, 8($s0)      # $t0 = scores[2]
    add  $s3, $s3, $t0
    lw   $t0, 12($s0)     # $t0 = scores[3]
    add  $s3, $s3, $t0
    lw   $t0, 16($s0)     # $t0 = scores[4]
    add  $s3, $s3, $t0    # $s3 = total

    li   $v0, 4           # print "Total: "
    la   $a0, tongcong
    syscall
    li   $v0, 1           # print total
    add  $a0, $s3, $zero
    syscall

    li   $v0, 10          # exit
    syscall
