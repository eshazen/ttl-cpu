; Basic System console/monitor for dmkCPU_01 - ver 02
; (Luis Cupido [ct1dmk@gmail.com] 2017-2019])
;
; Ver01 - first complete version fully working.
; Ver02 - adds the HELP command
;
; Operation via RS232 terminal.
; (check serial port addresses to match card jumpers)
;
;
; Commands:
;			H							-> displays an help with this list of commands
;			Gxxxx						-> goto, jump and execute from addr 'xxxx'
;			Dxx00						-> display 256 bytes from addr 'xx00'
;			Ixxxxaabbccdd<enter>		-> Insert bytes starting at addr 'xxxx' accepts data until <enter>
;			Lxxxx						-> Loads binary at adress xxxx, reset to exit (code will stay in SRAM)
;
;										Invalid Hex entries when typing will abort any command immediately.


;hardware

mem	[@serial_port],#4000	;serial port address
mem	[@serial_flags],#4200	;serial flags address
equ	[@txrdy_msk],#08		;mask txready flag
equ	[@rxfull_msk],#04		;mask rxfull flag


;Constants

equ	[prompt],#3E			;the prompt char '>'
equ	[err_ch],#3F			;the error char '?'
equ	[ccD],#44				;cmnd 'D'
equ	[ccG],#47				;cmnd 'G'
equ	[ccH],#48				;cmnd 'H'
equ	[ccI],#49				;cmnd 'I'
equ	[ccL],#4C				;cmnd 'L'


;variables, ram addrs

mem	[lptr],#8000			; string loop pointer variable
mem	[txbuff],#8001			; tx char buffer
mem	[rxbuff],#8002			; rx char buffer

mem [cmdbuff],#8010			; input cmnd buffer
mem [ptr0],#8011			; addr ptr lsb
mem [ptr1],#8012			; addr ptr msb
mem [tmpvar],#8013			; temp var, parameter pass to function
mem [tmpbyte],#8014			; temp byte, parameter pass to function

mem [nbuff0],#8020			; input buffer
mem [nbuff1],#8021
mem [nbuff2],#8022
mem [nbuff3],#8023

mem [hex0],#8024			; hex nibble buffer
mem [hex1],#8025


; call/ret pointers

mem [@call_ptr1_l],#8030
mem [@call_ptr1_h],#8031
mem [@call_ptr2_l],#8032
mem [@call_ptr2_h],#8033


; scratch pad area, to load executable code that needs to run on RAM
; starts at 8050, hard coded/mounted at startup
;
mem [scratchp],#8050
mem [sp_ptr_h],#8051
mem [sp_ptr_l],#8053
mem [sp_value],#8055
mem [sp_ret_h],#8058
mem [sp_ret_l],#805A





;----------------;
;- Start of ROM -;
;----------------;

ORG #0000


;----------------------------------
; Some initial delay

	$delay #80

	
;-----------------------------------
; mount the sctatch pad area at ram location #8050
; with a code to write memory from a full 16bit pointer.
; ROM code can only use 8 bit pointers. CPU limitation (would need one register more)
; therefore this hack is required for full 16bit pointers.

	ld yh,#[scratchp]

	ld yl,#50
	ld a,#13		; ld yh,#__
	ld mem,a

	ld yl,#51
	ld a,#00
	ld mem,a

	ld yl,#52
	ld a,#12		; ld yl,#__
	ld mem,a

	ld yl,#53
	ld a,#00
	ld mem,a

	ld yl,#54
	ld a,#10		; ld a,#__
	ld mem,a

	ld yl,#55
	ld a,#00
	ld mem,a

	ld yl,#56
	ld a,#07		; ld mem,a
	ld mem,a

	ld yl,#57
	ld a,#13		; ld yh,#__
	ld mem,a

	ld yl,#58
	ld a,#00
	ld mem,a

	ld yl,#59
	ld a,#52		; ld yl,#__,jmp
	ld mem,a

	ld yl,#5A
	ld a,#50
	ld mem,a

	$jmp #[start]



