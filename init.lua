require("vim._core.ui2").enable({})

-- config
require('config.options')
require('config.keybinds')
require('config.commands')

-- plugins
require('plugins.colors')
require('plugins.fzf')
require('plugins.treesitter')
require('plugins.mini')
require('plugins.lsp')
require('plugins.lualine')
