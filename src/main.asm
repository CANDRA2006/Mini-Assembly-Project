%include "../include/windows.inc"

extern read_password
extern write_string
extern xor_buffer
extern validate_password
extern save_to_file

section .data
    menu db "1. Encrypt",13,10,"2. Decrypt",13,10,"Pilih mode: ",0
    valid_msg db 13,10,"Valid!",13,10,0
    invalid_msg db 13,10,"Password min 8 & harus ada angka!",13,10,0
    filename db "output.txt",0
    xor_key equ 0x5A

section .bss
    buffer resb 128
    mode   resb 4

section .text
global main

main:

    ; Tampilkan menu
    lea rcx, [rel menu]
    call write_string

    ; Input mode
    mov rcx, mode
    mov rdx, 2
    call read_password

    ; Input password
    lea rcx, [rel buffer]
    mov rdx, 128
    call read_password

    ; Validasi
    lea rcx, [rel buffer]
    call validate_password
    cmp rax, 1
    jne invalid

    lea rcx, [rel valid_msg]
    call write_string

    ; Encrypt / Decrypt (XOR sama saja)
    lea rcx, [rel buffer]
    mov rdx, xor_key
    call xor_buffer

    ; Simpan ke file
    lea rcx, [rel filename]
    lea rdx, [rel buffer]
    call save_to_file

    jmp exit

invalid:
    lea rcx, [rel invalid_msg]
    call write_string

exit:
    mov rcx, 0
    call ExitProcess