local map = vim.api.nvim_set_keymap

map('i', 'jk', '<Esc>', {})
map('v', '<', '<gv', { noremap = true })
map('v', '>', '>gv', { noremap = true })
