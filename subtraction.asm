org 100h;leaves 100h memory location, specified by intel

xor di,di
mov di,1;initialize the di register to select the option
mov cx,4
xor bx,bx


cmp di,1
je subtraction;if there is 1 in di then it will goto subtraction

cmp di,2
je addition;if there is 2 in di then it will goto addition

jmp quit;if none of the codition is true then the program will close



subtraction:
CLC;clear the carry flag

  here:
    mov ax,[num2+bx]
    jmp complement;goes to find the complement
    back:;comes back with complement in ax
    adc ax,[num1+bx]
    mov [res+bx],ax
    inc bx
    inc bx
  loop here

  jmp quit

  complement:
  not ax
  adc ax,1
  CLC;this addition will modify the carry flag and mess with the addition done upward
  jmp back



addition:
  here2:
    mov ax,[num1+bx]
    adc ax,[num2+bx]
    mov [res+bx],ax
    inc bx
    inc bx
  loop here2


quit:;exit the program
mov ax,4c00h
int 21h
num1 : dw 0xEE00,0xFFEF,0xFFFE,0x00FF
num2 : dw 0x1111,0x0101,0x0100,0x0000
res  : dw 0x0000,0x0000,0x0000,0x0000

;num1-num2=num1+(-num2)
