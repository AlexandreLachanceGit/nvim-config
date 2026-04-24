-- nvim-treesitter main branch uses a new API; highlighting is driven by
-- Neovim's built-in vim.treesitter rather than the old configs module.

vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        pcall(vim.treesitter.start)

        if ev.match ~= 'python' then
            vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end

        local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
        local config = require('nvim-treesitter.config')
        if not vim.list_contains(config.get_installed(), lang) then
            if vim.list_contains(config.get_available(), lang) then
                require('nvim-treesitter').install({ lang })
            end
        end
    end,
})

local parsers = require('nvim-treesitter.parsers')
parsers.p4 = {
    install_info = {
        url = '~/Documents/University/Master/tree-sitter-p4',
        files = { 'src/parser.c', 'src/scanner.c' },
    },
}
