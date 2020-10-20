/* ------------------------------------------------------------------------- */
/* sprites - sprite-related operations                                       */
/* ------------------------------------------------------------------------- */
	.include "src/md.i"
	.global	loadsprite
/* ------------------------------------------------------------------------- */
	.text
/* ------------------------------------------------------------------------- */

/* ------------------------------------------------------------------------- */
/* loadsprite - fully load a sprite to the VDP                               */
/* Arguments:                                                                */
/*	a0 -> sprite:                                                            */
/*		tilesize.w				- size of tile collection in words           */
/*      tiles[tilesize].b		- tiles                                      */
/*		attrib[4].w				- attributes								 */
/*  d0.w = vram address                                                      */
/*  d1.w = vsram address   													 */
/* ------------------------------------------------------------------------- */
loadsprite:
	lea		v_vdpreg, %a1
	lea		v_vdpdata, %a2
	bsr		vramwrite

	move.l	#0, %d3
	move.w	(%a0)+, %d3
	
movetileloop:
	move.w	(%a0)+, %a2
	dbf		%d3, movetileloop
	
	move.w	vdpregs + 0xA, %d0
	lsl.b	#1, %d0
	lsl.w	#8, %d0
	bsr		vramwrite
	move.b	#3, %d0
	
moveattrloop:
	move.w	(%a0)+, %a2
	dbf		%d0, moveattrloop
	
	/* in progress */
	
	rts
