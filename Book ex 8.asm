;Write a program to display a "?", read two capital letters, and display them on the next line In alphabetical order. 

.MODEL SMALL
.STACK 100H
.DATA
CHARACTER1 DB ?
CHARACTER2 DB ? 

MSG DB 'YOU BREAK THE RULES.$'
.CODE
MAIN PROC
     
    MOV AX, @DATA
    MOV DS, AX
    STEP1:
    MOV AH, 1
    INT 21H
    MOV CHARACTER1, AL
    
    CMP AL, 'A'
    JGE NEXT1
    JMP NEWEXIT 
    
    NEXT1:
    CMP AL, 'Z'
    JLE STEP2
    JMP NEWEXIT 
    
    STEP2:
    MOV AH, 1
    INT 21H
    MOV CHARACTER2, AL
    
    CMP AL, 'A'
    JGE NEXT2
    JMP NEWEXIT  
    
    NEXT2:
    CMP AL, 'Z'
    JLE CODEE
    JMP NEWEXIT 
      
    CODEE:
    MOV BL, CHARACTER1 
    CMP BL, CHARACTER2
    JL ONE
    
    
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    MOV AH, 2
    MOV DL, CHARACTER2
    INT 21H
    MOV DL, CHARACTER1
    INT 21H
    JMP EXIT
    
    ONE:
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    MOV AH, 2
    MOV DL, CHARACTER1
    INT 21H
    MOV DL, CHARACTER2
    INT 21H
    JMP EXIT  
    
    
    NEWEXIT:
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    MOV AH, 9
    LEA DX, MSG
    INT 21H
    JMP EXIT
    
    
    
    EXIT: 
    MOV AH, 4CH
    INT 21H
   
    
    
    
    
    MAIN ENDP
END MAIN