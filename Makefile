#- - - - - - - - VARIABLES - - - - - - - -
CC = gcc
CFLAGS = -Wall -Wextra `pkg-config --cflags gtk+-3.0` `pkg-config --cflags sdl2`
LDLIBS = `pkg-config --libs gtk+-3.0 ` `pkg-config --libs sdl2` -lSDL2_image -lm

SRC_DIR = source
INC_DIR = include
DIR_OBJ = obj

#- - - - - - - - AUTOMATIC VARIABLES - - - - - - - -
SRC = $(shell find -name "*.c")
INC = $(shell find -name "*.h")

OBJ = $(addprefix $(DIR_OBJ)/, $(SRC:c=o))
INC_DIR_ARG = $(addprefix -I, $(shell find -type d -name $(INC_DIR) -not -path '*obj*')) -ITools/

FLAGS = $(INC_DIR_ARG) $(CFLAGS) $(LDLIBS)

#- - - - - - - - RULES - - - - - - - -
all: init sudoku-ocr clear

init:
	@mkdir -p $(DIR_OBJ)
	@mkdir -p $(addprefix $(DIR_OBJ)/, $(shell find -type d -not -path '*/.*'))

clear:
	find $(DIR_OBJ) -type d -empty -delete
print:
	echo C FILES
	@$(foreach file25, $(SRC), echo -e "$(file25)\n")
	echo HEADER
	@$(foreach file25, $(INC), echo -e "$(file25)\n")
	echo INCLUDE
	@$(foreach file25, $(INC_DIR_ARG), echo -e "$(file25)\n")
	echo OBJ
	@$(foreach file25, $(OBJ), echo -e "$(file25)\n")

sudoku-ocr: $(OBJ)
	$(CC) $^ -o $@ $(FLAGS)

$(DIR_OBJ)/%.o: %.c $(INC)
	$(CC) -c $< -o $@ $(FLAGS)

clean:
	rm -fr $(DIR_OBJ)
	rm -f sudoku-ocr
