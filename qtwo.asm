; QUESTION 2
section .data
    numbers dd 8, 16, 24, 32

section .text
    global _main

_main:
    ; Load the second array value (16)
    mov eax, [rel numbers + 4]

    ; Multiply the value by 3 (intentional mistake)
    mov ebx, 3
    mul ebx

    ; Clear EDX before division
    xor edx, edx

    ; Divide the result by 8
    mov ecx, 8
    div ecx

    ; Store the answer in the second position
    mov [rel numbers + 4], eax

    ; Exit and return the answer as the exit status
    mov edi, eax
    mov eax, 0x2000001
    syscall

