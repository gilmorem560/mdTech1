/* ------------------------------------------------------------------------- */
/* config - graphics configuration                                           */
/* ------------------------------------------------------------------------- */
	.include "src/md.i"
	.global vdpregs
	.global	vdpinit
	.global vramwrite
/* ------------------------------------------------------------------------- */
	.data
/* ------------------------------------------------------------------------- */
vdpregs:
	.word	0x8006
	.word	0x8104
	.word	0x8230
	.word	0x832C
	.word	0x8407
	.word	0x8554
	.word	0x8600
	.word	0x8700
	.word	0x8800
	.word	0x8900
	.word	0x8A00
	.word	0x8B00
	.word	0x8C81
	.word	0x8D2B
	.word	0x8E00
	.word	0x8F02
	.word	0x9000
	.word	0x9100
	.word	0x9200
	.word	0x9300
	.word	0x9400
	.word	0x9500
	.word	0x9600
	.word	0x9700
vdpregsend:
/* ------------------------------------------------------------------------- */
	.text
/* ------------------------------------------------------------------------- */

/* ------------------------------------------------------------------------- */
/* vdpinit - initialize the vdp                                              */
/* ------------------------------------------------------------------------- */
vdpinit:
	lea		v_vdpreg, %a0
	lea		vdpregs, %a1
	move.l	#((vdpregsend-vdpregs) / 2) - 1, %d0
	
loadreg:
	move.w	(%a1)+, (%a0)
	dbf		%d0, loadreg
	
	lea		v_vdpdata, %a1
	move.l	#0x7FFF, %d0
	move.w	#0, %d1
	move.l	#0x40000000, (%a0)
	
clearvram:
	move.w	%d1, (%a1)
	dbf		%d0, clearvram
	
	move.l	#0xC0000000, (%a0)
	move.l	#0x3F, %d0
	
clearcram:
	move.w	%d1, (%a1)
	dbf		%d0, clearcram
	
	move.l	#0x40000010, (%a0)
	move.l	#0x27, %d0
	
clearvsram:
	move.w	%d1, (%a1)
	dbf		%d0, clearvsram
	
	rts
	
/* ------------------------------------------------------------------------- */
/* vramwrite - call vram write to address                                    */
/* ------------------------------------------------------------------------- */
vramwrite:
	move.w	%d0, %d3
	andi.w	#0x3FFF, %d3
	or.w	#0x4000, %d3
	move.w	%d0, %d4
	lsr.w	#8, %d4
	lsr.w	#6, %d4
	move.w	%d3, (%a1)
	move.w	%d4, (%a1)
	rts
