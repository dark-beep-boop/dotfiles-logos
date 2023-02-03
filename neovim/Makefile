username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 init.lua\
							 lua/config.lua\
							 lua/keymaps.lua\
							 lua/options.lua\
							 lua/plugins.lua\
							 lua/variables.lua\
							 lua/autopairs-config/init.lua\
							 lua/comment-config/init.lua\
							 lua/fidget-config/init.lua\
							 lua/gitsigns-config/init.lua\
							 lua/indent-blankline-config/init.lua\
							 lua/lualine-config/init.lua\
							 lua/lualine-config/themes/base16.lua\
							 lua/lualine-config/styles/simple.lua\
							 lua/mason-config/init.lua\
							 lua/mason-lspconfig-config/init.lua\
							 lua/neodev-config/init.lua\
							 lua/nvim-cmp-config/init.lua\
							 lua/nvim-lspconfig-config/init.lua\
							 lua/nvim-tree-config/init.lua\
							 lua/telescope-config/init.lua\
							 lua/treesitter-config/init.lua
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
