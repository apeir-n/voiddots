config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:136.0) Gecko/20100101 Firefox/136.0', 'https://accounts.google.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/ch_rism_/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/ch_rism_/.local/share/qutebrowser/userscripts/*')

import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], capture_output=True, check=True, text=True)
    lines = x.stdout.split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props

xresources = read_xresources("*")

c.colors.statusbar.normal.bg = xresources["*.background"]
c.colors.statusbar.normal.fg = xresources["*.foreground"]
c.colors.statusbar.command.bg = xresources["*.background"]
c.colors.statusbar.command.fg = xresources["*.foreground"]
c.colors.statusbar.insert.bg = xresources["*.color9"]
c.colors.statusbar.insert.fg = xresources["*.color0"]
c.colors.statusbar.caret.bg = xresources["*.color12"]
c.colors.statusbar.caret.fg = xresources["*.color0"]
c.colors.statusbar.caret.selection.bg = xresources["*.color12"]
c.colors.statusbar.caret.selection.fg = xresources["*.color0"]
c.colors.statusbar.passthrough.bg = xresources["*.color14"]
c.colors.statusbar.passthrough.fg = xresources["*.color0"]
c.colors.statusbar.url.fg = xresources["*.color13"]
c.colors.statusbar.url.success.https.fg = xresources["*.color13"]
c.colors.statusbar.url.hover.fg = xresources["*.color12"]
c.colors.tabs.even.bg = xresources["*.color0"]
c.colors.tabs.odd.bg = xresources["*.color0"]
c.colors.tabs.even.fg = xresources["*.color7"]
c.colors.tabs.odd.fg = xresources["*.color7"]
c.colors.tabs.selected.even.bg = xresources["*.color8"]
c.colors.tabs.selected.odd.bg = xresources["*.color8"]
c.colors.tabs.selected.even.fg = xresources["*.color15"]
c.colors.tabs.selected.odd.fg = xresources["*.color15"]
c.colors.hints.bg = xresources["*.color8"]
c.colors.hints.fg = xresources["*.color7"]
c.colors.completion.item.selected.match.fg = xresources["*.color6"]
c.colors.completion.match.fg = xresources["*.color6"]
c.colors.completion.odd.bg = xresources["*.background"]
c.colors.completion.even.bg = xresources["*.background"]
c.colors.completion.fg = xresources["*.foreground"]
c.colors.completion.category.bg = xresources["*.background"]
c.colors.completion.category.fg = xresources["*.foreground"]
c.colors.completion.item.selected.bg = xresources["*.foreground"]
c.colors.completion.item.selected.fg = xresources["*.background"]
c.colors.completion.item.selected.border.bottom = xresources["*.background"]
c.colors.completion.item.selected.border.top = xresources["*.background"]
c.colors.completion.scrollbar.bg = xresources["*.background"]
c.colors.completion.scrollbar.fg = xresources["*.foreground"]
c.colors.contextmenu.menu.bg = xresources["*.color15"]
c.colors.contextmenu.menu.fg = xresources["*.color0"]
c.colors.contextmenu.selected.bg = xresources["*.background"]
c.colors.contextmenu.selected.fg = xresources["*.foreground"]
c.colors.prompts.bg = xresources["*.color15"]
c.colors.prompts.fg = xresources["*.color0"]
c.colors.prompts.border = xresources["*.color10"]
c.colors.prompts.selected.bg = xresources["*.background"]
c.colors.prompts.selected.fg = xresources["*.foreground"]
c.colors.tabs.indicator.start = xresources["*.color10"]
c.colors.tabs.indicator.stop = xresources["*.color8"]
c.colors.messages.info.bg = xresources["*.color10"]
c.colors.messages.info.fg = xresources["*.color0"]
c.colors.messages.info.border = xresources["*.color7"]
c.colors.messages.error.bg = xresources["*.color11"]
c.colors.messages.error.fg = xresources["*.color0"]
c.colors.messages.error.border = xresources["*.color7"]
c.colors.messages.warning.bg = xresources["*.color12"]
c.colors.messages.warning.fg = xresources["*.color0"]
c.colors.messages.warning.border = xresources["*.color7"]
c.colors.downloads.error.bg = xresources["*.background"]
c.colors.downloads.error.fg = xresources["*.foreground"]
c.colors.downloads.bar.bg = xresources["*.background"]
c.colors.downloads.start.bg = xresources["*.color10"]
c.colors.downloads.start.fg = xresources["*.foreground"]
c.colors.downloads.stop.bg = xresources["*.color8"]
c.colors.downloads.stop.fg = xresources["*.foreground"]
c.colors.tooltip.bg = xresources["*.background"]
c.colors.webpage.bg = xresources["*.background"]
c.hints.border = xresources["*.foreground"]

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']
c.auto_save.session = True

