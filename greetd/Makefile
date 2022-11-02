config_files := config.toml sway-config kanshi-config wlgreet-config.toml
src_config_dir := config/
dst_config_dir := /etc/greetd/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install: $(dst_config_dir) $(dst_config_files)

$(dst_config_dir):
	@install --owner=greeter --group=greeter --directory $(dst_config_dir)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	@install --owner=greeter --group=greeter --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
