
%include "macro.asm"
global _start
_start:

extern proc1
global buff, abufflen

section .text
pop rcx
pop rcx
pop rcx
mov [filename], rcx
FOpen [filename]

cmp rax, -1h
je EXIT
mov [filehandle], rax
FRead [filehandle], buff, bufflen
dec rax
mov [abufflen], rax
call proc1

EXIT:
	mov rax, 60
	mov rdi, 0
	syscall
section .data

section .bss

filename resb 50
buff resb 50
abufflen resb 50
bufflen resb 50
filehandle resb 50
