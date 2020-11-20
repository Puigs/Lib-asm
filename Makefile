##
## EPITECH PROJECT, 2019
## Makefile
## File description:
## Makefile
##

CC			=	ld

SRC			= 	my_strlen.asm 		\
				strchr.asm	  		\
				strcmp.asm	  		\
				memset.asm	  		\
				memcpy.asm	  		\
				memmove.asm	  		\
				strncmp.asm	  		\
				strcasecmp.asm		\
				rindex.asm			\
				strstr.asm			\
				strcspn.asm			\
				strpbrk.asm			\

CFLAGS		=	-shared

OBJ			=	$(SRC:.asm=.o)

NAME		=	libasm.so

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all