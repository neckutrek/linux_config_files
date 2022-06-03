call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clangd/coc-clangd'
Plug 'bfrg/vim-cpp-modern'
Plug 'cdelledonne/vim-cmake'

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
Plug 'mileszs/ack.vim'

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

" Settings for vim-cmake
let g:cmake_root_markers = ['CMakeLists.txt']
let g:cmake_jump=1
nnoremap <F10> :CMakeOpen<CR> :set rnu<CR> :wincmd p<CR>

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

highlight ExtraWhitespace ctermbg=darkgrey guibg=darkgrey
match ExtraWhitespace /\s\+$/

" Tabstop
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Don't let netrw directory listing keep one buffer open all the time
let g:netrw_fastbrowse = 0

" Add functionality to follow filepath with line and column number in previous
" window
:function! GetFileLineNumber()
  :let word=expand("<cWORD>")
  ":echo "word     = ".word

  :let filepath=expand("<cfile>")
  :if filepath[0:0]!="/" | let filepath=substitute(word,"\\(/.*\\):.*","\\1","") | endif
  ":echo "filepath = ".filepath
  :if filepath[0:0]!="/"
    :echo "Not a valid file path under cursor"
    :return
  :endif

  :let line=substitute(word,"^[^:]*:\\([^:]*\\).*$","\\1","")
  :if line!="".str2nr(line) | let line="1" | endif
  ":echo "line     = ".line

  :let column=substitute(word,"^[^:]*:[^:]*:\\([^:]*\\).*$","\\1","")
  :if column!="".str2nr(column) | let column="1" | endif
  ":echo "column  = ".column

  :wincmd p
  ":echo filepath." ".line." ".column
  :execute("e ".filepath)
  :call cursor(line,column)
  :wincmd p
:endfunction

nnoremap <F8> :call GetFileLineNumber()<CR>

