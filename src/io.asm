%include "../include/windows.inc"

section .text
global write_string
global read_password

write_string:
    sub rsp, 40
    mov r8, 0
    mov r9, 0
    call GetStdHandle
    mov rbx, rax

    mov rcx, rbx
    mov rdx, [rsp+48]
    mov r8, 128
    lea r9, [rsp+32]
    call WriteConsoleA
    add rsp, 40
    ret

read_password:
    sub rsp, 40
    mov r8, 0
    mov r9, 0
    call GetStdHandle
    mov rbx, rax

    mov rcx, rbx
    mov rdx, [rsp+48]
    mov r8, [rsp+56]
    lea r9, [rsp+32]
    call ReadConsoleA
    add rsp, 40
    ret