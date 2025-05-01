username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 init.lua\
							 lua/keymaps.lua\
							 lua/options.lua\
							 lua/variables.lua\
							 lua/commands.lua\
							 lua/plugins/vim-startify.lua\
							 lua/plugins/base16-nvim.lua\
							 lua/plugins/lualine/init.lua\
							 lua/plugins/lualine/styles/simple.lua\
							 lua/plugins/lualine/themes/base16.lua\
							 lua/plugins/indent-blankline.lua\
							 lua/plugins/comment.lua\
							 lua/plugins/which-key.lua\
							 lua/plugins/nvim-window-picker.lua\
							 lua/plugins/telescope.lua\
							 lua/plugins/tagbar.lua\
							 lua/plugins/git.lua\
							 lua/plugins/nvim-autopairs.lua\
							 lua/plugins/toggleterm.lua\
							 lua/plugins/neo-tree.lua\
							 lua/plugins/nvim-treesitter.lua\
							 lua/plugins/nvim-treesitter-cpp-tools.lua\
							 lua/plugins/markdown-preview.lua\
							 lua/plugins/vim-latex-live-preview.lua\
							 lua/plugins/vim-askpass.lua\
							 lua/plugins/lsp/init.lua\
							 lua/plugins/lsp/scan-servers.lua\
							 lua/plugins/lsp/lsp-servers/bash-language-server.lua\
							 lua/plugins/lsp/lsp-servers/clangd.lua\
							 lua/plugins/lsp/lsp-servers/lua-language-server.lua\
							 lua/plugins/lsp/lsp-servers/pyright.lua\
							 lua/plugins/lsp/lsp-servers/texlab.lua\
							 lua/plugins/dap/init.lua\
							 lua/plugins/dap/scan-adapters.lua\
							 lua/plugins/dap/dap-adapters/codelldb.lua\
							 lua/plugins/dap/dap-adapters/debugpy.lua
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
