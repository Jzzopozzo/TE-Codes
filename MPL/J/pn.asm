global _start
_start:

section .text
mov rsi, arr
l: mov rax, [rsi]

push rsi
call display
pop rsi
add rsi, 8
dec byte[cnt]
jnz l

mov rsi, arr
l3: bt qword[rsi], 63

jc l4
inc byte[pcnt]
jmp l5
l4: inc byte[ncnt]

l5: add rsi, 8
dec byte[cnt1]
jnz l3

mov rax, 1
mov rdi, 1
mov rsi, msg
mov rdx, len
syscall

mov ah, 00h
mov al, byte[pcnt]
call Display

mov rax, 1
mov rdi, 1
mov rsi, msg1
mov rdx, len1
syscall

mov ah, 00h
mov al, byte[ncnt]
call Display

mov rax, 60
mov rdi, 0

syscall

Display:
mov rsi, disparr+ 01
mov rcx, 02h

l9: mov rdx, 0h
mov rbx, 10h
div rbx
cmp dl, 09h
jbe l6
add dl, 07h
l6: add dl, 30h
mov [rsi], dl
dec rsi
dec rcx
jnz l9
mov rax, 1
mov rdi, 1
mov rsi, disparr
mov rdx, 02h

syscall 
ret

display:
mov rsi, disparr+ 15
mov rcx, 16

l2: mov rdx, 0
mov rbx, 10h
div rbx
cmp dl, 09h
jbe l1
add dl, 07h
l1: add dl, 30h
mov [rsi], dl
dec rsi
dec rcx
jnz l2
mov rax, 1
mov rdi, 1
mov rsi, disparr
mov rdx, 16h

syscall 
ret

section .data
msg db"Positive:",10
len equ $-msg

msg1 db"Negative:",10
len1 equ $-msg1

arr dq 8765432112345678h, 1234567887654321h, 9000000000000001h
cnt db 03h
cnt1 db 03h

section .bss
pcnt resb 03
ncnt resb 03
disparr resb 50
