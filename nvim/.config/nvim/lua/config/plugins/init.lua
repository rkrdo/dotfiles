return {
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = true
  },
  {
    "tpope/vim-rhubarb",
    dependencies = {
      "tpope/vim-fugitive",
      cmd = { "Git" }
    },
    cmd = { "GBrowse" }
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    config = true
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
  {
    'luochen1990/rainbow',
    event = "BufRead",
    init = function()
      vim.g.rainbow_active = 1
    end
  }
}
