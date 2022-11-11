local map = vim.api.nvim_set_keymap
local set_hl = vim.api.nvim_set_hl
-- https://github.com/mfussenegger/nvim-dap-python#usage
local dap_python = require('dap-python')
dap_python.setup('~/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'

-- breakpoint icon
-- https://github.com/mfussenegger/nvim-dap/discussions/355#discussioncomment-2159022
set_hl(0, 'DapBreakpoint', { ctermbg=0, fg='#993939', bg='#31353f' })
set_hl(0, 'DapLogPoint', { ctermbg=0, fg='#61afef', bg='#31353f' })
set_hl(0, 'DapStopped', { ctermbg=0, fg='#98c379', bg='#31353f' })

vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

-- dap keymaps
map('', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', {})
map('', '<leader>dc', ':lua require("dap").continue()<CR>', {})
map('', '<leader>do', ':lua require("dap").step_over()<CR>', {})
map('', '<leader>dsi', ':lua require("dap").step_into()<CR>', {})
map('', '<leader>dso', ':lua require("dap").step_out()<CR>', {})
map('', '<leader>dr', ':lua require("dap").repl.toggle()<CR>', {})

-- dap-python keymaps
map('', '<leader>dn', ':lua require("dap-python").test_method()<CR>', {})
map('', 'leader>df', ':lua require("dap-python").test_class()<CR>', {})
map('v', '<leader>ds', '<ESC>:lua require("dap-python").debug_selection()<CR>', {})

-- nvim-dap-ui
require("dapui").setup()
map('', '<leader>dui', ':lua require("dapui").toggle()<CR>', {})

-- nvim-dap-virtual-text
require("nvim-dap-virtual-text").setup()
