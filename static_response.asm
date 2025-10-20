.intel_syntax noprefix
.global _start
_start:
    socket:
    mov rax ,41 
    mov rdi ,2 
    mov rdx ,0
    mov rsi ,1       
    syscall
    mov rbx, rax           

   bind:
    mov rax,49 
    mov rdi,rbx
    lea rsi, sin_family
    mov rdx,16   
    syscall

    listen:
    mov rax,50
    mov rdi,rbx
    mov rsi , 0
    syscall
    
   accept:
    mov rdi, 3
    mov rsi, 0
    mov rdx, 0
    mov rax, 0x2b
    syscall

    read:
    mov rdi, 4
    mov rsi, rsp
    mov rdx, 146
    mov rax, 0x00
    syscall

    write:
    mov rdi, 4
    lea rsi, massage
    mov rdx, 19
    mov rax, 0x01
    syscall

    close:
    mov rdi, 4
    mov rax, 0x03
    syscall

   exit:
    mov rdi, 0
    mov rax, 0x3c        
    syscall
        
.section .data 
    sin_family: .word 2 
    sin_port: .word 20480 
    sin_addr: .word 0 
    padding: .space 8 
    massage: .string "HTTP/1.0 200 OK\r\n\r\n"