local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

configs.p4_lsp = {
    default_config = {
        cmd = { "p4_lsp" },
        filetypes = { "p4" },
        root_dir = util.path.dirname,
    },
    -- on_new_config = function(new_config) end;
    -- on_attach = function(client, bufnr) end;
    docs = {
        description = [[
Language Server Protocol for P4.
]]       ,
        default_config = {
            root_dir = [[root_pattern(".git")]],
        },
    },
}

require('lspconfig').p4_lsp.setup {}

-- require('lspconfig').rust_analyzer.setup {
--     settings = {
--         ['rust-analyzer'] = {
--             checkOnSave = {
--                 allFeatures = true,
--                 overrideCommand = {
--                     'cargo', 'clippy', '--workspace', '--message-format=json',
--                     '--all-targets', '--all-features'
--                 }
--             },
--         }
--     }
-- }

local rt = require("rust-tools").setup({
    server = {
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
})


lsp.setup()
