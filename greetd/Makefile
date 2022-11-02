config_files := config.toml sway-config kanshi-config wlgreet-config.toml
src_config_dir := config/
dst_config_dir := /etc/greetd/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

bin_files := greetd-oneshot-delay sway-run
src_bin_dir := bin/
dst_bin_dir := /usr/local/bin/
dst_bin_files := $(addprefix $(dst_bin_dir),$(bin_files))

background_files := .default painted.jpg
src_background_dir := backgrounds/
dst_background_dir := /usr/local/share/backgrounds/
dst_background_files := $(addprefix $(dst_background_dir),$(background_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_config_dir) $(dst_config_files)\
	$(dst_bin_files)\
	$(dst_background_files)\
	/usr/lib/systemd/system/greetd.service

$(dst_config_dir):
	install --owner=greeter --group=greeter --directory $(dst_config_dir)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=greeter --group=greeter --mode=644 $< $@

.SECONDEXPANSION:
$(dst_bin_files): $$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	install --owner=root --group=root --mode=755 $< $@

.SECONDEXPANSION:
$(dst_background_files): $$(subst $$(dst_background_dir),$$(src_background_dir),$$@)
	install --owner=root --group=root --mode=755 $< $@

/usr/lib/systemd/system/greetd.service: systemd/greetd.service
	install --owner=root --group=root --mode=644\
		/usr/lib/systemd/system/greetd.service\
		/usr/lib/systemd/system/greetd.service.bak
	install --owner=root --group=root --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
	rm -rf $(dst_bin_files)
	rm -rf $(dst_background_files)
	install --owner=root --group=root --mode=644\
		/usr/lib/systemd/system/greetd.service.bak\
		/usr/lib/systemd/system/greetd.service
	rm -rf /usr/lib/systemd/system/greetd.service.bak
