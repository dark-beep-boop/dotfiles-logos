dots :=\
			 bpytop\
			 dunst\
			 greetd\
			 kanshi\
			 kitty\
			 logout-menu\
			 menu\
			 neofetch\
			 neovim\
			 swaylock

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
