section .text
global xor_buffer

xor_buffer:
    ; RCX = buffer
    ; RDX = key
    mov rsi, rcx
    mov bl, dl

.loop:
    mov al, [rsi]
    cmp al, 0
    je .done
    xor al, bl
    mov [rsi], al
    inc rsi
    jmp .loop

.done:
    ret