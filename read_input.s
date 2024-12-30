.section .data
.global user_command
.global BUF_SIZE

user_command:
    .space 512
BUF_SIZE:
    .word 512

.section .text
.extern execute_user_command
.extern display_prompt
.global read_input

read_input:
    push {r4-r11, lr}
    sub sp, #8000
    mov r0, #0
    ldr r1, =user_command
    mov r2, #0

_clear_buffer:
    ldrb r3, [r1, r2]
    cmp r3, #0
    beq _get_input
    mov r3, #0x00
    strb r3, [r1, r2]
    add r2, #1
    b _clear_buffer

_get_input:
    ldr r4, =BUF_SIZE
    ldr r2, [r4]
    mov r7, #0x03
    svc #0

    bl execute_user_command

    add sp, #8000
    pop {r4-r11, pc}

