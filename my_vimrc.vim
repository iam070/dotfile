"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       iam070@qq.com
"       Modified based on Amir Salihefendic http://amix.dk - amix@amix.dk
" For linux:
"       mkdir or link ~/.vimrc with my_vimrc
"       install the vimplug, see the comment on VimplugInit()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let $LANG = 'en'  "set message language
set langmenu=en   "set menu's language of gvim. no spaces beside '='

" let g:workspace = ""
let g:OS_WINDOWS = "windows"
let g:OS_LINUX = "linux"
let g:OS_UNKNOWN = "unknown"


""""{ true, 'm', "modifiedFile",  "modified files"},
""""{ true, 'n', "newFile",       "newly created files"},
""""{ true, 'd', "deletedFile",   "deleted files"},
""""{ true, 'h', "hunk",          "hunks"},

"   let type_python.kind2scope = {
"       \ 'c' : 'class',
"       \ 'f' : 'function',
"       \ 'm' : 'function'
"   \ }
"   let type_python.scope2kind = {
"       \ 'class'    : 'c',
"       \ 'function' : 'f'
"   \ }

" scope2kind: 根据key找到value对应的kinds成员
" kind2scope: 根据key找到value对应的
let g:tagbar_type_diff = {
    \ 'ctagstype' : 'diff',
    \ 'ctagsargs' : '-f - --fields=nksSa',
    \ 'sro' : ':',
    \ 'kinds'     : [
        \ 'm:modifiedFile:0:0',
        \ 'h:hunk:0:0',
        \ 'n:newFile:0:0',
        \ 'd:deletedFile:0:0',
        \ ],
    \ 'scope2kind' : {
        \ 'modifiedFile' : 'm',
    \ },
    \ 'kind2scope' : {
        \ 'm' : 'modifiedFile',
    \ }
\ }

" vundle or vim-plug
function! SetupLeaderKey()
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","
endfunction

function! GetOS()
    if has("win32") || has("win64")
        return g:OS_WINDOWS
    elseif has("unix")
        return g:OS_LINUX
    else
        return g:OS_UNKNOWN
    endif
endfunction

function! OSIsLinux()
    if GetOS() == g:OS_LINUX
        return 1
    else
        return 0
    endif
endfunction

function! GetDefaultVimrc()
    if GetOS() == g:OS_WINDOWS
        return "$VIM/_vimrc"
    else
        return "~/.vimrc"
    endif
endfunction

function! GetDefaultBufferVimrc()
    if GetOS() == "windows"
        return "_vimrc"
    else
        return ".vimrc"
    endif
endfunction

function! GetPluginPath()
    let path ='~/.vim/plugged'
    return path
endfunction

" vundle require special setup before init
function! SetupBeforePluginMgrInit()
    set nocompatible
    filetype on
endfunction

