global _start
_start:

section .text
; macro to display message
	%macro Write 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm

; macro to accept a number
	%macro Read 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm

	Write msg1, len1
	Read num1, 02
	push num1
	dec byte[num1]
	cmp byte[num1], 1
	je l1
	l1:	
section .data
msg db"Enter a number:", 10
len1 equ $- msg1

section .bss
num1 resb 5
