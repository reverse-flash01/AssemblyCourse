org 100h

;extended addition currently working on 64 bit. can be used to add any bit number. just change the loop iterator

mov cx,4;the number of words
xor bx,bx
CLC
here: mov ax,[num1+bx]
	  	adc [res+bx],ax
	  	inc bx
	  	inc bx
	  	loop here

mov ax,4c00h
int 21h
num1 : dw 0xEE00,0xFFEF,0xFFFE,0x00FF
res  : dw 0x0000,0x0000,0x0000,0x0000

