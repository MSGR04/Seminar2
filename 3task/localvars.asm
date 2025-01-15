codes:
    db      '0123456789ABCDEF', 10
    
global _start

section .text

local_vars:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 40          

    mov     qword [rbp - 8],  0xAA
    mov     qword [rbp - 16], 0xBB
    mov     qword [rbp - 24], 0xCC
    mov     qword [rbp - 32], 0xFF


    mov     rdi, [rbp - 8]
    call    print_hex

    mov     rdi, [rbp - 16]
    call    print_hex

    mov     rdi, [rbp - 24]
    call    print_hex

    mov     rdi, [rbp - 32]
    call    print_hex

    add     rsp, 40
    pop     rbp
    ret

_start:
    call    local_vars

    mov     rax, 60        
    xor     rdi, rdi       
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
