stack segment stack
   db 100 dup(0)
stack ends
data segment 
num1 db 3 
num2 db 5 
num3 db ? 
string db '3+5=$' 
data ends 
code segment 
assume cs:code,ds:data 
start:mov ax,data 
mov ds,ax 
mov al,num1 
add al,num2 
mov num3,al 
lea dx,string 
mov ah,09h 
int 21h 
add num3,30h 
mov dl,num3 
mov ah,02 
int 21h 
mov ax,4c00h 
int 21h 
code ends 
end start