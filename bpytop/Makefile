username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := bpytop.conf
src_config_dir := config/
dst_config_dir := $(userhome).config/bpytop/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

theme_config_files := base16-flavours.theme
src_theme_config_dir := $(src_config_dir)themes/
dst_theme_config_dir := $(dst_config_dir)themes/
dst_theme_config_files :=\
			 $(addprefix\
			 $(dst_theme_config_dir),\
			 $(theme_config_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_config_dir)\
	$(dst_config_files)\
	$(dst_theme_config_dir)\
	$(dst_theme_config_files)

$(dst_config_dir):
	install --owner=$(username) --group=$(username) --directory $@

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=$(username) --group=$(username) --mode=644 $< $@

$(dst_theme_config_dir):
	install --owner=$(username) --group=$(username) --directory $@

.SECONDEXPANSION:
$(dst_theme_config_files):\
	$$(subst $$(dst_theme_config_dir),$$(src_theme_config_dir),$$@)
	install --owner=$(username) --group=$(username) --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
