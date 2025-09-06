local cinnamon = require("cinnamon")

cinnamon.setup {
    keymaps = {
        basic = true,
        extra = true,
    },
    options = {
        mode = "cursor",
        delay = 5,
        max_delta = {
            time = 400,
        },
    },
}

vim.keymap.set("n", "zh", function()
    cinnamon.scroll("zH")
end, { noremap = true, silent = true, desc = "screen_slideL" })

vim.keymap.set("n", "zl", function()
    cinnamon.scroll("zL")
end, { noremap = true, silent = true, desc = "screen_slideR" })

vim.keymap.set("", "gh", function()
    cinnamon.scroll("0")
end, { noremap = true, silent = true, desc = "cursor_sol" })

vim.keymap.set("", "gl", function()
    cinnamon.scroll("$")
end, { noremap = true, silent = true, desc = "cursor_eol" })
