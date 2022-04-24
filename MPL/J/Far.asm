global _start
_start:

extern proc1
global buff, abufflen

section .text
; macro to read from file
	%macro FRead 3
	mov rax, 0
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
	%endm

; macro to write into file
	%macro FWrite 3
	mov rax, 1
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
	%endm

; macro to open a file
	%macro Open 1
	mov rax, 2
	mov rdi, %1
	mov rsi, 2
	mov rdx, 0777o
	syscall
	%endm

; macro to delete file
	%macro Delete 1
	mov rax, 87
	mov rdi, %1
	syscall
	%endm

; macro to close file
	%macro Close 1
	mov rax, 3
	mov rdi, %1
	syscall
	%endm
	%macro Write 2
		mov rax, 1
		mov rdi, 1
		mov rsi, %1
		mov rdx, %2
		syscall
	%endm
Write msg, len
pop rcx
pop rcx
pop rcx
mov [filename], rcx
Open [filename]

cmp rax, -1h
je Error
mov [filehandle], rax
FRead [filehandle], buff, bufflen

dec rax
mov [abufflen], rax

call proc1
Write msg6, len6
Close [filehandle]

Error:
	mov rax, 60
	mov rdi, 0
	syscall
section .data
msg db "Contents of file are:", 10
len equ $- msg

msg6 db "", 10
len6 equ $- msg6

section .bss
filename resb 50
buff resb 50
bufflen resb 50
abufflen resb 50
filehandle resb 50