function! VimplugInit()
    " Installation:
    " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "
    " basic use
    "   call plug#begin()
    "   Plug 'tpope/vim-sensible'
    "   call plug#end()

    call plug#begin(GetPluginPath())

    """"""""""""""""""""""""""""""
    " => file/project/session manage plugins
    """"""""""""""""""""""""""""""
    " sessions manage
    Plug 'vim-scripts/sessionman.vim'

    " Ctrl+p for file search
    Plug 'kien/ctrlp.vim'

    " multiple context
    Plug 'dyng/ctrlsf.vim'

    " a file explorer
    Plug 'mbbill/VimExplorer'

    " tree browser
    Plug 'scrooloose/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'iam070/nerdtree-svn-plugin'

    " mostly recent use
    " Plug 'mru.vim'

    " buffer list explorer
    " Plug 'bufexplorer.zip'
    Plug 'sandeepcr529/Buffet.vim'

    Plug 'drmikehenry/vim-fontsize'

    """"""""""""""""""""""""""""""
    " => Snippets plugins
    "    XXX: currently those snips will conflict with YouCompleteMe
    """"""""""""""""""""""""""""""
    " Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

    """"""""""""""""""""""""""""""
    " => UI looks
    """"""""""""""""""""""""""""""
    " rainbow parentheses, make colors
    Plug 'kien/rainbow_parentheses.vim'

    " set color columns
    Plug 'iam070/colorcolumn2'

    " highlight the trailing whitespace in the end of lines
    Plug 'ntpeters/vim-better-whitespace'

    " symbol char for indent
    "   XXX: should be disable in vimwiki
    Plug 'Yggdroot/indentLine'

    " multiple colorful mark for words
    Plug 'vim-scripts/Mark--Karkat'

    " highlight for markdown
    Plug 'plasticboy/vim-markdown'

    " a explorer for preview colorscheme, some bugs fixed
    Plug 'iam070/colorSchemeExplorer'

    " vim color schemes, a big collection package
    Plug 'flazz/vim-colorschemes'

    " Those two colorscheme are already in the vim-colorschemes package
    " a nice color scheme, five starts
    "   Plug 'molokai'
    " another nice color scheme, five starts
    "   Plug 'altercation/vim-colors-solarized'

    " beautiful statue line
    Plug 'bling/vim-airline'

    " official themes for air line
    Plug 'vim-airline/vim-airline-themes'

    " visual mark
    Plug 'kshenoy/vim-signature'

    " some bugs?
    " Plug 'Highlight-and-Mark-Lines'

    " tab manager
    Plug 'kien/tabman.vim'

    Plug 'Raimondi/delimitMate'

    " a emacs-like tmp buffer
    Plug 'mtth/scratch.vim'

    " Five years passed, i still cannot handle the window resize command. :-(
    " :-) to press <C-e>.
    Plug 'simeji/winresizer'

    " show #EEEEEE color
    " Plug 'lilydjwg/colorizer'


    " preview for patch, little useful
    Plug 'junkblocker/patchreview-vim'

    " text align
    Plug 'godlygeek/tabular'

    " quick move, like a jet
    Plug 'easymotion/vim-easymotion'

    " a screen saver
    Plug 'uguu-org/vim-matrix-screensaver'

    " draw in vim
    Plug 'vim-scripts/drawit'

    " run shell in vim
    Plug 'oplatek/Conque-Shell'

    " undo tree history
    Plug 'mbbill/undotree'

    """"""""""""""""""""""""""""""
    " => Comment tools
    """"""""""""""""""""""""""""""
    " commentary for multiply lines
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-scripts/DoxygenToolkit.vim'

    " quickly add/del/change surround
    Plug 'tpope/vim-surround'

    " Ctrl-N to mark multiple location to work
    Plug 'kristijanhusak/vim-multiple-cursors'


    """"""""""""""""""""""""""""""
    " => Programming tools
    """"""""""""""""""""""""""""""

    " a very excellent completer for c/c++ or others, little hard to install now.
    " run in YouComplete folder:
    "   ./install.py --clang-completer
    Plug 'Valloric/YouCompleteMe'

    " easy way to generate .ycm_extra_conf for YouCompleteMe
    " Plug 'rdnetto/YCM-Generator'

    " go language support
    "   Plug 'fatih/vim-go'

    " a java completer and grammer
    "   XXX: can eclipse run in shell?
    "   Plug 'mattn/emmet-vim'

    " python completer?
    "   Plug 'Pydiction'

    " show diff info in sign column
    "   Plug 'airblade/vim-gitgutter'
    " the original svngutter will cause lag with long svn log history
    "   Plug 'iam070/vim-svngutter'

    " a more powerful diff sign, replace git/svn gutter
    Plug 'mhinz/vim-signify'

    Plug 'will133/vim-dirdiff'

    Plug 'majutsushi/tagbar'

    " tradictional tags
    Plug 'vim-scripts/ctags.vim'

    " gtags >= ctags + cscope ?
    Plug 'vim-scripts/gtags.vim'

    Plug 'multilobyte/gtags-cscope'

    " a nice git integrate to vim
    Plug 'tpope/vim-fugitive'

    " grammer check
    Plug 'scrooloose/syntastic'

    " vim script lint
    Plug 'syngan/vim-vimlint'

    " python checker
    Plug 'kevinw/pyflakes-vim'


    """"""""""""""""""""""""""""""
    " => Misc
    """"""""""""""""""""""""""""""
    " personal vimki
    Plug 'vimwiki/vimwiki'
    " clone of emac org-mode
    Plug 'jceb/vim-orgmode'
    " personal calandar
    Plug 'itchyny/calendar.vim'

    " unite and related
    Plug 'Shougo/unite.vim'
    " session manage
    Plug 'Shougo/unite-session'
    " gtags via unite
    Plug 'hewes/unite-gtags'

    " bookmark via unite
    " Plug 'MattesGroeger/vim-bookmarks'

    " search
    Plug 'dkprice/vim-easygrep'

    " fly grep
    Plug 'wsdjeg/FlyGrep.vim'

    " Yank manage
    " Plug 'YankRing.vim'

    " vim-plug requird
    call plug#end()
    filetype plugin indent on
endfunction " end of VimplugInit()

function! SetupPluginMgr()
    call VimplugInit()
