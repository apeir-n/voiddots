local options = {
    laststatus = 3,
    ruler = false,
    showmode = false,
    showcmd = false,
    cmdheight = 0,
    wrap = false,
    linebreak = true,
    mouse = "a",
    clipboard = "unnamedplus",
    history = 100,
    swapfile = false,
    backup = false,
    undofile = true,
    cursorline = true,
    ttyfast = true,
    smoothscroll = true,
    title = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    autoindent = true,
    tabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    foldmethod = "expr",
    foldlevel = 99,
    foldexpr = "nvim_treesitter#foldexpr()",
    termguicolors = true,
    ignorecase = true,
    smartcase = true,
    conceallevel = 0,
    concealcursor = "nc",
    splitkeep = "screen",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.o.showtabline = 1
vim.opt.fillchars:append({ eob = " " })
vim.diagnostic.config({ signs = false })
