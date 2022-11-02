config_files := bpytop.conf
src_config_dir := config/
dst_config_dir := $(HOME)/.config/bpytop/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

theme_files := base16-flavours.theme
src_theme_dir := themes/
dst_theme_dir := $(HOME)/.config/bpytop/themes/
dst_theme_files := $(addprefix $(dst_theme_dir),$(theme_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install: $(dst_config_dir) $(dst_config_files) $(dst_theme_dir) $(dst_theme_files)

$(dst_config_dir):
	install --owner=$(USER) --group=$(USER) --directory $(dst_config_dir)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=$(USER) --group=$(USER) --mode=644 $< $@

$(dst_theme_dir):
	install --owner=$(USER) --group=$(USER) --directory $(dst_theme_dir)

.SECONDEXPANSION:
$(dst_theme_files): $$(subst $$(dst_theme_dir),$$(src_theme_dir),$$@)
	install --owner=$(USER) --group=$(USER) --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
