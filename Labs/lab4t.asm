.model	tiny
.486
.data
loc1	db	"microprocessor,programming&interfacing $"
loc2	db	24 dup('$')
cnt1	db	38
off1	db	?
inp1 	db  "Enter value of m $"
inp2 	db 	0DH,0Ah,"Enter replacement Character - $"
char1	db  22h

.code
.startup
		mov ah,09h
		lea dx,inp1
		int 21h
		
		mov ah,01h
		int 21h
		
		add al,0fh
		mov off1,al
		
		mov ah,09h
		lea dx,inp2
		int 21h
		
		lea		si,loc1
		movzx	bx,off1
		dec		si
		movzx	ax,cnt1
		div		bl
		cbw
		mov		cx,ax
		mov		al,char1
x1:		mov		[si+bx],al
		add		si,bx
		loop	x1
		
		lea dx,loc1
		mov ah,09h
		int 21h
.exit
end	


		mov ah,01h
		int 21h
		
		mov char1,al
		
		