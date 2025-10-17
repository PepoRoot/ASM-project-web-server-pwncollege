.intel_syntax noprefix
.global _start
_start:

    ;socket
    mov rax ,41
    mov rdi ,2 ;AF_INET
    mov rsi ,1 ;SOCK_STREAM
    mov rdx ,0 ;protocol
    syscall


    mov rax, 60        
    mov rdi, 0
    syscall        
