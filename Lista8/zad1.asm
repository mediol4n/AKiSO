section .text
global main
main:

mov edi, 255;

ror edi, 4
mov esi, edi
and esi, 0xf
add esi, symbols
mov edx, 1
mov ecx, esi
mov ebx, 1
mov eax, 4
int 80h
rol edi, 4
mov esi, edi
and esi, 0xf
add esi, symbols
mov edx, 1
mov ecx, esi
mov ebx, 1
mov eax, 4
int 80h
mov edx, 1
mov ecx, newline
mov ebx, 1
mov eax, 4
int 80h


mov ebx, 0
mov eax, 1
int 80h

section .data
newline db 10
symbols db '0123456789abcdef'