ORG #0050
;----------------------------------
; Start o monitor aplic

[start]



;----------------------------------
; Display a startup message.
;

	ld b,#00				;init loop pointer
	$sto b #[lptr]
	
[sloop]
	$rcl b #[lptr]			;get loop pointer
	
	ld yl,b					;get char from string
	ld yh,#[gmessage]
	ld a,mem

	ld yh,#[main_loop]		;null char, end of string
	ld yl,#[main_loop],jz

	$sto a #[txbuff]	
	$send #[txbuff]

	$rcl a #[lptr]			;next lptr
	$inca
	ld mem,a

	$jmp #[sloop]			;else loop



;---------------------------------
; main loop


[main_loop]

	ld a,#0D			; CR, LF, prompt
	$sto a #[txbuff]	
	$send #[txbuff]
	ld a,#0A
	$sto a #[txbuff]	
	$send #[txbuff]
	ld a,#[prompt]
	$sto a #[txbuff]	
	$send #[txbuff]


	; get command char

	$get #[rxbuff]		; wait command
	$send #[rxbuff]		; echo out
	ld b,#DF			; ascii mask to
	ld a,and			; force uppercase
	$sto a #[cmdbuff]	; store


	; check if it is "help"

	ld	yh,#[cmnd_H]
	ld	yl,#[cmnd_H]
	ld b,#[ccH]
	ld a,xor,jz


	; all other commands require an address
	; get 4 chars for address

	$get #[rxbuff]		; wait char
	$send #[rxbuff]		; echo out
	$sto a #[tmpvar]
	$call1 #[hex2bin]	; conv. char to its binary value
	$rcl a #[tmpvar]
	$sto a #[nbuff3]	; store

	$get #[rxbuff]		; wait char
	$send #[rxbuff]		; echo out
	$sto a #[tmpvar]
	$call1 #[hex2bin]	; conv. char to its binary value
	$rcl a #[tmpvar]
	$sto a #[nbuff2]	; store

	$get #[rxbuff]		; wait char
	$send #[rxbuff]		; echo out
	$sto a #[tmpvar]
	$call1 #[hex2bin]	; conv. char to its binary value
	$rcl a #[tmpvar]
	$sto a #[nbuff1]	; store

	$get #[rxbuff]		; wait char
	$send #[rxbuff]		; echo out
	$sto a #[tmpvar]
	$call1 #[hex2bin]	; conv. char to its binary value
	$rcl a #[tmpvar]
	$sto a #[nbuff0]	; store


	; assemble the address pointer
	; make 16bit pointer from 4 nibbles

	$rcl a #[nbuff1]	; high nibble x 16
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	$rcl b #[nbuff0]
	ld a,or
	$sto a #[ptr0]

	$rcl a #[nbuff3]	; high nibble x 16
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	$rcl b #[nbuff2]
	ld a,or
	$sto a #[ptr1]



	; check for command, and go there

	$rcl a #[cmdbuff]	; check D command
	ld	yh,#[cmnd_D]
	ld	yl,#[cmnd_D]
	ld b,#[ccD]
	ld a,xor,jz

	$rcl a #[cmdbuff]	; check I command
	ld	yh,#[cmnd_I]
	ld	yl,#[cmnd_I]
	ld b,#[ccI]
	ld a,xor,jz

	$rcl a #[cmdbuff]	; check G command
	ld	yh,#[cmnd_G]
	ld	yl,#[cmnd_G]
	ld b,#[ccG]
	ld a,xor,jz

	$rcl a #[cmdbuff]	; check L command
	ld	yh,#[cmnd_L]
	ld	yl,#[cmnd_L]
	ld b,#[ccL]
	ld a,xor,jz


