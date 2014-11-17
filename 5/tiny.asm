GLOBAL _start
SECTION .text

_start:
    xor eax, eax
    inc eax
    mov bl, 42
    int 0x80
