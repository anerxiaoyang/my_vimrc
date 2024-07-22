" Description:   The basic settings of vim configuration
" Maintainer:    lamb_deng
" Website:
" Created Time:  2021-07-18 16:08:05
" Version:
"          2021-07-18: init version
"          2024--7-22: add vim rules from jason
" Last Modified:
" File:          basic_dyj.vim
" License:       MIT

"""""""""""""""""""""""""""""""""""""""""
" 一般设置
"""""""""""""""""""""""""""""""""""""""""
" 设置默认解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 关闭兼容模式，用于避免老版本的bug和局限
set nocompatible

" 历史记录数
set history=1000

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=! 
set lines=50 columns=120

" 将数字0-9、可打印希腊文（还是阿拉丁文？）、下划线、连接符视为单词字符
"set iskeyword=48-57,192-255,_,-,$,@,%,#
set iskeyword=48-57,192-255,_,-,@,%,#

" 语法高亮
syntax on

" 高亮字符，让其不受100列限制
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%101v.*'

" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"共享剪贴板  
set clipboard+=unnamed

"在右下角显示normal mode下的正在输入的命令
set showcmd

"显示中文帮助
if version >= 603
    set helplang=cn
    set langmenu=zh_CN.UTF-8
    set encoding=utf-8
endif

" For regular expressions turn magic on
set magic

"""""""""""""""""""""""""""""""""""""""""
" plugin
"""""""""""""""""""""""""""""""""""""""""
" 使用Vunble管理vim插件, Vundle需要安装
" https://zhuanlan.zhihu.com/p/34478059/
" https://blog.csdn.net/lyshark_lyshark/article/details/125846990
" https://blog.csdn.net/qq_42570601/article/details/120368712
" https://blog.csdn.net/u013496080/article/details/85649242
" https://blog.csdn.net/zzyczzyc/article/details/83244516
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" nerdtree就是需要管理的插件，其它插件类似，nerdtree也需要安装？
" https://github.com/preservim/nerdtree
Plugin 'nerdtree'
call vundle#end

map <F1> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要而设置）
set nobackup
"在修改文件的时候，会生成一个老版本的备份，文件以.~结尾
"if has("vms")
"    set nobackup
"else
"    set backup
"endif

" 显示行号
set number

" 搜索模式包含大写字母，则搜索将区分大小写。如果搜索模式全部为小写字母，则搜索将不区分大小写
set smartcase

" 突出显示当前行
set cursorline

" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 在插入模式下，会把按 Tab 键所插入的 tab 字符替换为合适数目的空格。如果确实要插入 tab 字符，需要按 CTRL-V 键，再按 Tab 键
set expandtab

" 不要生成swap文件，当buffer被丢弃的是否隐藏它
setlocal noswapfile
set bufhidden=hide

" 字符间插入的像素行数目
set linespace=0

" 在状态行显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %31\ %c\ %p%%%)

" 命令行（在状态行下）的高度，默认为1
set cmdheight=1

" 使回格键（backspase）正常处理indent，eol，start等
set backspace=2

" 允许baskspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
" set mouse=a
" set selection=exclusive
" set selectmode=mouse,key

" 在启动的时候不显示援助索马里儿童的提示
set shortmess=atI

" 通过使用：commands命令，告诉我们文件的哪一行被改变过
set report=0

" 在被分割的窗口显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\ 

" 可以让vim 根据编辑的文件自动切换工作目录
set autochdir

" 设置当文件被改动时自动载入
set autoread

"在visual mode下选择内容能按  p  将选择的内容替换为缓冲区的内容
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

"""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 搜索忽略大小写
"set ignorecase

" 搜索时匹配字符高亮
set hlsearch

" 在搜索时，输入的词句逐字3高亮（类似firefox的搜索）
" set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$ 

"翻页的时候顶部或底部保留5行内容
set scrolloff=5

" 我的装填行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d%m%y\ -\ %H:%M\")}

" 启动显示状态行（1），总是显示状态行（2）
set laststatus=2

" 禁止在搜索到达文件两端时，又从另一端开始
set nowrapscan

"""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent

" 不要换行显示
set nowrap

" 在行和段开始处使用制表符
set smarttab

"""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""
" 按照名称排序
let Tlist_Sort_Type = "name"

" 在右侧显示窗口
let Tlist_Use_Right_Window = 1

" 压缩方式
let Tlist_Compart_Format = 1

" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1

" 不要关闭其它文件的tags
let Tlist_File_Fold_Auto_Close = 0

" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0

set tags+=.../tags

"""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
autocmd FileType xml,html xsl source $VIMRUNTIME/plugin/closetag.vim
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe " normal g`\"" |
\ endif
endif "has("autocmd")

" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./两个字符

" C的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc

" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

map ff :call SetLeftWindow()<CR>
func! SetLeftWindow()
    winpos 10 0
    set lines=50 columns=210
endfunc

map fg :call SetRightWindow()<CR>
func! SetRightWindow()
    winpos 2565 0
    set lines=50 columns=210
endfunc

" 能够漂亮地显示.NFO文件
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,gb2312,big5,euc-jp,euc-kr,latin1

function! SetFileEncodings(encodings)
let b:myfileencodingsbak=&fileencodings
let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
let &fileencodings=b:myfileencodingsbak
unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single au BufReadPost *.nfo call RestoreFileEncodings()

" 高亮显示普通txt文件（需要txt.vim）-> 但是没有找到这个txt.vim文件
au BufRead,BufNewFile * setfiletype txt

" 用空格键来开关折叠
set foldenable
"手动折叠
set foldmethod=marker
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc':'zo')<CR>

