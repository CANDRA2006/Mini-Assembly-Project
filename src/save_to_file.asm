extern CreateFileA
extern WriteFile
extern CloseHandle

global save_to_file

save_to_file:
    sub rsp, 40

    mov r8, 0
    mov r9, 0
    call CreateFileA
    mov rbx, rax

    mov rcx, rbx
    mov rdx, [rsp+56]
    mov r8, 128
    lea r9, [rsp+32]
    call WriteFile

    mov rcx, rbx
    call CloseHandle

    add rsp, 40
    ret