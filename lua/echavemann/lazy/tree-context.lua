return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile", "BufWritePost"},
  enabled = true,
  opts = { mode = "cursor", max_lines = 3 },
}
