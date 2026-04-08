vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "]q", "<cmd>cnext<cr>", { desc = "Next quickfix item" })
vim.keymap.set("n", "[q", "<cmd>cprev<cr>", { desc = "Prev quickfix item" })
