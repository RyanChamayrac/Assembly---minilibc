##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile
##

NAME=		libasm.so

SRC=        strlen.s    \
            strchr.s    \
            rindex.s    \
            strpbrk.s   \
            strcspn.s   \
            strstr.s    \
            memcpy.s

ASMFLAGS=   -f elf64

LDFLAGS=    -shared

ASM=        nasm

LD=         ld

RM=         rm -f

OBJ=        $(SRC:.s=.o)

%.o: %.s
			$(ASM) -o $@ $< $(ASMFLAGS)

all:        $(NAME)

$(NAME):    $(OBJ)
			$(LD) $(LDFLAGS) -o $(NAME) $(OBJ)

clean:
			$(RM) $(OBJ)

fclean:		clean
			$(RM) $(NAME)

re:		fclean all
