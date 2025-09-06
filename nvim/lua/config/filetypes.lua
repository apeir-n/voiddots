vim.filetype.add({
    extension = {
        crinkle = "lua",
        genexpr = "genexpr",
        scpt = "applescript",
        maxstx = "json",
        maxtheme = "json",
    },
})

vim.treesitter.language.register('genexpr', 'genexpr')
require("nvim-treesitter.parsers").get_parser_configs().genexpr = {}
