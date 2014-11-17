BITS 64                                         ; -f bin
            org     0x00400000

ehdr:                                           ; Elf64_Ehdr
            db      0x7F, "ELF", 2, 1, 1, 0     ;   e_ident

_start:
            xor     eax, eax
            inc     eax
            mov     bl, 42
            int     0x80

            dw      2                           ;   e_type
            dw      0x3E                        ;   e_machine
            dd      1                           ;   e_version
            dq      _start                      ;   e_entry
            dq      phdr - $$                   ;   e_phoff
            dq      0                           ;   e_shoff
            dd      0                           ;   e_flags
            dw      ehdrsize                    ;   e_ehsize
            dw      phdrsize                    ;   e_phentsize
phdr:                                                              ; Elf64_Phdr
            dd      1                           ;   e_phnum        ;   p_type
                                                ;   e_shentsize
            dd      5                           ;   e_shnum        ;   p_flags
                                                ;   e_shstrndx

ehdrsize    equ     $ - ehdr

            dq      0                                              ;   p_offset
            dq      $$                                             ;   p_vaddr
            dq      $$                                             ;   p_paddr
            dq      filesize                                       ;   p_filesz
            dq      filesize                                       ;   p_memsz
            dq      0x200000                                       ;   p_align

phdrsize    equ     $ - phdr

filesize    equ     $ - $$
