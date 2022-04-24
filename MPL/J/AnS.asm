global _start
_start:

section .text
; Macro to display a message:
	%macro Write 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm
	
;Macro to accept input:
	%macro Read 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2	
	syscall
	%endm
	
	
	Write msg1, len1
	Read num1, 03
	call Convert
	mov [no1], ax
	
	Write msg2, len2
	Read num1, 03
	call Convert
	mov [no2], ax
	
	mov ax, [no1]
	mov bx, [no2]
	
	a1:	shr bx, 1
	jnc a2
	add [res], ax
	a2:	shl ax, 1
	cmp ax, 0000H
	je a3
	cmp bx, 0000H
	jne a1
	a3:	mov ax, [res]
	call Display
	
	mov rax, 60
	mov rdi, 0
	syscall
	
	Display:
	mov rsi, disparr+ 3
	mov rcx, 4
	mov rdx, 0
	l1:	mov rdx, 0
	mov rbx, 10
	div rbx
	cmp dl, 09h
	jbe l2
	add dl, 07h
	l2: add dl, 30h
	mov [rsi], dl
	dec rsi
	dec rcx
	jnz l1
	
	mov rax, 1
	mov rdi, 1
	mov rsi, disparr
	mov rdx, 4
	syscall
	ret
	
	Convert:
	mov rsi, num1
	mov al, [rsi]
	cmp al, 39h
	jbe l3
	sub al, 07h
	l3:	sub al, 30h
	rol al, 04h
	mov bl, al
	inc rsi
	mov al, [rsi]
	cmp al, 39h
	jbe l4
	sub al, 07h
	l4:	sub al, 30h
	add al, bl
	ret
	
section .data
msg1 db "Enter multiplicand:", 10
len1 equ $- msg1

msg2 db "Enter multiplier:", 10
len2 equ $- msg2

section .bss
num1 resb 5
no1 resb 5
res resw 50
no2 resb 5
disparr resw 50
