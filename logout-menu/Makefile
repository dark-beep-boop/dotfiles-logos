username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := config style.css color-scheme.css
src_config_dir := config/
dst_config_dir := $(userhome).config/wofi/logout-menu/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

bin_files := logout-menu
src_bin_dir := bin/
dst_bin_dir := $(userhome).local/bin/
dst_bin_files := $(addprefix $(dst_bin_dir),$(bin_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_config_dir)\
	$(dst_config_files)\
	$(dst_bin_dir)\
	$(dst_bin_files)

$(dst_config_dir):
	install --owner=$(username) --group=$(username) --directory $@

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=$(username) --group=$(username) --mode=644 $< $@

$(dst_bin_dir):
	install --owner=$(username) --group=$(username) --directory $@

.SECONDEXPANSION:
$(dst_bin_files): $$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	install --owner=$(username) --group=$(username) --mode=755 $< $@

uninstall:
	rm -rf $(dst_config_dir)
	rm -rf $(dst_bin_files)
