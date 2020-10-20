#
# mdTech1 - a simple megadrive engine 
#
BIN		=	game.bin

AS		=	m68k-md-coff-as
ASFLAGS		=	-m68000
LD		=	m68k-md-coff-ld
LDFLAGS		=	-T link.ld -s

HEADER		=	src/header.o

GRAPHICS	=	src/graphics/config.o \
			src/graphics/planes.o \
			src/graphics/sprites.o

LIB		=	src/utility.o \
			src/ctrl.o \
			$(GRAPHICS)
			
INT		=	src/hint.o \
			src/vint.o

MAIN		=	src/main.o

OBJS		=	$(HEADER) \
			$(LIB) \
			$(INT) \
			$(MAIN) 

game: $(OBJS)
	$(LD) $(LDFLAGS) -o $(BIN) $(OBJS)

%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -rf $(OBJS) $(BIN)
