.model tiny
.data
loc1 db 'm','i','c','r','o','m','i','c','r','o','m','i'
off1 db 6
cnt1 db 12

.code
.startup
	lea si,loc1
	mov cx,06h
	
	cld
x1: mov cx,06h
	rep lodsb
	dec si
	mov ax,22h
	mov [si],ax
	dec cnt1
	dec cnt1
	dec cnt1
	dec cnt1
	dec cnt1
	dec cnt1
	jnz x1

.exit
end

