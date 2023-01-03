return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  init = function()
    -- -- https://github.com/Yggdroot/indentLine#customization
    -- vim.g.indentLine_leadingSpaceChar = '.'
    -- vim.g.indentLine_leadingSpaceEnabled = 1

    vim.g.indent_blankline_char_list = { '|', '¦', '┆', '┊' }
    vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
    vim.g.indent_blankline_buftype_exclude = { 'help', 'terminal', 'nofile' }
    vim.g.indent_blankline_show_trailing_blankline_indent = false

    vim.opt.list = true
    vim.opt.listchars:append("eol:↴")
  end,
  config = {
    show_end_of_line = true
  }
}
