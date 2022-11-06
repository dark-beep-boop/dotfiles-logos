dots :=\
			 bpytop\
			 dunst\
			 flavours\
			 greetd\
			 kanshi\
			 kitty\
			 lock\
			 logout-menu\
			 menu\
			 neofetch\
			 neovim\
			 sway\
			 waybar

.PHONY:\
	all\
	install\
	uninstall

all:

install:
	@for dir in $(dots);\
	do\
		cd $$dir;\
		make install;\
		cd ..;\
	done

uninstall:
	@for dir in $(dots);\
	do\
		cd $$dir;\
		make uninstall;\
		cd ..;\
	done
