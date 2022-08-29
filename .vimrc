set nocompatible              " required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jakwings/vim-colors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'taglist.vim'
Plugin 'Yggdroot/indentLine'
Bundle 'tmhedberg/SimpylFold'
Plugin 'joshdick/onedark.vim'
Plugin 'bronson/vim-trailing-whitespace'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required
autocmd bufwritepost ~/.vimrc source ~/.vimrc
set helplang=cn
if version >= 603
    set helplang=cn
    set encoding=utf-8
endif
set enc=utf-8
set encoding=utf-8 fileencodings=utf-8
set number
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条"
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set cursorline                  "突出显示当前行"
set cursorcolumn                "突出显示当前列"
set langmenu=zh_CN.UTF-8        "显示中文菜单
" 变成辅助 -------------------------------------
syntax on                           "开启语法高亮
set nowrap                      "设置代码不折行"
set noswapfile
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set autoindent
set fileformat=unix             "设置以unix的格式保存文件"
set cindent                     "设置C样式的缩进格式"
set tabstop=4                   "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=4                "每一级缩进是多少个空格
set backspace+=indent,eol,start "set backspace&可以对其重置
set showmatch                   "显示匹配的括号"
set scrolloff=5                 "距离顶部和底部5行"
set laststatus=2                "命令行为两行"
" 其他杂项 -------------------------------------
set mouse=a                     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase                  "忽略大小写"
set incsearch
set hlsearch                    "高亮搜索项"
autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
"set noexpandtab                 "不允许扩展table"
set whichwrap+=<,>,h,l
"使用F3键快速调出和隐藏它
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25
" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 打开vim时自动打开NERDTree
"autocmd vimenter * NERDTree
"How can I open NERDTree automatically when vim starts up on opening a directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 开发的过程中，我们希望git信息直接在NERDTree中显示出来， 和Eclipse一样，修改的文件和增加的文件都给出相应的标注， 这时需要安装的插件就是 nerdtree-git-plu
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let Tlist_Use_Right_Window = 1          "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1      "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。

let Tlist_Show_One_File = 1             "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name'             "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序

let Tlist_GainFocus_On_ToggleOpen = 1       "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1           "如果taglist窗口是最后一个窗口，则退出vim

let Tlist_WinWidth = 32             "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd='/usr/bin/ctags'  "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个

map <F2> :TlistToggle<CR>              "热键设置，我设置成Leader+t来呼出和关闭Taglist
" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'
" 使indentline生效
let g:indentLine_enabled = 0
" 必须手动输入za来折叠（和取消折叠）
set foldmethod=indent                " 根据每行的缩进开启折叠
set foldlevel=99
" 使用空格键会是更好的选择,所以在你的配置文件中加上这一行命令吧：
nnoremap <space> za
" 希望看到折叠代码的文档字符串？
let g:SimpylFold_docstring_preview=1
" nerdcommenter默认热键<leader>为'\'，这里将热键设置为','
let mapleader=','

" 设置注释快捷键
map <F4> <leader>ci<CR>
colorscheme desert

if has('mouse')
    set mouse-=a
endif
map <c-]> g<c-]>

" 状态行
set laststatus=2
highlight StatusLine cterm=bold ctermfg=white ctermbg=blue
set statusline=%f%m%r%h%w\[POS=%l,%v][%p%%]\[%{&fileformat}]\[%{&encoding}]\[%{strftime(\"%Y-%m-%d\ %H:%M:%S\")}]

" 新建或修改文件的注释
map <F4> :call AddTitleForLua()<cr>'s
"创建文件时自动生成注释
autocmd BufNewFile *.lua exec ":call AddTitleForLua()"
function AddTitleForLua()
    call append(0,"--[[")
    call append(1,"*  @Company: Junhai")
    call append(2,"*  @Author: huangxufeng")
    call append(3,"*  @Email: huangxufeng@ijunhai.com")
    call append(4,"*  @Date: ".strftime("%Y-%m-%d %H:%M"))
    call append(5,"*  LastEditors: huangxufeng")
    call append(6,"*  LastEditTime: ".strftime("%Y-%m-%d %H:%M"))
    call append(7,"*  @Description: ")
    call append(8,"--]]")
endfunction

" luacheck 保存时检查lua语法
function! s:MyBufList()
    let checkfile = getcwd() . "/tools/gitlab_ci/check_single_file_format.sh"
    if !filereadable(checkfile)
        let checkfile = getcwd() . "/tools/check_single_file_format.sh"
    endif

    if filereadable(checkfile)
        let cmdstr = "sh " . checkfile . " " . expand('%p')
        let errmsg = system(cmdstr)
        if v:shell_error == 1
            echo errmsg
        elseif matchstr(errmsg, "0 warnings / 0 errors") == ""
            echo errmsg
        endif
    endif
endfunction

autocmd BufWritePost *.lua :call s:MyBufList()

