local g = vim.g
local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local opt = vim.opt

g.mapleader = ','
g.netrw_dirhistmax = 0
cmd('let &showbreak = ">>> "')

o.hidden = true
wo.wrap = true
wo.linebreak = true
wo.list = false
o.pumheight = 10
opt.iskeyword:append { '-' }
-- o.mouse = 'a'
o.splitbelow = true
o.splitright = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
-- opt.laststatus = 0
opt.number = true
opt.numberwidth = 1
opt.cursorline = true
opt.scrolloff = 5
opt.showtabline = 0
opt.errorbells = false
opt.visualbell = true
opt.wildmode = { 'longest:list', 'full' }
opt.wildignore = { '*.o', '*.obj', '*~' }
opt.updatetime = 300
opt.timeoutlen = 500
-- opt.formatoptions:remove { 'c', 'r', 'o' } -- doesn't work
o.clipboard = 'unnamedplus'
o.completeopt = 'menuone,noselect'
-- https://vi.stackexchange.com/a/28837
opt.jumpoptions:append({ "stack" })
