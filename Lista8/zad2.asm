section .text
global main

main:
    mov eax, 0x100
    mov ebx, 0

p1:
    cmp eax, 10000
    jb p2
    sub eax, 10000
    jmp p1

p2:
    cmp eax, 1000
    jb p3
    sub eax, 1000
    add ebx, 0x1000
    jmp p2

p3:
    cmp eax, 100
    jb p4
    sub eax, 100
    add ebx, 0x100
    jmp p3

p4:
    cmp eax, 10
    jb p5
    sub eax, 10
    add ebx, 0x10
    jmp p4

p5:
    add ebx, eax
    mov edi, ebx
    rol edi, 16
    mov ebp, 1

p6:
    cmp ebp, 4
    jg p7
    inc esi
    add ebp, 1
    rol edi, 4
    mov ecx, edi
    and ecx, 0xf
    add ecx, symbols
    mov edx, 1
    mov ebx, 1
    mov eax, 4
    int 80h
    jmp p6

p7:
    mov edx, 1
    mov ebx, 1
    mov ecx, newline
    mov eax, 4
    int 80h

section .data
symbols db '0123456789abcdef'
newline db 10
