.section .data
prompt:
    .asciz "tshell$ "

.section .text
.extern read_input
.global display_prompt

display_prompt:
    push {r4-r11, lr}
    sub sp, #8000
    mov r0, #1
    ldr r1, =prompt
    mov r2, #0

_size_of_string:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq _output_prompt
    add r2, #1
    b _size_of_string


_output_prompt:
    mov r7, #0x04
    svc #0

    bl read_input
    add sp, #8000
    pop {r4-r11, pc}


    
