username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 init.lua\
							 lua/variables.lua\
							 lua/options.lua\
							 lua/keybindings.lua\
							 lua/plugins.lua\
							 lua/hop/base.lua\
							 lua/lualine/base.lua\
							 lua/lualine/themes/base16.lua\
							 lua/lualine/styles/simple.lua\
							 lua/nvim-autopairs/base.lua\
							 lua/nvim-cmp/base.lua\
							 lua/nvim-lspconfig/base.lua\
							 lua/nvim-tree/base.lua
src_config_dir := config/
dst_config_dir := $(userhome).config/nvim/
dst_config_files := $(addprefix $(dst_config_dir),$(config_files))

.PHONY: all, install, uninstall

all:

install: $(dst_config_files)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=644 -D $< $@"

uninstall:
	rm -rf $(dst_config_dir)
