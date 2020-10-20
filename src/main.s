/* ------------------------------------------------------------------------- */
/* main - main functionality                                                 */
/* ------------------------------------------------------------------------- */
	.include "src/md.i"
	.include "src/vars.i"
	.global	sysinit
/* ------------------------------------------------------------------------- */
	.data
/* ------------------------------------------------------------------------- */
secmsg:
	.ascii	"SEGA"
/* ------------------------------------------------------------------------- */
	.text
/* ------------------------------------------------------------------------- */

/* ------------------------------------------------------------------------- */
/* sysinit - startup system                                                  */
/* ------------------------------------------------------------------------- */
sysinit:
	move	#0x2700, %sr
	
	move.b	0xA10001, %d0
	andi.b	#0x0F, %d0
	beq.b	securityclear
	lea		secmsg, %a0
	move.l	(%a0), 0xA14000
	
securityclear:
	lea		m_ramstart, %a0
	move.l	#0x3F7F, %d0
	move.l	#0, %d1
clearram:
	move.l	%d1, (%a0)+
	dbf		%d0, clearram
	move.b	%d1, g_vintmask
	
	bsr		vdpinit
	bsr		padinit
	
	lea		v_vdpreg, %a0
	move.w	#0x8164, %a0
	andi	#0xF8FF, %sr

/* ------------------------------------------------------------------------- */
/* main - the main game loop                                                 */
/* ------------------------------------------------------------------------- */
main:
	bsr		readctrl
	lea		v_vdpreg, %a0
	lea		v_vdpdata, %a1
	move.w	#0x8F02, (%a0)
	move.w	#0x8701, (%a0)
	move.l	#0xC0000000, (%a0)
	move.w	#0x000, (%a1)
	move.b	g_padapress, %d0
	move.b	%d0, %d1
	andi.b	#c_up, %d1
	beq.s	setblue				/* blue on up */
	move.b	%d0, %d1
	andi.b	#c_down, %d1
	beq.s	setgreen			/* green on down */
	move.b	%d0, %d1
	andi.b	#c_left, %d1
	beq.s	setyellow			/* yellow on left */
	move.b	%d0, %d1
	andi.b	#c_right, %d1
	beq.s	setred				/* red on right */
	move.w	#0x0000, (%a1)
	bra.s	dispcolor
	
setblue:
	move.w	#0xE00, (%a1)
	bra.s	dispcolor
	
setgreen:
	move.w	#0x0E0, (%a1)
	bra.s	dispcolor
	
setred:
	move.w	#0x00E, (%a1)
	bra.s	dispcolor
	
setyellow:
	move.w	#0x0EE, (%a1)
	
dispcolor:
	nop
	nop
	bra.s	main
