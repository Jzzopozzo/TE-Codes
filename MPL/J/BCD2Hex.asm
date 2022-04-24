global _start
_start:

section .text
%macro syswrite 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endm

%macro sysread 2
mov rax, 0
mov rdi, 0
mov rsi, %1
mov rdx, %2
syscall
%endm

syswrite msg1, len
mov rsi, arr1
l1: push rsi
sysread num1, 01
pop rsi
mov al, byte[num1]

sub al, 30H

mov bx, [rsi]
mul bx
add [result], ax
add rsi, 2
dec byte[cnt]
jnz l1

mov ax, [result]
call display

mov rax, 60
mov rdi, 0
syscall

display:
mov rsi, disparr+ 3
mov rcx, 4
l2:	mov rdx, 0
	mov rbx, 10h
	div rbx
	cmp dl, 09h
	jbe l3
	add dl, 07h
l3:	add dl, 30h
	mov [rsi], dl
	dec rsi
	dec rcx
	jnz l2

mov rax, 1
mov rdi, 1
mov rsi, disparr
mov rdx, 4
syscall 
ret

section .data
msg1 db"Enter a 5- digit no:" , 10
len equ $-msg1

arr1 dw 2710H, 03E8H, 0064H, 000AH, 0001H

cnt db 05H

section .bss
num1 resb 5
result resw 10
disparr resb 36
