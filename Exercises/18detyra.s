
 
        .globl main        
        .text

factorial:
    slt $t2, $a0, $a1   # kontrollojme per $a0 < $a1 (a < n) 
    beq $t2, $zero, else # per $t2 = 0  pra kercim ne else              
                         # pra nuk kemi thirrje funksioni rekurzive
    addi $sp, $sp, -12  # alokojme 12 bytes ne stack per parametrat dhe adresen kthyese
    sw  $a0, 0($sp)     # vendosim $a0 ne stack (mund edhe te mos vendoset pasi nuk ndryshon)  ($a0 = a)
    sw  $a1, 4($sp)     # vendosim $a1 ne stack pasi ndryshon me thirrje funksionesh ($a1 = n)
    sw  $ra, 8($sp)     # vendosim $ra ne stack per te ruajtur adresen kthyese pas thirrjeve rekurzive
    addi $a1, $a1, -1   # dektremetojme parametrin ne regjistrin $a1 ($a1 = n), n=n-1

    jal factorial       # therrasim ne menyre rekurzive funskionin pasi kemi ruajtuar parametrat e adresat kthyese
    lw $a0, 0($sp)      # vendosim ne $a0 vleren e parametrit te rezervuar ne stack
    lw $a1, 4($sp)      # vendosim ne $a1 vleren e parametrit te rezervuar ne stack
    lw $ra, 8($sp)      # vendosim ne $ra adresen kthyese qe kemi ruajtur ne stack
                        # pra vlerat para thirrjes rekurzive gjenden ne stack
    mult $v0, $a0       # shumezojme $v0 me $a0 pra (a * rezultati)
    mflo $v0            # e vendosim vleren nga regjistri special ne $v0
    mult $v0, $a1       # pastaj shumezojme me $a1  (n * rezultati)
    mflo $v0            # e vendosim ne $v0

    addi $sp, $sp, 12   # dealokojme haspiren ne stack 
    jr $ra              # dhe kthehemi tek adresa kthyese ne $ra 

else:                   # Ne etiketen else hyjme nese $a0 nuk eshte me e vogel se $a1 
    move $v0, $a0       # atehere ne $v0 ruajme vleren e $a0 ( $a0 = a)
    jr $ra              # dhe kthehemi tek adresa kthyese

main:
    li  $v0, 4        #  Vendosim 4 ne regjistrin $v0 
    la  $a0, prompt   #  Vendosim ne regjistrin $a0 adresen prompt te stringut ne memorje statike
    syscall           #  System call qe ben printimin e nje stringu

    li $v0, 5         #  Vendosim 5 ne regjistrin $v0
    syscall           #  System call qe mer nje input nga tastiera

    move $t0, $v0     # Kopjojme vleren e regjistrit $v0 ne $t0 per perdorim te mevonshem, $t0 = input

    lw $a0, a         # Vendosim ne $a0 vleren ne adresen a pra numrin 1 ($a0 = a)
                      # E kam vendosur vleren e a ne memorje statike per arsye te deklarimit
                      # dhe inicializimit ne te njejten kohe ne kod pra int a = 1 
    move $a1, $t0     # kopjojme ne regjistrin $a1 vleren e $t0 pra inputin nga useri ($a1 = n) 

    jal factorial     # Pasi kemi pergatitur parametrat tani kercejmë ne etiketen factorial
                      # pra vendoset adresa e instruksionit te radhes ne $ra

    move $t1 , $v0    # Vendosim ne $t1 rezultatin e fituar nga funksioni qe gjendet ne $v0

    li  $v0, 4        # Printimi i stringut me adresen res
    la  $a0, res        
    syscall

    li  $v0, 1        # Printimi i vleres input nga perdoruesi
    move $a0, $t0
    syscall

    li $v0, 4         # Printimi i simbolit barazim
    la $a0, equals
    syscall

    li $v0, 1         # Printimi i rezulatit
    move $a0, $t1
    syscall

    li $v0, 4         # Newline
    la $a0, nl
    syscall

    li $v0, 10        # Exit program 
    syscall


        .data
prompt:    .asciiz "Enter a non-negative number: ";
res:  .asciiz "Factorial of "
equals:  .asciiz " = "
nl:    .asciiz "\n"
a:  .word 1     

    