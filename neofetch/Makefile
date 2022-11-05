config_files := config.conf
src_config_dir := config/
dst_config_dir := $(HOME)/.config/neofetch/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install: $(dst_config_dir) $(dst_config_files)

$(dst_config_dir):
	install --owner=$(SUDO_USER) --group=$(SUDO_USER) --directory $(dst_config_dir)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=$(SUDO_USER) --group=$(SUDO_USER) --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
