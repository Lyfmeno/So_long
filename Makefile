NAME	=	so_long

SRCS	=	./srcs/*.c\
			./lib/libft/*.c\
			./tools/gnl/*.c

CC		=	gcc

CFLAGS		=	-Werror -Wextra -Wall

SANFLAGS	=	-g -fsanitize=address

LIX_LIB		=	-lm -lX11 -lXext -lz

MAC_LIB		=	-lm -lmlx -framework OpenGL -framework AppKit

LIX_MLX		=	./lib/minilibx-linux/libmlx_Linux.a

MAC_MLX		=	./lib/minilibx_opengl_20191021/libmlx.a

DEL			=	rm -f

$(NAME):
				echo "choisissez un os [san_, re_](lix, mac)"

all:			${NAME}

lix:
				${CC} -o ${NAME} ${SRCS} ${LIX_MLX} ${LIX_LIB} ${CFLAGS}

mac:
				${CC} -o ${NAME} ${SRCS} ${MAC_MLX} ${MAC_LIB} ${CFLAGS}

san_lix:
				${CC} -o ${NAME} ${SRCS} ${LIX_MLX} ${LIX_LIB} ${CFLAGS} ${SANFLAGS}

san_mac:
				${CC} -o ${NAME} ${SRCS} ${MAC_MLX} ${MAC_LIB} ${CFLAGS} ${SANFLAGS}

clean:
				${DEL} ${NAME}

re_lix:			clean lix

re_mac:			clean mac

res_lix:		clean san_lix

res_mac:		clean san_mac

.PHONY: 		clean lix san_lix re_lix mac san_mac re_mac res_lix res_mac