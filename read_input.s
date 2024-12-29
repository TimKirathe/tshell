.section .data
.global user_command

user_command:
    .space 2097152

.section .text
.extern execute_user_command
.extern display_prompt
.global read_input

read_input:
    push {r7, lr}
    sub sp, #8000
    mov r0, #0
    ldr r1, =user_command
    mov r2, #2097152
    mov r7, #0x03
    svc #0

    bl execute_user_command

    b display_prompt

    add sp, #8000
    pop {r7, pc}

