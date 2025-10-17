.intel_syntax noprefix
.global _start
_start:

    ;socket
    mov rax ,41
    mov rdi ,2 ;AF_INET
    mov rsi ,1 ;SOCK_STREAM
    mov rdx ,0 ;protocol
    syscall
    mov rbx, rax ;save sockfd
    ;bind
    mov rax,49; 
    mov rdi,rbx;
    mov rsi, sin_family;  
    mov rdx,16 ;   
    syscall




    mov rax, 60        
    mov rdi, 0
    syscall        
.section .data 
    ;sockaddr_in struct
    sin_family: .word 2 ;AF_INET
    sin_port: .word 20480 ;port
    sin_addr: .word 0 ;INADDR_ANY
    padding: .space 8 ;padding

    