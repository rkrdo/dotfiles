return {
  {
    "numToStr/Comment.nvim",
    config = true
  },
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    "kylechui/nvim-surround",
    config = true
  },

  {
    "luochen1990/rainbow",
    config = function()
      -- https://github.com/luochen1990/rainbow#install
      vim.g.rainbow_active = 1
    end
  },
  {
    "windwp/nvim-autopairs", config = true
  }
}
