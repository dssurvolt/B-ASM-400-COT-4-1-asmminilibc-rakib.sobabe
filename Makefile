##
## EPITECH PROJECT, 2024
## B-ASM-400-COT-4-1-asmminilibc-rakib.sobabe [WSL: kali-linux]
## File description:
## Makefile
##

NAME	= 	libasm.so
ASM		= 	nasm
CC		= 	ld
CFLAGS	= 	-fPIC -shared
ASFLAGS	= 	-f elf64

SRC		=

T_SRC	= 

OBJ		= 	$(SRC:.asm=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	$(ASM) $(ASFLAGS) -o $@ $<

clean:
	rm -rf $(OBJ)
	rm -rf *.gcno
	rm -rf *.gcda
	rm -rf test
	rm -rf *.gcno *.gcda

fclean: clean
	rm -rf $(NAME)

re:	fclean all

tests_run:	re
	gcc $(T_SRC) -ldl -o test -lcriterion --coverage
	./test

.PHONY: all $(NAME) clean fclean re tests_run