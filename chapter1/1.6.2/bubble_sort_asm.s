.equ N,32768
.comm data,N*4,4
.global main
.arch armv7-a

main: ldr r1,=N
	sub r1,r1,#1 @r1=N-1
	mov r5,#0 @i=0
oloop:cmp r5,r1 @i==N-1 ?
	beq exito
	mov r3,#0 @j=0
	ldr r2,=data @ r2=&data
	ldr r11,[r2]
iloop:cmp r3,r1 @ j==N-1 ?
	beq exiti
	ldr r10,[r2,#4]
	cmp r11,r10 @compare values
	stmgt r2,{r10,r11} @store in reverse order
	movle r11,r10
	add r2,r2,#4
	add r3,r3,#1 @j++
	b iloop
exiti:add r5,r5,#1 @ i++
	b oloop
	exito:bx lr
