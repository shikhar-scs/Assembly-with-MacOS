DATA SEGMENT
NUM1 DB ?
NUM2 DB ?
RESULT DB ?
MSG1 DB 10,13,"ENTER FIRST NUMBER TO ADD : $"
MSG2 DB 10,13,"ENTER SECOND NUMBER TO ADD : $"
MSG3 DB 10,13,"RESULT OF ADDITION IS : $"
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:

MOV AX,DATA
MOV DS,AX

;n1 input
LEA DX,MSG1 ;Print msg 1 .. a string basically
MOV AH,9
INT 21H

MOV AH,1 ; input a character
INT 21H

SUB AL,30H ; subtracting 30 from input
MOV NUM1,AL

;n2 input
LEA DX,MSG2
MOV AH,9
INT 21H

MOV AH,1
INT 21H

SUB AL,30H
MOV NUM2,AL

;add and move to result
ADD AL,NUM1
MOV RESULT,AL
MOV AH,0 ;set higher nibble 0 because ah was 1 before. Try removing this line and you'll understand.

AAA

ADD AH,30H

ADD AL,30H

MOV BX,AX

; printing answer nibble by nibblw
LEA DX,MSG3
MOV AH,9
INT 21H


MOV AH,2
MOV DL,BH
INT 21H

MOV AH,2
MOV DL,BL
INT 21H

MOV AH,4CH
INT 21H

CODE ENDS
END START
