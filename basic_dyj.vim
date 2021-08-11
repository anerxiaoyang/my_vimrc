" Description:   The basic settings of vim configuration
" Maintainer:    lamb_deng
" Website:
" Created Time:  2021-07-18 16:08:05
" Last Modified:
" File:          basic_dyj.vim
" License:       MIT




"config from yuanyapeng
set number
set ruler
set showmatch
set autoindent
set nowrap
set nowrapscan
set tabstop=4
set shiftwidth=4
set cmdheight=1
set expandtab
set gfn=FiraCode\ NF:h15
set tags+=.../tags
set autochdir
colorschem desert


"my config
"

"""""""""""""""""""""""""""""""""""""""""
"""""""""使用设置"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\

" 高亮显示匹配的括号
set showmatch

"搜索忽略大小写
"set ignorecase

" 显示行号
set number

" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 设置当文件被改动时自动载入
set autoread

"共享剪贴板  
set clipboard+=unnamed

"关闭兼容模式，用于避免老版本的bug和局限
set nocompatible

"
set backspace=indent,eol,start
"换行时与上一行有相同的缩进方式
set autoindent
set cindent
" 为C程序提供自动缩进
set smartindent

"在修改文件的时候，会生成一个老版本的备份，文件以.~结尾
"if has("vms")
"    set nobackup
"else
"    set backup
"endif

"历史记录数
set history=1000

"在右下角显示光标所在的行列信息
set ruler

"在右下角显示normal mode下的正在输入的命令
set showcmd

"在visual mode下选择内容能按  p  将选择的内容替换为缓冲区的内容
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

"语法高亮
syntax on

"搜索时匹配字符高亮
set hlsearch

"
filetype plugin indent on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on

"补全选项，建议一定将noselect选项加上
"关于补全的脚本在 (apc.vim)vim-auto-popmenu 内容
set completeopt=preview,menu,menuone,noselect,longest

"给一个词语加上(),{},[],"",''，<>  缺点是使用的时候需要在normal mode，且把光标放在单词词首（b是移动光标到单词词首）
nnoremap ( i(<Esc>ea)<Esc>
nnoremap { i{<Esc>ea}<Esc>
nnoremap [ i[<Esc>ea]<Esc>
nnoremap " i"<Esc>ea"<Esc>
nnoremap ' i'<Esc>ea'<Esc>
"nnoremap < i<<Esc>ea><Esc>

"在insert mode自动打出成对的(),{},[],"",'',<>
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
"inoremap < <><Esc>i



"翻页的时候顶部或底部保留5行内容
set scrolloff=5

"将数字0-9、可打印希腊文（还是阿拉丁文？）、下划线、连接符视为单词字符
set iskeyword=@,48-57,192-255,_,-,$,@,%,#

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"将光标所在行上移或下移（另一个版本），配合数字使用是2]e将当前行下移两行（]e可以，我自定义的[k、]j带数字不行）
"nnoremap [k :<c-u>execute 'move -1-'. v:count1<cr>
"nnoremap ]j :<c-u>execute 'move +'. v:count1<cr>

"在当前窗口对所在行高亮，但在插入模式关闭这个效果，然而我在neovim试了没用
"autocmd IesertLeave,WinEnter * set cursorline
"autocmd InsertEnter,WinLeave * set nocursorline
"这是高亮当前行另一种写法
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul
" 突出显示当前行
set cursorline 

"状态行显示的内容
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m%y\ -\ %H:%M\")}

"启动显示状态行（1），总是显示状态行（2）
set laststatus=1

"允许折叠
set foldenable
"手动折叠
set foldmethod=manual

"显示中文帮助
if version >= 603
    set helplang=cn
    set langmenu=zh_CN.UTF-8
    set encoding=utf-8
endif

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
"set report=0

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
"set mouse=a
"set selection=exclusive
"set selectmode=mouse,key

" For regular expressions turn magic on
set magic

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext 

"在本行与上行/下行之间，在insert mode插入一个空行，且具有相应行缩进
inoremap <c-shift-o> <Esc>k$o
inoremap <c-o> <Esc>$o

"在insert mode自定义begin end
inoremap <c-b> begin<cr>end<Esc>k$o

"在insert mode下自定义一个always模块
inoremap <c-a> always @(posedge clk or negedge rst_n) begin<cr>end<Esc>k$oif (!rst_n) begin<cr>end<cr>else begin<cr>end<Esc>3k$o



"""""""""""""""""""""""""""""""""""""""""
"""""""""新文件标题""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
"但是经过我实际测试，不适用于v和sv文件
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: ma6174") 
        call append(line(".")+2, "\# mail: ma6174@163.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "  > Author: ma6174") 
        call append(line(".")+2, "  > Mail: ma6174@163.com ") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "   if &filetype == 'java'
    "       call append(line(".")+6,"public class ".expand("%"))
    "       call append(line(".")+7,"")
    "   endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

"""""""""""""""""""""""""""""""""""""""""
"""""""""键盘命令"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" 映射全选+复制 ctrl+a
nnoremap <C-a> ggVGY
"去空行
"vnoremap <F2> :g/^\s*$/d<cr>
"比较文件  
"nnoremap <C-F2> :vert diffsplit 
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'py'
        exec "!python %"
        exec "!python %<"
    endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %<"
    exec "!gdb ./%<"
endfunc


"打开文件时恢复光标位置(网上找的)
"autocmd BufReadPost *
"    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif
" 定位到退出位置并移动到屏幕中央(gyf)
augroup return_exit_positon
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif | normal! zvzz
augroup END

augroup update_last_modified_on_write
  autocmd!
  autocmd BufWritePre * call functions#UpdateLastModified()
augroup END

augroup nolist_group
    autocmd!
    autocmd FileType help,git,gitcommit setlocal nolist | setlocal nonumber | setlocal norelativenumber | setlocal signcolumn=no
augroup END

augroup q_for_quit_on_helpfile_group
    autocmd!
    autocmd FileType help nnoremap <silent> <buffer> q :bwipeout<cr>
augroup END
            

