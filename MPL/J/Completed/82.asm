%include "macro.asm"


global proc1
extern buff, abufflen

section .text
proc1:
	Write buff, abufflen
	Write msg1, len1
	Read ch1, 2
	mov bl, [ch1]
	
	mov rsi, buff
	a5:	mov al, [rsi]

	cmp al, 0Ah
	je a1
	
	cmp al, 20h
	je a2
	
	cmp al, bl 
	je a3
	jmp a4
	
	a1:	inc byte[cnte]
		jmp a4
		
	a2:	inc byte[cnts]		
		jmp a4
		
	a3:	inc byte[cntc]
		jmp a4
		
	a4:	inc rsi
	dec byte[abufflen]
	jnz a5
	
	Write msg2, len2
	mov al, byte[cnte]
	call Display
	Write msg, len

	Write msg3, len3
	mov al, byte[cnts]
	call Display
	Write msg, len

	Write msg4, len4
	mov al, byte[cntc]
	call Display
	Write msg, len
	
	ret
	
	Display:
		mov rsi, disparr+ 3
		mov rcx, 4
		
		l2:	mov rdx, 0h
		mov rbx, 10h
		div rbx
		cmp dl, 09h
		jbe l1
		add dl, 07h
		l1:	add dl, 30h
		mov [rsi], dl
		dec rsi
		dec rcx
		jnz l2
		
		Write disparr, 4
		syscall
		ret
section .data

msg db "", 10
len equ $-msg

msg1 db "Enter character to be searched:", 10
len1 equ $- msg1

msg2 db "Number of enter:", 10
len2 equ $-msg2

msg3 db "Number of Spaces:", 10
len3 equ $-msg3

msg4 db "Number of occurrence of character:", 10
len4 equ $-msg4


section .bss

disparr resb 50
ch1 resb 5
cnte resb 10
cnts resb 10
cntc resb 10