[invalid]

	ld a,#0D			; invalid command therefore echo "CR LF SP ?"
	$sto a #[txbuff]
	$send #[txbuff]
	ld a,#0A
	$sto a #[txbuff]
	$send #[txbuff]
	ld a,#20
	$sto a #[txbuff]
	$send #[txbuff]
	ld a,#[err_ch]
	$sto a #[txbuff]
	$send #[txbuff]

	$jmp #[main_loop]


;________________________________________________________________


; Cmnd. HELP		H
; Display an help with a list of commands


[cmnd_H]

	ld b,#00				;init loop pointer
	$sto b #[lptr]
	
[hloop]
	$rcl b #[lptr]			;get loop pointer
	
	ld yl,b					;get char from string
	ld yh,#[hmessage]
	ld a,mem

	ld yh,#[main_loop]		;null char, end of string
	ld yl,#[main_loop],jz

	$sto a #[txbuff]	
	$send #[txbuff]

	$rcl a #[lptr]			;next lptr
	$inca
	ld mem,a

	$jmp #[hloop]			;else loop

;________________________________________________________________


; Cmnd. DISPLAY		DXXXX
; Display memory contents starting address XX00
; Show a 256 bytes page. Address LSByte is forced to 00
; for easy display and visualization.


[cmnd_D]

	ld a,#00				; force pointer LSB to 00
	$sto a #[ptr0]

[d_line_loop]

	ld a,#0D				; print CR, LF
	$sto a #[txbuff]
	$send #[txbuff]
	ld a,#0A
	$sto a #[txbuff]
	$send #[txbuff]

	$rcl a #[ptr1]			; pointer MSB to hex
	$sto a #[tmpbyte]
	$call1 #[byte2hex]

	$rcl a #[hex1]			; print byte in hex
	$sto a #[txbuff]
	$send #[txbuff]
	$rcl a #[hex0]
	$sto a #[txbuff]
	$send #[txbuff]

	$rcl a #[ptr0]			; pointer LSB to hex
	$sto a #[tmpbyte]
	$call1 #[byte2hex]

	$rcl a #[hex1]			; print byte in hex
	$sto a #[txbuff]
	$send #[txbuff]
	$rcl a #[hex0]
	$sto a #[txbuff]
	$send #[txbuff]

	ld a,#20				; print space
	$sto a #[txbuff]
	$send #[txbuff]

[d_loop]

	$rcl b #[ptr1]
	$rcl a #[ptr0]
	ld yh,b
	ld yl,a
	ld a,mem
	$sto a #[tmpbyte]
	$call1 #[byte2hex]

	$rcl a #[hex1]			; print byte in hex
	$sto a #[txbuff]
	$send #[txbuff]
	$rcl a #[hex0]
	$sto a #[txbuff]
	$send #[txbuff]

	ld a,#20				; print space
	$sto a #[txbuff]
	$send #[txbuff]

	$rcl a #[ptr0]
	$inca
	$sto a #[ptr0]

	$ptr #[main_loop]		; end of 256 bytes = end of D command
	ld a,a,jz

	$ptr #[d_line_loop]		; end of 16 bytes = end of one line
	ld b,#0F
	ld a,and,jz

	$jmp #[d_loop]			; next byte

;________________________________________________________________


; Cmnd. INSERT	IXXXX XX XX XX XX XX XX<enter>
; Inserts bytes starting at addres XXXX
; the spaces are auto inserted on the terminal echo for easy visualization
; input is continuous IXXXXaaBBaaBBaaBBaaBBaaBB<enter>

