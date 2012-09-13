; Calculate the first 50 Fibonacci numbers. F1 = 1, F2 = 1
; The result is stored in 0x8500
; Author:	Jianfei CHEN
; Date:		2012-9-13
LI R1 0x01
LI R2 0x01
LI R3 0x85
SLL R3 R3 0x00
LI R4 0x19
SW R3 R1 0x00
SW R3 R2 0x01
ADDU R1 R2 R1
ADDU R1 R2 R2
ADDIU R3 0x02
ADDIU R4 0xff
BNEZ R4 0xf9
NOP
