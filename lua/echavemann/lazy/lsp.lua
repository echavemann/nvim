return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "saghen/blink.cmp"
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        vim.lsp.config("*", {
            capabilities = capabilities,
            root_markers = { '.git' },
         })
        vim.lsp.config('lua_ls', {
            settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        'vim',
                        'require',
                    },
                },
                },
            },
        })

        vim.lsp.config("pyrefly", {
            settings = {
            }
        })

        vim.lsp.config("clangd", {
            settings = {
            }
        })

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyrefly",
            },
            automatic_installation = true,
        })
    end
}
