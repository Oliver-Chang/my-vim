" My config 
" 语法高亮
syntax enable
syntax on
set smartindent 
set sw=4
set ts=4
autocmd FileType python setlocal et sta sw=4 sts=4
let mapleader = "\<Space>"


nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>




" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j


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


" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
map <C-l> :bn<CR>
map <C-h> :bp<CR>
map <C-\> :bd<CR>



" NERDTree
" 使用 vim 打开目录自动打开 NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
" autocmd StdinReadPre * let s:std_in=1
" 自动关闭
" let g:nerdtree_tabs_autoclose=0
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 映射 F2 隐藏显示 NERDTree
map <F2> :NERDTreeTabsToggle<CR>
" 当只有 NERDTree 窗口时关闭 vim
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 宽度
let g:NERDTreeWinSize=20
" 自动打开 NERDTree
" autocmd vimenter * NERDTree
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 打开新的buffer时自动定位到编辑窗口
" autocmd VimEnter * wincmd p
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1



" tagbar
nmap <F3> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
" 设置tagbar的宽度为30列，默认40
" let g:tagbar_width = 30


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <F4> :SyntasticToggleMode<CR>


" Python flake8
let g:syntastic_python_checkers = ['flake8']



autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

