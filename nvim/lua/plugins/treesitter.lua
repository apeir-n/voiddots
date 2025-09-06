require'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "c", "css", "cpp", "go", "html", "java", "javascript", "json", "lua", "markdown", "markdown_inline", "python", "rust", "ron", "tsx", "typescript", "haskell", "supercollider" },
    highlight = {
        enable = false,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
    },
}

require('nvim-treesitter.parsers').get_parser_configs().supercollider = {
  filetype = "supercollider",
}
