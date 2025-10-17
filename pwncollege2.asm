.intel_syntax noprefix
.global _start
_start:
    socket:                 ; create a new socket
    ; Syscall: socket(AF_INET=2, SOCK_STREAM=1, protocol=0)
    mov rax, 41            ; sys_socket
    mov rdi, 2             ; AF_INET
    mov rsi, 1             ; SOCK_STREAM
    mov rdx, 0             ; protocol 0
    syscall
    mov rbx, rax           ; save socket fd in rbx

    bind:                   ; bind(socket, &addr, sizeof(addr))
    mov rax, 49            ; sys_bind
    mov rdi, rbx           ; sockfd
    lea rsi, sin_family    ; pointer to sockaddr_in (sin_family is start)
    mov rdx, 16            ; sizeof(struct sockaddr_in) = 16
    syscall

    listen:                 ; listen(socket, backlog)
    mov rax, 50            ; sys_listen
    mov rdi, rbx           ; sockfd
    mov rsi, 0             ; backlog = 0 (no queue)
    syscall

    accept:                 ; accept(connection)
    mov rax, 43            ; sys_accept
    mov rdi, rbx           ; sockfd
    mov rsi, 0             ; NULL addr
    mov rdx, 0             ; NULL addrlen
    syscall
    mov r10, rax           ; client fd in rax -> save to r10

    exit:                   ; exit(0)
    mov rax, 60            ; sys_exit
    mov rdi, 0             ; status 0
    syscall

    .section .data
    ; sockaddr_in layout (total 16 bytes):
    ;  .word sin_family (2 bytes)
    ;  .word sin_port   (2 bytes) - network byte order
    ;  .word sin_addr   (4 bytes)
    ;  .space padding   (8 bytes) - pad to 16 bytes
    sin_family: .word 2
    ; sin_port is htons(80) -> 0x5000 = 20480, so this binds to TCP port 80
    sin_port: .word 20480
    sin_addr: .word 0      ; INADDR_ANY (0.0.0.0)
    padding: .space 8