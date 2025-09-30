###!! DOESN'T WORK !!!!!!!!!!!!

username := $(SUDO_USER)
userhome := $(shell echo ~$(username))

src_config_dir := config
dst_config_dir := $(userhome)/.config/nvim
config_files :=\
	$(shell find $(src_config_dir) -type f -not -path '$(src_config_dir)'\
	| sed 's/^$(src_config_dir)\///g'\
	| sort)
dst_config_files := $(addprefix $(dst_config_dir)/,$(config_files))

.PHONY: test, all, install, uninstall

all:

test:
	echo $(dst_config_files)

install: $(dst_config_files)

.SECONDEXPANSION:
$(dst_config_files): $$(subst $$(dst_config_dir),$$(src_config_dir),$$@)
	su $(username) --preserve-environment --command="\
		git submodule --quiet foreach\
		git clone $$(git remote get-url origin) $(dst_config_dir)"

uninstall:
	rm -rf $(dst_config_dir)
