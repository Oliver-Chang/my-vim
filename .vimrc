runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
Helptags


" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized
" 使支持256色
set t_Co=256


" NERDTree
" 自动打开 NERDTree
"autocmd vimenter * NERDTree
"使用 vim 打开目录自动打开 NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
"打开新的buffer时自动定位到编辑窗口
autocmd VimEnter * wincmd p
"映射 F2 隐藏显示 NERDTree
map <F2> :NERDTreeToggle<CR>
"当只有 NERDTree 窗口时关闭 vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
