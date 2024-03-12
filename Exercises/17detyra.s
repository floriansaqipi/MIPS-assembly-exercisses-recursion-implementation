

#include <iostream> 
#using namespace std;

#int factorial(int);

# int main() { 
#     int n, result; 

#     cout << "Enter a non-negative number: ";
#     cin >> n; 
#     result = factorial(n); 
#     cout << "Factorial of " << n << " = " << result;
    
#     return 0; 
# }

# int factorial(int n) { 
#     if (n > 1) { 
#         return n * factorial(n - 1); 
#     } else { 
#         return 1;
#      } 
# }


        # .globl main
        
        .text

factorial:
    li $t9, 1
    
    ble $a0, $t9, else

    addi $sp, $sp, -8

    sw  $a0, 0($sp)
    sw  $ra, 4($sp)

    addi $a0, $a0, -1

    jal factorial

    lw $a0, 0($sp)
    lw $ra, 4($sp)

    mul $v0, $v0, $a0
    addi $sp, $sp, 8
    jr $ra

    # j end_else
    
else:

    li $v0, 1
    jr $ra
# end_else:


main:

    li  $v0, 4              #   Print the request
    la  $a0, request
    syscall

    li $v0, 5               # Prompt user for input
    syscall

    move $t0, $v0           # Copy user input into $t0 reg

    move $a0, $t0           # Copy user input to func params

    jal factorial           # Jump to factorial label and set next instruction adress to $ra

    move $t1 , $v0          # Copy result of function into $t1

    li  $v0, 4              # Print response1
    la  $a0, response1
    syscall

    li  $v0, 1              # Print user input value
    move $a0, $t0
    syscall

    li $v0, 4               # Print equals
    la $a0, response2
    syscall

    li $v0, 1               # Print equals
    move $a0, $t1
    syscall

    li $v0, 10              # Exit program 
    syscall


        .data
request:  .asciiz "Enter a non-negative number: ";
response1: .asciiz "Factorial of "
response2: .asciiz " = "

    