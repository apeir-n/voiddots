local mason_lspconfig = require("mason-lspconfig")

require("mason").setup()

mason_lspconfig.setup({
    ensure_installed = {
        "rust_analyzer",
        "lua_ls",
    },
    automatic_installation = true,
})

--vim.lsp.config().rust_analyzer.setup({
--    settings = {
--        ["rust-analyzer"] = {
--            cargo = { allFeatures = true },
--            checkOnSave = { command = "clippy" },
--        },
--    },
--})
--
--vim.lsp.config().clangd.setup({})
--
--vim.lsp.config().lua_ls.setup({
--    settings = {
--        Lua = {
--            diagnostics = { globals = { "vim" } },
--        },
--    },
--})
