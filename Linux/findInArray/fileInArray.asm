DATA SEGMENT
MSG1 DB 10,13,'CHARACTER FOUND :) $'
MSG2 DB 10,13,'CHARACTER NOT FOUND :($'
MSG3 DB 10,13,'ENTER NUMBERS (PRESS ENTER TO HALT): $'
MSG4 DB 10,13,'ENTER THE NUMBER TO BE SEARCHED : $'
NEW DB 10,13,'$'
INST DB 10 DUP(0)
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA

    START:
        MOV AX,DATA
        MOV DS,AX
        LEA DX,MSG3
        MOV AH,09H
        INT 21H

        MOV BX,00

    UP:
        MOV AH,01H
        INT 21H
        CMP AL,0DH
        JE DOWN
        MOV [INST+BX],AL
        INC BX
        JMP UP

    DOWN:
        LEA DX,NEW
        MOV AH,09H
        INT 21H
        LEA DX,MSG4
        MOV AH,09H
        INT 21H
        MOV AH,01H
        INT 21H
        MOV CX,BX
        MOV DI,0

    UP1:
        CMP AL,[INST+DI]
        JE DOWN1
        INC DI
        LOOP UP1
        LEA DX,MSG2
        MOV AH,09H
        INT 21H
        JMP FINISH

    DOWN1:
        LEA DX,MSG1
        MOV AH,09H
        INT 21H

    FINISH:
        INT 3

CODE ENDS
END START