endfunction

function! SetupGtagsCscope()
    " AutoMap will map <C-p> to :cp<CR>, conflicting with CtrlP
    "   let g:GtagsCscope_Auto_Map = 1
    " To quiet gtags cscope
    let g:GtagsCscope_Quiet = 1
    " To ignore letter case when searching:
    let g:GtagsCscope_Ignore_Case = 1
    " To use absolute path name:
    let g:GtagsCscope_Absolute_Path = 1
    " To deterring interruption:
    let g:GtagsCscope_Keep_Alive = 1
    " If you hope auto loading:
    let g:GtagsCscope_Auto_Load = 1
    " To use 'vim -t ', ':tag' and ''
    set cscopeprg="gtags-cscope"
    " To auto update tags when a file is saved, may have little lag
    let g:GtagsCscope_Auto_Update = 1
endfunction

function! SetupRainbowParentheses()
    " custom the colors
    let g:rbpt_colorpairs = [
                \ ['brown',       'RoyalBlue3'],
                \ ['Darkblue',    'SeaGreen3'],
                \ ['darkgray',    'DarkOrchid3'],
                \ ['darkgreen',   'firebrick3'],
                \ ['darkcyan',    'RoyalBlue3'],
                \ ['darkred',     'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['brown',       'firebrick3'],
                \ ['gray',        'RoyalBlue3'],
                \ ['black',       'SeaGreen3'],
                \ ['darkmagenta', 'DarkOrchid3'],
                \ ['Darkblue',    'firebrick3'],
                \ ['darkgreen',   'RoyalBlue3'],
                \ ['darkcyan',    'SeaGreen3'],
                \ ['darkred',     'DarkOrchid3'],
                \ ['red',         'firebrick3'],
                \ ]

    let g:rbpt_max = 16

    let g:rbpt_loadcmd_toggle = 0

    " let g:rainbowparent_ignore_filetypes = ['text', 'vimwiki', 'conque_term']

    "" Rainbow Parenthese commands
    ""RainbowParenthesesToggle       " Toggle it on/off
    ""RainbowParenthesesLoadRound    " (), the default when toggling
    ""RainbowParenthesesLoadSquare   " []
    ""RainbowParenthesesLoadBraces   " {}
    ""RainbowParenthesesLoadChevrons " <>
    ""``

    " always on
    au VimEnter * RainbowParenthesesToggle
    " au BufRead,BufNewFile * if ShouldEnableRainbowParenthese() | call RainbowParenthesesToggle | endif
    " au Syntax * RainbowParenthesesLoadRound
    " au Syntax * RainbowParenthesesLoadSquare
    " au Syntax * RainbowParenthesesLoadBraces

endfunction "SetupRainbowParentheses

" after loaded 'flazz/vim-colorschemes'
function! SetupColorScheme()
    set background=dark
    " colorscheme molokai
    colorscheme solarized
    " make the default bg of SignColumn more normally
    highlight clear SignColumn ctermbg guibg
endfunction

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
function! SetupNerdTree()
    " key binding

    " toggle NerdTree
    nmap <silent> <leader>nn :NERDTreeToggle<cr>
    " open curent editing file path
    nmap <silent> <leader>nc :NERDTree %:p:h<cr>
    " open and wait typing
    nmap <leader>nh :NERDTree ~/

    " file filter
    let g:NERDTreeIgnore=['.git$[[dir]]', '.o$[[file]]', '.pyc$[[file]]']

    " nerdtree-git-plugin
"   let g:NERDTreeIndicatorMapCustom = {
"       \ "Modified"  : "✹",
"       \ "Staged"    : "✚",
"       \ "Untracked" : "✭",
"       \ "Renamed"   : "➜",
"       \ "Unmerged"  : "═",
"       \ "Deleted"   : "✖",
"       \ "Dirty"     : "✗",
"       \ "Clean"     : "✔︎",
"       \ "Unknown"   : "?"
"       \ }
endfunction

function! SetupTagbar()
    " sort according by the order in file
    let g:tagbar_sort = 0

    " show absolute line numbers
    let g:tagbar_show_linenumbers = 2

    if GetOS() == g:OS_WINDOWS
        let g:tagbar_ctags_bin = "$VIM/ctags.exe"
    endif

    " Tagbar toggle
    map <silent> <leader>tt :TagbarToggle<cr>

    let g:tagbar_type_vimwiki = {
        \ 'ctagstype'   : "vimwiki",
        \ 'kinds'       : [
            \ 't:todos:0:0',
            \ 'f:finishs:0:0',
            \ 'a:headers:0:0',
            \ 'b:headers:0:0',
            \ 'c:headers:0:0',
            \ 'd:headers:0:0',
            \ 'e:headers:0:0',
        \ ],
        \ 'sort'        : 0,
    \ }

"   \ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/vimwiki.cnf'

    " Tagbar filetype settings
    "let g:tagbar_type_python = {
    "    \ 'kinds' : [
    "        \ 'c:classes',
    "        \ 'i:imports',
    "        \ 'f:functions',
    "        \ 'm:class members',
    "        \ 'v:variables',
    "    \ ]
    "\ }
endfunction " end of SetupTagbar

function! SetupBufexplorer()
    " Show 'No Name' buffers.
    " let g:bufExplorerShowNoName = 1
    " Show unlisted buffers.
    " let g:bufExplorerShowUnlisted = 1
    " nmap <silent> <leader>ls :BufExplorer<CR>
endfunction " end of SetupBufexlorer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupVimrcEdit()
    "Fast editing of .vimrc
    map <silent> <leader>vrce :exec ':e'.GetDefaultVimrc()<cr>
    "Fast reloading of the .vimrc
    map <silent> <leader>vrcs :exec ':source '.GetDefaultVimrc()<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost :call GetDefaultBufferVimrc source :call GetDefaultVimrc()
endfunction " end of cetupVimrcEdic()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupGeneral()
    " Sets how many lines of history VIM has to remember
    set history=700

    " Enable filetype plugins
    filetype plugin on
    filetype indent on

    " Set to auto read when a file is changed from the outside
    set autoread

    " Fast saving
    nmap <leader>w :w!<cr>
    
    " emacs style movement in insert mode
    inoremap <C-F> <Right>
    inoremap <C-B> <Left>
    inoremap <C-N> <Down>
    inoremap <C-P> <Up>
    inoremap <C-A> <Home>
    inoremap <C-E> <End>

    " viminfo for mark save
    set viminfo+=!

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf-8
    set fileencodings=utf-8,gb2312,gb18030
    set fencs=utf8,gbk,gb2312,gb18030

    " Use Unix as the standard file type
    set ffs=unix

    " A buffer becomes hidden when it is abandoned
    set hid

    " Configure backspace so it acts as it should act
    set backspace=eol,start,indent
    set whichwrap+=<,>,h,l

    " Ignore case when searching
    set ignorecase

    " When searching try to be smart about cases
    set smartcase

    " For regular expressions turn magic on
    set magic

    " swap file is annoying
    set nobackup
    set nowb
    set noswapfile

    " Text, tab and indent related
    " Use spaces instead of tabs
    set expandtab

    " Be smart when using tabs ;)
    set smarttab

    " 1 tab == 4 spaces
    set shiftwidth=4
    set tabstop=4

    " Linebreak on 500 characters
    set lbr
    set tw=500

    set cindent
    set nowrap "No wrap lines

    set mouse=v

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupVimUI()
    " Set 7 lines to the cursor - when moving vertically using j/k
    set so=7

    " Turn on the WiLd menu
    set wildmenu

    " Ignore compiled files
    set wildignore=*.o,*~,*.pyc

    "Always show current position
    set ruler

    " Height of the command bar
    "set cmdheight=2

    " Line number
    set nu

    " Highlight search results
    set hlsearch

    " Highlight current line
    set cursorline

    " column 100 highlight
    " set cc=80

    " Makes search act like search in modern browsers
    set incsearch

    " Don't redraw while executing macros (good performance config)
    set lazyredraw


    " Show matching brackets when text indicator is over them
    " set showmatch

    " How many tenths of a second to blink when matching brackets
    " set mat=2

    " No annoying sound on errors
    set noerrorbells
    set novisualbell
    set t_vb=
    set tm=500

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Colors and Fonts
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Enable syntax highlighting
    syntax enable

    nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

    " Set extra options when running in GUI mode
    let g:airline_powerline_fonts=1
    " enable/disable enhanced tabline. (c)
    let g:airline#extensions#tabline#enabled = 1
    " enable/disable displaying open splits per tab (only when tabs are opened). >
    let g:airline#extensions#tabline#show_splits = 1
    " switch position of buffers and tabs on splited tabline (c)
    let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
    " enable/disable displaying buffers with a single tab. (c)
    let g:airline#extensions#tabline#show_buffers = 1
    " enable/disable displaying tabs, regardless of number. (c)
    let g:airline#extensions#tabline#show_tabs = 1
    " enable/disable display preview window buffer in the tabline. >
    let g:airline#extensions#tabline#exclude_preview = 1
    " configure how numbers are displayed in tab mode. >
    let g:airline#extensions#tabline#tab_nr_type = 2 " # of splits (default)
    " enable/disable displaying tab number in tabs mode. >
    let g:airline#extensions#tabline#show_tab_nr = 1
    " enable/disable displaying tab type (far right) >
    let g:airline#extensions#tabline#show_tab_type = 1
    " disable white space check
    let g:airline#extensions#whitespace#enabled = 0

    " theme of airline
    let g:airline_theme='zenburn'

    if has("gui_running")
        set guioptions=""
        set guitablabel=%M\ %t
        if OSIsLinux()
            " linux guifont format may cause gvim cannot startup without any msg
            " in windows
            set guifont=Source\ Code\ Pro\ for\ Powerline\ 14
            " set guifont=Monospace\ 16
            " set guifont=Source\ Code\ Pro\ 14
            " set guifont=DroidSansMonoForPowerline\ Nerd\ Font\ 18
        else
            set guifont=Sauce_Code_Powerline:h14:cANSI
        endif
    else
        set guitablabel=%M\ %t
        set t_Co=256
    endif

endfunction " end of SetupVimUI()

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! SetupMoving()
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => Moving around, tabs, windows and buffers
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Treat long lines as break lines (useful when moving around in them)
    map j gj
    map k gk

    " Smart way to move between windows
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " Close the current buffer
    map <leader>bk :Bclose<cr>
    map <leader>bn :bnext<cr>
    map <leader>bp :bprevious<cr>

    " Close all the buffers
    map <leader>ba :1,1000 bd!<cr>

    " Useful mappings for managing tabs
    map <leader>tc :tabnew<cr>
    map <leader>tk :tabclose<cr>
    map <leader>tm :tabmove
    map <leader>tp :tabprevious<cr>
    map <leader>tn :tabnext<cr>
    map <leader>to :tabonly<cr>

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

    " Switch CWD to the directory of the open buffer
    map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Specify the behavior when switching between buffers
    try
        set switchbuf=useopen,usetab
        set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    " Remember info about open buffers on close
    " set viminfo^=%
endfunction " end of SetupMoving


""""""""""""""""""""""""""""""
" => IndentLine
""""""""""""""""""""""""""""""
function! SetupIndentLine()
    " enable indent line in these filetypes
    " let g:indentLine_fileType = ['c', 'cpp', 'py']
    " disable indent line in these filetypes, XXX: not work?
    " indentLine conflicts with vimwiki for the conceal feature
    let g:indentLine_fileTypeExclude = ['txt', 'text', 'log', 'help', 'vimwiki' , 'markdown']
    " disable indent line in these buffer
    let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
    " set indent line char style similar to sublime's
    " let g:indentLine_char = '┊'
endfunction "end of SetupIndentLine()

""""""""""""""""""""""""""""""
" => ConquerTerm
""""""""""""""""""""""""""""""
function! SetupConqueTerm()
    if isdirectory(expand(GetPluginPath()."/Conque-Shell")) == 0
        return
    endif
    nmap <silent><leader>cqb :ConqueTerm bash<cr>
endfunction "end of SetupConqueTerm()

""""""""""""""""""""""""""""""
" => Commentary
""""""""""""""""""""""""""""""
function! SetupCommentary()
    if isdirectory(expand(GetPluginPath()."/commentary.vim")) == 0
        return
    endif
    " Mapping
    " gc
    " \\
    " {visual}gc
    " {visual}\\
endfunction " end of SetupCommentary()

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
function! SetupStatusLine()
    " Always show the status line
    set laststatus=2

    " Format the status line
    " set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
endfunction " end of SetupStatusLine()

""""""""""""""""""""""""""""""
" => Command line mode
""""""""""""""""""""""""""""""
" Always cursor move like emacs or shell
function! SetupCmdLineMode()
    "cnoremap <C-H> <BS>
    cnoremap <C-A> <Home>
    cnoremap <C-E> <End>
    cnoremap <C-F> <Right>
    cnoremap <C-B> <Left>
    cnoremap <C-D> <Del>
    cnoremap <Esc>b <S-Left>
    cnoremap <Esc>f <S-Right>
    cnoremap <leader>b <S-Left>
    cnoremap <leader>f <S-Right>
endfunction " end of SetupCmdLineMode()

""""""""""""""""""""""""""""""
" Vimwiki
""""""""""""""""""""""""""""""
function! SetupVimwiki()
    let wiki_md = {}
    let wiki_md.automatic_nested_syntaxes = 1
    let wiki_md.path = "/data/vimwiki_md/"
    let wiki_md.syntax = "markdown"
    let wiki_md.ext = ".md"

    let wiki = {}
""    let wiki.nested_syntaxes = { 'python': 'python', 'c++': 'cpp','c': 'c', 'make': 'make'}
    let wiki.automatic_nested_syntaxes = 1

    if OSIsLinux() == 0
        let wiki.path = "f:/OneDrive/vimwiki/"
    else
        let wiki.path = "/data/vimwiki/"
    endif
    let g:vimwiki_list = [wiki, wiki_md]

    let g:vimwiki_table_auto_fmt = 0
    let g:vimwiki_hl_cb_checked = 1
    let g:vimwiki_use_calendar = 1

    exec "hi VimwikiHeader1 guifg=#FF0000 ctermfg=220"
    exec "hi VimwikiHeader2 guifg=#00FF00 ctermfg=210"
    exec "hi VimwikiHeader3 guifg=#0000FF ctermfg=170"
    exec "hi VimwikiHeader4 guifg=#FF00FF ctermfg=105"
    exec "hi VimwikiHeader5 guifg=#00FFFF ctermfg=80"
    exec "hi VimwikiHeader6 guifg=#FFFF00 ctermfg=40"
endfunction

function! SetupMarkdown()
    " apply conceal feature in vim-markdown mode
    set conceallevel=2
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupSearch()
    " Press <leader>Enter select the word of current cursor
    nmap <silent> <leader><Enter> viw

    " Always: n -> forward, N <- backward
    nnoremap <expr> n  'Nn'[v:searchforward]
    nnoremap <expr> N  'nN'[v:searchforward]

    " When you press gv you vimgrep after the selected text
    vnoremap <silent> <leader>sg :call VisualSelection('vimgrep')<CR>

    " Open vimgrep, put the cursor in the right position
    map <leader>sg :vimgrep // **/*.<left><left><left><left><left><left><left>

    " Vimgreps in the current file
    map <leader>svc :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

    " When you press <leader>r you can search and replace the selected text
    vnoremap <silent> <leader>sr :call VisualSelection('replace')<CR>
    vnoremap <silent> <leader>ssr :call VisualSelection('replace_similar')<CR>

    " Do :help cope if you are unsure what cope is. It's super useful!
    "
    " When you search with vimgrep, display your results in cope by doing:
    "   <leader>cc
    "   <leader>n
    "
    " To go to the previous search results do:
    "   <leader>p
    "
    "map <leader>n :cn<cr>
    "map <leader>p :cp<cr>
endfunction " end of SetupSearch()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupSpellChecking()
    " Pressing ,ss will toggle and untoggle spell checking
    map <leader>ss :setlocal spell!<cr>

    " Shortcuts using <leader>
    map <leader>sn ]s
    map <leader>sp [s
    map <leader>sa zg
    map <leader>s? z=

    nmap <leader>kkk :%s/\<<c-r><c-w>\>//gn<CR>
endfunction "

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupMisc()
    " default to load tags
    set tags=tags;/
    set diffopt+=horizontal
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>cm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Quickly open a buffer for scripbble
    map <leader>q :e ~/.tmp.wiki<cr>
    map <leader>tmp :e /tmp/vim_tmp_file<cr>

    " Toggle paste mode on and off
    map <leader>pp :setlocal paste!<cr>

    " XXX: will make <tab> shown as ^I
    " show Enter char in eol
    " set lcs=eol:⏎
    " set list
endfunction " end of SetupMisc()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'vimgrep'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'replace_similar'
        call CmdLine("%s" . '/'. l:pattern . '/' . l:pattern)
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! SetupMiniBufExpl()
    let g:miniBufExplMapWindowNavArrows = 1
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMapCTabSwitchWindows = 1
    "let g:miniBufExplMapCTabSwitchBufs = 1
    let g:miniBufExplModSelTarget = 1
endfunction " end of SetupMiniBufExpl()

function! SetupQuickFix()
    " toggles the quickfix window.
    command! -bang -nargs=? QFix call QFixToggle(<bang>0)
    function! QFixToggle(forced)
        if exists("g:qfix_win") && a:forced == 0
            cclose
        else
            execute "botright copen "
            ". g:jah_Quickfix_Win_Height
        endif
    endfunction

    " used to track the quickfix window
    augroup QFixToggle
        autocmd!
        autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
        autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
    augroup END

    map <silent> <leader>qf :QFix<cr>
endfunction

" NO WORK WELL, COMMENT CURRENTLY
"
"function! g:UltiSnips_Complete()
"    call UltiSnips#ExpandSnippet()
"    if g:ulti_expand_res == 0
"        if pumvisible()
"            return "\<C-n>"
"        else
"            call UltiSnips#JumpForwards()
"            if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"            endif
"        endif
"    endif
"    return ""
"endfunction
"
"function! g:UltiSnips_Reverse()
"    call UltiSnips#JumpBackwards()
"    if g:ulti_jump_backwards_res == 0
"        return "\<C-P>"
"    endif
"
"    return ""
"endfunction
"
"function! SetupUltiSnipsConflict()
"    if !exists("g:UltiSnipsJumpForwardTrigger")
"        let g:UltiSnipsJumpForwardTrigger = "<tab>"
"    endif
"
"    if !exists("g:UltiSnipsJumpBackwardTrigger")
"        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"    endif
"
"    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger     . " <C-R>=g:UltiSnips_Complete()<cr>"
"    au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
"endfunction

function! SetupYouCompleteMe()
    "if isdirectory(expand(GetPluginPath()."/YouCompleteMe")) == 0
    "    return
    "endif

    let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gr :YcmForceCompileAndDiagnostics<CR>

    set completeopt=preview,menu
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

    let g:ycm_confirm_extra_conf=0
    let g:ycm_collect_identifiers_from_tags_files= 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 0
    let g:ycm_min_num_of_chars_for_completion= 2
    let g:ycm_cache_omnifunc=0
    let g:ycm_seed_identifiers_with_syntax= 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_complete_in_strings = 1
    let g:ycm_key_invoke_completion = "<c-y>"
    let g:ycm_filetype_whitelist = { 'c': 1, 'cpp': 1, 'python': 1 }
    let g:ycm_filetype_blacklist = { '*' :  1 }
    let g:ycm_python_binary_path = '/usr/bin/python3'
endfunction " end of SetupYouCompleteMe

function! SetupDrawit()
    " key bind
    " <leader>di to start
    " <leader>ds to stop
    " use <left><right><up><down> to move and draw
    " <h><j><k><l> to move cursor
endfunction " end of SetupDrawit

function! SetupUndoTree()
    if has("persistent_undo")
        set undodir=~/.undodir/
        set undofile
    endif
    nnoremap <leader>ut :UndotreeToggle<cr>
endfunction

function! SetupColorColumn2()
    let g:colorcolumn2_ignore_filetypes = ['text', 'help']
endfunction

" replaced by unite-session
function! SetupSessionman()
"   set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
"   nmap <leader>sl :SessionList<CR>
"   nmap <leader>ss :SessionSave<CR>
"   nmap <leader>sc :SessionClose<CR>
endfunction

let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 32
function! AdjustFontSize(amount)
    if has("gui_running")
        let fontname = substitute(&guifont, s:pattern, '\1', '')
        let cursize = substitute(&guifont, s:pattern, '\2', '')
        let newsize = cursize + a:amount
        if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
            let newfont = fontname . newsize
            let &guifont = newfont
        endif
    else
        echoerr "You need to run the GUI version of Vim to use this function."
    endif
endfunction

function! LargerFont()
    call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
    call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

noremap <leader>ftj :call SmallerFont()<cr>
noremap <leader>ftk :call LargerFont()<cr>

function! SetupDoxgenToolkit()
    let g:DoxygenToolkit_briefTag_funcName = "yes"
    let g:DoxygenToolkit_briefTag_pre=""
    let g:DoxygenToolkit_briefTag_post=" - "
    let g:DoxygenToolkit_paramTag_pre="@"
    let g:DoxygenToolkit_paramTag_post=":"
    let g:DoxygenToolkit_returnTag="Returns "
    let g:DoxygenToolkit_authorName="070"
    let g:DoxygenToolkit_licenseTag="My own license"
endfunction

function! SetupSyntastic()
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 0
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0
endfunction

function! SetupCtrlp()
    if executable("ag")
        set grepprg=ag\ --nogroup\ --nocolor
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    endif
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_max_depth = 40
endfunction

function! SetupUnite()

    " unite-session
    nnoremap <leader>uss :UniteSessionSave
    nnoremap <leader>usl :Unite session<CR>

    nmap <silent> <leader>ls :Unite buffer<CR>
    nmap <silent> <leader>lt :Unite tab<CR>
    nmap <silent> <leader>lw :Unite window<CR>

    " unite-gtags
    nnoremap <leader>ug :Unite gtags/
    nnoremap <leader>ugd :Unite gtags/def<CR>
    nnoremap <leader>ugr :Unite gtags/ref<CR>
    autocmd BufEnter *
        \   if empty(&buftype)
        \|      nnoremap <buffer> <C-]> :Unite gtags/def<CR>
        \|  endif

