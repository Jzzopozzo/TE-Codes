global _start
_start:

section .text
mov rsi, sarr
mov rdi, darr
l1: mov al, [rsi]
mov [rdi], al
inc rsi
inc rdi
dec byte[cnt]
jnz l1
; ------
%macro syswrite 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endm

syswrite msg, len
mov rsi, darr

l2: mov al, [rsi]
push rsi

call display

syswrite msg1, len1

pop rsi
inc rsi
dec byte[cnt1]
jnz l2

mov rax, 60
mov rdi, 0
syscall

display:
mov rsi, disparr+ 1
mov rcx, 2

l4: mov rdx, 0
mov rbx, 10h
div rbx
cmp dl, 09h
jbe l3
add dl, 07h
l3: add dl, 30h
mov [rsi], dl
dec rsi
dec rcx
jnz l4

syswrite disparr, 2
ret

section .data
sarr db 10h, 11h, 12h, 13h, 14h
darr db 00h, 00h, 00h, 00h, 00h
cnt db 05h
cnt1 db 05h

msg db"Copied elements:", 10
len equ $-msg

msg1 db "                  ", 10
len1 equ $-msg1

section .bss
disparr resb 50
