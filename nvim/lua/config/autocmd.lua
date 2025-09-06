--streamline_modeclrs
vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
        local ok, mode = pcall(vim.fn.mode)
        if not ok then return end

        local hl = vim.api.nvim_set_hl

        if mode == "n" then
            hl(0, "StreamlineMode", { fg = "#D27E99", bg = "none", bold = true })
        elseif mode == "i" then
            hl(0, "StreamlineMode", { fg = "#98BB6C", bg = "none", bold = true })
        elseif mode == "v" or mode == "V" or mode == "\22" then
            hl(0, "StreamlineMode", { fg = "#7FB4CA", bg = "none", bold = true })
        elseif mode == "R" then
            hl(0, "StreamlineMode", { fg = "#D27E99", bg = "none", bold = true })
        else
            hl(0, "StreamlineMode", { fg = "#AAAAAA", bg = "none", bold = true })
        end
    end,
})

--:w_lint
vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
        require("lint").try_lint()
    end,
})

--disable_autocomment
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

--yank_highlight
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
    vim.highlight.on_yank({ timeout = 120 })
    end,
})

--cursor_restore
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
        vim.cmd("normal! g'\"")
    end
end,
})

----noconceal
----uncomment if conceallevel != 0
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = { "json", "jsonc", "md" },
--  callback = function()
--    vim.opt_local.conceallevel = 0
--  end
--})

vim.cmd [[
  autocmd BufRead,BufNewFile *.sc set filetype=supercollider
]]
