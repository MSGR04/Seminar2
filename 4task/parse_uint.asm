global parse_uint
section .text

parse_uint:
    xor rax, rax
    xor rdx, rdx

    mov r11, rdi

.read_loop:

    mov r8b, [r11]

    cmp r8b, '0'
    jb .done        
    cmp r8b, '9'
    ja .done        

    imul rax, rax, 10
    sub r8b, '0'
    add rax, r8

    inc rdx


    inc r11
    jmp .read_loop

.done:
    ret
