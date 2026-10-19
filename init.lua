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
require('plugins.mini-statusline')
require('plugins.lsp')
