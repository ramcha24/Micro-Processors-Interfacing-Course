.model tiny
.486
.data
dis1 db	"Attempt to display $"
dis2 db	0dh,0ah
.code
.startup
	;set display mode
	mov ah,0
	mov al,12h
	int 10h
	
	;fill pixel
	mov cx,10
	mov bx,20
x1:	mov al,1100b
	mov dx,20
	mov ah,0Ch
	int 10h
	inc cx
	dec bx
	cmp bx,0
	jnz x1

	;blocking function
	mov ah,07h
	b:  int 21h
		cmp al,'%'
		jnz b
.exit
end