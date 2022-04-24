global _start
_start:

section .text
;Macro to write into system:
	%macro Write 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm

;Macro to accept digits from the system:
	%macro Accept 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm
	
	Write msg1, len1
	Accept num, 3
	call Convert
	mov [no1], al
	cmp al, 01h
	ja l1
	Write msg2, len2
	jmp exit
	
	l1:	push rax
	Write msg3, len3
	pop rax
	mov rcx, rax
	dec rcx
	
	l2:	push rax
	dec rax
	cmp rax, 01h
	ja l2
	
	l3:	pop rbx
	mul rbx
	dec rcx
	jnz l3
	call display
	
	exit:	mov rax, 60
	mov rdi, 0
	syscall
	
	Convert:
	mov rsi, num
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
	
	display:
	mov rsi, disparr+ 15
	mov rcx, 16
	l6:	mov rdx, 0
	mov rbx, 10h
	div rbx
	cmp dl, 09h
	jbe l7
	add dl, 07h
	l7:	add dl, 30h
	mov [rsi], dl
	dec rsi
	dec rcx
	jnz l6
	mov rax, 1
	mov rdi, 1
	mov rsi, disparr
	mov rdx, 16
	syscall

	ret
	
	
section .data
msg1 db"Enter number whose factorial is to be found:", 10
len1 equ $- msg1

msg2 db"Factorial of entered number is 1.", 10
len2 equ $- msg2

msg3 db"Factorial of number is:", 10
len3 equ $- msg3

cnt db 03h


section .bss
num resb 5
no1 resb 5
disparr resb 50
