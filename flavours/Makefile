username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files := config.toml
src_config_dir := config/
dst_config_dir := $(userhome).config/flavours/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

sources_list_files := sources.yaml
src_sources_list_dir := sources-list/
dst_sources_list_dir := $(userhome).local/share/flavours/base16/
dst_sources_list_files :=\
	$(addprefix $(dst_sources_list_dir),$(sources_list_files))

.PHONY: all, install, uninstall

all:

install: $(dst_config_files) $(dst_sources_list_files)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

.SECONDEXPANSION:
$(dst_sources_list_files):\
	$$(subst $$(dst_sources_list_dir),$$(src_sources_list_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

uninstall:
	rm -rf $(dst_config_dir)
	rm -rf $(dst_sources_list_files)
