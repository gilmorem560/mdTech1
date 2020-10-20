/* ------------------------------------------------------------------------- */
/* mdTech1 - a simple megadrive engine                                       */
/* ------------------------------------------------------------------------- */
OUTPUT_FORMAT(binary)

SECTIONS
{
	. = 0;
	.output : {
		*(.text);
		*(.data);
		*(.bss);
	}
	_ROM_START_ = ADDR(.output);
	_ROM_END_ = SIZEOF(.output);
}