" minibufexpl插件的一般设置   -> 我认为minibufexpl是Vundle自安装的一个插件
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" 不让vim发出讨厌的滴滴声
" 不要闪烁
set novisualbell
set vb t_vb=
au GuiEnter * set t_vb=

"设置命令模式下命令的自动补全行为，1：bash shell行为，2：zsh行为
"1
set wildmode=longest,list
"2
"set wildmenu
"set wildmode=full

"补全选项，建议一定将noselect选项加上
"关于补全的脚本在 (apc.vim)vim-auto-popmenu 内容
set completeopt=preview,menu,menuone,noselect,longest

"""""""""""""""""""""""""""""""""""""""""
" color scheme
"""""""""""""""""""""""""""""""""""""""""
set background=dark
"colo termschool
"colo pink-moon
colo yellow-moon
"colo orange-moon

if(!has("gui_running"))
    set background=light
    colo seoul256-light
endif

if(match(hostname(), 'ionode..') >= 0)
    set guifont=Monospace\ 18
else
    set guifont=DejaVu\ Sans\ Mono\ 18
endif

" old color scheme
"set gfn=FiraCode\ NF:h15
"set gfn=Courier\ 10\ Pitch\ 14
"colorschem desert


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
" 映射全选+复制 ctrl+a -> 舍弃，保留vim原有功能，数字加1（ctrl+x，数字减1）
"nnoremap <C-a> ggVGY
"去空行
"vnoremap <F2> :g/^\s*$/d<cr>
"比较文件  
"nnoremap <C-F2> :vert diffsplit 

"""""""""""""""""""""""""""""""""""""""""
" 个人设置
"""""""""""""""""""""""""""""""""""""""""
"在visual mode下选择内容能按  p  将选择的内容替换为缓冲区的内容
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" 展示完搜索结果后，取消搜索结果高亮
map <silent> <leader><cr> :noh<cr>

"给一个词语加上(),{},[],"",''，<>  缺点是使用的时候需要在normal mode，且把光标放在单词词首（b是移动光标到单词词首）
nnoremap ( bi(<Esc>ea)<Esc>
nnoremap { bi{<Esc>ea}<Esc>
nnoremap [ bi[<Esc>ea]<Esc>
nnoremap " bi"<Esc>ea"<Esc>
nnoremap ' bi'<Esc>ea'<Esc>
"nnoremap < bi<<Esc>ea><Esc>

"在insert mode自动打出成对的(),{},[],"",'',<>
inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
"inoremap < <><Esc>i

"在insert mode自动打出只想打出单个的(,{,[,"
inoremap <M-(> (
inoremap <M-{> {
inoremap <M-[> [
inoremap <M-"> "

" 使用ALT+[jk]在normal mode移动鼠标所在行， or Command+[jk] on mac
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

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext 

"在本行与上行/下行之间，在insert mode插入一个空行，且具有相应行缩进
inoremap <c-o> <Esc>k$o

"在insert mode自定义begin end
"inoremap <c-b> begin<cr>end<Esc>k$o

"在insert mode下自定义一个always模块
"inoremap <c-a> always @(posedge clk or negedge rst_n) begin<cr>end<Esc>k$oif (!rst_n) begin<cr>end<cr>else begin<cr>end<Esc>3k$o

"打开文件时恢复光标位置(网上找的)
"autocmd BufReadPost *
"    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif
" 定位到退出位置并移动到屏幕中央(gyf)
" It runs perfect on my nvim
" But meet bugs that I don't understand on lexin'vim
" Forgive me, I am just a vim fool
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

"set for ctags
map <silent> <leader>w <c-w>}

"match the key words that I defined
"exclude this vimrc settings, you should do these steps:
"1: cd ~/.vim
"2: cd plugin
"3: cp $VIMRUNTIME/macros/matchit.vim ~/.vim/plugin
"4: if step 3 wrong, display Undefined VINRUNTIME, you can open vim, and put this: echo $VIMRUNTIME
let b:match_word='\<begin\>:\<end\>,'
    \ . '\<`ifdef\>:\<`elsif\>:\<`else\>:\<`endif\>,'
    \ . '\<if>:\<else if\>:\<else\>,'
    \ . '\<module\>:\<endmodule\>'
let b:matchit_ignorecase=1  "hue nue da xiao xie
" now you can use % to tiao lai tiao qu
            
"启用下侧滚动条
set go+=b



"一个gvim中不同缓冲区之间的切换
nnoremap <silent> <leader>n :bnest<CR>
nnoremap <silent> <leader>p :bprevious<CR>
nnoremap <silent> <leader>f :bfirst<CR>
nnoremap <silent> <leader>l :blast<CR>

"缺省情况下，普通模式/可视模式下，*会对光标下的单词进行搜索
"现进行重定义，可视模式下，*会正向搜索当前选择区文本，#会反向搜索当前选择区文本
"来自vim实用技巧87
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap * :<C-u>call <SID>VSetSearch('?')<CR>/<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

"in visual or normal mode, mask or unmask chosed line(s)
normap <silent> <leader>/ I//<Esc>
normap <silent> <leader><leader>/ 0f/xx
xnormap <silent> <leader>/ :\/<CR>
xnormap <silent> <leader><leader>/ :\\/<CR>

normap <silent> <leader># I#<Esc>
normap <silent> <leader><leader># 0f#x
xnormap <silent> <leader># :\#<CR>
xnormap <silent> <leader><leader># :\\#<CR>

" shift+鼠标左击，会将搜索的单词跳往下一个匹配字符，按F2不会跳往，继续停留在当前字符（确定，所选字符会变成现实的中间行）
map <F2> :keepjumps normal! *N<CR>
