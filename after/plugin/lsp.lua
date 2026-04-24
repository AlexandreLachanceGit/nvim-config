local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config('*', {
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    end
})

local function file_dir(fname)
    return vim.fn.fnamemodify(fname, ':h')
end

vim.lsp.config('p4_lsf', {
    cmd = { "lever_p4" },
    filetypes = { "p4" },
    root_dir = file_dir,
})
vim.lsp.enable('p4_lsf')

vim.lsp.config('lever_protobuf', {
    cmd = { "lever_protobuf" },
    filetypes = { "proto" },
    root_dir = file_dir,
})
vim.lsp.enable('lever_protobuf')

vim.lsp.config('lsf_lsf', {
    cmd = { "lsf_lsf" },
    filetypes = { "lsf" },
    root_dir = file_dir,
})
vim.lsp.enable('lsf_lsf')

vim.lsp.config('jpipe', {
    cmd = { "jpipe-ls" },
    filetypes = { "jd" },
    root_dir = file_dir,
})
vim.lsp.enable('jpipe')

vim.lsp.config('gdscript', {})
vim.lsp.enable('gdscript')

vim.lsp.config('rust_analyzer', {})
vim.lsp.enable('rust_analyzer')

vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
    },
})
vim.lsp.enable('clangd')

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file("", true),
            },
        },
    },
})

require('mason').setup()
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            vim.lsp.enable(server_name)
        end,
    }
})
