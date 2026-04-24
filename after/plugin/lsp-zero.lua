vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '✘',
            [vim.diagnostic.severity.WARN] = '▲',
            [vim.diagnostic.severity.HINT] = '⚑',
            [vim.diagnostic.severity.INFO] = '',
        },
    },
    float = {
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

local cmp = require('cmp')
local luasnip = require('luasnip')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    window = {
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        ['<C-e>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end),

        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<C-d>'] = cmp.mapping(function() luasnip.jump(1) end, { 'i', 's' }),
        ['<C-b>'] = cmp.mapping(function() luasnip.jump(-1) end, { 'i', 's' }),

        ['<C-f>'] = cmp.mapping.scroll_docs(5),
        ['<C-u>'] = cmp.mapping.scroll_docs(-5),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
})
