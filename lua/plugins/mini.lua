vim.pack.add({
    {
        src = "https://github.com/nvim-mini/mini.nvim",
    },
    {
        src = "https://github.com/rafamadriz/friendly-snippets",
    },
    {
        src = "https://github.com/tpope/vim-fugitive"
    },
})

-- mini files
local MiniFiles = require("mini.files")
MiniFiles.setup({
    mappings = {
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "_",
    },
})

vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<CR>", { desc = "Toggle mini file explorer" })
vim.keymap.set("n", "<leader>-", function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end, { desc = "Toggle into currently opened file" })

-- mini notify
local MiniNotify = require("mini.notify")
MiniNotify.setup({
    --only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

-- mini command-line completion
local MiniCmdline = require("mini.cmdline")
MiniCmdline.setup({
    autocorrect = { enable = false }
})

-- mini surround
local MiniSurround = require("mini.surround")
MiniSurround.setup()
-- Default Keymaps
-- | `sa` | Add surrounding |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Higlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

-- mini completions
local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
    lsp_completion = {
        auto_setup = true,
    }
})

-- mini snippet
local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendly-snippets automatically
    },
    -- disable empty tabstop(snippet)
    expand = {
        insert = function(snippet)
            MiniSnippets.default_insert(snippet, { empty_tabstop = "" })
        end,
    },
})
MiniSnippets.start_lsp_server({ match = false })

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})
    end,
})

-- mini diff
local MiniDiff = require("mini.diff")
MiniDiff.setup({
    source = MiniDiff.gen_source.git({ index = false }),
})

-- vim.keymap.set("n", "[h", function() MiniDiff.goto_hunk("prev") end, { desc = "Prev hunk" })
-- vim.keymap.set("n", "]h", function() MiniDiff.goto_hunk("next") end, { desc = "Next hunk" })
-- [H first hunk
-- ]H last hunk
-- gh : stage hunk
-- gH : reset hunk

vim.keymap.set("n", "<leader>gg", "<cmd>tabnew | Git | only<cr>", { desc = "Fugitive Full Page New Tab" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gcdiffsplit<CR>", { desc = "Git diff split", })