# keybinds
config.unbind("d", mode="normal")
config.unbind("J", mode="normal")
config.unbind("K", mode="normal")
config.bind("pp", "open -- {clipboard}")
config.bind("pt", "open -t -- {clipboard}")
#config.bind("<ctrl-y>:, "spawn --userscript ytdl.sh")
config.bind("X", "tab-close")
config.bind("H", "tab-prev")
config.bind("L", "tab-next")
config.bind("]", "tab-prev")
config.bind("[", "tab-next")
config.bind("}", "tab-move +")
config.bind("{", "tab-move -")
config.bind("t", "open --t")
config.bind("<", "back")
config.bind(">", "forward")
config.bind("=", "zoom-in")
config.bind("-", "zoom-out")
config.bind("\\", "zoom") # escaped \
config.bind("cs", "config-source")
config.bind("<alt-h>", "history")
config.bind("<alt-a>", "config-cycle tabs.show multiple never")
config.bind("<alt-x>", "config-cycle statusbar.show always never")
config.bind("<alt-z>", "config-cycle tabs.show multiple never;; config-cycle statusbar.show always never")
config.bind("<alt-j>", "completion-item-focus next", mode="command")
config.bind("<alt-k>", "completion-item-focus prev", mode="command")

# customize
c.tabs.show = "multiple"
c.tabs.padding = {"top": 3, "bottom": 3, "left": 6, "right": 6}
c.tabs.indicator.width = 0 # no tab indicators
c.tabs.position = "top"
c.tabs.title.format = "{audio}{current_title}"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
config.set("url.default_page", "~/.config/qutebrowser/etc/home.html")
config.set("url.start_pages", "~/.config/qutebrowser/etc/home.html")
#config.set("content.user_stylesheets", "~/.config/qutebrowser/styles/qute.css")

# fonts
c.fonts.default_family = ["JetBrainsMono Nerd Font"]
c.fonts.default_size = "10pt"
c.fonts.web.family.fixed = "JetBrainsMono Nerd Font"
c.fonts.web.family.sans_serif = "JetBrainsMono Nerd Font"
c.fonts.web.family.serif = "JetBrainsMono Nerd Font"
c.fonts.web.family.standard = "JetBrainsMono Nerd Font"
c.fonts.web.size.default = 14
c.fonts.contextmenu = "JetBrainsMono Nerd Font"
c.fonts.prompts = "JetBrainsMono Nerd Font"

# privacy
# config.set("completion.cmd_history_max_items", 0)
# config.set("content.private_browsing", True)
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)
# config.set("content.javascript.enabled", False)

c.content.blocking.enabled = True
# c.content.blocking.method = 'adblock' # uncomment this if you install python-adblock
c.content.blocking.adblock.lists = [
        "https://github.com/ewpratten/youtube_ad_blocklist/blob/master/blocklist.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/legacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2020.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2021.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2022.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2023.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/filters-2024.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badware.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/privacy.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-cookies.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/annoyances-others.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/badlists.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/quick-fixes.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/resource-abuse.txt",
        "https://github.com/uBlockOrigin/uAssets/raw/master/filters/unbreak.txt"
]
