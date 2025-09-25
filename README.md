_most of my main tools are configured via source code_
- _dwm, dmenu, herbe, nsxiv, etc_
_need to figure out a good way to push them to remote repo_
_i'd rather not make a repo for each directory, but theyre already all initialized as local git repos_

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
