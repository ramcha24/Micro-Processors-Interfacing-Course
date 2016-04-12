.model tiny
.486
.data
dis1 db	"Attempt to display $"
dis2 db	0dh,0ah
.code
.startup
	mov ah,00h
	mov al,03h
	int 10h
	
	mov ah,02h
	mov dl,40
	mov dh,0
	mov bh,0
	int 10h
	
	lea si,dis1
	mov bp,5h
	
	CLD
	
x2:	mov ah,09h
	mov al,[si]
	inc si
	mov bh,00h
	mov bl,8Fh
	mov cx,1
	int 10h
	dec bp
	mov ah,02h
	inc dl
	mov dh,0
	mov bh,0
	int 10h
	jnz x2
	
	mov ah,07h
x1: int 21h
	cmp al,'%'
	jnz x1
.exit
end
	cmp bp,00h
	
	cmp bp,0
	