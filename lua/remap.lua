local opts = { noremap = true }

keymap = vim.api.nvim_set_keymap

-- Set leader key
vim.g.mapleader=" "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- Center after certain commands
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Delete and paste without modifying the "deleted" register
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Keep the cursor when append lines with J
keymap("n", "J", "mzJ`z", opts)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>b", "<cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>g", "<cmd>Telescope git_status<CR>")
