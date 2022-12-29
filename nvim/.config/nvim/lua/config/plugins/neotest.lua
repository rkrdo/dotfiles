return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/neotest-python",
    "olimorris/neotest-rspec",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim"
  },
  config = function()
    local map = vim.api.nvim_set_keymap

    require 'neotest'.setup({
      adapters = {
        require('neotest-python')({
          args = { "-vv" },
        }),
        require("neotest-rspec"),
      }
    })

    -- :h neotest.run
    map('', '<leader>T', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>', {})
    map('', '<leader>t', ':lua require("neotest").run.run()<cr>', {})
    map('', '<leader>ts', ':lua require("neotest").summary.toggle()<cr>', {})
    map('', '<leader>to', ':lua require("neotest").output.open({ enter = true })<cr>', {})
  end
}
