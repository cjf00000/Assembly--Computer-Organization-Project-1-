; Read and output $R2 consequent characters starting from memory address $R1
; Convert them to lower case and write back
; Author:	Jianfei CHEN
; Date:		2012-9-18

LI R6 0xBF		; R6 is the IO port
SLL R6 R6 0x00

LI R1 0xC0		; R1 is the starting address
SLL R1 R1 0x00

LI R2 0x05		; read 5 numbers

LI R3 0x41		; Write 'APPLE'
SW R1 R3 0x00
LI R3 0x50
SW R1 R3 0x01
LI R3 0x50
SW R1 R3 0x02
LI R3 0x4C
SW R1 R3 0x03
LI R3 0x45
SW R1 R3 0x04

MFPC R7			; save return address to R7
ADDIU R7 0x03	
B subRoutine		; call subRoutine
NOP

finish:
JR R6			; Crash the machine
NOP

subRoutine:		; Read and output $R2 consequent characters starting from memory address $R1

NOP
loop:
LW R1 R3 0x00		; Load to R3
SW R6 R3 0x00		; Print to screen
ADDIU R3 0x20		; R3 += 20 = lower(R3)
SW R1 R3 0x00		; Write back

ADDIU R1 0x01		; Address++
ADDIU R2 0xFF		; Count--

BNEZ R2 loop		; loop
NOP

JR R7			; return
NOP
