; Read and echo digits from keyboard. If receive a non-digit character, the program terminates
; Author:	Jianfei CHEN
; Date:		2012-9-18

LI R6 0xBF
SLL R6 R6 0x00

loop:
LW R6 R1 0x00		; Read a character

SLTI R1 0x30		; If R1 < 30 then finish
BTNEZ finish
NOP
SLTI R1 0x40		; If R1 >= 40 then finish
BTEQZ finish
NOP

SW R6 R1 0x00		; echo
B loop
NOP

finish:
JR R6
NOP
