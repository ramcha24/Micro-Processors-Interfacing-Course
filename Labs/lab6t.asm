.model tiny
.486
.data
dis1 db	"Attempt to display $"
dis2 db	0dh,0ah
.code
.startup
	;set display mode
	mov ah,0
	mov al,03
	int 10h
	
	;set cursor start pos
	mov ah,02h
	mov dl,0
	mov dh,0
	mov bh,0
	int 10h
	
	;mov bp,0
	;first int10h for writing char , second int10h for setting new cursor position
x2:	mov ah,09h
	mov al,'@'
	mov bh,00h
	mov bl,89h
	mov cx,80
	int 10h
	
	mov ah,02h
	mov dl,0
	inc dh
	inc dh
	mov bh,0
	int 10h
	cmp dh,24
	jnz x2
	
	;for second part
	;set cursor start pos
	mov ah,02h
	mov dl,0
	mov dh,1
	mov bh,0
	int 10h
	

x3:	mov ah,09h
	mov al,'@'
	mov bh,00h
	mov bl,0Ah
	mov cx,80
	int 10h
	
	;not bp
	mov ah,02h
	mov dl,0
	inc dh
	inc dh
	mov bh,0
	int 10h
	cmp dh,25
	jnz x3
	
	
	;blocking function
	mov ah,07h
	b:  int 21h
		cmp al,'?'
		jnz b
.exit
end