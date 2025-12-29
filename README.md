# dots

dotfiles for void linux. programs configured via source code and compilation are in `builds/` directory.

### info

home dots
- zsh and xinit rc files are symlinked to `$HOME` and renamed
    - `ln -s ~/dots/zshrc ~/.zshrc`
    - `ln -s ~/dots/xinitrc ~/.xinitrc`

ctwm & fvwm
- rc files in `~/.config/wal/templates/`
- they're generated on pywal wallpaper change (`wal --cols16 -i /path/to/image.png`) and populated in `~/.cache/wal/`
- need to be symlinked with the correct name & location like:
    - `ln -s ~/.cache/wal/colors.ctwmrc ~/.ctwmrc`

wal
- other files generated from wal templates need to be symlinked from `~/.cache/wal` to wherever they need to be

builds
- suckless stuff etc
- patches are kept in the patches subdir of each repo
    - they're not always applied and sometimes i altered them after they were applied
