.intel_syntax noprefix
.global _start
_start:
    socket:
    mov rax ,41
    mov rdi ,2 
    mov rsi ,1 
    mov rdx ,0 
    syscall
    mov rbx, rax
    bind:
    mov rbx, rax 
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
    mov rax,43
    mov rdi,rbx
    mov rsi,0
    mov rdx,0
    syscall
    mov r10,rax
        


    exit:
    mov rax, 60        
    mov rdi, 0
    syscall    
        
.section .data 
    sin_family: .word 2 
    sin_port: .word 20480 
    sin_addr: .word 0 
    padding: .space 8 