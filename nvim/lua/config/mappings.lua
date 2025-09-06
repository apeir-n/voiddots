local function map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

--leader
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = ","

map("n", "q", "<Nop>")
map("n", "@", "<Nop>")

--tabs&windows
map("n", "L", ":tabnext<CR>")
map("n", "H", ":tabprev<CR>")
map("n", "X", ":tabclose<CR>")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-S-k>", ":resize +2<CR>")
map("n", "<C-S-j>", ":resize -2<CR>")
map("n", "<C-S-l>", ":vertical resize +2<CR>")
map("n", "<C-S-h>", ":vertical resize -2<CR>")
map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])

map("n", "<leader>t", ":Telescope<CR>")
map("n", "<leader>fz", ":lua require('fzf-lua').files()<CR>") --find_cwd
map("n", "<leader>f~", ":lua require('fzf-lua').files({ cwd = '~/' })<CR>") --find_home
map("n", "<leader>f.", ":lua require('fzf-lua').files({ cwd = '~/.config' })<CR>") --find_.config
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>fc", ":Telescope commands<CR>")
map("n", "<leader>fy", ":Telescope registers<CR>")
map("n", "<leader>fr", ":Telescope oldfiles<CR>")
map("n", "<leader>fm", ":Telescope man_pages<CR>")
map("n", "<leader>y", ":Yazi<CR>")
map("n", "<leader>c", ":Themery<CR>")
map("n", "<leader>p", ":PlugInstall<CR>")
map("n", "<leader>x", "<cad>!chmod +x %<CR>")
map("n", "<leader>r", ":so %<CR>")
map("n", "<leader>u", ':silent !xdg-open "<cWORD>" &<CR>')
map("n", "<leader>w", ":set wrap!<CR>")
map("n", "<leader>,", "q") --recmacro
map("n", "<leader>.", "@") --playmacro
map("n", "<leader>lr", vim.lsp.buf.rename)
map("n", "<leader>la", vim.lsp.buf.code_action)
map("n", "<leader>ld", vim.lsp.buf.definition)
map("n", "<leader>li", vim.lsp.buf.implementation)
map("n", "<leader>lh", vim.lsp.buf.hover)
map("n", "<leader>ls", vim.lsp.buf.signature_help)
map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end) --anonymous function to wrap arguments passed into formatter
map("n", "<leader>le", vim.diagnostic.open_float)
map("n", "<leader>lq", vim.diagnostic.setloclist)
map("n", "<leader>l[", vim.diagnostic.goto_prev)
map("n", "<leader>l]", vim.diagnostic.goto_next)
map("n", "<localleader>m", ":RenderMarkdown toggle<CR>")
map("v", "<", "<gv")
map("v", ">", ">gv")

local snuggles = require("config.snuggles")

vim.keymap.set("n", "<leader>d", snuggles.ShowSnuggle, {
    desc = "Snuggle Message 💖",
})

--- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
--- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
--- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
