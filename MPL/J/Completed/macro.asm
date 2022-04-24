%macro Read 2
	mov rax, 0
	mov rdi, 0
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm
	
%macro Write 2
	mov rax, 1
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
	%endm
	
%macro FRead 3
	mov rax, 0 
	mov rdi, %1
	mov rsi, %2
	mov rdx, %3
	syscall
	%endm
	
%macro FWrite 3
	mov rax, 1
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
