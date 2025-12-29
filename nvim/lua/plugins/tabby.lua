vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    callback = function()
        local function get_fg(group, fallback)
            local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
            if ok and hl and hl.fg then
                return string.format('#%06x', hl.fg)
            end
            return fallback
        end

        local theme = {
            fill = 'TabLineFill',
            head = {
                fg = get_fg('Comment', '#7AA89F'),
                bg = 'none',
                style = 'italic',
            },
            current_tab = {
                fg = get_fg('Normal', '#223249'),
                bg = get_fg('Comment', '#7AA89F'),
                style = 'italic',
            },
            tab = {
                fg = get_fg('Comment', '#7AA89F'),
                bg = 'none',
                style = 'italic',
            },
            win = {
                fg = get_fg('Normal', '#223249'),
                bg = get_fg('Comment', '#7AA89F'),
                style = 'italic',
            },
            tail = {
                fg = get_fg('Comment', '#7AA89F'),
                bg = 'none',
                style = 'italic',
            },
        }

        require('tabby.tabline').set(function(line)
            return {
                {
                    { ' 󱣻 ', hl = theme.head },
                },
                line.tabs().foreach(function(tab)
                    local is_current = tab.is_current()
                    local hl = is_current and theme.current_tab or theme.tab
                    return {
                        is_current and line.sep('', hl, theme.fill) or ' ',
                        is_current and '' or '',
                        tab.number(),
                        tab.name(),
                        tab.close_btn(''),
                        is_current and line.sep('', hl, theme.fill) or ' ',
                        hl = hl,
                        margin = ' ',
                    }
                end),
                line.spacer(),
                    ---- shows list of windows in tab
                    --line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
                    --    return {
                    --        line.sep('', theme.win, theme.fill),
                    --        win.is_current() and '' or '',
                    --        win.buf_name(),
                    --        line.sep('', theme.win, theme.fill),
                    --        hl = theme.win,
                    --        margin = ' ',
                    --    }
                    --end),
                {
                    { '  ', hl = theme.tail },
                },
                hl = theme.fill,
            }
        end)
    end,
})
