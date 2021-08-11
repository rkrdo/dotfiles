"
" Config options
"

" colorscheme
" https://github.com/drewtempelmeyer/palenight.vim#true-colors
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" https://github.com/drewtempelmeyer/palenight.vim#usage
set background=dark
colorscheme palenight

let mapleader = ","
set number
let &showbreak = ">>> "
set wrap linebreak nolist
" Disable beeping https://vim.fandom.com/wiki/Disable_beeping
set noeb vb t_vb=

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" set swap file directory
set directory^=$VIMDATA/swap//

" https://stackoverflow.com/a/13043196
set wildmode=longest:list,full
" stuff to ignore when tab completing
set wildignore=*.o,*.obj,*~

" disable netrwhist
let g:netrw_dirhistmax = 0


" Better display for messages
set cmdheight=2

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

"
" Mappings
"

imap jk <Esc>

"
" Plugin custom config
"

" fzf.vim config
nnoremap <C-p> :Files<Cr>
" https://bluz71.github.io/2018/12/04/fuzzy-finding-in-vim-with-fzf.html
let g:fzf_layout = { 'window': {
      \ 'width': 0.9,
      \ 'height': 0.7,
      \ 'highlight': 'Comment',
      \ 'rounded': v:false } }

" https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

" https://github.com/junegunn/fzf.vim/issues/50#issuecomment-161676378m
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" https://github.com/Yggdroot/indentLine#customization
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_bufTypeExclude = ['help', 'terminal']

" https://github.com/luochen1990/rainbow#install
let g:rainbow_active = 1

" https://github.com/vim-test/vim-test#strategies
let test#strategy = "vimux"