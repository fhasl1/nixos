vim.keymap.set("n", "y", '"+y')
vim.keymap.set("v", "y", '"+y')

vim.keymap.set("n", "<leader>X", "<cmd>!chmod +x %<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<", "<gv")
vim.keymap.set("n", ">", ">gv")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("i", "<C-BS>", "<C-W>", { desc = "Delete word backward" })
