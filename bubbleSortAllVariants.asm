org 100h
xor ax,ax
xor bx,bx
mov cx,14
mov si,15
mov di,1

cmp di,1
je ascendingUnsig
cmp di,2
je descendingUnsig
cmp di,3
je ascendingSig
cmp di,4
je descendingSig


jmp quit  ;if none of the case match then exit the program

descendingSig:
outer:

  inner:
  mov ah,[num1+bx]
  cmp [num1+bx+1],ah
  jl skipSwap
  xchg [num1+bx+1],ah
  mov [num1+bx],ah
  skipSwap:
  inc bx
  loop inner

mov cx,14
dec si
cmp si,0
je quit

jmp outer



ascendingSig:
outer:

  inner:
  mov ah,[num1+bx]
  cmp [num1+bx+1],ah
  jg skipSwap
  xchg [num1+bx+1],ah
  mov [num1+bx],ah
  skipSwap:
  inc bx
  loop inner

mov cx,14
dec si
cmp si,0
je quit

jmp outer


descendingUnsig:
outer:

  inner:
  mov ah,[num1+bx]
  cmp [num1+bx+1],ah
  jb skipSwap
  xchg [num1+bx+1],ah
  mov [num1+bx],ah
  skipSwap:
  inc bx
  loop inner

mov cx,14
dec si
cmp si,0
je quit

jmp outer


ascendingUnsig:
outer:

  inner:
  mov ah,[num1+bx]
  cmp [num1+bx+1],ah
  ja skipSwap
  xchg [num1+bx+1],ah
  mov [num1+bx],ah
  skipSwap:
  inc bx
  loop inner

mov cx,14
dec si
cmp si,0
je quit

jmp outer


quit:

mov ax,4c00h
int 21h
num1 : db 0x1,0x4,0x2,0x3,0xF,0xA,0x9,0x5,0x6,0xE,0x8,0x7,0xC,0xB,0xD
