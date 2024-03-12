# int factorial1(int n){
#     // if(n==1){
#     if(n==0){
#         return 1;
#     }
#     return factorial1(n-1) * n;
# }



        .text
factorial:
    bnez $a0, recurse

    li $v0, 1
    jr $ra

recurse:
    addi $sp, $sp, -8
    sw $a0, 0($sp)
    sw $ra, 4($sp)
    addi $a0, $a0, -1
    
    jal factorial
    lw $a0, 0($sp)
    mul $v0, $v0, $a0
    lw $ra 4($sp)
    addi $sp, $sp, 8
    jr $ra 



main:

    li  $a0, 5      #   paramter setting

    jal factorial

    move $t0, $v0 

    li $v0, 1
    move $a0, $v0
    syscall    

    li $v0, 10
    syscall  