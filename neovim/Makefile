username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 init.lua\
							 lua/utils.lua\
							 lua/keymaps.lua\
							 lua/options.lua\
							 lua/variables.lua\
							 lua/commands.lua\
							 lua/plugins/vim-startify.lua\
							 lua/plugins/base16-nvim.lua\
							 lua/plugins/lualine.lua\
							 lua/plugins/lualine-config/styles/simple.lua\
							 lua/plugins/lualine-config/themes/base16.lua\
							 lua/plugins/indent-blankline.lua\
							 lua/plugins/comment.lua\
							 lua/plugins/which-key.lua\
							 lua/plugins/telescope.lua\
							 lua/plugins/tagbar.lua\
							 lua/plugins/git.lua\
							 lua/plugins/vim-sleuth.lua\
							 lua/plugins/nvim-autopairs.lua\
							 lua/plugins/toggleterm.lua\
							 lua/plugins/neo-tree.lua\
							 lua/plugins/nvim-treesitter.lua\
							 lua/plugins/markdown-preview.lua\
							 lua/plugins/vim-latex-live-preview.lua\
							 lua/plugins/lsp.lua\
							 lua/plugins/dap.lua
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
