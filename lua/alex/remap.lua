vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("NvimTreeToggle")
end)

vim.keymap.set("n", "<C-s>", function()
    vim.cmd("LspZeroFormat")
    vim.cmd("w")
    print("File saved and formatted.")
end)

vim.keymap.set("v", "J", ":m '>+2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")
