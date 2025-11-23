local options = {
    laststatus = 3,
    ruler = false,
    showmode = false,
    showcmd = false,
    showtabline = 1,
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
    ignorecase = false,
    smartcase = true,
    conceallevel = 0,
    concealcursor = "nc",
    splitkeep = "screen",
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.fillchars:append({ eob = " " })
vim.diagnostic.config({ signs = false })
