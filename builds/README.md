# builds

these items are programs that need to be built from source, i.e. suckless stuff. in fact, they're all suckless except for herbe, which is basically suckless.

all the patches i used will be located in a `patches/` subdir in each directory. i keep the patches around for reference and stuff. if i changed one of the patches, i'll describe the changes from the .diff files and denote the deletions with `X` and my additions with `O` (so it's not confused with the normal `+ -` notation in .diff files)

### programs

dmenu
- patches:
    - center - center it on the screen
    - border - lets you ad a border in pixels with `-bw` flag
    - date - adds a `strftime()` line to the bottom of the menu, more below
    - xresources
- i changed the date patch because dmenu interprets the date line as an actual line
    - so if i had a file with 10 lines and i listed it with `cat file | dmenu -l 10`, it would only show 9 lines plus the date, and youd have to scroll to get to the 10th item
    - i basically just added an extra line in the math that draws the menu
- here are the sections from the .diff file and my changes:
```
@@ -84,7 +84,7 @@ calcoffsets(void)
 	int i, n;
 
 	if (lines > 0)
-		n = lines * bh;             <- original
+		n = (lines * bh) - 1;       <- patched
>		n = lines * bh;             <- my changes (just reverted it)
 	else
 		n = mw - (promptw + inputw + TEXTW("<") + TEXTW(">"));
 	/* calculate which items will begin the next page and previous page */
```

```
@@ -172,6 +188,8 @@ drawmenu(void)
 		/* draw vertical list */
 		for (item = curr; item != next; item = item->right)
 			drawitem(item, x, y += bh, mw - x);
+
+        drawdate(x, lines * bh, w);        <- patched
>        drawdate(x, (lines + 1) * bh, w);  <- my changes
 	} else if (matches) {
 		/* draw horizontal list */
 		x += inputw;
```

```
this one was in the original source code and not the patch
in setup(void) in dmenu.c, line 675 in my build

	utf8 = XInternAtom(dpy, "UTF8_STRING", False);

	/* calculate menu geometry */
	bh = drw->fonts->h + 2;
	lines = MAX(lines, 0);
x	mh = (lines + 1) * bh;      <- original
>	mh = (lines + 2) * bh;      <- my changes (just added another line)
	promptw = (prompt && *prompt) ? TEXTW(prompt) - lrpad / 4 : 0;
#ifdef XINERAMA
```

dwm
- deleted the stuff i didn't need from `vanitygaps.c`
- focusdir patch instead of normal window cycling

dwmblocks

herbe
- a notification program that runs only on call, if you're unfamiliar
    - doesn't use dbus or a daemon at all
    - _very_ tiny
    - basically only useful for scripting notifications manually
    - more suitable for people who already like to do everything with scripts and prefer to not use daemons if possible
    - i fucking love this thing
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
- patches:
    - boxdraw
        - this ones weird, i had to make some significant changes
        - i'm not sure if its because the patch is out of date or my build is too modified
        - will explain below
- changes:
```
the patch assumed that there was a line field in the term struct
so it was trying to access it with term.line[y][x], but my file's code
only had it written as line[x]. so i only had to change it to line[x].mode
in the patch's addition.

diff --git a/st.c b/st.c
index f43cfd3..baa2bed 100644
--- a/st.c
+++ b/st.c
@@ -1214,6 +1214,9 @@ tsetchar(Rune u, const Glyph *attr, int x, int y)
 	term.dirty[y] = 1;
x	term.line[y][x] = *attr;        <- patch
x	term.line[y][x].u = u;          <- '''
> 	line[x] = *attr;                <- how it should be
> 	line[x].u = u;                  <- '''

+
+	if (isboxdraw(u))
+		term.line[y][x].mode |= ATTR_BOXDRAW;   <- patch
>		line[x].mode |= ATTR_BOXDRAW;           <- my changes
 }
 
 void
```

```
i don't really know where the patch wanted to put this hunk, literally the only
clue i got was from the i in `glyphidx = boxdrawindex(&glyphs[i]);`, which told me
it probably belonged in some iterator. there's one main for loop in this function
but it doesn't iterate with i, but i stuck it in there anyway

this is what the patch wanted to do:

-------------------------------------------------------------------------------------------------
diff --git a/x.c b/x.c
index 2a3bd38..bf6bbf9 100644
--- a/x.c
+++ b/x.c
@@ -1283,8 +1285,13 @@ xmakeglyphfontspecs(XftGlyphFontSpec *specs, const Glyph *glyphs, int len, int x
 			yp = winy + font->ascent;
 		}
 
-		/* Lookup character index with default font. */
-		glyphidx = XftCharIndex(xw.dpy, font->match, rune);
+		if (mode & ATTR_BOXDRAW) {
+			/* minor shoehorning: boxdraw uses only this ushort */
+			glyphidx = boxdrawindex(&glyphs[i]);
+		} else {
+			/* Lookup character index with default font. */
+			glyphidx = XftCharIndex(xw.dpy, font->match, rune);
+		}
 		if (glyphidx) {
 			specs[numspecs].font = font->match;
 			specs[numspecs].glyph = glyphidx;
-------------------------------------------------------------------------------------------------

but this is what i did instead, in the for loop beginning at line 1436 in my build:

-------------------------------------------------------------------------------------------------
for (code_idx = 0; code_idx < shaped.count; code_idx++) {
    int idx = shaped.glyphs[code_idx].cluster;

    if (glyphs[idx].mode & ATTR_WDUMMY)
        continue;

    /* Advance the drawing cursor if we've moved to a new cluster */
    if (code_idx > 0 && idx != shaped.glyphs[code_idx - 1].cluster) {
        xp += runewidth;
        cluster_xp = xp;
        cluster_yp = yp;
    }

>   if (shaped.glyphs[code_idx].codepoint != 0) {
>       int i = shaped.glyphs[code_idx].cluster;
>       /* If symbol is found, put it into the specs. */
>       specs[numspecs].font = font->match;

>   if (glyphs[i].mode & ATTR_BOXDRAW) {
>       glyphidx = boxdrawindex(&glyphs[i]);
>   } else {
>       glyphidx = shaped.glyphs[code_idx].codepoint;
>   }

>       specs[numspecs].glyph = glyphidx;
-------------------------------------------------------------------------------------------------
```

surf

tabbed
