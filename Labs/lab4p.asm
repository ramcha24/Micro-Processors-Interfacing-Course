.model tiny
.data
FNAME DB 'FILE1',0
HANDLE DW ?
fn2 DB 'abc.txt',0
handle2 DW ?
dat1 DB 5,6,1,4,2,5,6,1,5,5,2,1,5
cnt DW ?
.code
.startup
	mov AH,3CH
	lea DX,FNAME
	mov CL,0
	int 21h
	mov handle,AX
	
	mov AH,3DH
	mov AL,0
	lea DX,fn2
	int 21h
	mov handle2,AX
	
	mov AH,40H
	lea bx,handle2
	mov CX,10
	lea DX,dat1
	mov cnt,AX
.exit
end

