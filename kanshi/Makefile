username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := config
src_config_dir := config/
dst_config_dir := $(userhome).config/kanshi/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

background_files :=\
		   painted-main.png\
		   painted-horizontal-main.png\
		   painted-horizontal-secondary.png\
		   painted-vertical.png
src_background_dir := backgrounds/
dst_background_dir := $(userhome).local/share/backgrounds/
dst_background_files := $(addprefix $(dst_background_dir),$(background_files))

.PHONY: all, install, uninstall

all:

install: $(dst_config_files) $(dst_background_files)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_background_files):\
	$$(subst $$(dst_background_dir),$$(src_background_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

uninstall:
	rm -rf $(dst_config_dir)
	rm -rf $(dst_background_files)
