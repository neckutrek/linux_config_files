call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'clangd/coc-clangd'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'mg979/vim-studio-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'cloudhead/neovim-fuzzy'
call plug#end()

nnoremap <Space> <Nop>
:let mapleader = " "

" vim-fugitive Git integration
nmap <Leader>gs :G<CR>
nmap <Leader>gj :diffget //3<CR>
nmap <Leader>gf :diffget //2<CR>

let g:airline#extensions#fugitiveline#enabled = 1
nmap <Leader>gb :call gitblame#echo()<CR>

" Coc, coc-clangd
let $COCCONFIG = $HOME . '/.config/nvim/coc.vim'
if filereadable($COCCONFIG)
   source $COCCONFIG
endif

" Windows-style file saving
map <C-s> <ESC>:w<cr>
imap <C-s> <ESC>:w<cr>

" Navigate vim windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Navigate buffers
nmap <Leader>bp :bp<cr>
nmap <Leader>bn :bn<cr>
nmap <Leader>bd :bn<cr>:bd#<cr>
nmap <Leader>bD :bn<cr>:bd!#<cr>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '  '
let g:airline_theme='luna'

colorscheme vsdark
let g:Vsd.contrast = 2
syntax on
highlight LineNr ctermfg=244 ctermbg=233
set number
set cursorline

highlight ExtraWhitespace ctermbg=lightred guibg=lightred
match ExtraWhitespace /\s\+$/

set tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab

" Defx
nmap <Leader>vv :Defx `expand('%:p:h')` -search=`expand('%:p')` -show-ignored-files<CR>C

autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('preview')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_tree', 'toggle')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

