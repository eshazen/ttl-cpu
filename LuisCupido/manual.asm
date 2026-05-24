; Manual for the dmkCPU
; ... and for the "c_asm" assembler supported features

; by: Luis Cupido [ct1dmk@gmail.com] -- (software 2015-2019 / hardware 1980-2017)



; This file will assemble without errors the manual.lst manual.hex manual.bin files
; will be generated. Use this to test if the c_asm is working properly.

; ------------------------------
; Versions:
;           1.0 C#, C-win32 - Abandoned
;			1.1 C msdos
;			1.2 C gcc (linux, BCC win, BCC msdos) - Current Version



; ------------------------------
; Assembler Language conventions

; comments start with a semicolon all text after ';' is ignored

; all numeric values start with '#'. Menemonics that expect imediate numeric values are
; written with '#' in the second operand even when the value that follows is actually
; expressed in reference literals the # is always necessary.

; all numeric values are hexadecimal only.

; labels and reference literals must be written within rectangular
; brackets and must not use spaces. Example:

[label]		; This is a label to where you can jump from anywhere within the code.

; anyline starting with '$' is a macro that must have a defenition in _macro.asm file
; see _macro.asm file for macro defenitions and usage.

; The c_asm assembler when invoked as "c_asm my-file.asm" first expand macros that exist
; in the asm file 'my-file.asm' creating the "my-file.as_".
; the file "my-file.as_" is the one actually being assembled.
; When no macros are used "my-file.asm" and "my-file.as_" will be equal.
; Assembly operation happens in two passes, first pass retrieves defines and labels
; and second pass will assemble the code producing the hex and binary files.
; A complete listing that include code, references and variables, is provided in
; the .lst file.

;--------------------------------
; valid assembler directives 

ORG	#0200					;Determines the new address for assembly code to be 0x0200
							;If used more than once new ORG directives must be higher than previous

EQU [this_byte] #3f			;Equates a byte value into a literal reference

INS #01						;Inserts a single byte into the code at current position
INS #02,#03 #04 #05,#06		;Inserts several bytes into the code at current position, either space or coma as delimiter
INS "this is text"			:Inserts the ascii codes of all text characters

MEM [some-ram_addr]  #81f0	;Equates a word value to be used as RAM address into a literal reference

PRG [some-code_addr] #10ff	;Equates a word value to be used as code address into a literal reference

[my_label]					;Label, equates a word value equal to the address of its current position


; -------------------------------
; CPU mnemonics

	; only a "load" instruction exists
	; generic form is:						LD op1,op2,jmp_option
	; op1 is the target and can be:			a,b,yl,yh,mem
	; op2 is the source and can be:			a,b,imd,mem,add,and,or,xor
	; jmp_option is optional and can be:	jmp,jz,jc
	
	; aritmetic and logic operations are allways obtained from 'a' and 'b' registers,
	
	ld a,#1f			;loads the imediate code #1f into 'a'
	ld b,a				;loads the value of 'a' into 'b'
	ld a,add			;loads the value 'a+b' into 'a'
	ld b,#[this_byte]	;loads the value #3f into 'b' (as equated above).
	
	; the "y" (yl,yh) is a special register to be used only a pointer to program or memory
	
	ld yl,#4f			;loads #4f into 'yl'
	
	; loading a register from 16bit reference literals (either MEM PRG or Labels)
	; the assembler automatically assign the least and most significant
	; to the convenient registers. (remember the above assignement of 'some-ram_addr'
	; which holds 81f0) 
	
	ld yl,#[some-ram_addr]		;loads #f0 into 'yl'
	ld yh,#[some-ram_addr]		;loads #81 into 'yh'
								;y register has now #81f0
	
	; same assembler behaviour on a and b registers because there must be an easy
	; way to manipulate address pointers in a and b when loading them by reference
	
	ld a,#[some-ram_addr]		;loads #f0 into 'a'
	ld b,#[some-ram_addr]		;loads #81 into 'b'


	; however there must be a way to load the LSB of a 16bit reference in 'b' register (or MSB in 'a')
	; to make 16bit references useable in all cases without need to make the reference in two 8 bit EQU
	; or explicit using 8 bit numbers.
	;
	; loading a register from a 16bit reference literal (either MEM PRG or Labels) in the
	; reverse order, that is, MSB into 'a' or 'yl' and LSB into 'b' or 'yh' can be acomplished
	; by using % instead of #. This only works for reference literals, either PRG MEM or labels.


	ld yl,%[some-ram_addr]		;loads #81 into 'yl'
	ld yh,%[some-ram_addr]		;loads #f0 into 'yh'
								;y register has now #f081

	ld a,%[some-ram_addr]		;loads #81 into 'a'
	ld b,%[some-ram_addr]		;loads #f0 into 'b'


								
	; loading data from ram memory happens at ram address pointed by 'y' register

	ld a,mem					;loads into 'a' the contents of ram at #81f0
	ld mem,b					;loads ram at #81f0 with 'b' register contents
	
	; Next program-fetch location is always determined at the last cycle of each instruction
	; For simple instructions (without jump action) the PC is incremented by 1
	; When a Jump action is specified the PC is loaded with the Y register
	; whenever a jump actions happens the new program location is the address stored by 'y' register

								;Jumps with numbers
	ld yl,#00					;loads #00 into 'yl'
	ld yh,#01					;loads #01 into 'yh'
								;results that #0100 was loaded to 'y'
	ld	a,b,jmp					;loads 'a' with the contents of 'b' and jump to #0100
	
								;Jumps with defines
	ld yl,#[some-code_addr]		;loads #ff into 'yl'
	ld yh,#[some-code_addr]		;loads #10 into 'yh'
								;results that #10ff was loaded to 'y'
	ld	a,b,jmp					;loads 'a' with the contents of 'b' and jump to #10ff
	
								;Jumps with labels	
	ld yl,#[label]				;loads the [label] LSByte into 'yl'
	ld yh,#[label],jmp			;loads the [label] MSByte into 'yh', and jumps there

	;Conditional jumps have the same behaviour regarding the y register.

	ld yl,#[label]				;loads the [label] LSByte into 'yl'
	ld yh,#[label]				;loads the [label] MSByte into 'yh'

	ld a,a,jc					;loads 'a' with 'a' (does nothing) and if carry exists on 'a+b' jumps to [label]
	ld a,add,jz					;loads 'a' with a+b and if 'a' becomes zero jumps to [label]


	;Flags are obtained from the a and b register values as they are at the time of testing.

	;when testing flags on instructions that affect a or b registers consider that the test will
	;happen after the operation therefore the represents the a and b registers after operation.
	;Carry is the carry status of the a+b register values, while zero is the status of the a register.

	; there is no need to perform any operations to check for carry or zero
	; the zero circuitery is premanently wired to register 'a' and the add circuitery is permanently
	; wired to 'a' and 'b' registers therefore zero and carry flags are always accessible.
	
	; zero flag is 'a=0' but there is no need to perform any operation into 'a' to check for zero
	; at any time if 'a' is zero and current intruction ends with 'jz' code will jump.
	

	ld b,#34,jz			;loads 'b' with #34 and if 'a' is zero jumps to [label]

	ld a,#00
	ld b,#01
	ld a,add,jz			;will not jump, at the time zero is tested 'a' is already 01

	ld a,and,jz			;loads 'a' with 'a&b' and jumps if the after the operation a equals zero


	ld a,or,jc			;loads 'a' with 'a|b' and jumps if the after the OR operation a+b has carry	
	ld b,#34,jc			;loads 'b' with #34 and if 'a+b' has a carry then jumps

	ld a,#01
	ld b,#FF
	ld yl,a,jc			; will jump as a+b has carry

	ld a,#01
	ld b,#FF			; a carry exists at this point

	ld a,add,jc			; but now it will not jump because at the time of test 'a' is already 00.
						; and carry no longer exists.



