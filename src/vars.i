/* ------------------------------------------------------------------------- */
/* vars - variables and constants                                            */
/* ------------------------------------------------------------------------- */

/* control constants */
	.set	c_up, 0x1
	.set	c_down, 0x2
	.set	c_left, 0x4
	.set	c_right, 0x8

/* globals */
	.set	g_padapress, 0xFF0000		/* pad 1 current press */
	.set	g_padaprev,	 0xFF0001		/* pad 1 previous press */
	.set	g_vintmask,	 0xFF0002		/* vertical interrupt routine mask */
