this patch was almost the death of me but totally worth it

hunk in st.c:
```c
diff --git a/st.c b/st.c
index f43cfd3..baa2bed 100644
--- a/st.c
+++ b/st.c
@@ -1214,6 +1214,9 @@ tsetchar(Rune u, const Glyph *attr, int x, int y)
 	term.dirty[y] = 1;
 	term.line[y][x] = *attr;
 	term.line[y][x].u = u;
+
+	if (isboxdraw(u))
+		term.line[y][x].mode |= ATTR_BOXDRAW;
 }
 
 void
```
should actually be:
```c
 	term.dirty[y] = 1;
 	term.line[y] = *attr;
 	term.line[y].u = u;
+
+	if (isboxdraw(u))
+		line[x].mode |= ATTR_BOXDRAW;
```

```
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
```
should be:
```
int xmakeglyphfontspecs(...)
(line 1436)
for (code_idx = 0; code_idx < shaped.count; code_idx++) {
    int idx = shaped.glyphs[code_idx].cluster;

// -- snip --

    if (shaped.glyphs[code_idx].codepoint != 0) {
        int i = shaped.glyphs[code_idx].cluster;
        specs[numspecs].font = font->match;

    if (glyphs[i].mode & ATTR_BOXDRAW) {
        glyphidx = boxdrawindex(&glyphs[i]);
    } else {
        glyphidx = shaped.glyphs[code_idx].codepoint;
    }

        specs[numspecs].glyph = glyphidx;
 }
```

