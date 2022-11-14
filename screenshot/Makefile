username := $(SUDO_USER)
userhome := $(shell echo ~$(username))/

bin_files := screenshot
src_bin_dir := bin/
dst_bin_dir := $(userhome).local/bin/
dst_bin_files := $(addprefix $(dst_bin_dir),$(bin_files))

.PHONY: all, install, uninstall

all:

install: $(dst_bin_files)

.SECONDEXPANSION:
$(dst_bin_files): $$(subst $$(dst_bin_dir),$$(src_bin_dir),$$@)
	su $(username) --command="\
		install --owner=$(username) --group=$(username) --mode=755 -D $< $@"

uninstall:
	rm -rf $(dst_bin_files)
