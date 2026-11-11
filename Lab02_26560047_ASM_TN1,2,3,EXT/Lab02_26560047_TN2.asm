# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Update score at index k (for D = 7: k = 2, V = 84) and compute the total of five scores.

# Register plan:
# Variable   Register   Description
# scores     $s0        base address of scores[0]
# k          $s1        index to update (k = 2)
# V          $s2        new score value (V = 84)
# total      $s3        sum of the five scores
# addr_k     $t1        effective address of scores[k]
# temp       $t0        temporary register to load each score

.data
scores:   .word 40, 55, 70, 85, 100
tongcong: .asciiz "Total: "

.text
.globl main
main:
    la   $s0, scores          # $s0 = address of scores[0]

    # Step 1: Store V = 84 into scores[k] where k = 2 (for D = 7)
    addi $s1, $zero, 2        # k = 2
    addi $s2, $zero, 84       # V = 84
    sll  $t1, $s1, 2          # $t1 = 4 * k
    add  $t1, $t1, $s0        # $t1 = address of scores[k]
    sw   $s2, 0($t1)          # scores[2] = 84

    # Step 2: Add up the five scores in $s3 using lw with constant offsets
    lw   $s3, 0($s0)          # $s3 = scores[0]
    lw   $t0, 4($s0)          # $t0 = scores[1]
    add  $s3, $s3, $t0        # $s3 = scores[0] + scores[1]
    lw   $t0, 8($s0)          # $t0 = scores[2]
    add  $s3, $s3, $t0        # $s3 += scores[2]
    lw   $t0, 12($s0)         # $t0 = scores[3]
    add  $s3, $s3, $t0        # $s3 += scores[3]
    lw   $t0, 16($s0)         # $t0 = scores[4]
    add  $s3, $s3, $t0        # $s3 = total of all 5 scores (364)

    # Step 3: Print "Total: " followed by the total
    li   $v0, 4               # service 4: print string
    la   $a0, tongcong
    syscall
    li   $v0, 1               # service 1: print integer
    add  $a0, $s3, $zero      # argument: total
    syscall

    li   $v0, 10              # service 10: exit
    syscall