[cmnd_I]


	ld a,#20				; print space
	$sto a #[txbuff]
	$send #[txbuff]


	; get MS hex char

	$get #[rxbuff]		; wait char
	$send #[rxbuff]		; echo out
	$sto a #[tmpvar]

	$ptr #[main_loop]	; detect enter
	ld b,#0D
	ld a,xor,jz

	$call1 #[hex2bin]	; conv. char to its binary value
	$rcl a #[tmpvar]
	$sto a #[nbuff1]	; store


	; get LS hex char

	$get #[rxbuff]		; wait char
	$send #[rxbuff]		; echo out
	$sto a #[tmpvar]

	$ptr #[main_loop]	; detect enter
	ld b,#0D
	ld a,xor,jz

	$call1 #[hex2bin]	; conv. char to its binary value
	$rcl a #[tmpvar]
	$sto a #[nbuff0]	; store


	; compose a byte from two nibbles

	$rcl a #[nbuff1]	; high nibble x 16
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	ld b,a
	ld a,add
	$rcl b #[nbuff0]
	ld a,or				; result is in 'a'


	; write value at memory location, using a variable 16bit pointer is not possible
	; with just two registers, (3 would be required). A piece of code runs in RAM with
	; ld immediate values that are patched before execution.

	$ptr #[sp_value]	; write value to scratch pad area
	ld mem,a

	$ptr #[ptr1]		; get msb of the pointer
	ld a,mem
	$ptr #[sp_ptr_h]	; write to scratch pad area
	ld mem,a
	$ptr #[ptr0]		; get lsb of the pointer
	ld a,mem
	$ptr #[sp_ptr_l]	; write to scratch pad area
	ld mem,a

	ld b,#[iiret_sp]	; set the return point from scratchpad
	$ptr #[sp_ret_h]
	ld mem,b
	ld a,#[iiret_sp]
	$ptr #[sp_ret_l]
	ld mem,a

	$jmp #[scratchp]	; go to scratch pad area



[iiret_sp]			; return from scratch pad into here

	$rcl a #[ptr0]		; increment addr pointer
	$ptr #[iincmsb]
	ld b,#01
	ld a,add,jz

	$sto a #[ptr0]		; only LSB updates
	$jmp #[cmnd_I]		; loop for more inserts

[iincmsb]

	$sto a #[ptr0]		; store ptr0 (=0)

	$rcl a #[ptr1]		; increase ptr1
	ld b,#01
	ld a,add
	$sto a #[ptr1]

	$jmp #[cmnd_I]		; loop for more inserts


;________________________________________________________________


; Cmnd, GO		GXXXX
; Jumps to address, same as
; executes code starting at address

[cmnd_G]

	ld a,#0D				; newline on terminal, print CR LF
	$sto a #[txbuff]
	$send #[txbuff]
	ld a,#0A
	$sto a #[txbuff]
	$send #[txbuff]

	$rcl b #[ptr1]			; get pointer value and jump to that location.
	$rcl a #[ptr0]

	ld yh,b
	ld yl,a,jmp


;________________________________________________________________


; Cmnd. LOAD	LXXXX
; loads code from serial, binary format 8 bits.
; loops forever requires a cpu reset to exit.

[cmnd_L]

	ld a,#20			; print space
	$sto a #[txbuff]
	$send #[txbuff]


[ll_loop]

	; get byte
	$get #[rxbuff]		; wait char

	$rcl a #[rxbuff]

	; write value at memory location, using a variable 16bit pointer is not possible
	; with just two registers, (3 would be required). A piece of code runs in RAM with
	; ld immediate values that are patched before execution.

	$ptr #[sp_value]	; write value to scratch pad area
	ld mem,a

	$ptr #[ptr1]		; get msb of the pointer
	ld a,mem
	$ptr #[sp_ptr_h]	; write to scratch pad area
	ld mem,a
	$ptr #[ptr0]		; get lsb of the pointer
	ld a,mem
	$ptr #[sp_ptr_l]	; write to scratch pad area
	ld mem,a

	ld b,#[llret_sp]	; set the return point from scratchpad
	$ptr #[sp_ret_h]
	ld mem,b
	ld a,#[llret_sp]
	$ptr #[sp_ret_l]
	ld mem,a

	$jmp #[scratchp]	; go to scratch pad area


[llret_sp]			; return from scratch pad into here

	$rcl a #[ptr0]		; increment addr pointer
	$ptr #[lincmsb]
	ld b,#01
	ld a,add,jz

	$sto a #[ptr0]		; only LSB updates
	$jmp #[ll_loop]		; loop for more bytes

