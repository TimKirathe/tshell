.section .text
.extern display_prompt
.global _start

_start:
    bl display_prompt
    mov r0, #0
    mov r7, #0x01
    svc #0