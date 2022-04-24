global _start
_start:

section .text
;Macro to write into system
%macro Write 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endm
	
	;to display contents of MSW:
	smsw eax
	mov [CRdata], eax
	bt eax, 0
	jc l1
	jmp exit
	l1:	Write msg1, len1	
	Write msg7, len7
	mov ax, [CRdata+ 2]
	call display
	mov ax, [CRdata]
	call display
	Write msg6, len6	

	Write msg6, len6
	Write msg2, len2
	;to display contents of LDTR:
	sldt ax
	call display
	Write msg6, len6
		
	Write msg6, len6
	Write msg4, len4
	; to display contents of IDTR:
	sidt [t1]
	mov ax, [t1+ 4]
	call display
	mov ax, [t1+2]
	call display
	mov ax, [t1]
	call display
	Write msg6, len6
		
	Write msg6, len6
	Write msg3, len3
	;to display contents of GDTR:
	sgdt [t2]
	mov ax, [t2+ 4]
	call display
	mov ax, [t2+ 2]
	call display
	mov ax, [t4]
	call display
	Write msg6, len6
	
	Write msg6, len6
	Write msg5, len5
	; to display contents of TR:
	str [t3]
	call display
	Write msg6, len6
		
	Write msg6, len6
	exit:	mov rax, 60
	mov rbx, 0
	syscall
	
	display:
	mov rsi, disparr+ 3
	mov rcx, 4
	l2:	mov rdx, 0
	mov rbx, 10h
	div rbx
	cmp dl, 09h
	jbe l3
	add dl, 07h
	l3:	add dl, 30h
	mov [rsi], dl
	dec rsi
	dec rcx
	jnz l2
	
	mov rax, 1
	mov rdi, 1
	mov rsi, disparr
	mov rdx, 4
	syscall
	ret
	
section .data
msg1 db "Entered Protected mode!", 10
len1 equ $- msg1

msg2 db "Contents of LDTR are:", 10
len2 equ $- msg2

msg3 db "Contents of GDTR are:", 10
len3 equ $- msg3

msg4 db "Contents of IDTR are:", 10
len4 equ $- msg4

msg5 db "Contents of TR are:", 10
len5 equ $- msg5

msg6 db "   ", 10
len6 equ $- msg6

msg7 db "Contents of MSW are:", 10
len7 equ $- msg7

section .bss
CRdata resb 4
t1 resb 6
t2 resb 6
t3 resb 6
t4 resb 6
disparr resb 35
