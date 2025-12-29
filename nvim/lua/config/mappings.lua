local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

--leader
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

--fuck q @ nigga
map('n', 'q', '<Nop>')
map('n', '@', '<Nop>')

--tabs&windows
map('n', 'L', ':tabnext<CR>')
map('n', 'H', ':tabprev<CR>')
map('n', 'X', ':tabclose<CR>')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-S-k>', ':resize +2<CR>')
map('n', '<C-S-j>', ':resize -2<CR>')
map('n', '<C-S-l>', ':vertical resize +2<CR>')
map('n', '<C-S-h>', ':vertical resize -2<CR>')
map('t', '<C-h>', [[<C-\><C-n><C-w>h]])
map('t', '<C-j>', [[<C-\><C-n><C-w>j]])
map('t', '<C-k>', [[<C-\><C-n><C-w>k]])
map('t', '<C-l>', [[<C-\><C-n><C-w>l]])

map('n', '<leader>t', ':Telescope<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')
map('n', '<leader>fc', ':Telescope commands<CR>')
map('n', '<leader>fr', ':Telescope registers<CR>')
map('n', '<leader>fo', ':Telescope oldfiles<CR>')
map('n', '<leader>fm', ':Telescope man_pages<CR>')
map('n', '<leader>fn', ':Telescope notify<CR>')
map('n', '<leader>y', ':Yazi<CR>')
map('n', '<leader>c', ':Themery<CR>')
map('n', '<leader>pi', ':PlugInstall<CR>')
map('n', '<leader>pu', ':PlugUpdate<CR>')
map('n', '<leader>pc', ':PlugClean<CR>')
map('n', '<leader>r', ':so %<CR>')
map('n', '<leader>u', ':silent !xdg-open "<cWORD>" &<CR>')
map('n', '<leader>w', ':set wrap!<CR>')
map('n', '<leader>,', 'q') --recmacro
map('n', '<leader>.', '@') --playmacro
map('n', '<leader>lr', vim.lsp.buf.rename)
map('n', '<leader>la', vim.lsp.buf.code_action)
map('n', '<leader>ld', vim.lsp.buf.definition)
map('n', '<leader>li', vim.lsp.buf.implementation)
map('n', '<leader>lh', vim.lsp.buf.hover)
map('n', '<leader>ls', vim.lsp.buf.signature_help)
map('n', '<leader>lf', function() vim.lsp.buf.format({ async = true }) end) --anonymous function to wrap arguments passed into formatter
map('n', '<leader>le', vim.diagnostic.open_float)
map('n', '<leader>lq', vim.diagnostic.setloclist)
map('n', '<leader>l[', vim.diagnostic.goto_prev)
map('n', '<leader>l]', vim.diagnostic.goto_next)
map('n', '<leader>nm', ':Neominimap Toggle<CR>')
map('n', '<leader>nr', ':Neominimap Refresh<CR>')
map('n', '<leader>nf', ':Neominimap ToggleFocus<CR>')
map('n', '<leader>ar', ':CellularAutomaton make_it_rain<CR>')
map('n', '<leader>al', ':CellularAutomaton game_of_life<CR>')
map('n', '<localleader>m', ':RenderMarkdown toggle<CR>')
map('v', '<', '<gv')
map('v', '>', '>gv')
map('n', 'zh', 'zH')
map('n', 'zl', 'zL')
map('', 'gh', '0')
map('', 'gl', '$')

local snuggles = require('config.snuggles')
vim.keymap.set('n', '<leader>d', snuggles.ShowSnuggle, { desc = 'Snuggle Message 💖', })

local diagnostic_toggle = false
vim.keymap.set('n', '<leader>v', function ()
    diagnostic_toggle = not diagnostic_toggle
    vim.diagnostic.config({
        virtual_lines = {
            current_line = diagnostic_toggle,
        },
    })
    print('virtual lines ' .. (diagnostic_toggle and 'on' or 'off'))
end, { desc = 'toggle virutal line diagnostics' }
)

--vim.keymap.set("n", "zh", function()
--    cinnamon.scroll("zH")
--end, { noremap = true, silent = true, desc = "screen_slideL" })
--
--vim.keymap.set("n", "zl", function()
--    cinnamon.scroll("zL")
--end, { noremap = true, silent = true, desc = "screen_slideR" })
--
--vim.keymap.set("", "gh", function()
--    cinnamon.scroll("0")
--end, { noremap = true, silent = true, desc = "cursor_sol" })
--
--vim.keymap.set("", "gl", function()
--    cinnamon.scroll("$")
--end, { noremap = true, silent = true, desc = "cursor_eol" })
--
--    grn in Normal mode maps to vim.lsp.buf.rename()
--    grr in Normal mode maps to vim.lsp.buf.references()
--    gri in Normal mode maps to vim.lsp.buf.implementation()
--    gO in Normal mode maps to vim.lsp.buf.document_symbol() (this is analogous to the gO mappings in help buffers and :Man page buffers to show a “table of contents”)
--    gra in Normal and Visual mode maps to vim.lsp.buf.code_action()
--    CTRL-S in Insert and Select mode maps to vim.lsp.buf.signature_help()
--    [d and ]d move between diagnostics in the current buffer ([D jumps to the first diagnostic, ]D jumps to the last)
--
--We’ve also included versions of some of the mappings from Tim Pope’s vim-unimpaired:
--
--    [q, ]q, [Q, ]Q, [CTRL-Q, ]CTRL-Q navigate through the quickfix list
--    [l, ]l, [L, ]L, [CTRL-L, ]CTRL-L navigate through the location list
--    [t, ]t, [T, ]T, [CTRL-T, ]CTRL-T navigate through the tag matchlist
--    [a, ]a, [A, ]A navigate through the argument list
--    [b, ]b, [B, ]B navigate through the buffer list
--    [<Space>, ]<Space> add an empty line above and below the cursor
