        .text
main:

    li $t0, 7
    li $s0, 15
    li $s1, 8


    addi    $sp, $sp, -8
    sw      $s0, 0($sp)
    sw      $s1, 4($sp)
    lw      $t1, 0($sp)
    add     $t2, $t0, $t1
    addi    $sp, $sp, -4
    sw      $t2, 0($sp)
    add     $s0, $t1, $t2
    sub     $s1, $t2, $s1
    sw      $s1, 4($sp)
    addi    $sp, $sp, 12

    li $v0, 10
    syscall
