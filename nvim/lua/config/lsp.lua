vim.lsp.enable({
    'clangd',
    'lua_ls',
    'rust_analyzer',
})

----i think i prefer c-x c-o to get the menu
--vim.api.nvim_create_autocmd('LspAttach', {
--    callback = function(ev)
--        local client = vim.lsp.get_client_by_id(ev.data.client_id)
--        if client:supports_method('textDocument/completion') then
--            vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
--            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
--            vim.keymap.set('i', '<C-Space>', function()
--                vim.lsp.completion.get()
--            end)
--        end
--    end,
--})

--[[ vim.diagnostic.config({
    virtual_lines = {
        current_line = true,
    },
}) ]]

---- from the old mason.lua file
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
