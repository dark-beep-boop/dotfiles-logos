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

systemd_name := delay-greetd
systemd_file := $(systemd_name).service
systemd_config_dir := $(systemd_name).d
src_systemd_dir := systemd/
src_systemd_file := $(src_systemd_dir)$(systemd_file)
src_systemd_config_dir := $(src_systemd_dir)$(systemd_config_dir)
dst_systemd_dir := /usr/lib/systemd/system/
dst_systemd_file := $(dst_systemd_dir)$(systemd_file)
dst_systemd_config_dir := $(dst_systemd_dir)$(systemd_config_dir)

.PHONY: all, install, uninstall

all:

install:\
	$(dst_config_dir)\
	$(dst_config_files)\
	$(dst_bin_files)\
	$(dst_background_files)\
	$(dst_systemd_file)

$(dst_config_dir):
	install --owner=greeter --group=greeter --directory $@

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=greeter --group=greeter --mode=644 -D $< $@

.SECONDEXPANSION:
$(dst_bin_files): $$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	install --owner=root --group=root --mode=755 -D $< $@

.SECONDEXPANSION:
$(dst_background_files):\
	$$(subst $$(dst_background_dir),$$(src_background_dir),$$@)
	install --owner=root --group=root --mode=644 -D $< $@

$(dst_systemd_file): $(src_systemd_file)
	install --owner=root --group=root --mode=644 -D $< $@

$(dst_systemd_config_dir): $(src_systemd_config_dir)
	install --owner=root --group=root --mode=644 -D $< $@

uninstall:
	rm -rf $(dst_config_dir)
	rm -rf $(dst_bin_files)
	rm -rf $(dst_background_files)
	rm -rf $(dst_systemd_file)
	rm -rf $(dst_systemd_config_dir)
