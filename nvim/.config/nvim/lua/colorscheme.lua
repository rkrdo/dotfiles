local cmd = vim.cmd

require('material').setup({
  -- lualine_style = "stealth";
  contrast = {
    non_current_windows = true,
  }
})

vim.g.material_style = 'palenight'
cmd "colorscheme material"
