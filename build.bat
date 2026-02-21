@echo off
nasm -f win64 src/main.asm -o main.obj
nasm -f win64 src/io.asm -o io.obj
nasm -f win64 src/crypto.asm -o crypto.obj
nasm -f win64 src/validator.asm -o validator.obj

gcc main.obj io.obj crypto.obj validator.obj -o securexor.exe -lkernel32
echo Build selesai!
pause