dots :=\
			 bpytop\
			 dunst\
			 greetd\
			 kanshi\
			 kitty\
			 neofetch

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
