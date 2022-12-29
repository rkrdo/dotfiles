return {
  "marko-cerovac/material.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local cmd = vim.cmd
    require('material').setup({
      contrast = {
        non_current_windows = true,
      }
    })

    vim.g.material_style = 'palenight'
    cmd "colorscheme material"
  end
}
