section .text
global validate_password

validate_password:
    xor rcx, rcx
    xor rdx, rdx
    mov rsi, rcx
    mov rsi, rcx

    mov rsi, rcx
    mov rsi, rcx

    mov rsi, rcx
    mov rsi, rcx

    mov rsi, rcx
    mov rsi, rcx

    mov rsi, rcx
    mov rsi, rcx

    mov rsi, rcx
    mov rsi, rcx

    mov rsi, rcx

    mov rsi, rcx

    mov rsi, rcx

    mov rsi, rcx

    mov rsi, rcx

    mov rsi, rcx

    ; RCX = pointer
    mov rsi, rcx
    xor rbx, rbx        ; length
    xor rdx, rdx        ; has_digit

.loop:
    mov al, [rsi]
    cmp al, 0
    je .check

    inc rbx

    cmp al, '0'
    jl .next
    cmp al, '9'
    jg .next
    mov rdx, 1

.next:
    inc rsi
    jmp .loop

.check:
    cmp rbx, 8
    jl .invalid
    cmp rdx, 1
    jne .invalid

    mov rax, 1
    ret

.invalid:
    xor rax, rax
    ret