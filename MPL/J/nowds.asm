global _start
_start:

section .text

%macro write 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endm

mov rsi, sarr
mov rdi, darr
cld
mov rcx, 06h
rep movsb

mov rsi, darr
l2: mov al, [rsi]
push rsi 
call Display
pop rsi
inc rsi
dec byte[cnt]
jnz l2

mov rax, 60
mov rdi, 0
syscall

Display:
mov rsi, disparr+ 1
mov rcx, 2
l3: mov rdx, 0
mov rbx, 10h
div rbx
cmp dl, 09h
jbe l4
add dl, 07h
l4: add dl, 30h

mov [rsi], dl
dec rsi
dec rcx
jnz l3
write msg, len

mov rax, 1
mov rdi, 1
mov rsi, disparr
mov rdx, 2
syscall
ret


section .data
sarr db 10h, 11h, 12h, 13h, 14h, 15h
darr db 00h, 00h, 00h, 00h, 00h, 00h

cnt db 06h
msg db "", 10
len equ $-msg
section .bss
disparr resb 50
