.model tiny
.386
.data
dat1 dd 12345678,1234556,1234576,23456721
cnt1 db 120

off1 db 4

max1 db 32
act2 db ?
inp2 db 32 dup(0)

off1 db 4


.code
.startup

	mov si,[dx]
	lea si,off1
	lea ch,cnt1
	mov ah,09h
	int 21h
	jmp x1
	

x2: lea dx,dat1
	mov ah,0ah
	int 21h
	push dx
	pop dx
x1:	inc si
	dec ch
	jnz x2
.exit
end
	



