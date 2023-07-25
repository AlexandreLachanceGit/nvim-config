local lsp = require('lsp-zero')

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


configs.p4analyzer = {
    default_config = {
        cmd = { "p4analyzer" },
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

lsp.configure('p4_lsp', {
    settings = {
        p4test_path = "/home/alex/.local/bin/p4c_backend_p4test",
        include_path = "/home/alex/Documents/University/Master/p4c/p4include"
    }
})

require("lspconfig").gdscript.setup { capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) }

-- lsp.configure('p4analyzer', {})

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

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.setup()
