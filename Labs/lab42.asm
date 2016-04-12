.model	tiny
.486
.data
loc1	db	"microprocessor,programming&interfacing"
loc2	db	24 dup(?)
cnt1	db	38
off1	db	5
char1	db  22h
.code
.startup
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
.exit
end	