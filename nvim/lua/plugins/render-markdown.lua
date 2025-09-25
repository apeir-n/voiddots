require("render-markdown").setup({
    render_modes = true,
    bullet = { icons = {'•', '◦'} },
    checkbox = {
        unchecked = {
            icon = ' ',
            highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
            icon = ' ',
            highlight = 'RenderMarkdownChecked',
        },
        custom = {
            postpone = {
                raw = "[>]",
                rendered = " ",
                highlight = "RenderMarkdownInfo",
            },
            todo = {
                raw = "[/]",
                rendered = " ",
                highlight = "RenderMarkdownWarn",
            },
            cancelled = {
                raw = "[-]",
                rendered = " ",
                highlight = "RenderMarkdownError",
            },
            question = {
                raw = "[?]",
                rendered = " ",
                highlight = "RenderMarkdownH1",
            },
            important = {
                raw = "[!]",
                rendered = " ",
                highlight = "RenderMarkdownSuccess",
            },
            idea = { --󰌵   
                raw = "[I]",
                rendered = "󰌵 ",
                highlight = "RenderMarkdownHint",
            },
            fire = {
                raw = "[f]",
                rendered = " ",
                highlight = "RenderMarkdownError",
            },
            quote = {
                raw = '["]',
                rendered = " ",
                highlight = "RenderMarkdownSuccess",
            },
            pro = {
                raw = "[p]",
                rendered = " ",
                highlight = "RenderMarkdownHint",
            },
            con = {
                raw = "[c]",
                rendered = " ",
                highlight = "RenderMarkdownError",
            },
            schedule = {
                raw = "[<]",
                rendered = " ",
                highlight = "RenderMarkdownH1",
            },
            laptop = {
                raw = "[l]",
                rendered = " ",
                highlight = "RenderMarkdownH4",
            },
            star = {
                raw = "[*]",
                rendered = " ",
                highlight = "RenderMarkdownH5",
            },
        },
    },
    code = {
        width = 'block',
        min_width = 45,
        left_pad = 2,
        right_pad = 2,
        language_pad = 2,
        border = 'thick',
        sign = false,
        highlight = 'RenderMarkdownCode',
        highlight_fallback = 'RenderMarkdownCodeFallback',
    },
    link = {
        image = ' ',
        email = ' ',
        hyperlink = ' ',
        highlight = 'RenderMarkdownH1',
        wiki = {
            icon = ' ',
            body = function()
                return nil
            end,
            highlight = 'RenderMarkdownSuccess',
        },
    },
})

--RenderMarkdownH1
--RenderMarkdownH2
--RenderMarkdownH3
--RenderMarkdownH4
--RenderMarkdownH5
--RenderMarkdownH6
--RenderMarkdownSuccess
--RenderMarkdownInfo
--RenderMarkdownHint
--RenderMarkdownWarn
--RenderMarkdownError
