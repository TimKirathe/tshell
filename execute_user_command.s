.section .text
.extern user_command
.global execute_user_command

execute_user_command:
    push {r4-r11, lr}
    sub sp, #8000

    mov r0, #1
    ldr r1, =user_command
    mov r2, #0
    
_parse_user_command:
    ldrb r3, [r1, r2]
    cmp r3, #0
    bleq _fork_proc
    add r2, #1
    b _parse_user_command
    
_fork_proc:
    mov r7, #0x04
    svc #0

    add sp, #8000
    pop {r4-r11, pc}

