
ASSUME CS:CODE,DS:DATA

DATA SEGMENT
    msg db 'Hello! This is int0_test!$'
DATA ENDS  

CODE SEGMENT
    start: 
        mov ax, 1000h
        mov bl, 0     
        div bl      

        mov ah,4ch
        int 21h  
    
CODE ENDS
END START