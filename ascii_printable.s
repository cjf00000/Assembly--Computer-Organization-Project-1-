; Print all ascii printable characters: from 20 to 7E
; Author:	Jianfei CHEN
; Date:		2012-9-18

LI R6 0xBF		; R6 is the IO port
SLL R6 R6 0x00

LI R1 0x20		; Set initial value: print r1

loop:
SW R6 R1 0x00		; PRINT R1
ADDIU R1 0x01
CMPI R1 0x80
BTNEZ loop
NOP

finish:
JR R6			; Crash the machine
NOP
