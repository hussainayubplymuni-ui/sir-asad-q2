HUSSAIN AYUB 


QUESTION 2:


section .data
    numbers dd 8, 16, 24, 32

section .text
    global _main

_main:
    ; Load the second array value (16)
    mov eax, [rel numbers + 4]

    ; Multiply the value by 4
    mov ebx, 4
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
QUESTION 3
;QUESTION 3:


section .data
    ; Array A contains 10 values
    A db 2, 4, 6, 8, 10, 12, 14, 16, 18, 20

    ; Array C contains 10 values
    C db 4, 6, 8, 10, 12, 14, 16, 18, 20, 22

    ; Array B reserves 10 bytes for results
    B times 10 db 0

section .text
    global _main

_main:
    ; getting the starting addresses of the arrays
    lea r8, [rel A]
    lea r9, [rel C]
    lea r10, [rel B]

    ; starting the loop at index 0
    xor r11d, r11d

loop_start:

    ;load A[i] and multiply it by 3
    movzx eax, byte [r8 + r11]
    mov ecx, 3
    mul ecx

    ; add 1 to the result
    add eax, 1

    ; saving  first part of the calculation
    mov esi, eax

    ; load C[i] and multiply it by 2
    movzx eax, byte [r9 + r11]
    mov ecx, 2
    mul ecx

    ; add 1 to the result
    add eax, 1

    ; add the first and second parts
    add esi, eax

    ; calculate (A[i] + C[i]) / 2
    movzx eax, byte [r8 + r11]
    movzx edx, byte [r9 + r11]
    add eax, edx

    ; clear EDX before division
    xor edx, edx

    ; divide by 2
    mov ecx, 2
    div ecx

    ; add the third part to the total
    add esi, eax

    ; store the result in B[i]
    mov [r10 + r11], sil

    ; move to the next array position
    inc r11d

    ; repeat until 10 iterations are completed
    cmp r11d, 10
    jl loop_start

    ; return the last calculated value (B[9])
    movzx eax, byte [r10 + 9]
    ret




