local map = vim.api.nvim_set_keymap

map('', '<leader>ff', '<cmd>Telescope find_files<cr>', {})
map('', '<leader>fb', '<cmd>Telescope buffers<cr>', {})
map('', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
map('', '<leader>rg', '<cmd>Telescope grep_string<cr>', {})
map('', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
map('', '<leader>fd', '<cmd>Telescope file_browser<cr>', {})
map('', '<leader>fc', '<cmd>Telescope command_history<cr>', {})
map('', '<leader>fj', '<cmd>Telescope jumplist<cr>', {})

return {
  "nvim-telescope/telescope.nvim",
  cmd = { "Telescope" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>" }
  }
}
