username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 config\
							 config.d/00-color-scheme\
							 config.d/00-file-explorer\
							 config.d/00-lock\
							 config.d/00-mail\
							 config.d/00-menu\
							 config.d/00-power-menu\
							 config.d/00-screenshot\
							 config.d/00-variables\
							 config.d/10-bar\
							 config.d/10-idle\
							 config.d/10-input\
							 config.d/10-output\
							 config.d/20-window-behaviour\
							 config.d/50-basic-keys\
							 config.d/50-control-keys\
							 config.d/50-layout-keys\
							 config.d/50-movement-keys\
							 config.d/50-resize-keys\
							 config.d/50-scratchpad-keys\
							 config.d/50-workspace-keys\
							 config.d/80-appearance\
							 config.d/90-autostart\
							 config.d/99-last
src_config_dir := config/
dst_config_dir := $(userhome).config/sway/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

background_files := default painted/default lines/default
src_background_dir := backgrounds/
dst_background_dir := $(userhome).local/share/backgrounds/
dst_background_files := $(addprefix $(dst_background_dir),$(background_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_config_files)\
	$(dst_background_files)

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
