return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    local cmd = vim.cmd
    vim.g.material_style = 'palenight'
    cmd "colorscheme material"
  end,
  config = {
    contrast = {
      non_current_windows = true,
    }
  }
}
