NAME Data_transfer
TITLE address_mode

ASSUME CS:CODE , DS:DATA

DATA SEGMENT 
    DATA1 DB 23H   ;0
    DATA2 DW 1234H ;1
    DATA3 DB AH    ;3
    DATA4 DW 0H    ;4
    DATA5 DW 2345H,6789;ARRAY
    db 'abcdefg hello world!$'
DATA ENDS 

;DIFFERENT DATA IN DATA SEGMENT 

CODE SEGMENT     

START:     
    MOV AX,DATA ; INITIALISE DS TO POINT TO START OF THE MEMORY
    MOV DS,AX ; SET ASIDE FOR STORING OF DATA 
    MOV AL,25H ; L MEANS 8 BIT REG , STORING 25H TO AL REG
    MOV AX,2345H ; X MEANS 16 BIT REG ,COPY 2345H INTO AX REG    
    XCHG BX,AX ; COPY THE CONTENT OF AX INTO BX REGISTER    
    XCHG BL,CH
    XCHG AL,[10b]
    MOV CL,AL ; COPY THE CONTENT OF AL REGISTER TO CL    
    lea bx, offset 
    MOV AL,DATA1 ; COPIES THE BYTES CONTENT OF THE DATA SEGMENT MEMORY     
    MOV AX,DATA2 ; COPIES THE ALL CONTENTS OF DATA SEGMENT , LOCATION DATA2 INTO 16 BIT AX   
    MOV DATA3,AL ; AL--> DATA3  
    MOV DATA4,AX ; AX--> DATA4
    MOV BX,OFFSET DATA5 ; THE 16BIT OFFSET ADDRESS OF THE DS MEMORY                        
    MOV AX,[BX] ; INDIRECT ADDRESSING   
    MOV DI,02H ;   
    MOV AX,[BX+DI] ;,MEMORY LOCATION ADDRESS BY BX + DI INTO AX (BASE PLUS INDIRECT ADDRESSSING)  
    MOV AX,[BX+002H] ; COPIES THE WORD CONTENT OF DATA SEGMENT   
    MOV AL,[DI+2] ;REGISTER RELATIVE INDEXING    

    MOV AX,[BX+DI+002H] ; MEMORY LOCATION ADDRESS BY BX+DI+002H INTO AX 16 BIT 
    mov ax, [200+bx]

MORE:  
    mov ax, 200[bx]
    mov ax, [bx].200
    mov ax, 0x2000[bx]
    mov ax, 200[bx][si]
    mov ax,[bx].200[si]
    mov ax,[bx][si][.200]
    mov ds:[40H],ax
    mov ax,ds:[bx]
CODE ENDS 
ENDS START 
