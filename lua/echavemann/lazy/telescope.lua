return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local actions = require("telescope.actions")
            local options = {
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                    mappings = {
                        n = { ["q"] = require("telescope.actions").close },
                    },
                },

                extensions_list = { "themes", "terms" },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
            }
            require("telescope").setup(options)
            local builtin = require('telescope.builtin')

            vim.keymap.set("n", "<leader>o", builtin.buffers, {})
            vim.keymap.set("n", "<leader>f", builtin.find_files, {})
            vim.keymap.set("n", "<leader>r", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>h", builtin.oldfiles, {})
        end
    }
}
