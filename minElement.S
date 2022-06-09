.data
N:
.word 5
M:
.word 4
matrix:
.word 2, 2, 3, 4, 6
.word 2, 2, 1, 6, 2
.word 6, 2, 5, 3, 3
.word 4, 5, 6, 7, 2
result:
.word 0

.text
main:
la a2, N
la a3, M
la a4, matrix
la a5, result
call process
la a2, M
la a3, result
call print
call exit
    
process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M

addi t4, x0, 0 # row pointer
lw t5, 0(a4) # result to save

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
bge t6, t5, increm
blt t6, t5, swope

swope:
lw t5, 0(a4)
sw t5, 0(a5) # save result

increm:
addi a4, a4, 4 # increment array pointer
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
ret

print:
addi a0, x0, 1 # print_int ecall
lw a1, 0(a3)
ecall

addi a0, x0, 11 # print_char ecall
addi a1, x0, 32
ecall

exit:
addi a0, x0, 10
ecall



