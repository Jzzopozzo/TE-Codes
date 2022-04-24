global _start
_start:

section .text
mov rax, 1234567887654321h
mov rbx, 8765432112345670h
add rax, rbx
call disp_proc
mov rax, 60
mov rbx, 0
syscall

disp_proc:
mov rsi, disparr+15
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
mov rsi, disparr
mov rdx, 16
syscall
ret

section .bss 
disparr resb 36
