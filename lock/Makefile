username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := config
src_config_dir := config/
dst_config_dir := $(userhome).config/swaylock/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

bin_files := lock
src_bin_dir := bin/
dst_bin_dir := $(userhome).local/bin/
dst_bin_files := $(addprefix $(dst_bin_dir),$(bin_files))

.PHONY: all, install, uninstall

all:

install: $(dst_config_files) $(dst_bin_files)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_bin_files): $$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=755 -D $< $@"

uninstall:
	rm -rf $(dst_config_dir)
	rm -rf $(dst_bin_files)
