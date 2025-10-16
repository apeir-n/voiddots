- wants to add another int to xdrawglyphfontspecs for 4 total, but there's already 4
    - look for patch that added that

- patch expects:
```c
-     xdrawglyphfontspecs(const XftGlyphFontSpec *specs, Glyph base, int len, int x, int y)
+     xdrawglyphfontspecs(const XftGlyphFontSpec *specs, Glyph base, int len, int x, int y, int dmode)
```
- what's there (charlen):
```c
      xdrawglyphfontspecs(const XftGlyphFontSpec *specs, Glyph base, int len, int x, int y, int charlen)
```

- patch expects:
```c
-	xdrawglyphfontspecs(&spec, g, numspecs, x, y);
+	xdrawglyphfontspecs(&spec, g, numspecs, x, y, DRAW_BG | DRAW_FG);
```
- whats there:
```c
	xdrawglyphfontspecs(specs, g, numspecs, x, y, (g.mode & ATTR_WIDE) ? 2 : 1);
```

- patch wants to delete this at the beginning of func:
```c
-	numspecs = xmakeglyphfontspecs(specs, &line[x1], x2 - x1, x1, y1);
```
- but i found this towards the end:
```c
      numspecs = xmakeglyphfontspecs(specs, &line[ox], x2 - ox, ox, y1);
```



