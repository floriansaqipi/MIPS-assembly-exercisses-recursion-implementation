    .data
    .text
main:

    li $t0, 5
    li $t1, 5
    
    mult $t0, $t1

    li $v0, 10
    syscall