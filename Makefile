# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dkremer <dkremer@student.42heilbronn.de>   +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/03 14:10:04 by dkremer           #+#    #+#              #
#    Updated: 2024/06/03 14:36:13 by dkremer          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


NAME = libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror -I./inc

# Directory names
GNL_DIR    = gnl
MEM_DIR    = mem
CHAR_DIR   = char
STR_DIR    = str
PRINTF_DIR = printf
PUT_DIR    = put
CONV_DIR   = conv
BINDIR     = bin

# Source files
GNL_SRCS    = $(wildcard $(GNL_DIR)/*.c)
MEM_SRCS    = $(wildcard $(MEM_DIR)/*.c)
CHAR_SRCS   = $(wildcard $(CHAR_DIR)/*.c)
STR_SRCS    = $(wildcard $(STR_DIR)/*.c)
PRINTF_SRCS = $(wildcard $(PRINTF_DIR)/*.c)
PUT_SRCS    = $(wildcard $(PUT_DIR)/*.c)
CONV_SRCS   = $(wildcard $(CONV_DIR)/*.c)

# Combine all source files
SRCS        = $(GNL_SRCS) $(MEM_SRCS) $(CHAR_SRCS) $(STR_SRCS) $(PRINTF_SRCS) $(PUT_SRCS) $(CONV_SRCS)

OBJS = $(SRCS:%.c=$(BINDIR)/%.o)

all: $(NAME)

.SILENT:

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)
	echo $(GREEN)"Linking $(NAME)"$(DEFAULT)

$(BINDIR):
	echo $(GREEN)"Creating $(BINDIR) directory"$(DEFAULT)
	mkdir -p $(BINDIR)

$(BINDIR)/%.o: %.c | $(BINDIR)
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(BINDIR)/**/*.o
	echo $(RED)"Cleaning object files"$(DEFAULT)

fclean: clean
	rm -f $(NAME)
	rm -rf $(BINDIR)
	echo $(RED)"Removing $(NAME) and $(BINDIR) directory"$(DEFAULT)

re: fclean all

.PHONY: all clean fclean re

# Colours
DEFAULT = "\033[39m"
GREEN   = "\033[32m"
RED     = "\033[31m"

