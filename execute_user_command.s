.section .data
temp_prompt:
    .asciz "user said: "

.section .text
.extern user_command
.global execute_user_command

execute_user_command:
    push {r7, lr}
    sub sp, #8000
    mov r0, #1
    ldr r1, =temp_prompt
    mov r2, #11
    mov r7, #0x04
    svc #0

    mov r0, #1
    ldr r1, =user_command
    mov r2, #2097152
    mov r7, #0x04
    svc #0

    add sp, #8000
    pop {r7, pc}

