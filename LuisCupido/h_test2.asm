; Hardware test code dmkCPU_01
; Just dumps a string over serial
; Sort of Hello World.

;variables
mem	[lptr],#8000			;loop pointer variable

;hardware
mem	[serial_port],#4000		;tx port address
mem	[serial_flags],#4200		;serial flags address
equ	[txrdy_msk],#08			;mask txready flag


ORG #0000

	ld yl,#[lptr]			;init loop pointer
	ld yh,#[lptr]
	ld b,#00
	ld mem,b
	
	
[loop]
	
	ld yl,#[lptr]				;get loop pointer
	ld yh,#[lptr]
	ld b,mem
	
	ld yl,b						; get char from string
	ld yh,#[gmessage]
	ld a,mem
	
	ld yl,#[serial_port]		; send char to TXD serial
	ld yh,#[serial_port]	
	ld mem,a


[wait_tx]	
	ld yl,#[serial_flags]		; check txflag empty
	ld yh,#[serial_flags]	
	ld a,mem
	
	ld yl,#[wait_tx]
	ld yh,#[wait_tx]
	ld b,#[txrdy_msk]
	ld a,and,jz
	

	ld yl,#[lptr]		;get loop pointer
	ld yh,#[lptr]
	ld a,mem

	ld b,#01			; add 1 and store it
	ld a,add
	ld mem,a


	ld yl,#[end]
	ld yh,#[end]
	
	ld b,#[strlen]		;compare with string length
	ld a,xor,jz			;when all sent go to end

	ld yl,#[loop]		;loop
	ld yh,#[loop]
	ld a,a,jmp


[end]

	ld yl,#[stuck]
	ld yh,#[stuck]

[stuck]
	ld a,a, jmp			; keep stuck in here forever
	

ORG #0100			;startup greetings
equ [strlen],#11	;string length
[gmessage]
	ins #64	;d
	ins #6d	;m
	ins #6b	;k
	ins #43	;C
	ins #50	;P
	ins #55	;U
	ins #20	;
	ins #76	;v
	ins #31	;1
	ins #2e	;.
	ins #30	;0
	ins #20	;
	ins #31	;1
	ins #39	;9
	ins #38	;8
	ins #39	;9
	ins #0d	;<cr>
	ins #0a	;<lf>
	
; end of code