endfunction

function! SetupColorizer()
    " the plugin will map ,tc, which cause confliction in my vimrc
    let g:colorizer_nomap = 1
endfunction

function! SetupVimBookmarks()
    call unite#custom#profile('source/vim_bookmarks', 'context', {
        \   'winheight': 13,
        \   'direction': 'botright',
        \   'start_insert': 0,
        \   'keep_focus': 1,
        \   'no_quit': 1,
        \ })
endfunction

function! SetupEasyGrep()
    let g:EasyGrepWindow = 1
endfunction

function! GetGitRootDir(path)
    if !executable('git')
        return ''
    endif

    let l:git_cmd = 'git rev-parse --show-toplevel'
    let l:cmd = 'cd ' . a:path . ' && ' . l:git_cmd
    let l:ret = system(l:cmd)
    if v:shell_error != 0
        return ''
    endif
    let l:ret_split = split(l:ret, '\n')
    return l:ret_split[0]
endfunction

function! GetCurrentPath()
    let l:path = expand('%:h')

    if l:path != ''
        return l:path
    endif

    return getcwd()
endfunction

function! GetProperWorkspaceDir()
    let l:cwd = GetCurrentPath()
    if executable('git')
        let l:git_path = GetGitRootDir(l:cwd)
        if l:git_path != ''
            return l:git_path
        endif
    endif

    if executable('svn')
        "let l:svn_path = GetSvnRootDir(l:cwd)
        if l:svn_path != ''
            return l:svn_path
        endif
    endif

    return l:cwd
