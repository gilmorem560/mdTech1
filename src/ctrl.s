/* ------------------------------------------------------------------------- */
/* ctrl - controller subroutines                                             */
/* ------------------------------------------------------------------------- */
	.include "src/md.i"
	.include "src/vars.i"
	.global padinit
	.global readctrl
/* ------------------------------------------------------------------------- */
	.text
/* ------------------------------------------------------------------------- */

/* ------------------------------------------------------------------------- */
/* padinit  - initialize controller                                          */
/* ------------------------------------------------------------------------- */
padinit:
	lea		c_padactrl, %a0
	move.b	#0x40, (%a0)
	rts

/* ------------------------------------------------------------------------- */
/* readctrl - read the controller                                            */
/* ------------------------------------------------------------------------- */
readctrl:
	lea		c_padadata, %a0
	lea		c_padactrl, %a1
	lea		g_padapress, %a2
	lea		g_padaprev, %a3
	
	move.b	(%a2), (%a3)	/* backup previous */
	move.b	#0, (%a2)
	
	move.b	#0xC0, (%a1)
	move.b	#0x40, (%a0)	/* th disable */
	nop
	move.b	(%a0), %d1		/* get th-off read */
	
	move.b	#0x00, (%a0)	/* th enable */
	nop
	nop						/* give time for th-int, is this necessary? */
	move.b	(%a0), %d0		/* get th-on read */
	lsl.b	#2, %d0
	andi.b	#0xC0, %d0
	or.b	%d0, %d1		/* stow start/a in upper 2 bits */
	
	move.b	%d1, (%a2)
	
	rts
