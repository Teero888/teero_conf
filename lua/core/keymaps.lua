vim.keymap.set("n", "dp", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "dn", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<left>", '')
vim.keymap.set("n", "<right>", '')
vim.keymap.set("n", "<up>", '')
vim.keymap.set("n", "<down>", '')
vim.keymap.set("n", "tt", '<cmd>bd<CR>');
vim.keymap.set("n", "x", '"_x');
vim.keymap.set("n", "xx", '"_dd');
vim.keymap.set("n", "q", '"_x');
vim.keymap.set("v", "x", '"_x');
-- I system mapped capslock to F13
-- vim.keymap.set('i', '<Esc>', '<Esc>', { noremap = true, desc = 'Exit to Normal mode' })
-- vim.keymap.set('v', '<Esc>', '<Esc>', { noremap = true, desc = 'Exit to Normal mode' })
-- vim.keymap.set('c', '<Esc>', '<Esc>', { noremap = true, desc = 'Exit to Normal mode' })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- unbind o so i can use it for leap
-- vim.keymap.set("n", "o", '')
-- vim.keymap.set("n", "O", '')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
