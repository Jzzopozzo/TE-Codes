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

%macro FWrite 3
	mov rax, 1
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
%endm

%macro Close 1
	mov rax, 3
	mov rdi, %1
	syscall
%endm

	pop rcx
	pop rcx
	pop rcx
	mov [filename], rcx
	FOpen [filename]
	cmp rax, -1h
	je Error
	
	mov [filehandle], rax
	FRead [filehandle], buff, bufflen
	dec rax
	mov [abufflen], rax
	Write buff, [abufflen]
	call CalLen
	call RemEnter
	call BSort
	Write msg1, len1
	Write msg, len
	FWrite [filehandle], buff1, [cnt1]
	Write buff1, [cnt1]
	Close [filehandle]
	
	Error:	mov rax, 60
		mov rdi, 0
		syscall
	
	CalLen:
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
	mov cl,00h
	l3:	mov al, [rsi]
		mov [rdi], al
		inc rsi 
		inc rsi
		inc rdi
		inc cl
		dec dl
		dec dl
		jnz l3
		mov byte[lbuff1], cl
		ret
		
	BSort:
	mov cl, [lbuff1]
		mov [cnt1], cl
	j1:	mov rsi, buff1
		mov rdi, buff1
		inc rdi
		mov cl, [cnt1]
		dec cl
		mov [lbuff2], cl
		
	j2:	mov cl, [rsi]
		mov dl, [rdi]
		cmp cl, dl
		jbe j3
		call Swap
	
	j3:	mov [rsi], cl
		mov [rdi], dl
		inc rsi
		inc rdi
		dec byte[lbuff2]
		jnz j2
		dec byte[lbuff1]
		jnz j1
		ret
		
	Swap:
		mov al, cl
		mov cl, dl
		mov dl, al
		ret
		
section .data
msg db "Sorted array is:", 10
len equ $- msg

msg1 db "", 10
len1 equ $- msg1

section .bss
filename resb 100
filehandle resb 200
buff resb 100
bufflen resb 200
abufflen resb 200
cnt1 resb 100
lbuff resb 200
lbuff1 resb 200
lbuff2 resb 200
buff1 resb 200
