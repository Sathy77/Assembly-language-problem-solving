;9. Write a program to display the extended ASCII characters (ASCJI
;codes 80h to FF_h). Display 10 characters per line, separated by
;blanks. Stop after the extended characters have been displayed
;once. 

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC  
    
    MOV DL, 127 
    MOV BL, 127
    
    ONE:
    
    MOV CX, 20
    
    LP: 

    MOV DL, BL 
    MOV BH, 255
    CMP DL, BH
    JE EXIT 
    INC DL
    MOV AH, 2
    INT 21H 
    MOV BL, DL
    MOV DL, 32
    INT 21H
    
    LOOP LP
    JMP NEW
     
     
    
    
    NEW:
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
    MOV AH, 9
    JMP ONE
    
    EXIT: 
    MOV AH, 4CH
    INT 21H
   
    
    
    
    
    MAIN ENDP
END MAIN