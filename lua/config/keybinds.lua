vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader
-- vim.keymap.set("n", "<leader>cd", vim.cmd.Ex) -- if there is no explorer-like(nvim-tree, mini.nvim) available

-- Clear search 
vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search hightlights" })

-- Moving to different windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Spliting windows
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizonatally" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Move line/s up/down
vim.keymap.set("n", "<A-S-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-S-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-S-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-S-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Line indentation
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

