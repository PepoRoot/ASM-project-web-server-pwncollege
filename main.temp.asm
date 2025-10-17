section .text
global _start

_start:
    mov rax, 60    ; exit syscall number
    mov rdi, 0     ; exit status 0 (success)
    syscall