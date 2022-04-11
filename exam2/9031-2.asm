stack segment stack
db 100  dup(0)
 stack  ends
 data segment       
    org 10       
    number_y dw 76A3h       
    addr_y dw   ?       
    count db ?              
 data ends     
 code segment       
     assume cs:code, ds:data          
 start:        
mov ax, data       
mov ds, ax              
mov bx, offset number_y ;         
mov addr_y, bx          ;      
mov bx, addr_y          ;       
mov ax, word ptr [bx]   ;             
mov cl, 0               ;   
next:       
test ax, 0ffffh  ;      
jz  exit         ;                   
shl ax,1         ;       
jnc next         ;                          
inc cl           ;             
jmp next         ;       
exit:       
mov count, cl    ;      
mov dl,cl       
add dl, 30h        
mov ah,02h       
int 21h     
; the exit system call       
mov ah, 4ch       
int 21h    
code ends       
end start
