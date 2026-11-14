HUSSAIN AYUB 


QUESTION 2:


section .data
    numbers dd 8, 16, 24, 32

section .text
    global _main

_main:
    ; Loading the second array value which is 16
    mov eax, [rel numbers + 4]

    ; Multiply by 4
    mov ebx, 4
    mul ebx

    ; clear EDX before division
    xor edx, edx

    ; Divide by 8
    mov ecx, 8
    div ecx

    ; Store the number in the second position
    mov [rel numbers + 4], eax

    ; exit the program
    mov edi, eax
    mov eax, 0x2000001
    syscall


 
