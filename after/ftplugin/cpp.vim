" C++ specific settings

" Coc, coc-clangd
let $COCCONFIG = $HOME . '/.config/nvim/coc.vim'
if filereadable($COCCONFIG)
   source $COCCONFIG
endif

" Settings for vim-cmake
let g:cmake_root_markers = ['CMakeLists.txt']
let g:cmake_jump=1
nnoremap <F10> :CMakeOpen<CR> :set rnu<CR> :wincmd p<CR>

"nnoremap <Leader>gd :call CocActionAsync('jumpDefinition')<CR>
"nnoremap <Leader>gr :call CocActionAsync('jumpReferences')<CR>

