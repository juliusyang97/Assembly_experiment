stack segment stack
   db 100 dup(0)
stack ends         ；前三行解决没有堆栈段问题
dseg segment
    org 20h
    Y dw 76A3H
    addrr dw Y        ;addrr的值是Y的地址

    count db ?
dseg ends

cseg segment
    assume cs:cseg, ds:dseg
begin:
    mov ax, dseg
    mov ds, ax

    mov bx, addrr
    mov al, [bx]
    mov count, al     ;count的值为Y中第一个字节的值

mov ah, 4ch
    int 21h
cseg ends
    end begin