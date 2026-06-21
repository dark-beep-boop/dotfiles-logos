username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

background_files := default lock wall/fachada wall/fluorescente wall/pasillo wall/patio wall/sombra
src_background_dir := backgrounds/
dst_background_dir := $(userhome).local/share/backgrounds/
dst_background_files := $(addprefix $(dst_background_dir),$(background_files))

bin_files := set_backgrounds
src_bin_dir := bin/
dst_bin_dir := $(userhome).local/bin/
dst_bin_files := $(addprefix $(dst_bin_dir),$(bin_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_background_files) \
	$(dst_bin_files)

.SECONDEXPANSION:
$(dst_background_files):\
	$$(subst $$(dst_background_dir),$$(src_background_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_bin_files):\
	$$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=755 -D $< $@"

uninstall:
	rm -rf $(dst_background_files) \
	rm -rf $(dst_bin_files)