endfunction

function! FlyGrepWorkspace()
    let l:cwd = GetProperWorkspaceDir()
    if l:cwd != ''
        let l:flygrep_args = { 'dir': l:cwd }
        call FlyGrep#open(l:flygrep_args)
    else
        call FlyGrep#open({})
    endif
endfunction

function! SetupFlyGrep()
    command! -nargs=0 FlyGrepWorkspace call FlyGrepWorkspace()
    nmap <silent> <leader>fg :FlyGrepWorkspace<cr>
endfunction

func! GtagsMsgHandler(chn, msg)
    echo a:msg
endfunc

func! MakeGtags()
    if !has('job')
        echoerr 'Need vim with +job.'
        return
    endif
    let l:cwd = GetProperWorkspaceDir()
    if l:cwd != ''
        let l:path = input("==========================================================\n" .
                         \ "Ready to generate GTAGS in this path:                     \n" .
                         \ "", l:cwd, "file")
        redraw
        if l:path ==# ''
            echom 'GTAGS generating aborted!'
            return
        endif
        if  !isdirectory(l:path)
            echom 'GTAGS generating aborted! ' . l:path . ' is not a dir.'
            return
        endif
        let l:gtags_cmd = 'cd ' . l:path . ' && gtags -v'
        call job_start(['sh', '-c', l:gtags_cmd ], {'callback': 'GtagsMsgHandler'})
    else
        echom "no available path."
    endif
