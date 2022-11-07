dots :=\
			 bpytop\
			 dunst\
			 flavours\
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
	uninstall\
	install-greetd\
	uninstall-greetd

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

install-greetd:
	@cd greetd;\
		make install;\
		cd ..

uninstall-greetd:
	@cd greetd;\
		make uninstall;\
		cd ..
