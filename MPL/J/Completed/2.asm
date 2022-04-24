global _start
_start:

section .text
%macro Write 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm
	
%macro Read 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm

	Write MENU, len
	Read ch1, 2
	
	mov al, byte[ch1]
	cmp al, 31h
	je Choice1
	
	cmp al, 32h
	je Choice2
	
	cmp al, 33h
	je Choice3
	
	cmp al, 34h
	je Choice4
	
	cmp al, 35h
	je Exit
	
	Choice1:
		Write msg1, len1
		mov rsi, sarr
	
	Choice2:
		mov rsi, sarr		; rsi points to sarr
		mov rdi, darr		; rdi points to darr
		cld			; direction flag cleared
		mov rcx, 06h		; count given to rcx
		rep movsb		; repeat the process of copying string
			
		mov rsi, darr		; rsi points to darr
		a1:	mov al, [rsi]	; contents of rsi copied to al	
		push rsi		; rsi pushed on stack
		call Display	
		pop rsi			
		inc rsi
		dec byte[cnt]		
		jnz a1
	
	Choice3:
	
	Choice4:
	
	Exit:
		mov rax, 60
		mov rdi, 0
		syscall
	
	
	Display:
		mov rsi, disparr+ 1
		mov rcx, 2
		
		l2:	mov rdx, 0
			mov rbx, 10
			div rbx
			cmp dl, 09h
			jbe l1
			add dl, 07h
			l1:	add dl, 30h
			dec rcx
			dec rsi
			jnz l2
			Write msg, leng
			Write disparr, 2
			syscall 
			ret
		
section .data

MENU db"MENU", 10
db "1. Non overlap without string", 10
db "2. Non overlap with string", 10
db "3. Overlap without string", 10
db "4. Overlap without string", 10
db "5. Exit", 10
len equ $- MENU

msg db "", 10
leng equ $- msg

msg1 db "Original array is:", 10
len1 equ $- msg1

msg2 db "Copied array is:", 10
len2 equ $- msg2

sarr db 01h, 02h, 03h, 04h, 05h, 06h
darr db 00h, 00h, 00h, 00h, 00h, 00h
cnt db 06h

section .bss
ch1 resb 5
disparr resb 50
