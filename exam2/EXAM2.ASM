 stack segment stack
   db 100 dup(0)
stack ends
DATA      SEGMENT
;Y EQU 76A3H
;NUMBER DW Y
ADDR    DW    76A3H
COUNT  DW    ?
DATA     ENDS
CODE     SEGMENT
       ASSUME    CS:CODE , DS:DATA
 START:   MOV   AX , DATA
                   MOV   DS ,  AX
                   MOV   CX ,  0
                   
                   MOV   AX , addr
 REPEAT:TEST  AX , 0FFFFH
                   JZ     EXIT
                   JNS    SHIFT;²âÊÔAX×î¸ßÎ»
                   INC    CX
 SHIFT:     SHL    AX , 1
                   JMP  REPEAT
 EXIT:       MOV  COUNT , CX
                   MOV   AX , 4C00H
                   INT    21H
CODE       ENDS
                 END   START  
