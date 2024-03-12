# int fib3(int n){
#     int t0 = 0, t1 = 1, s = 0;
#     if(n <=1){
#         return n;
#     }
#     for(int i = 2;i<=n;i++){
#         s = t0 + t1;
#         t0 = t1;
#         t1 = s;
#     }
#     return s;
# }

        .data
query:  .asciiz "Enter the fibonacci number: "
res:    .asciiz "F("
res2:   .asciiz ")= "
        .text

fibonacci:
    li $t1, 0   #first term
    li $t2, 1   #second term
    li $v0, 0   #sum and result
    li $t9, 1

    bgt $a0, $t9, end_if

    move $v0, $a0
    jr $ra
end_if:

    li $t3, 2   #counter

for:
    bgt $t3, $a0, end_for

    add $v0, $t1, $t2
    move $t1, $t2
    move $t2, $v0

    addi $t3, $t3, 1
    j   for
end_for:
    jr $ra
    
main:
    
    li $v0, 4
    la $a0, query;
    syscall

    li $v0, 5
    syscall
    move $t0, $v0       #   Requeseted number  input is in $t0

    li $v0, 4
    la $a0, res
    syscall

    move $a0, $t0       #   Set up the paramter 

    jal fibonacci

    move $t4, $v0       #   result is in $t4

    li $v0, 1
    move $a0,  $t0
    syscall

    li $v0, 4
    la $a0, res2
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0 10
    syscall

    





