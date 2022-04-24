global _start   
_start:

section .text
;macro to open an existing file
	%macro fopen 1
		mov rax, 2
		mov rdi, %1
		mov rsi, 2
		mov rdx, 0777o
		syscall
	%endm

;macro to read from an existing file
	%macro fread 3
		mov rax, 0
		mov rdi, %1
		mov rsi, %2
		mov rdx, %3
		syscall
	%endm
	
;macro to display on screen
	%macro Write 2
		mov rax, 1
		mov rdi, 1
		mov rsi, %1
		mov rdx, %2
		syscall
	%endm
;macro to close opened file
	%macro Close 1
		mov rax, 3
		mov rdi, %1
		syscall
	%endm

;macro to write into an existing file
	%macro FWrite 3
		mov rax, 1
		mov rdi, %1
		mov rsi, %2
		mov rdx, %3
		syscall
	%endm
	
; macro to delete a file
	%macro Delete 1
		mov rax, 87
		mov rdi, %1
		syscall
	%endm
	
	Write msg2, len2			;Contents of original file are
	
	pop rcx
	pop rcx
	pop rcx					;found t1
	mov [filename1], rcx			; rcx has name of file to be opened
	fopen [filename1]			;opens filename1
	cmp rax, -1h				; if not opened successfully then 
	je Error
	
	mov [filehandle1], rax			;file handle copied to rax
	fread [filehandle1], buff, bufflength	
	dec rax					
	mov [abufflen], rax			
	Write buff, [abufflen]
	
	pop rcx
	mov [filename2], rcx
	fopen [filename2]
	cmp rax, -1h
	je Error
	
	mov [filehandle2], rax
	FWrite [filehandle2], buff, [abufflen]
	
	Write msg1, len1
	Write msg3, len3
	Write buff, [abufflen]

	Close [filehandle1]
	Close [filehandle2]
	Write msg, len	
	
	Delete [filename2]
	Write msg4, len4
	Error:
		mov rax, 60
		mov rsi, 0
		syscall
section .data
msg db " ", 10
len equ $- msg

msg1 db "***FILE COPIED SUCCESSFULLY!*** ", 10
len1 equ $- msg1

msg2 db "Contents of original file are: ", 10
len2 equ $- msg2

msg3 db "Contents of copied file are:", 10
len3 equ $- msg3

msg4 db "Copied file has been deleted successfully! ", 10
len4 equ $- msg4

section .bss
abufflen resb 100
filename1 resb 10
buff resb 50
bufflength resb 50
filehandle1 resb 20
filehandle2 resb 20
filename2 resb 10
