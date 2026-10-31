vim.pack.add({
    {
        src = 'https://github.com/neovim/nvim-lspconfig'
    },
    {
        src = "https://github.com/mason-org/mason.nvim",
    },
})

-- Mason Setup
require("mason").setup()

-- LSP Keymap
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>z", vim.lsp.buf.format, { desc = "Format Local buffer" })

-- LSP Setup
vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    update_in_insert = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

-- Lua LSP Config
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

-- Enable LSP Modules
vim.lsp.enable({
    "lua_ls",           -- https://github.com/LuaLS/lua-language-server
    "jsonls",           -- https://github.com/microsoft/vscode-json-languageservice
    "dprint",           -- https://github.com/dprint/dprint
    "tombi",            -- https://github.com/tombi-toml/tombi
    "rust-analyzer",    -- https://github.com/rust-lang/rust-analyzer
    "biome",            -- https://github.com/biomejs/biome
    "clangd",           -- https://clangd.llvm.org/installation
    "shuck",            -- https://github.com/ewhauser/shuck
})
