-- Leader をここで定義する場合は「最初」に書くのが重要
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 分割（標準コマンドにエイリアス）
map("n", "<leader>L", "<cmd>vsplit<cr>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
map("n", "<leader>J", "<cmd>split<cr>",  vim.tbl_extend("force", opts, { desc = "Horizontal split" }))

-- ウィンドウ移動（Ctrl-w を省略）
map("n", "<leader>h", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Go left window" }))
map("n", "<leader>j", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Go lower window" }))
map("n", "<leader>k", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Go upper window" }))
map("n", "<leader>l", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Go right window" }))

-- サイズ調整（任意）
map("n", "<leader>w+", "<C-w>+", vim.tbl_extend("force", opts, { desc = "Increase height" }))
map("n", "<leader>w-", "<C-w>-", vim.tbl_extend("force", opts, { desc = "Decrease height" }))
map("n", "<leader>w>", "<C-w>>", vim.tbl_extend("force", opts, { desc = "Increase width" }))
map("n", "<leader>w<", "<C-w><", vim.tbl_extend("force", opts, { desc = "Decrease width" }))
map("n", "<leader>w=", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Equalize windows" }))

-- 閉じる（任意）
map("n", "<leader>wc", "<C-w>c", vim.tbl_extend("force", opts, { desc = "Close window" }))
map("n", "<leader>wo", "<C-w>o", vim.tbl_extend("force", opts, { desc = "Only window" }))

