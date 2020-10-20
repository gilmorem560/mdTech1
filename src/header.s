/* ------------------------------------------------------------------------- */
/* mdTech1 - a simple megadrive engine                                       */
/* ------------------------------------------------------------------------- */
	.text
/* ------------------------------------------------------------------------- */

vector:
	.long	0xFFFFFE00	, sysinit	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, hint
	.long	nullloop	, vint		, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop
	.long	nullloop	, nullloop	, nullloop	, nullloop

header:
	.ascii	"SEGA MEGA DRIVE "
	.ascii	"(C)SEGA 2020.OCT"
	.ascii	"GAME                                            "
	.ascii	"GAME                                            "
	.ascii	"GM 00000000-00"
	.word	0x0000
	.ascii	"J               "
	.long	_ROM_START_, _ROM_END_
	.long	0xFF0000, 0xFFFFFF
	.ascii	"  "
	.byte	0b00100000, 0b00100000
	.long	0x20202020, 0x20202020
	.ascii	"  ", "    ", "    "
	.ascii	"                                          "
	.ascii	"JUE             " 
