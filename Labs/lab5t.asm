.model	tiny
.486
.data
fil1 db	"abc.txt",0
fil2 db "xyz.txt",0
str1 db 6 dup('$')
str2 db 6 dup('$')
str3 db 11 dup('$')
dis2 db	0dh,0ah
han1 dw ?
han2 dw ?
.code
.startup
	mov ah,3dh
	mov al,02h
	lea dx,fil1
	int 21h
	mov han1,ax
	mov ah,3fh
	mov bx,han1
	mov cx,5
	lea dx,str1
	int 21h
	mov ah,3eh
	int 21h
	
	
	mov ah,3dh
	mov al,02h
	lea dx,fil2
	int 21h
	mov han2,ax
	mov ah,3fh
	mov bx,han2
	mov cx,5
	lea dx,str2
	int 21h
	mov ah,3eh
	int 21h
	
	
	lea si,str1
	lea di,str3
	mov cl,5
	

x1: mov al,[si]
	mov [di],al
	add di,2
	inc si
	dec cl
	jnz x1
	
	lea si,str2
	add si,5
	sub di,8
	mov cl,5
	
x2: mov al,[si]
	mov [di],al
	add di,2
	inc si
	dec cl
	jnz x2
	
	lea di,str3
	mov ah,09h
	int 21h
.exit
end