require("obsidian").setup {
    workspaces = {
        {
            name = 'Vault',
            path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault',
        },
    },
    
    daily_notes = { folder = '__planner' },
    
    new_notes_location = 'current_dir',
    preferred_link_style = 'wiki',
    disable_frontmatter = true,
    templates = { folder = 'templates' },
    
    follow_url_func = function(url)
        vim.ui.open(url)
    end,
    
    follow_img_func = function(img)
        vim.ui.open(img)
    end,
    
    picker = { name = 'telescope.nvim' },
    open_notes_in = 'current',
    ui = { enable = false },
    checkbox = {
        order = {
            ' ',
            'x',
            '>',
            '<',
            '-',
            '!',
            '?',
            '/',
            'I',
            'f',
            '"',
            'p',
            'c',
        },
    },
    legacy_commands = false,
    footer = { enabled = false },
    statusline = { enabled = false },
}
