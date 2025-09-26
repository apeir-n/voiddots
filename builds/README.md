# builds

these items are programs that need to be built from source, i.e. suckless stuff. in fact, they're all suckless except for herbe, which is basically suckless.

patches will be located in a `patches/` subdir.

### programs

dmenu
- changed the date patch

dwm
- deleted the stuff i didn't need from `vanitygaps.c`

dwmblocks

herbe
- the freebsd patch is not applied, just there for when i need it on freebsd
- all of the settings can be altered at runtime because of the xrdb patch
    - the variables are called in `~/.Xresources` like:

```
herbe.background_color:
herbe.border_color:
herbe.font_color:
herbe.font_pattern:
herbe.line_spacing:
herbe.padding:
herbe.width:
herbe.border_size:
herbe.pos_x:
herbe.pos_y:
herbe.corner:
herbe.duration:
```

nsxiv

st

surf

tabbed
