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
mov rdi, sarr
add rsi, 9
add rdi, 13
std
mov rcx, 0Ah
rep movsb

;mov rsi, darr
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
sarr db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0Ah, 0Bh, 0Ch, 0Dh, 0Eh, 0Fh

cnt db 0Fh
msg db "", 10
len equ $-msg
section .bss
disparr resb 50
