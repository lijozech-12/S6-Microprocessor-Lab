ASSUME DS:DATA,CS:CODE

DATA SEGMENT
MSG1 DB 0AH,0DH,"ENTER THE FIRST NUMBER:$"
MSG2 DB 0AH,0DH,"ENTER THE SECOND NUMBER:$"
OP DB 0AH,0DH,"THE DIFFERENCE IS:$"
DATA ENDS

CODE SEGMENT
START:
	MOV AX,DATA
	MOV DS,AX

	LEA DX,MSG1; ACCEPT FIRST NUMBER
	MOV AH,09H
	INT 21H

	MOV AH,01H
	INT 21H
	MOV BH,AL
	MOV AH,01H
	INT 21H
	MOV BL,AL

	LEA DX,MSG2 ; ACCEPT SECOND NUMBER
	MOV AH,09H
	INT 21H

	MOV AH,01H
	INT 21H
	MOV CH,AL
	MOV AH,01H
	INT 21H
	MOV CL,AL

	LEA DX,OP
	MOV AH,09H
	INT 21H

	MOV AH,00H
	SUB BL,CL
	MOV AL,BL
	AAS
	MOV CL,AH  ; BORROW OF THE LOWER DIGIT
	ADD AL,30H
	MOV BL,AL

	MOV AH,00H
	SUB BH,CH
	MOV AL,BH
	AAS
	ADD AH,30H
	MOV BH,AH
	ADD AL,CL
	ADD AL,30H
	MOV CH,AL



	MOV DL,CH
	MOV AH,02H; DISPLAY O/P
	INT 21H

	MOV DL,BL
	MOV AH,02H ; DISPLAY O/P
	INT 21H

	MOV AH,4CH
	INT 21H

CODE ENDS
END START
