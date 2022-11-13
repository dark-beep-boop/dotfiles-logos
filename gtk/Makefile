username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

gtk2_config_files := gtkfilechooser.ini
src_gtk2_config_dir := gtk2-config/
dst_gtk2_config_dir := $(userhome).config/gtk-2.0/
dst_gtk2_config_files :=\
	$(addprefix $(dst_gtk2_config_dir),$(gtk2_config_files))

gtk3_config_files := gtk.css settings.ini
src_gtk3_config_dir := gtk3-config/
dst_gtk3_config_dir := $(userhome).config/gtk-3.0/
dst_gtk3_config_files :=\
	$(addprefix $(dst_gtk3_config_dir),$(gtk3_config_files))

rc_files := .gtkrc-2.0
src_rc_dir := rc/
dst_rc_dir := $(userhome)
dst_rc_files := $(addprefix $(dst_rc_dir),$(rc_files))

theme_files := FlatColor Raleigh
src_themes_dir := themes/
dst_themes_dir := $(userhome).themes/
dst_theme_files := $(addprefix $(dst_themes_dir),$(theme_files))

icon_files := Papirus Papirus-Dark Papirus-Light ePapirus ePapirus-Dark
src_icons_dir := icons/
dst_icons_dir := $(userhome).icons/
dst_icon_files := $(addprefix $(dst_icons_dir),$(icon_files))

bin_files := import-gsettings
src_bin_dir := bin/
dst_bin_dir := $(userhome).local/bin/
dst_bin_files := $(addprefix $(dst_bin_dir),$(bin_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_gtk2_config_files)\
	$(dst_gtk3_config_files)\
	$(dst_rc_files)\
	$(dst_theme_files)\
	$(dst_icon_files)\
	$(dst_bin_files)

.SECONDEXPANSION:
$(dst_gtk2_config_files):\
	$$(subst $$(dst_gtk2_config_dir),$$(src_gtk2_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_gtk3_config_files):\
	$$(subst $$(dst_gtk3_config_dir),$$(src_gtk3_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_rc_files): $$(subst $$(dst_rc_dir),$$(src_rc_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_theme_files): $$(subst $$(dst_themes_dir),$$(src_themes_dir),$$@)
	su $(username) --command="cp -r $< $@"

.SECONDEXPANSION:
$(dst_icon_files): $$(subst $$(dst_icons_dir),$$(src_icons_dir),$$@)
	su $(username) --command="cp -r $< $@"

.SECONDEXPANSION:
$(dst_bin_files): $$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=755 -D $< $@"

uninstall:
	rm -rf $(dst_gtk2_config_dir)
	rm -rf $(dst_gtk3_config_dir)
	rm -rf $(dst_rc_files)
	rm -rf $(dst_theme_files)
	rm -rf $(dst_icon_files)
	rm -rf $(dst_bin_files)
