username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 init.lua\
							 lua/keymaps.lua\
							 lua/options.lua\
							 lua/plugins.lua\
							 lua/variables.lua\
							 lua/autopairs-config/init.lua\
							 lua/comment-config/init.lua\
							 lua/dap-config/init.lua\
							 lua/dap-config/keymaps.lua\
							 lua/dapui-config/init.lua\
							 lua/dapui-config/keymaps.lua\
							 lua/gitsigns-config/init.lua\
							 lua/indent-blankline-config/init.lua\
							 lua/lspconfig-config/init.lua\
							 lua/lualine-config/init.lua\
							 lua/lualine-config/styles/simple.lua\
							 lua/lualine-config/themes/base16.lua\
							 lua/nvim-cmp-config/init.lua\
							 lua/nvim-dap-virtual-text/init.lua\
							 lua/nvim-tree-config/init.lua\
							 lua/nvim-tree-config/keymaps.lua\
							 lua/nvim-treesitter-config/init.lua\
							 lua/tagbar-config/init.lua\
							 lua/tagbar-config/keymaps.lua\
							 lua/telescope-config/init.lua\
							 lua/telescope-config/keymaps.lua\
							 lua/toggleterm-config/init.lua\
							 lua/toggleterm-config/keymaps.lua\
							 lua/which-key-config/init.lua\
							 lua/which-key-config/options.lua
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