;--------------------------------------
; -------------------------------------
; Assembler test, all mnemonics tested	

EQU [bytetest] #7f
PRG [codetest] #20f0
MEM [ramtest] #8100

ORG	#1000

INS #AA,#BB,#01,#02

INS "This is text"

	ld a,a
	ld a,b
	ld a,#a3
	ld a,#[bytetest]
	ld a,mem
	ld a,add
	ld a,and
	ld a,or
	ld a,xor
	
	ld b,a
	ld b,b
	ld b,#a3
	ld b,#[bytetest]
	ld b,mem
	ld b,add
	ld b,and
	ld b,or
	ld b,xor
	
	ld yl,a
	ld yl,b
	ld yl,#a3
	ld yl,#[bytetest]
	ld yl,mem
	ld yl,add
	ld yl,and
	ld yl,or
	ld yl,xor
	
	ld yh,a
	ld yh,b
	ld yh,#a3
	ld yh,#[bytetest]
	ld yh,mem
	ld yh,add
	ld yh,and
	ld yh,or
	ld yh,xor
	
	ld mem,a
	ld mem,b
	
	
	; ------------------------
	; the next three instructions will not produce any useable result. Both immediate
	; and memory values, that are read from the data-bus, are available at CPU
	; internal bus in order to be registered on a,b,yl or yh but will no longer
	; be present after the data bus switches to write. Therefore loading from imediate
	; or memory to write into memory makes no sense in this architecture.
	; Loading from memory to memory, (regardless if it is data-memory or code-memory or both)
	; must always happen through a register.
	; >>>>>> Be sure not to use any of this <<<<<<
	ld mem,#a3
	ld mem,#[bytetest]
	ld mem,mem
	; ------------------------
	
	
	ld mem,add
	ld mem,and
	ld mem,or
	ld mem,xor

[label_k]

	ld yl,#1f
	ld yh,#80
	ld yl,#[codetest]
	ld yh,#[codetest]
	ld yl,#[label_k]
	ld yh,#[label_k]
	
	ld a,#[codetest]
	ld b,#[codetest]
	ld a,#[label_k]
	ld b,#[label_k]
	
	; jumps may used together with any CPU operation
	; below we are using just one example
	; to test the assembler coding. note that
	; JMP, JZ, or JC may be added to all other menemonics.
	
	ld a,b,jmp
	ld a,b,jz
	ld a,b,jc
	
; end of code
	
	
	
