require('neoscroll').setup({
    mappings = {
        '<C-u>',
        '<C-d>',
        '<C-b>',
        '<C-f>',
        '<C-y>',
        '<C-e>',
        'zt',
        'zz',
        'zb',
        'gg',
    },
    hide_cursor = true,
    duration_multiplier = 0.6,
    --linear, quadratic, cubic, quartic, quintic, circular, sine
    easing = 'sine',
})
