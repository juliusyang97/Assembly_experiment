stack segment stack
   db 100 dup(0)
stack ends         ��ǰ���н��û�ж�ջ������
dseg segment
    org 20h
    Y dw 76A3H
    addrr dw Y        ;addrr��ֵ��Y�ĵ�ַ

    count db ?
dseg ends

cseg segment
    assume cs:cseg, ds:dseg
begin:
    mov ax, dseg
    mov ds, ax

    mov bx, addrr
    mov al, [bx]
    mov count, al     ;count��ֵΪY�е�һ���ֽڵ�ֵ

mov ah, 4ch
    int 21h
cseg ends
    end begin