endfunc

function! SetupMakeGtags()
    command! -nargs=0 MakeGtags call MakeGtags()
    nmap <silent> <leader>mg :MakeGtags<cr>
endfunction

"
" vim setup
"
call SetupLeaderKey()
call SetupGeneral()
call SetupVimUI()
call SetupMoving()
"
" plugin setup
call SetupBeforePluginMgrInit()
call SetupPluginMgr()
call SetupGtagsCscope()
call SetupRainbowParentheses()
call SetupColorScheme()
call SetupColorColumn2()
call SetupNerdTree()
call SetupTagbar()
call SetupBufexplorer()
call SetupQuickFix()
call SetupCmdLineMode()
call SetupMiniBufExpl()
call SetupMisc()
call SetupSpellChecking()
call SetupSearch()
call SetupVimrcEdit()
call SetupIndentLine()
call SetupStatusLine()
call SetupDrawit()
call SetupConqueTerm()
call SetupUndoTree()
call SetupSessionman()
call SetupDoxgenToolkit()
call SetupSyntastic()
call SetupVimBookmarks()
call SetupUnite()
call SetupColorizer()
" call SetupUltiSnipsConflict()
call SetupYouCompleteMe()
call SetupCtrlp()
call SetupVimwiki()
call SetupMarkdown()
call SetupEasyGrep()
call SetupFlyGrep()
call SetupMakeGtags()

