vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim"
})

local colors = {
    rosewater   = "#f5e0dc",
    flamingo    = "#f2cdcd",
    pink        = "#f5c2e7",
    mauve       = "#cba6f7",
    red         = "#f38ba8",
    maroon      = "#eba0ac",
    peach       = "#fab387",
    yellow      = "#f9e2af",
    green       = "#a6e3a1",
    teal        = "#94e2d5",
    sky         = "#89dceb",
    sapphire    = "#74c7ec",
    blue        = "#89b4fa",
    lavender    = "#b4befe",
    text        = "#cdd6f4",
    subtext1    = "#bac2de",
    subtext0    = "#a6adc8",
    overlay2    = "#9399b2",
    overlay1    = "#7f849c",
    overlay0    = "#6c7086",
    surface2    = "#585b70",
    surface1    = "#45475a",
    surface0    = "#313244",
    base        = "#1e1e2e",
    mantle      = "#181825",
    crust       = "#11111b",
}

local theme = {
    normal = {
        a = {bg = colors.base, fg = colors.mauve, gui = 'bold'},
        b = {bg = colors.base, fg = colors.blue},
        c = {bg = colors.base, fg = colors.text},
        x = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        y = {bg = colors.base, fg = colors.pink, gui = 'bold'},
        z = {bg = colors.base, fg = colors.mauve, gui = 'bold'}
    },
    insert = {
        a = {bg = colors.base, fg = colors.green, gui = 'bold'},
        b = {bg = colors.base, fg = colors.blue},
        c = {bg = colors.base, fg = colors.text},
        x = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        y = {bg = colors.base, fg = colors.pink, gui = 'bold'},
        z = {bg = colors.base, fg = colors.mauve, gui = 'bold'}
    },
    visual = {
        a = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        b = {bg = colors.base, fg = colors.blue},
        c = {bg = colors.base, fg = colors.text},
        x = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        y = {bg = colors.base, fg = colors.pink, gui = 'bold'},
        z = {bg = colors.base, fg = colors.mauve, gui = 'bold'}
    },
    replace = {
        a = {bg = colors.base, fg = colors.maroon, gui = 'bold'},
        b = {bg = colors.base, fg = colors.blue},
        c = {bg = colors.base, fg = colors.text},
        x = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        y = {bg = colors.base, fg = colors.pink, gui = 'bold'},
        z = {bg = colors.base, fg = colors.mauve, gui = 'bold'}
    },
    command = {
        a = {bg = colors.base, fg = colors.peach, gui = 'bold'},
        b = {bg = colors.base, fg = colors.blue},
        c = {bg = colors.base, fg = colors.text},
        x = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        y = {bg = colors.base, fg = colors.pink, gui = 'bold'},
        z = {bg = colors.base, fg = colors.mauve, gui = 'bold'}
    },
    inactive = {
        a = {bg = colors.base, fg = colors.overlay0, gui = 'bold'},
        b = {bg = colors.base, fg = colors.blue},
        c = {bg = colors.base, fg = colors.overlay0},
        x = {bg = colors.base, fg = colors.blue, gui = 'bold'},
        y = {bg = colors.base, fg = colors.pink, gui = 'bold'},
        z = {bg = colors.base, fg = colors.mauve, gui = 'bold'}
    }
}

local function section_glyph(section)
    local glyphs = {
        left = "|",
        right = "|",
    }
    local glyph = assert(glyphs[section], "Unknown lualine section: " .. tostring(section))

    return {
        function ()
            return glyph
        end,
        color = {fg = colors.text},
        padding = 0,
        separator = "",
    }
end 

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
            refresh_time = 16, -- ~60fps
            events = {
                'WinEnter',
                'BufEnter',
                'BufWritePost',
                'SessionLoadPost',
                'FileChangedShellPost',
                'VimResized',
                'Filetype',
                'CursorMoved',
                'CursorMovedI',
                'ModeChanged',
            },
        }
    },
    sections = {
        lualine_a = {'mode', section_glyph("left")},
        lualine_b = {
            {
                'filename',
                path = 4
            },
            section_glyph("left"),
            {
                'filetype'
            },
            section_glyph("left")
        },
        lualine_c = {},
        lualine_x = {
            'diagnostics',
            section_glyph("right"),
            'diff',
            section_glyph("right"),
            'branch'
        },
        lualine_y = {section_glyph("right"), 'progress'},
        lualine_z = {section_glyph("right"), 'location'}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
