return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            picker = { enabled = true },
        },
        keys = {
            { "<leader>f", function() Snacks.picker.files() end,                  desc = "Find Files" },
            { "<leader>o", function() Snacks.picker.buffers() end,                desc = "Buffers" },
            { "<leader>r", function() Snacks.picker.grep() end,                   desc = "Live Grep" },
            { "<leader>h", function() Snacks.picker.recent() end,                 desc = "Recent Files" },
            { "<leader>y", function() Snacks.picker.lsp_workspace_symbols() end,  desc = "Workspace Symbols" },
            { "<leader>g", function() Snacks.picker.grep_word() end,              desc = "Grep Word" },
        },
    }
}
