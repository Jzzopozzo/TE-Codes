global _main
_main:

global proc1
extern buff, abufflen

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
proc1:
	Write buff, [abufflen]
	Write msg5, len5
	Write msg1, len1
	Read char1, 2
	mov bl, [char1] 
	mov rsi, buff
	l5:	mov al, [rsi]
	cmp al, 0Ah	
	je l1
	cmp al, 20h
	je l2
	cmp al, bl
	je l3
	jmp l4
	l1:	inc byte [CNTE]
		jmp l4
	l2:	inc byte [CNTS]
		jmp l4
	l3:	inc byte [CNTC]
		jmp l4
	l4:	inc rsi
	dec byte [abufflen]
	jnz l5
	
	Write msg2, len2 
	mov al, byte[CNTE]
	call display
	Write msg5, len5

	Write msg3, len3
	mov al, byte[CNTS]
	call display
	Write msg5, len5

	Write msg4, len4
	mov al, byte[CNTC]
	call display
	Write msg5, len5

	ret
	display:
	mov rsi, disparr +1
	mov rcx, 2
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
	Write disparr, 02
	ret
	
section .data
msg1 db "Enter the character to be searched:", 
len1 equ $- msg1

msg2 db "Number of lines:",
len2 equ $- msg2

msg3 db "Number of spaces:", 
len3 equ $- msg3

msg4 db "Number of occurence of character:",
len4 equ $- msg4

msg5 db " ", 10
len5 equ $- msg5

section .bss
disparr resb 50
char1 resb 50 
CNTE resb 50
CNTS resb 50
CNTC resb 50

