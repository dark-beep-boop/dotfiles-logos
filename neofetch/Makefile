username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := config.conf
src_config_dir := config/
dst_config_dir := $(userhome).config/neofetch/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

ascii_files := knife.ascii
src_ascii_dir := ascii/
dst_ascii_dir := $(userhome).config/neofetch/ascii/
dst_ascii_files := $(addprefix $(dst_ascii_dir),$(ascii_files))

.PHONY: all, install, uninstall

all:

install: $(dst_config_files) $(dst_ascii_files)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_ascii_files): $$(subst $$(dst_ascii_dir),$$(src_ascii_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

uninstall:
	rm -rf $(dst_ascii_dir)
	rm -rf $(dst_config_dir)
