return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame = true
  }
}
