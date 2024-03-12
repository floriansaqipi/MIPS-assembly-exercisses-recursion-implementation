# int factorial(int n){
#     int res = 1;
#     for(int i = 2; i<=n; i++){
#         res *= i;
#     }
#     return res;
# }

        .data
query:  .asciiz "Enter number for factorial "
res:    .asciiz "! = ";
        .text

factorial:
    li $v0, 1   #result res
    li $t1, 2   #counter i

loop:
    bgt $t1, $a0, end_loop      #check if i>n to break loop if true 

    mul $v0, $v0, $t1           #   multiply the res by counter
    addi $t1, $t1, 1            #   increment counter

    j   loop
end_loop:

    jr $ra                      # jump to adress specified by ra


main:

    li $v0, 4;          #   Print query to user
    la $a0, query
    syscall

    li $v0, 5
    syscall
    move $t0, $v0       # copy the input to $t0

    move $a0, $t0       #set up paramter for function $a0 = n

    jal factorial       # call function and set $ra to next instruction 

    move $t2, $v0       #res of fucntion is in $t2 now

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, res
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall











