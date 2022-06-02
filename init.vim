call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clangd/coc-clangd'
Plug 'bfrg/vim-cpp-modern'
Plug 'mileszs/ack.vim'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'cloudhead/neovim-fuzzy'

Plug 'Yohannfra/Nvim-Switch-Buffer'
call plug#end()

" Coc, coc-clangd
let $COCCONFIG = $HOME . '/.config/nvim/coc.vim'
if filereadable($COCCONFIG)
   source $COCCONFIG
endif

nnoremap <Space> <Nop>
:let mapleader = " "

nnoremap <ESC> <ESC><ESC>:noh<CR><ESC>
tnoremap <ESC> <C-\><C-n>

" File system naviagtion
nnoremap <C-p> :FuzzyOpen<CR>

" Silver Searcher Ag search in all files under cwd
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <C-s> :Ack 

let g:airline#extensions#fugitiveline#enabled = 1

"nnoremap <Leader>gd :call CocActionAsync('jumpDefinition')<CR>
"nnoremap <Leader>gr :call CocActionAsync('jumpReferences')<CR>

" Manage buffers
nmap <Leader>bd :bp<cr>:bd#<cr>
nmap <Leader>bD :bp<cr>:bd!#<cr>
:nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
:nnoremap <A-N> :bprevious<CR>:redraw<CR>:ls<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline_theme='tomorrow'

" Color theme
colorscheme gruvbox
syntax on
highlight LineNr ctermfg=244 ctermbg=233
set number
set cursorline

highlight ExtraWhitespace ctermbg=lightred guibg=lightred
match ExtraWhitespace /\s\+$/

" Tabstop
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Don't let netrw directory listing keep one buffer open all the time
let g:netrw_fastbrowse = 0

