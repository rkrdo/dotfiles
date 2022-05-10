local opt = vim.opt
local cmd = vim.cmd

-- opt.termguicolors = true
-- opt.background = 'dark'
vim.g.material_style = 'palenight'
cmd "colorscheme material"

require('material').setup({
  -- lualine_style = "stealth";
})
