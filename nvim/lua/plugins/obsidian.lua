require('obsidian').setup {
    workspaces = { { name = 'Vault', path = '~/Documents/obsidian_vault' } },
    daily_notes = { folder = '__planner' },
    templates = { folder = 'templates' },
    picker = { name = 'telescope.nvim' },
    open_notes_in = 'current',
    new_notes_location = 'current_dir',
    preferred_link_style = 'wiki',
    frontmatter = { enabled = false },
    ui = { enable = false },
    footer = { enabled = false },
    statusline = { enabled = false },
    legacy_commands = false,

    follow_url_func = function(url)
        vim.ui.open(url)
    end,

    follow_img_func = function(img)
        vim.ui.open(img)
    end,

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
}