[lincmsb]

	$sto a #[ptr0]		; store ptr0 (=0)

	$rcl a #[ptr1]		; increase ptr1
	ld b,#01
	ld a,add
	$sto a #[ptr1]
	$jmp #[ll_loop]		; loop for more bytes



;________________________________________________________________
;________________________________________________________________


[hex2bin]

	$rcl a #[tmpvar]
	ld b,#F0
	ld a,and
	ld b,#30
	$ptr #[is_number_l]
	ld a,xor,jz

	$rcl a #[tmpvar]
	ld b,#F0
	ld a,and
	ld b,#40

	$ptr #[is_alpha_l]
	ld a,xor,jz

	$jmp #[invalid]


[is_number_l]

	$rcl a #[tmpvar]
	ld b,#0F
	ld a,and
	$sto a #[tmpvar]

	$ptr #[invalid]		; if ascii number exceds 9 is invalid
	ld b,#F6,jc

	$ret1


[is_alpha_l]

	$rcl a #[tmpvar]
	ld b,#0F
	ld a,and

	$ptr #[invalid]		; if ascii letter exceeds F is invalid
	ld b,#F9,jc

	ld a,add
	ld b,#0F
	ld a,and
	$sto a #[tmpvar]

	$ret1

;______________________________________________________________


[byte2hex]

	$rcl a #[tmpbyte]	; convert LS nibble
	ld b,#0F
	ld a,and
	$sto a #[tmpvar]
	$call2 #[bin2hex]
	$rcl a #[tmpvar]	
	$sto a #[hex0]

	$rcl a #[tmpbyte]	; convert MS nibble
	ld b,#F0
	ld a,and

	ld b,#11

						
[calc_loop]				; no shift available on this CPU
	$ptr #[cont]		; transfer upper nibble to lower nibble
	ld a,a,jc			; with input byte in the form X0(hex) test adding 11(hex) continue if overflows
	ld a,add			; actually add 11(hex) and loop back
	$jmp #[calc_loop]

[cont]
	ld b,#FF			; Lower nibble will have F-X
	ld a,xor			; invert bits, will get X
	ld b,#0F			; then mask 0F(hex)
	ld a,and			; and result will be 0X(hex)

	$sto a #[tmpvar]
	$call2 #[bin2hex]
	$rcl a #[tmpvar]	
	$sto a #[hex1]

	$ret1
;_____________________________________________________________


[bin2hex]

	$rcl a #[tmpvar]

	$ptr #[is_alpha_b]
	ld b,#F6,jc

	ld b,#30			; offset 30hex to get ascii of '0'
	ld a,add
	$sto a #[tmpvar]

	$ret2

[is_alpha_b]

	ld b,#37			; offset 37(hex) to get ascii of 'A' when hex is 0A
	ld a,add
	$sto a #[tmpvar]

	$ret2


;______________________________________________________________



;---------------------------------
; Startup message data
ORG #0900

[gmessage]
	ins #1B #5B #48						;cursor home, top left (VT100)
	ins #1B #5B #32 #4A					;clear screen (VT100)
	ins "dmkCPU v1.0 1989-2017..."
	ins #0D #0A
	ins "Monitor Sw. Ver 2.0"
	ins #0D #0A
	ins #00



;---------------------------------
; Help message data
ORG #0A00

[hmessage]
	ins #0D #0A
	ins "Commands:"
	ins #0D #0A
	ins "  H        -> this help"
	ins #0D #0A
	ins "  Gxxxx    -> goto, execute from addr xxxx"
	ins #0D #0A
	ins "  Dxx00    -> display data from addr xx00"
	ins #0D #0A
	ins "  Lxxxx    -> Serial load binary to addr xxxx [reset to exit]"
	ins #0D #0A
	ins "  Ixxxx... -> Insert bytes at addr xxxx until <enter>"
	ins #00

; end of code


