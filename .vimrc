" Pathogen 
runtime bundle/vim-pathogen/autoload/pathogen.vim
" call pathogen#infect()
execute pathogen#infect()
Helptags


" vim-colors-solarized
set background=dark
colorscheme solarized
" 使支持256色
set t_Co=256


" NERDTree
" 自动打开 NERDTree
" autocmd vimenter * NERDTree
" 使用 vim 打开目录自动打开 NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 打开新的buffer时自动定位到编辑窗口
" autocmd VimEnter * wincmd p
" 映射 F2 隐藏显示 NERDTree
map <F2> :NERDTreeToggle<CR>
" 当只有 NERDTree 窗口时关闭 vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" python flake8
let g:syntastic_python_checkers = ['flake8']



" My config 
" 语法高亮
syntax enable
syntax on
filetype plugin indent on
set smartindent 
set sw=4
set ts=4
autocmd FileType python setlocal et sta sw=4 sts=4

