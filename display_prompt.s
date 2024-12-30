.section .data
prompt:
    .asciz "tshell$ "

.section .text
.extern read_input
.global display_prompt

display_prompt:
    push {r7, lr}
    sub sp, #8000
    mov r0, #1
    ldr r1, =prompt

_size_of_string:
    mov r2, #0
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq _print_prompt

    mov r2, #8
    mov r7, #0x04
    svc #0

    bl read_input
    add sp, #8000
    pop {r7, pc}


    
