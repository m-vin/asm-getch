section .data
	intro db "getch simples...programado por m-vin",10,0
	msg1 db "aperte uma tecla: "
	msg2 db "a tecla apertada: "
	new_line db 10,0

section .bss
	ch_to_read resb 1

section .text
global _start

_start:

;intro (sys_write)
	mov rax, 1
	mov rdi, 1
	mov rsi, intro
	mov rdx, 38
	syscall

;msg1 (sys_write)
	mov rax, 1
	mov rdi, 1
	mov rsi, msg1
	mov rdx, 18
	syscall

;armazena o caracter digitado em ch_to_read (sys_read)
	mov rax, 0
	mov rdi, 1
	mov rsi, ch_to_read
	mov rdx, 1
	syscall

;msg2 (sys_write)
	mov rax, 1
	mov rdi, 1
	mov rsi, msg2
	mov rdx, 18
	syscall

;mostra o caracter ch_to_read (sys_write)
	mov rax, 1
	mov rdi, 1
	mov rsi, ch_to_read
	mov rdx, 1
	syscall

;new_line (sys_write)
	mov rax, 1
	mov rdi, 1
	mov rsi, new_line
	mov rdx, 2
	syscall

;sai do programa (sys_exit)
	mov rax, 60
	mov rdi, 0
	syscall
