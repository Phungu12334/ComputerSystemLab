# Full name: Nguyen Ngo Bao Phuc
# Student ID: 26560047
# Purpose: Capitalize characters at offsets 0, 7, and 11 of a string in memory and print the result.

# Register plan:
# Variable   Register   Description
# str1       $s0        base address of the first byte of str1
# ch         $t0        temporary register holding the current character byte

.data
str1: .asciiz "nguyen van an\n"
tag:  .asciiz " [end]"

.text
.globl main
main:
    la   $s0, str1            # $s0 = address of str1

    # Capitalize byte at offset 0 ('n' -> 'N')
    lb   $t0, 0($s0)          # load byte at offset 0
    addi $t0, $t0, -32        # convert to uppercase (subtract 32)
    sb   $t0, 0($s0)          # store back to offset 0

    # Capitalize byte at offset 7 ('v' -> 'V')
    lb   $t0, 7($s0)          # load byte at offset 7
    addi $t0, $t0, -32        # convert to uppercase
    sb   $t0, 7($s0)          # store back to offset 7

    # Capitalize byte at offset 11 ('a' -> 'A')
    lb   $t0, 11($s0)         # load byte at offset 11
    addi $t0, $t0, -32        # convert to uppercase
    sb   $t0, 11($s0)         # store back to offset 11

    # Print updated string
    li   $v0, 4               # service 4: print string
    add  $a0, $s0, $zero      # $a0 = address of str1
    syscall

    li   $v0, 10              # service 10: exit
    syscall
