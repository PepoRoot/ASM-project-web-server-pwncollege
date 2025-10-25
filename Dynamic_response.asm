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
    mov rdi,3
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
    mov rdx, 256
    mov rax, 0x00
    syscall

    mov r10, rsp
    parse_get:
    mov al, byte ptr [r10]
    cmp al, ' '
    je done1
    add r10, 1
    jmp parse_get
    done1:
        add r10, 1
        mov r11, r10
    parse_FILE:
        mov al, byte ptr [r11]
        cmp al, ' '
        je done2
        add r11, 1
        jmp parse_FILE
    done2:
    mov byte ptr [r11], 0
    open:
    mov rax,2
    mov rdi, r10
    mov rsi,0
    mov rdx,0
    syscall

    
    mov rdi, 5
    mov rsi , rsp
    mov rdx ,256
    mov rax, 0x00
    syscall

    mov r12, rax

    close:
    mov rdi, 5
    mov rax, 0x03
    syscall

    write:
    mov rdi, 4
    lea rsi, massage
    mov rdx, 19
    mov rax, 0x01
    syscall

    Write:
    mov rdi, 4
    mov rsi, rsp
    mov rdx, r12
    mov rax, 0x01
    syscall

    Close:
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