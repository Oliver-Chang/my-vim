" My config 
" 语法高亮
syntax enable
syntax on
set smartindent 
set sw=4
set ts=4
autocmd FileType python setlocal et sta sw=4 sts=4
let mapleader = "\<Space>"

" 快速打开 .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" 应用 .vimrc 配置
nnoremap <leader>sv :source $MYVIMRC<cr>

" 大小写转换
nnoremap gu gU
nnoremap gl gu




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
" nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
" nmap <Leader>w :w<CR>
" 不做任何保存，直接退出 vim
" nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
" nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
" nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
" nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
" nnoremap <Leader>jw <C-W>j


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


" vim-bufkill
map <C-l> :bn<CR>
map <C-h> :bp<CR>
map <C-c> :BD<CR>



" NERDTree
" 映射 F2 隐藏显示 NERDTree
map <F2> :NERDTreeTabsToggle<CR>
" 宽度
let g:NERDTreeWinSize=20
" 打开目录时显示在左侧
let g:nerdtree_tabs_open_on_console_startup = 2



" tagbar
nmap <F3> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
" 设置tagbar的宽度为30列，默认40
" let g:tagbar_width = 30
let g:tagbar_sort = 0 


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" 每次自动调用 :SyntasticSetLocList, 将错误覆盖 **quickfix**
let g:syntastic_always_populate_loc_list = 1
" 自动拉起/关闭错误窗口, 不需要手动调用 :Errors
let g:syntastic_auto_loc_list = 1
" 自动高亮显示错误
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" let g:syntastic_c_compiler_options = ''
map <F4> :SyntasticToggleMode<CR>
" Python flake8
let g:syntastic_python_checkers = ['flake8']


" autoformat
noremap <F5> :Autoformat<CR>
let g:autoformat_verbosemode=1
let g:formatters_python = ['autopep8']
let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"


" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMixed<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


" ack.vim
nnoremap <Leader>a :Ack<space>
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif


" Cscope 设置
if has("cscope")
    set csprg=/usr/bin/cscope   " 指定用来执行cscope的命令
    set csto=0                  " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库"
    set cst                     " 同时搜索cscope数据库和标签文件"
    set cscopequickfix=s-,c-,d-,i-,t-,e-    " 使用QuickFix窗口来显示cscope查找结果"
    set nocsverb
    if filereadable("cscope.out")    " 若当前目录下存在cscope数据库，添加该数据库到vim
        cs add cscope.out
    elseif $CSCOPE_DB != ""            " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim
        cs add $CSCOPE_DB
    endif
    set csverb
endif
" map <F5> :!cscope -Rbkq<CR>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>

map <F12> :!cscope -Rbkq<CR>
map <F11> :cs add ./cscope.out .<CR>
"对:cs find c等Cscope查找命令进行映射
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR><CR>
nmap <leader>o :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>
"" 设定是否使用 quickfix 窗口来显示 cscope 结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
