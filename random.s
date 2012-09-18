; Random number generator
; Seed = R4
; Random = Seed * 107 + 91 = Seed * 0x6B + 0x5B
; Seed = 0x4321
; Author:	Jianfei CHEN
; Date:		2012-9-18

LI R4 0x43		; R4 = 0x4321
SLL R4 R4 0x00
ADDIU R4 0x21

LI R1 0xC0		; R1 = 0xC000
SLL R1 R1 0x00

LI R5 0x6B		; R5 = 0x6B

LI R0 0x10		; Generate 16 random numbers
forRandom:

; Perform R4 * R5
; mask = 1;
; ret = 0;
; while (mask)
; {
; 	temp = R5 and mask;
;	if (temp) ret += R4;
;	R4 = R4 << 1;
;	mask = mask << 1;
; }
; mask = R6; ret = R4; temp = R3; oldR4 = R2;
LI R6 0x01
MOVE R2 R4
LI R4 0x00

forDigit:
MOVE R3 R5	; temp = R5 and mask;
AND R3 R6 
BEQZ R3 skip	; if (!temp) skip;
NOP
ADDU R2 R4 R4	; ret += oldR4
skip:
SLL R6 R6 0x01	; mask <<= 1
SLL R2 R2 0x01	; oldR4 <<= 1

BNEZ R6 forDigit	; do while(mask)
NOP

; Perform R4 += 0x5B
ADDIU R4 0x5B

; Output R4
SW R1 R4 0x00
ADDIU R1 0x01

; Loop
ADDIU R0 0xFF
BNEZ R0 forRandom
NOP

finish:
LI R6 0xBF
SLL R6 R6 0x00
JR R6
NOP
