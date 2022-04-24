global _start
_start:

section .text
mov rsi, arr
l3: mov rax, [rsi]
push rsi
call disp_proc
pop rsi
add rsi, 8

dec byte[cnt]

jnz l3


mov rax, 60
mov rdi, 0
syscall

mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, len
disp_proc:
mov rsi, darr+ 15
mov rcx, 16
l2: mov rdx, 0
mov rbx, 10h
div rbx
cmp dl, 09h
jbe l1
l1: add dl, 30h

mov [rsi], dl
dec rsi
dec rcx
jnz l2



mov rax, 1
mov rdi, 1
mov rsi, darr
mov rdx, 16
syscall

mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, len
syscall
ret

section .data
arr dq 1234567887654321h, 8765432112345678h
cnt db 02h

msg db "       ", 10
len equ $-msg

section .bss
darr resb 50
