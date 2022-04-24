global _start
_start:

section .text
;macro for write:z
%macro write 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdi, %2
syscall
%endm

;macro for accept:
%macro accept 2
mov rax, 0
mov rdi, 0
mov rsi, %1
mov rdi, %2
syscall
%endm

write menu1, len1
accept ch1, 2

mov al, byte[ch1]
cmp al, 31h
je choice1

cmp al, 32h
je choice2

cmp al, 33h
je choice3
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
write msg2, len2
write disparr, 2
ret

choice1:

choice2:

choice3:
mov rax, 60
mov rdi, 0
syscall

section .data
menu1 db "1. Non overlap without string", 10
	db "2. Non overlap with string", 10
	db "3. Exit", 10
	db "Enter choice:", 10
	len1 equ $-menu1

sarr db 10h, 11h, 12h, 13h, 14h
darr db 00h, 00h, 00h, 00h, 00h
cnt db 05h
cnt1 db 05h

msg db"Copied elements:", 10
len equ $- msg

msg2 db "                  ", 10
len2 equ $- msg

section .bss
ch1 resb 5
disparr resb 50
