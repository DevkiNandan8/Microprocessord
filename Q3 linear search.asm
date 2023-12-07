.MODEL SMALL
.DATA
ARR DB 9 DUP(?)
MES1 DB 13,10,10, "ENTER THE ARRAY ELEMENTS : $"
MES2 DB 13,10,10, "ENTER THE VALUE TO BE SEARCHED : $"
MES3 DB 13,10,10, "VALUE FOUND AT LOCATION : $"
MES4 DB 13,10,10, "VALUE NOT PRESENT IN THE ARRAY $"

.CODE
.STARTUP
    MOV AH,9
    MOV DX, OFFSET MES1
    INT 21H
    MOV SI,0
    MOV CX,9
L1:
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV ARR[SI],AL
    INC SI
    LOOP L1

MOV AH,9
MOV DX, OFFSET MES2
INT 21H

MOV AH,1
INT 21H
SUB AL,30H

MOV SI,0
MOV CX,9

L2:
    CMP AL,ARR[SI]
    JZ EQUAL
    INC SI
    LOOP L2
    
    MOV DX,OFFSET MES4
    MOV AH,9
    INT 21H
    JMP STOP
    
EQUAL:
    MOV AH,9
    MOV DX, OFFSET MES3
    INT 21H
    
    MOV DX,SI
    ADD DL,30H
    MOV AH,2
    INT 21H
    
STOP:
    .EXIT
    END