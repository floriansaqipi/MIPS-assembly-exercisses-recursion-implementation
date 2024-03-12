# int pow(int m, int n){
#     if(n==0){
#         return 1;
#     }
#     return pow(m,n-1) * m;
# }




        .text

pow:
    bnez $a1, recurse
    
    li $v0, 1
    jr $ra

recurse:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    addi $a1, $a1, -1
    jal power
    mul $v0, $a0, $v0
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

main:

    li $a0, 2  # $a0 is going to be base
    li $a1, 5  # $a1 is exponent

    jal pow

    move $t0, $v0   # result is in $t0
    
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0 10
    syscall