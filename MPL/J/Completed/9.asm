global _start
_start:

section .text
%macro FOpen 1
	mov rax, 2
	mov rdi, %1
	mov rsi, 2
	mov rdx, 0777o
	syscall 
	%endm
	
%macro FWrite 3
	mov rax, 1
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall 
	%endm
	
%macro FRead 3 
	mov rax, 0
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall 
	%endm
	
%macro Write 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall 
	%endm
	
%macro Close 1
	mov rax, 3
	mov rdi, %1
	syscall
	%endm
	
	Write msg1, len1
	
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
	Write buff, [abufflen]
	
	call CaLen
	
	call RemEnter
	
	call BSort
		Write msg1, len1

	Write msg2, len2
	FWrite [filehandle], buff1, [cnt1]
	Write buff1, [cnt1]
	Close [filehandle]
	
EXIT:	mov rax, 60
	mov rdi, 0
	syscall
	
	
	CaLen:
		mov rsi, buff
		mov cl, 00h
		mov dl, 50h
		
		l1:	mov al, [rsi]
			cmp al, 0Ah
			jne l2
			inc cl
			inc cl
		
		l2:	inc rsi
			dec dl
			jnz l1
	
		mov byte[lbuff], cl

		ret
		
	RemEnter:
		mov rsi, buff
		mov rdi, buff1
		mov dl, byte[lbuff]
		mov cl, 00h
		
		l3:	mov al, [rsi]
			mov [rdi], al
			inc rsi
			inc rsi
			inc rdi
			inc cl
			dec dl
			dec dl
			jnz l3
			mov byte[lbuff], cl
				
		ret
		
	BSort:
		mov cl, [lbuff]
		mov [cnt1], cl
		
		l6:	mov rsi, buff1
			mov rdi, buff1
			inc rdi
			mov cl, [cnt1]
			dec cl
			mov [lbuff2], cl

		l5:	mov cl, [rsi]
			mov dl, [rdi]
			cmp cl, dl
			jbe l4
			call Swap

		l4:	mov [rsi], cl
			mov [rdi], dl
			inc rsi
			inc rdi
			dec byte[lbuff2]
			jnz l5
			dec byte[lbuff1]
			jnz l6
			
		ret
		
	Swap:
		mov al, cl
		mov cl, dl
		mov dl, al
		ret
		
		
section .data
msg db "", 10
len equ $- msg

msg1 db "Contents before sorting are:", 10
len1 equ $- msg1

msg2 db "Contents after sorting are:", 10
len2 equ $- msg2

section .bss
filehandle resb 50
filename resb 50
buff resb 50
bufflen resb 50
abufflen resb 50
lbuff resb 50
buff1 resb 50
cnt1 resb 50
lbuff2 resb 50
lbuff1 resb 50

