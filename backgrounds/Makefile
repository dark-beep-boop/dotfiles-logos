username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

background_files := default lock
src_background_dir := backgrounds/
dst_background_dir := $(userhome).local/share/backgrounds/
dst_background_files := $(addprefix $(dst_background_dir),$(background_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_background_files)

.SECONDEXPANSION:
$(dst_background_files):\
	$$(subst $$(dst_background_dir),$$(src_background_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

uninstall:
	rm -rf $(dst_background_files)
