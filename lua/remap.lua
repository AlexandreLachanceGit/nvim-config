vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("NeoTreeFocusToggle")
end)

vim.keymap.set("n", "<C-s>", function()
    -- pcall(vim.lsp.buf.format)
    vim.cmd("w")
end)

vim.keymap.set("n", "<leader>w", function()
    -- pcall(vim.lsp.buf.format)
    vim.cmd("noautocmd w")
end)

vim.keymap.set("v", "J", ":m '>+2<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "<C-r>", function()
--     local function snake(s)
--         return s:gsub('%f[^%l]%u', '_%1'):gsub('%f[^%a]%d', '_%1'):gsub('%f[^%d]%a', '_%1'):gsub('(%u)(%u%l)',
--             '%1_%2'):lower()
--     end
--
--     local original_word = vim.fn.expand("<cword>")
--
--     vim.cmd("%s/" .. original_word .. "/" .. snake(original_word) .. "/g")
-- end)

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

vim.keymap.set("n", "<leader>gh", function()
    vim.cmd "Gitsigns preview_hunk_inline"
end)

vim.keymap.set("n", "<leader>gr", function()
    vim.cmd "Gitsigns reset_hunk"
end)

vim.keymap.set("n", "<leader>nw", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end)

vim.keymap.set("n", "<leader>ne", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set("n", "<leader>ng", function()
    vim.cmd "Gitsigns next_hunk"
end)

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<CR>")

vim.cmd("cnoremap <A-BS> <c-w>")
vim.cmd("inoremap <A-BS> <c-w>")

-- More intuitive for wrapped lines
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = true })
vim.api.nvim_set_keymap('n', 'gj', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'gk', 'k', { noremap = true })

-- Terminal navigation (fix terminal lock-in)
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], { desc = "Move to left window" })
vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], { desc = "Move to bottom window" })
vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], { desc = "Move to top window" })
vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], { desc = "Move to right window" })
