return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
        {
            "<leader>e",
            function()
                require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
            end,
            desc = "Explorer NeoTree",
        },
        {
            "<leader>ge",
            function()
                require("neo-tree.command").execute({ source = "git_status", toggle = true })
            end,
            desc = "Git explorer",
        },
        {
            "<leader>be",
            function()
                require("neo-tree.command").execute({ source = "buffers", toggle = true })
            end,
            desc = "Buffer explorer",
        },
    },
    config = function()
        require("neo-tree").setup(
            {
                window = {
                    width = 30,
                    position = "right",
                },


            }
        )
    end,
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
}
