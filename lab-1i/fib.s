	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function
fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3,r4,r5,lr}

	mov r3,#-1 @previos=-1
	mov r4,#1  @result = 1
	mov r5,#0  @R5 sum = 0
	
	bl Loop
Loop:
	add r5,r3,r4  @R5 = R3+R4 sum = previos+result
	mov r3,r4     @R3 = R4 previos = result
	mov r4,r5     @R5 = R0 result = sum
	
	subs r0,r0,#1 @i--
	cmp r0,#0     @i>=0
	bgt Loop     @if(i>=0) goto .Loop
	
	mov r0,r5 @return answer
	pop {r3,r4,r5,pc}

	.size fibonacci, .-fibonacci
	.end
