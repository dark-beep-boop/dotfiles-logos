username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

config_files :=\
							 init.lua\
							 coc-settings.json\
							 lua/keybindings.lua\
							 lua/options.lua\
							 lua/plugins.lua\
							 lua/variables.lua\
							 lua/coc-config/init.lua\
							 lua/lualine-config/init.lua\
							 lua/lualine-config/themes/base16.lua\
							 lua/lualine-config/styles/simple.lua\
							 lua/neotest-config/init.lua\
							 lua/autopairs-config/init.lua\
							 lua/dap-config/init.lua\
							 lua/dap-ui-config/init.lua\
							 lua/dap-virtual-text-config/init.lua\
							 lua/tree-config/init.lua\
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
