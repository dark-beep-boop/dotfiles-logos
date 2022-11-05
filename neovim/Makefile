config_files := init.lua
src_config_dir := config/
dst_config_dir := $(HOME)/.config/kitty/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

lua_config_files := 
src_lua_config_dir := $(src_config_dir)lua/
dst_lua_config_dir := $(dst_config_dir)lua/
dst_lua_config_files := $(addprefix $(dst_lua_config_dir),$(lua_config_files))

.PHONY:\
	all,\
	install,\
	uninstall

all:

install:\
	$(dst_config_dir) $(dst_config_files)\
	$(dst_lua_config_dir) $(dst_lua_config_files)

$(dst_config_dir):
	install --owner=$(SUDO_USER) --group=$(SUDO_USER) --directory $@

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	install --owner=$(SUDO_USER) --group=$(SUDO_USER) --mode=644 $< $@

$(dst_lua_config_dir):
	install --owner=$(SUDO_USER) --group=$(SUDO_USER) --directory $@

.SECONDEXPANSION:
$(dst_lua_config_files):\
	$$(subst $$(dst_lua_config_dir),$$(src_lua_config_dir),$$@)
	install --owner=$(SUDO_USER) --group=$(SUDO_USER) --mode=644 $< $@

uninstall:
	rm -rf $(dst_config_dir)
