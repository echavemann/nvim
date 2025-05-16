return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local function lsp_keymaps(bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pylsp",
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = require('blink.cmp').get_lsp_capabilities(),
                        on_attach = function(client, bufnr)
                            lsp_keymaps(bufnr)
                        end,
                    }
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end
            }
        })
    end
}
