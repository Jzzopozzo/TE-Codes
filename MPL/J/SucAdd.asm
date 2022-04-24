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
	
	Write m1, len1
	Read num1, 03
	call Convert
	mov [no1], al

	Write m2, len2
	Read num1, 03
	call Convert
	mov [no2], al

	l1:	mov al, [no1]		;no1=no2
	add [res], al		;al copied 2 res
	dec byte[no2]	; no2 got reduced by 1
	jnz l1
	mov al, [res]	;al=sum
	call Display
	 
	mov rax, 60
	mov rdi, 0
	syscall
	
	Display:
	mov rsi, disparr+ 3
	mov rcx, 4
	l3:	mov rdx, 0
	mov rbx, 10h
	div rbx
	cmp dl, 09h
	jbe l2
	add dl, 07h
	l2:	add dl, 30h
	mov [rsi], dl
	dec rsi
	dec rcx
	jnz l3
	
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
	jbe l4
	sub al, 07h
	l4:	sub al, 30h
	rol al, 04h
	mov bl, al
	inc rsi
	mov al, [rsi]
	cmp al, 39h
	jbe l5
	sub al, 07h
	l5:	sub al, 30h
	add al, bl
	ret
	
	
section .data
m1 db "Enter 1st number:", 10
len1 equ $-m1

m2 db "Enter 2nd number:", 10
len2 equ $-m2

section .bss
num1 resb 5
no1 resb 5
no2 resb 5
disparr resb 50
res resb 5
