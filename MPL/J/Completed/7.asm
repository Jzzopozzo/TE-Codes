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
	
%macro FOpen 1
	mov rax, 2
	mov rdi, %1
	mov rsi, 2
	mov rdx, 0777o
	syscall
	%endm
	
%macro Delete 1
	mov rax, 87
	mov rdi, %1
	syscall
	%endm
	
%macro Close 1
	mov rax, 3
	mov rdi, %1
	syscall
	%endm

MENU: 	Write menu, len
	Read ch1, 2
	mov al, byte[ch1]
	
	cmp al, 31h
	je TYPE

	cmp al, 32h
	je COPY
	
	cmp al, 33h
	je DELETE
	
	cmp al, 34h
	je EXIT

	TYPE:		
		pop rcx					; pop no. of arguments
		pop rcx					; pop program name
		pop rcx					; pop required file name
		mov [filename1], rcx			; file name taken in rcx
		FOpen[filename1]			; file opened
		cmp rax, -1h				; returns -1 in case of error
		je EXIT
	
		mov [filehandle1], rax			; copied rax into filehandle
		FRead [filehandle1], buff, bufflen	; read file
		dec rax					; calculate actual length of file
		mov [abufflen], rax			; stored actual length
		Write buff, abufflen			; TYPE command complete
		jmp MENU
	
	COPY:
		pop rcx
		mov [filename2], rcx
		FOpen [filename2]
		cmp rax, -1h
		je EXIT
		mov [filehandle2], rax
		FWrite [filehandle2], buff, abufflen
		Write msg1, len1
		Close [filehandle1]		
		Close [filehandle2]
		jmp MENU
	
	DELETE:
		Delete [filename2]
		Write msg2, len2
		jmp MENU
		
		cmp rax, -1h
		jle EXIT
		jmp MENU
	EXIT:
		mov rax, 60
		mov rsi, 0
		syscall
section .data

menu db "MENU:", 10
	db "1. TYPE", 10
	db "2. COPY", 10
	db "3. DELETE", 10
	db "4. EXIT", 10
	db "Enter choice:", 10
	len equ $- menu
	
msg1 db "File 1 has copied to file 2 successfully!", 10
len1 equ $- msg1

msg2 db "File 2 has been deleted successfully!", 10
len2 equ $- msg2
section .bss
ch1 resb 10
filehandle1 resb 10
filehandle2 resb 10
filename1 resb 10
filename2 resb 10
buff resb 10
bufflen resb 10
abufflen resb 10
