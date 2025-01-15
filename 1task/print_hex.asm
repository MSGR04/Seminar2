section .data
newline_char: db 10
codes:
    db      '0123456789ABCDEF', 10

section .text
global _start

_start:
    mov  rdi, 0x1122334455667788
    call print_hex
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, newline_char
    mov     rdx, 1
    syscall

    mov rdi, 0xFFFF
    call print_hex
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, newline_char
    mov     rdx, 1
    syscall


    mov rdi, 0xC0FFEE
    call print_hex
    mov     rax, 1
    mov     rdi, 1
    lea     rsi, newline_char
    mov     rdx, 1
    syscall
    
    mov  rax, 60
    xor  rdi, rdi
    syscall



print_hex:
    mov rax, rdi
    mov rcx, 64
    .loop:
        push rax
        sub  rcx, 4
        sar  rax, cl
        and  rax, 0xf
        lea  rsi, [codes + rax]

        mov  rax, 1
        mov  rdi, 1      
        mov  rdx, 1   
        push rcx
        syscall

        pop rcx
        pop rax

        test rcx, rcx
        jnz .loop
    ret
