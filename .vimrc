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
" NERDTree config
"启动vim自动打开NERDTree
autocmd VimEnter * NERDTree
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"

"打开新的buffer时自动定位到编辑窗口
autocmd VimEnter * wincmd p
"映射 F2 隐藏显示 NERDTree
map <F2> :NERDTreeToggle<CR>
"在只有 NERDTree 时关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
