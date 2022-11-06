username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := kitty.conf current-theme.conf
src_config_dir := config/
dst_config_dir := $(userhome).config/kitty/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install: $(dst_config_dir) $(dst_config_files)

$(dst_config_dir):
	install --owner=$(username) --group=$(username) --directory $@

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=$(username) --group=$(username) --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
