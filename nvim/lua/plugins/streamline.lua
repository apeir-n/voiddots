require('streamline').setup({
    sections = {
        left = {
            'mode',
            'conform_status',
            'filename',
        },
        middle = {
            'macro',
        },
        right = {
            'git_branch',
            'filetype',
            --filetype_display,
        },
    },
    excluded_filetypes = {
        'TelescopePrompt',
        'snacks_picker_input',
    },
    icon_provider = 'nvim-web-devicons',
})
