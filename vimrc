set nocompatible              " be iMproved, required
" filetype off                  " required
filetype plugin indent on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Bundle "gilligan/vim-lldb"
Plugin 'valloric/youcompleteme'
Plugin 'kopischke/vim-fetch'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vifm/vifm.vim'
Plugin 'kana/vim-altr'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" C++ CODE COMPLETION STUFF
if has('macunix')
   let g:clang_library_path = system('echo $(find /Applications/Xcode.app/Contents/Developer/Toolchains/ -name "libclang.dylib" 2> /dev/null)')
else
   let g:clang_library_path = system('echo $(find /usr/ -name "libclang.so" 2> /dev/null)')
endif
let g:clang_use_library = 1
let g:clang_user_options='|| exit 0'
let g:clang_close_preview = 1
let g:clang_snippets = 1
let g:clang_trailing_placeholder = 1

highlight Pmenu ctermbg=gray guibg=gray
set shortmess+=c

" CUSTOM STUFF

set hidden " enable swapping away from unsaved buffers

" Windows style saving
map <C-s> <ESC>:w<cr>
imap <C-s> <ESC>:w<cr>

" Navigate vim windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" Navigate buffers
map bp :bp<cr>
map bn :bn<cr>
map bd :bn<cr>:bd!#<cr>

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

colorscheme gruvbox
set bg=dark
syntax on
highlight LineNr ctermfg=7 ctermbg=8
set number

set cursorline

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=lightred guibg=lightred
match ExtraWhitespace /\s\+$/

set tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab

" Swap between header and source files (C/C++)
map <C-p> <Plug>(altr-forward)
map <C-g> :YcmCompleter GoToDeclaration<cr>
map <C-f> :YcmCompleter GoToReferences<cr>

" Show symbol documentation with Shift-k
nmap K <Plug>(YCMHover)

" Vifm stuff
map vv :EditVifm<cr>
map vs :VsplitVifm<cr>

