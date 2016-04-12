.model tiny
.486
.data
file db "zyx.txt",0
handle dw ?
dat1 db 50 dup('$')
count db 0
.code
.startup

	mov ah,01h
	int 21h
	lea si,dat1
	mov cl,count
x1:	mov dl,al
	cmp dl,0Dh
	jz x2

	mov ah,3Ch
	mov cl,02h
	lea dx,file
	int 21h
	mov handle,ax
	mov ah,40h
	mov bx,handle
	mov cl,count
	lea dx,dat1
	int 21h
x2:
	mov ah,3eh
	int 21h
	
.exit
end
	
	
	
	
