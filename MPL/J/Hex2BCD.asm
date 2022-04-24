global _start
_start:

section .text
	;Macro for displaying message:
	%macro write 2 
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm
	
	;Macro for accepting input:
	%macro in 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1 
	mov rdx, %2
	syscall
	%endm
	
	write msg, len
	in num1, 2	;accepts tho and hun digit
	call convert
	mov [no1], al
	
	in num1, 3
	call convert
	mov [no2], al	
	
	mov al, [no2]
	mov ah, [no1]
	mov rsi, arr
	l3: mov bx, [rsi]
	mov dx, 0
	div bx
	mov [rem], dx
	push rsi
	call display
	pop rsi
	inc rsi
	inc rsi
	mov ax, [rem]
	dec byte[cnt]
	jnz l3
	
	
	mov rax, 60
	mov rbx, 0
	syscall
	
	convert:
	mov rsi, num1
	mov al, [rsi]
	cmp al, 39h
	jbe l1
	sub al, 07h
	l1:	sub al, 30h
	rol al, 04h	; swaps contents of al per nibble
	mov bl, al

	inc rsi

	mov al, [rsi]
	cmp al, 39h
	jbe l2
	sub al, 07h
	l2:	sub al, 30h
	add al, bl	; We get the decimal equivalent of our number

	ret
	
	display:
	cmp al, 09h
	jbe l4
	add al, 07h
	l4:	add al, 30h
	mov [t1], al
	write t1, 1
	ret
	
section .data
	msg db "Enter a 4- digit hexadecimal number to be converted:", 10
	len equ $- msg

	arr dw 2710h, 03E8H, 0064H, 000AH, 0001H

	cnt db 05h

section .bss
	num1 resb 5
	no1 resb 5
	no2 resb 5
	rem resb 5
	t1 resb 5

