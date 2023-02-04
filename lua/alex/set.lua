vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.lsp.set_log_level("debug")

if vim.g.neovide then
    print("here")
    vim.g.neovide_transparency = 0.98
    vim.opt.guifont = { "FiraCode Nerd Font", ":h10" }
end
