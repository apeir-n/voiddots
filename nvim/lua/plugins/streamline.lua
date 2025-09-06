require("mini.icons").setup({})

----attempt to override streamline's filetype display for .genexpr files
--local function filetype_display()
--  local ft = vim.bo.filetype
--  if ft == "genexpr" then
--    return "gen~"
--  end
--  return ft
--end

require("streamline").setup({
    sections = {
        left = {
            "mode",
            "conform_status",
            "filename",
        },
        middle = {
            "macro",
        },
        right = {
            "git_branch",
            "filetype",
            --filetype_display,
        },
    },
    excluded_filetypes = {
        "TelescopePrompt",
        "snacks_picker_input",
    },
    icon_provider = "mini.icons",
})
