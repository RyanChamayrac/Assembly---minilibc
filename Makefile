##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile
##

NAME=		libasm.so

all:
		nasm -f elf64 strlen.asm
		nasm -f elf64 strchr.asm
		gcc -shared -o $(NAME) *.o

clean:
			rm -f *.o

fclean:		clean
			rm -f $(NAME)

re:		fclean all
