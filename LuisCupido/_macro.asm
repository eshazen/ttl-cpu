;dmkCPU Macro defenition file
;
; Macro names start with '$' followed by the macro name
; any macro will end with '$end'

; user code may pass up to 5 parameters that are used inside the
; macro. %1 to %5 may be used inside macro.

; labels and references are autonumbered at macro expansion to 
; allow the macro to be used multiple times in different places/contexts
; labels and references stating with @ are static and will not be autonumbered

; Macro expansion is done in a one pass, therefore defenitions are non recursive.
; No macros can be used inside a macro definition.


;---------------------------------------
; Simple pointer
$ptr
	ld yh,%1
	ld yl,%1
$end



;---------------------------------------
; Jump macros, jp, jc, jz

$jmp
	ld yh,%1
	ld yl,%1,jmp
$end


$jc
	ld yh,%1
	ld yl,%1,jc
$end


$jz
	ld yh,%1
	ld yl,%1,jz
$end



;---------------------------------------
; Store and recall value in/from memory
$sto
	ld yh,%2
	ld yl,%2
	ld mem,%1
$end

$rcl
	ld yh,%2
	ld yl,%2
	ld %1,mem
$end



;----------------------------------
; makes a NOTXOR = not(a xor b)
$nxor
	ld a,xor
	ld b,#ff
	ld a,xor
$end



;----------------------------------
; inc a, dec a

$inca
	ld b,#01
	ld a,add
$end

$deca
	ld b,#ff
	ld a,add
$end


;----------------------------------
; inc b, dec b

$incb
	ld a,#01
	ld b,add
$end

$decb
	ld a,#ff
	ld b,add
$end



;----------------------------------
; delay value

$delay
	ld a,%1
	ld b,#ff
	ld yl,#[here]
	ld yh,#[here]
[here]
	ld a,add,jc
$end




;----------------------------------
; serial port
;	send, get
;		port addresses need to be defined in the asm file

$send
[wait_tx]	
	ld yl,#[@serial_flags]		; check txflag empty
	ld yh,#[@serial_flags]	
	ld a,mem
	
	ld yl,#[wait_tx]			; wait/loop until empty
	ld yh,#[wait_tx]
	ld b,#[@txrdy_msk]
	ld a,and,jz
	
	ld yh,%1					; get byte to send
	ld yl,%1
	ld a,mem

	ld yl,#[@serial_port]		; send char to TXD serial
	ld yh,#[@serial_port]	
	ld mem,a
$end


$get
[wait_rx]	
	ld yl,#[@serial_flags]		; check txflag empty
	ld yh,#[@serial_flags]	
	ld a,mem
	
	ld yl,#[wait_rx]			; loop until byte available
	ld yh,#[wait_rx]
	ld b,#[@rxfull_msk]
	ld a,and,jz
	
	ld yl,#[@serial_port]		; get byte from RXD serial
	ld yh,#[@serial_port]	
	ld a,mem

	ld yh,%1					; store byte received
	ld yl,%1
	ld mem,a
	
$end





;-------------------------------------------------------------
; call / ret
;		each call* implements one level call/return,
;		call within call must use call2
;		call within call within call must use call3 etc.
;
;		mem locations @call_ptr*_l and @call_ptr*_h
;		must be defined in the main program head.
;
; call #[call_addr]

$call1
	ld a,#[retloc]
	ld yl,#[@call_ptr1_l]
	ld yh,#[@call_ptr1_l]
	ld mem,a

	ld b,#[retloc]
	ld yl,#[@call_ptr1_h]
	ld yh,#[@call_ptr1_h]
	ld mem,b

	ld yh,%1
	ld yl,%1,jmp
	[retloc]
$end

$ret1
	ld yh,#[@call_ptr1_l]
	ld yl,#[@call_ptr1_l]
	ld a,mem
	ld yh,#[@call_ptr1_h]
	ld yl,#[@call_ptr1_h]
	ld b,mem
	ld yh,b
	ld yl,a,jmp
$end


$call2
	ld a,#[retloc]
	ld yl,#[@call_ptr2_l]
	ld yh,#[@call_ptr2_l]
	ld mem,a

	ld b,#[retloc]
	ld yl,#[@call_ptr2_h]
	ld yh,#[@call_ptr2_h]
	ld mem,b

	ld yh,%1
	ld yl,%1,jmp
	[retloc]
$end

$ret2
	ld yh,#[@call_ptr2_l]
	ld yl,#[@call_ptr2_l]
	ld a,mem
	ld yh,#[@call_ptr2_h]
	ld yl,#[@call_ptr2_h]
	ld b,mem
	ld yh,b
	ld yl,a,jmp
$end


$call3
	ld a,#[retloc]
	ld yl,#[@call_ptr3_l]
	ld yh,#[@call_ptr3_l]
	ld mem,a

	ld b,#[retloc]
	ld yl,#[@call_ptr3_h]
	ld yh,#[@call_ptr3_h]
	ld mem,b

	ld yh,%1
	ld yl,%1,jmp
	[retloc]
$end

$ret3
	ld yh,#[@call_ptr3_l]
	ld yl,#[@call_ptr3_l]
	ld a,mem
	ld yh,#[@call_ptr3_h]
	ld yl,#[@call_ptr3_h]
	ld b,mem
	ld yh,b
	ld yl,a,jmp
$end




