ctwm
- rc file in `wal/templates/colors.ctwmrc`
- it's generated on pywal wallpaper change and placed in `~/.cache/wal/colors.ctwmrc`
- needs to be symlinked to home with new name like:
    - `ln -s ~/.cache/wal/colors.ctwmrc ~/.ctwmrc`

home dots
- zsh and xinit rc files are renamed in their symlinks
    - `ln -s ~/dots/zshrc ~/.zshrc`
    - `ln -s ~/dots/xinitrc ~/.xinitrc`

wal
- files generated from wal templates need to be symlinked from `~/.cache/wal` to wherever they need to be
