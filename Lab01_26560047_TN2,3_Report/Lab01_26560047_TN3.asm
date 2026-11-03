# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Read four electricity meter readings and print monthly usages and total.

# Register plan:
# Variable   Register   Description
# reading0   $s0        reading at the start of month 1
# reading1   $s1        reading at the start of month 2
# reading2   $s2        reading at the start of month 3
# reading3   $s3        reading at the end of month 3
# usage1     $t0        usage for month 1
# usage2     $t1        usage for month 2
# usage3     $t2        usage for month 3
# total      $t3        total usage over three months

.data
NhapsokWh: .asciiz "Enter reading (kWh): "
thang1:    .asciiz "\nMonth 1: "
thang2:    .asciiz "\nMonth 2: "
thang3:    .asciiz "\nMonth 3: "
tongcong:  .asciiz "\nTotal:   "

.text
.globl main
main:
    # Read reading0 into $s0
    li   $v0, 4              # service 4: print string
    la   $a0, NhapsokWh
    syscall
    li   $v0, 5              # service 5: read integer
    syscall
    add  $s0, $v0, $zero     # $s0 = reading0

    # Read reading1 into $s1
    li   $v0, 4
    la   $a0, NhapsokWh
    syscall
    li   $v0, 5
    syscall
    add  $s1, $v0, $zero     # $s1 = reading1

    # Read reading2 into $s2
    li   $v0, 4
    la   $a0, NhapsokWh
    syscall
    li   $v0, 5
    syscall
    add  $s2, $v0, $zero     # $s2 = reading2

    # Read reading3 into $s3
    li   $v0, 4
    la   $a0, NhapsokWh
    syscall
    li   $v0, 5
    syscall
    add  $s3, $v0, $zero     # $s3 = reading3

    # Compute monthly usages and total
    sub  $t0, $s1, $s0       # usage1 = reading1 - reading0
    sub  $t1, $s2, $s1       # usage2 = reading2 - reading1
    sub  $t2, $s3, $s2       # usage3 = reading3 - reading2
    add  $t3, $t0, $t1       # $t3 = usage1 + usage2
    add  $t3, $t3, $t2       # total = (usage1 + usage2) + usage3

    # Print Month 1
    li   $v0, 4
    la   $a0, thang1
    syscall
    li   $v0, 1              # service 1: print integer
    add  $a0, $t0, $zero     # argument: usage1
    syscall

    # Print Month 2
    li   $v0, 4
    la   $a0, thang2
    syscall
    li   $v0, 1
    add  $a0, $t1, $zero     # argument: usage2
    syscall

    # Print Month 3
    li   $v0, 4
    la   $a0, thang3
    syscall
    li   $v0, 1
    add  $a0, $t2, $zero     # argument: usage3
    syscall

    # Print Total
    li   $v0, 4
    la   $a0, tongcong
    syscall
    li   $v0, 1
    add  $a0, $t3, $zero     # argument: total
    syscall

    # Exit program
    li   $v0, 10             # service 10: exit
    syscall
