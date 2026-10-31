vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
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

local function set_statusline_highlights()
    local function set(group, fg, bold)
        vim.api.nvim_set_hl(0, group, {
            fg = fg,
            bg = colors.base,
            bold = bold or false,
        })
    end

    -- Keep the statusline's empty/background area on your base color.
    vim.api.nvim_set_hl(0, "StatusLine", {
        fg = colors.text,
        bg = colors.base,
    })
    vim.api.nvim_set_hl(0, "StatusLineNC", {
        fg = colors.overlay0,
        bg = colors.base,
    })

    -- Mini uses a separate mode highlight for each mode.
    set("MiniStatuslineModeNormal",  colors.mauve, true)
    set("MiniStatuslineModeInsert",  colors.green, true)
    set("MiniStatuslineModeVisual",  colors.blue, true)
    set("MiniStatuslineModeReplace", colors.maroon, true)
    set("MiniStatuslineModeCommand", colors.peach, true)
    set("MiniStatuslineModeOther",   colors.mauve, true)

    -- Equivalent to your lualine b, x, y, and z colors.
    set("MiniStatuslineFile",     colors.blue)
    set("MiniStatuslineDevinfo",  colors.blue, true)
    set("MiniStatuslineProgress", colors.pink, true)
    set("MiniStatuslineLocation", colors.mauve, true)
    set("MiniStatuslineSeparator", colors.text)

    -- Your inactive mode indicator uses overlay0; the other inactive
    -- sections keep the colors from your inactive lualine theme.
    set("MiniStatuslineInactiveMode", colors.overlay0, true)
end

local function highlighted(group, text)
    if text == nil or text == "" then
        return ""
    end
    return "%#" .. group .. "#" .. text .. "%*"
end

local function join_nonempty(parts, separator)
    local out = {}
    for _, part in ipairs(parts) do
        if part ~= nil and part ~= "" then
            table.insert(out, part)
        end
    end
    return table.concat(out, separator)
end

local function make_statusline(is_active)
    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 0 })
    mode = mode:upper()
    if not is_active then
        mode_hl = "MiniStatuslineInactiveMode"
    end

    local filename = MiniStatusline.section_filename({ trunc_width = 140 })
    local file_and_type = join_nonempty({ filename }, " ")

    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
    local diff = MiniStatusline.section_diff({ trunc_width = 75 })
    local git = MiniStatusline.section_git({ trunc_width = 40 })

    local separator = highlighted("MiniStatuslineSeparator", "|")

    local left = highlighted(mode_hl, mode)
    if file_and_type ~= "" then
        left = left .. " " .. separator .. " "
            .. highlighted("MiniStatuslineFile", file_and_type)
    end

    local right = join_nonempty({
        highlighted("MiniStatuslineDevinfo",
            join_nonempty({ diagnostics, diff, git }, " ")),
        highlighted("MiniStatuslineProgress", "%p%%"),
        highlighted("MiniStatuslineLocation", "%l:%c"),
    }, " " .. separator .. " ")

    return left .. "%=" .. right
end

require("mini.statusline").setup({
    use_icons = true,
    content = {
        active = function()
            return make_statusline(true)
        end,
        inactive = function()
            return make_statusline(false)
        end,
    },
})

set_statusline_highlights()

-- Reapply these custom colors if a colorscheme is loaded or changed later.
vim.api.nvim_create_autocmd("ColorScheme", {
    callback = set_statusline_highlights,
})

vim.o.showmode = false
