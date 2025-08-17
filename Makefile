# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mal-moha <mal-moha@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/30 10:12:21 by mal-moha          #+#    #+#              #
#    Updated: 2025/05/30 10:12:24 by mal-moha         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC     = ft_printf.c helper.c

OBJ     = $(SRC:.c=.o)

NAME    = libftprintf.a
CC      = cc
CFLAGS  = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus