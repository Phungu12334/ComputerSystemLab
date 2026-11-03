# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Compute monthly electricity usages and the three-month total from four meter readings.

# Register plan:
# Variable   Register   Description
# reading0   $s0        meter reading at the start of month 1 (kWh)
# reading1   $s1        meter reading at the start of month 2 (kWh)
# reading2   $s2        meter reading at the start of month 3 (kWh)
# reading3   $s3        meter reading at the end of month 3 (kWh)
# usage1     $t0        energy used in month 1 (kWh)
# usage2     $t1        energy used in month 2 (kWh)
# usage3     $t2        energy used in month 3 (kWh)
# total      $t3        total energy used over three months: usage1 + usage2 + usage3 (kWh)

.text
.globl main
main:
    addi $s0, $zero, 1200    # reading0 = 1200
    addi $s1, $zero, 1350    # reading1 = 1350
    addi $s2, $zero, 1475    # reading2 = 1475
    addi $s3, $zero, 1640    # reading3 = 1640

    # Compute monthly energy usages
    sub  $t0, $s1, $s0       # usage1 = reading1 - reading0
    sub  $t1, $s2, $s1       # usage2 = reading2 - reading1
    sub  $t2, $s3, $s2       # usage3 = reading3 - reading2

    # Compute total energy used over three months
    add  $t3, $t0, $t1       # $t3 = usage1 + usage2
    add  $t3, $t3, $t2       # total = (usage1 + usage2) + usage3

    li   $v0, 10             # service 10: exit program
    syscall
