vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("NeoTreeFocusToggle")
end)

vim.keymap.set("n", "<C-s>", function()
    pcall(vim.lsp.buf.format)
    vim.cmd("w")
end)

vim.keymap.set("v", "J", ":m '>+2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-r>", function()
    local function snake(s)
        return s:gsub('%f[^%l]%u', '_%1'):gsub('%f[^%a]%d', '_%1'):gsub('%f[^%d]%a', '_%1'):gsub('(%u)(%u%l)',
            '%1_%2'):lower()
    end

    local original_word = vim.fn.expand("<cword>")

    vim.cmd("%s/" .. original_word .. "/" .. snake(original_word) .. "/g")
end)

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>h", function()
    vim.lsp.buf.hover()
end)

local inlay_hints = false
vim.keymap.set("n", "<leader>eh", function()
    local rt = require('rust-tools')
    if not inlay_hints then
        print("Enabled type hints.")
        rt.inlay_hints.enable()
        inlay_hints = true
    else
        print("Disabled type hints.")
        rt.inlay_hints.disable()
        inlay_hints = false
    end
end)

vim.keymap.set("n", "<leader>eb", function()
    local gs = package.loaded.gitsigns

    gs.toggle_current_line_blame()
end)

vim.keymap.set("n", "<leader>et", function()
    vim.cmd "InspectTree"
end)

vim.cmd("cnoremap <A-BS> <c-w>")
vim.cmd("inoremap <A-BS> <c-w>")
