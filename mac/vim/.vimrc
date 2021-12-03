"快捷操作映射
let mapleader=" "
"set encoding="utf-8"

"为防止在有些环境中无法识别，请务必将所有前导符写成<Leader>
"而非<Leader>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wq :wq<CR>
nmap <Leader>o :CtrlP<CR>
nmap <Leader>ls :ls<CR>
inoremap jj <ESC>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <c-o>gj
inoremap <c-k> <c-o>gk
inoremap <c-n> <c-o>o
inoremap <c-d> <c-o>s
inoremap <c-b> <backspace>

"force write
nmap <Leader>fw :w !sudo tee %<CR>

"show line num
nmap <Leader>sn :set nu<CR>
nmap <Leader>snn :set nonu<CR>


"折叠
nmap zu zO
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码

"set foldclose=all          " 设置为自动关闭折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"窗口快捷键映射
nmap <Leader>ws <C-w>s
nmap <Leader>wv <C-w>v
nmap <Leader>wh  <C-w>h
nmap <Leader>wj <C-w>j
nmap <Leader>wk <C-w>k
nmap <Leader>wl <C-w>l


"允许退格删除和tab操作
set smartindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
"set textwidth=79
set autoindent
set showmatch


set nocompatible " 关闭vi兼容模式


" Vundle插件管理配置
" Vundle可管理的插件分为三类
" 一直接在vim-scripts仓库里的，格式为Bundle '插件名'
" 二位于github网站上的插件 Bundle '作者名/插件名'
" 三其他插件， Bundle '插件的完整仓库地址(git协议)'
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'  "GUI模式主题
Plugin 'jnurmine/Zenburn' "终端模式主题
Plugin 'Valloric/YouCompleteMe'     "YCM通过Vundle安装完成后还需要到其下载目录下执行./install.py进行编译安装
Plugin 'vim-scripts/indentpython.vim'   "python自动缩进插件
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'plasticboy/vim-markdown' "markdown插件　
Plugin 'Chiel92/vim-autoformat' "格式化查件，是个格式化框架　
Plugin 'Lokaltog/vim-easymotion' "快速跳转
Plugin 'scrooloose/nerdcommenter' "注释插件
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/emmet-vim'
call vundle#end()




"主题设置
if has('gui_running')
    set background=dark
    colorscheme solarized
endif

filetype plugin on
syntax on "语法高亮
filetype plugin indent on "依文件类型进行自动缩进

set ruler "状态栏显示行列号
set nu "显示行号
set showcmd "在状态栏显示正在输入的命令
set cursorline "高亮显示当前行
set cursorcolumn "高亮显示当前列
set hlsearch  "高亮显示搜索结果

"状态栏配置，主要通过airline插件实现
set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"启用tab功能
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap t1 <Plug>AirlineSelectTab1
nmap t2 <Plug>AirlineSelectTab2
nmap t3 <Plug>AirlineSelectTab3
nmap t4 <Plug>AirlineSelectTab4
nmap t5 <Plug>AirlineSelectTab5
nmap t6 <Plug>AirlineSelectTab6
nmap t7 <Plug>AirlineSelectTab7
nmap t8 <Plug>AirlineSelectTab8
nmap t9 <Plug>AirlineSelectTab9
nmap th <Plug>AirlineSelectPrevTab
nmap tl <Plug>AirlineSelectNextTab

let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" YouCompleteMe配置
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
nnoremap <Leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>   "按jd 会跳转到定义
let g:ycm_confirm_extra_conf=0    "打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_sematic_triggers={
            \'javascript':['.','re!(?=[a-zA-Z]{3,4})'],
            \'html':['<','"','</',''],
            \'scss,css':['re!^\s{2,4}','re!:\s+']
            \}
set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


"Syntastic查件配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" python 配置
let python_highlight_all=1



" NerdTree配置
nmap <F2> : NERDTreeToggle<CR>
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1

"Autoformat配置
noremap <F3> :Autoformat<CR>
nnoremap <Leader>fa gg=G :retab<CR> :RemoveTrailingSpaces<CR>
"EasyMotion配置
map <Leader>f <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)
map <Leader>h <Plug>(easymotion-linebackend)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>s <Plug>(easymotion-s)

"NerdCommenter配置
"插入模式进行注释
imap <C-m> <plug>NERDCommenterInsert 
"<leader>cc   加注释
"<leader>cu   解开注释
"<leader>c<space>  加上/解开注释, 智能判断
"<leader>cy   先复制, 再注解(p可以进行黏贴)

"Emmet插件配置，该插件可以自动插入snippets
let g:user_emmet_mode='a'
let g:user_emmet_leader_key='<c-e>' "emmet插件触发leader键Ctrl+e
"<c-e>n：到下一个编辑点
"<c-e>N：到上一个编辑点
"<c-e>d：选中整个标签
"<c-e>D：选中整个标签的内容
"<c-e>k：删除当前标签
"<c-e>/ :注释html


"前端设置
let g:syntastic_javsacript_checkers = ['eslint']
let javascript_enable_domhtmlcss = 1



"<F5>编译与运行
"python
func! RunPython()
    exec "!python %"
endfunc

func! RunDjango()
    exec "!python manage.py runserver"
endfunc

func! Run()
    exec "w"
    if search("manage.py")!=0 && &filetype=="py"
        exec "call RunDjango()"
    elseif &filetype=="py"
        exec "!python %"
    elseif &filetype=='html'
        exec "!exec google-chrome %"
    endif
    
endfunc

map <F5> :call Run()<CR>
imap <F5> <ESC>:call Run()<CR>
vmap <F5> <ESC>:call Run()<CR>
