" install Vundle bundles
let $LANG = 'en'  "set message language
set langmenu=en   "set menu's language of gvim. no spaces beside '='

" My workspace
" E7240_OPENSUSE: Dell E7240 laptop, openSUSE 42.1
" MSI16F3_WIN7: MSI 16F3 laptop, Windows 7.
" OA_WIN7: OA Cloud client, Windows 7, 172.24.129.14
" OA_UBUNTU: OA Clound, Ubuntu 14.04, 172.24.129.99, telnet
" DELL_182_UBUNTU: Dell desktop, Ubuntu 14.04, 192.168.204.182, ssh ruijie
" DELL_183_UBUNTU: Dell desktop, Ubuntu 14.04, 192.168.204.183, ssh ruijie
" DELL_184_UBUNTU: Dell desktop, Ubuntu 14.04, 192.168.204.184, ssh ruijie
"

let g:workspace = "DELL_183_UBUNTU"
let g:OS_WINDOWS = "windows"
let g:OS_LINUX = "linux"
let g:OS_UNKNOWN = "unknown"
let g:OS_LINUX = "linux"

function! SetupLeaderKey()
    " With a map leader it's possible to do extra key combinations
    " like <leader>w saves the current file
    let mapleader = ","
    let g:mapleader = ","
endfunction
call SetupLeaderKey()

function! GetWorkspaceSetting()
    let host = hostname()
    if host == ""
    endif
endfunction

function! GetOS()
    if has("win32") || has("win64")
        return g:OS_WINDOWS
    elseif has("linux")
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

function! GetVundleBeginPath()
    let path = ''
    if GetOS() == g:OS_WINDOWS
        let path = '$VIM/vimfiles/bundle'
    else
        let path ='~/.vim/bundle'
    endif
    return path
endfunction

function! VundleInit()
    " install Vundle:
    "   mkdir -p .vim/bundle
    " for windows:
    "   git clone https://github.com/VundleVim/Vundle.vim.git $VIM\vimfiles\bundle\Vundle.vim
    " for linux:
    "   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

    " bundle require nocomp and filetype off
    set nocompatible
    filetype off

    " the runtime path to include Vundle and initialize
    let tmp_rtp=GetVundleBeginPath()."/Vundle.vim"

    " add runtimepath
    exec "set rtp+=".tmp_rtp
    call vundle#begin(GetVundleBeginPath())

    " vim plugin manage/install/delete/update
    Plugin 'gmarik/Vundle.vim'

    Plugin 'iam070/colorcolumn2.git'

    """"""""""""""""""""""""""""""
    " => Snippets plugins
    """"""""""""""""""""""""""""""
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'

    """"""""""""""""""""""""""""""
    " => UI looks
    """"""""""""""""""""""""""""""
    " rainbow parentheses, make colors
    Plugin 'kien/rainbow_parentheses.vim'

    " highlight the trailing whitespace in the end of lines
    " Plugin 'trailing-whitespace'
    Plugin 'ntpeters/vim-better-whitespace'

    " line for indent
    Plugin 'Yggdroot/indentLine'

    Plugin 'Mark--Karkat'

    " highlight for markdown
    Plugin 'plasticboy/vim-markdown'

    " vim color schemes package
    Plugin 'flazz/vim-colorschemes'

    " a nice color scheme
    Plugin 'molokai'

    " another nice color scheme
    Plugin 'altercation/vim-colors-solarized'

    " beautiful statue line
    Plugin 'bling/vim-airline'

    " buffer name shown in airline
    " Plugin 'bling/vim-bufferline'

    " a fancy start show
    Plugin 'mhinz/vim-startify'

    " visual mark
    Plugin 'kshenoy/vim-signature'

    Plugin 'junkblocker/patchreview-vim'

    """"""""""""""""""""""""""""""
    " => Comment
    """"""""""""""""""""""""""""""
    " commentary for multiply lines
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'vim-scripts/DoxygenToolkit.vim'

    " quickly add/del/change surround
    Plugin 'surround.vim'

    " Ctrl-N to mark multiple location to work
    Plugin 'kristijanhusak/vim-multiple-cursors'

    """"""""""""""""""""""""""""""
    " => Files
    """"""""""""""""""""""""""""""
    " file tree explorer
    Plugin 'scrooloose/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'

    " mostly recent use
    " Plugin 'mru.vim'

    " Ctrl+p for file search
    Plugin 'ctrlp.vim'

    Plugin 'bufexplorer.zip'


    """"""""""""""""""""""""""""""
    " => Files
    """"""""""""""""""""""""""""""

    Plugin 'ctags.vim'
    "Plugin 'pydoc.vim'
    "Plugin 'Gist.vim'
    "Plugin 'airblade/vim-gitgutter'
    "Plugin 'WebAPI.vim'

    Plugin 'Tagbar'
    Plugin 'rdnetto/YCM-Generator'

    " Plugin 'Raimondi/delimitMate'
    " Plugin 'Townk/vim-autoclose'
    " Plugin 'mattn/emmet-vim'
    "Plugin 'Pydiction'


    " a nice completer
    Plugin 'Valloric/YouCompleteMe'
    " grammer check
    Plugin 'scrooloose/syntastic'
    Plugin 'syngan/vim-vimlint'

    Plugin 'pyflakes.vim'

    " python complete, use YouCompleteMe to instead this
    " Plugin 'davidhalter/jedi-vim'

    Plugin 'vimwiki/vimwiki'

    """"""""""""""""""""""""""""""
    " => Misc
    """"""""""""""""""""""""""""""
    " text align
    Plugin 'Tabular'

    " quick move
    Plugin 'Easymotion'

    " draw in vim
    Plugin 'drawit'

    " run shell in vim
    Plugin 'oplatek/Conque-Shell'

    " undo tree history
    Plugin 'mbbill/undotree'

    " Yank manage
    " Plugin 'YankRing.vim'

    " vundle requird
    call vundle#end()
    filetype plugin indent on
endfunction " end of VundleInit()

call VundleInit()

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

    "let g:rainbowparent_ignore_filetypes = ['text', 'vimwiki', 'conque_term']

    "" Rainbow Parenthese commands
    ""RainbowParenthesesToggle       " Toggle it on/off
    ""RainbowParenthesesLoadRound    " (), the default when toggling
    ""RainbowParenthesesLoadSquare   " []
    ""RainbowParenthesesLoadBraces   " {}
    ""RainbowParenthesesLoadChevrons " <>
    ""``

    " always on
    " au VimEnter * RainbowParenthesesToggle
    "au BufRead,BufNewFile * if ShouldEnableRainbowParenthese() | call RainbowParenthesesToggle | endif
    "au Syntax * RainbowParenthesesLoadRound
    "au Syntax * RainbowParenthesesLoadSquare
    "au Syntax * RainbowParenthesesLoadBraces

endfunction "SetupRainbowParentheses


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
function! SetupNerdTree()
    " key binding

    " toggle NerdTree
    map <leader>nn :NERDTreeToggle<cr>
    " open curent editing file path
    map <leader>nc :NERDTree %:p:h<cr>

    " file filter
    let g:NERDTreeIgnore=['.git$[[dir]]', '.o$[[file]]', '.pyc$[[file]]']

    let g:NERDTreeIndicatorMapCustom = {
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

    " if s:workspace == s:WRKSPCE_OA_WIN7
    " endif
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

    nmap <silent> <leader>ls :BufExplorer<CR>
endfunction " end of SetupBufexlorer

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       iam070@qq.com
"       Modified based on Amir Salihefendic http://amix.dk - amix@amix.dk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupVimrcEdit()
    "Fast editing of .vimrc
    map <silent> <leader>vrce :exec ':e'.GetDefaultVimrc()<cr>
    "Fast reloading of the .vimrc
    map <silent> <leader>vrcs :exec ':source'.GetDefaultVimrc()<cr>
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
    " nmap <leader>w :w!<cr>

    " Set utf8 as standard encoding and en_US as the standard language
    set encoding=utf8
    set fileencodings=utf-8,gbk,gb18030,gk2312
    set fileencoding=gbk

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

    colorscheme solarized
    set background=dark

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


    if has("gui_running")
        set guioptions=""
        set guitablabel=%M\ %t
        if OSIsLinux()
            " linux guifont format may cause gvim cannot startup without any msg
            " in windows
            set guifont=Source\ Code\ Pro\ for\ Powerline\ 16
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

function SetupMoving()
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
        set switchbuf=useopen,usetab,newtab
        set stal=2
    catch
    endtry

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
    " Remember info about open buffers on close
    set viminfo^=%
endfunction " end of SetupMoving


""""""""""""""""""""""""""""""
" => IndentLine
""""""""""""""""""""""""""""""
function! SetupIndentLine()
    " enable indent line in these filetypes
    " let g:indentLine_fileType = ['c', 'cpp', 'py']
    " disable indent line in these filetypes, XXX: not work?
    let g:indentLine_fileTypeExclude = ['txt', 'text', 'log', 'help']
    " disable indent line in these buffer
    let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
    " set indent line char style similar to sublime's
    " let g:indentLine_char = '┊'
endfunction "end of SetupIndentLine()

""""""""""""""""""""""""""""""
" => ConquerTerm
""""""""""""""""""""""""""""""
function! SetupConqueTerm()
    if isdirectory(expand(GetVundleBeginPath()."/Conque-Shell")) == 0
        return
    endif
    nmap <silent><leader>cqb :ConqueTerm bash<cr>
endfunction "end of SetupConqueTerm()

""""""""""""""""""""""""""""""
" => Commentary
""""""""""""""""""""""""""""""
function! SetupCommentary()
    if isdirectory(expand(GetVundleBeginPath()."/commentary.vim")) == 0
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

function! SetupJedi()
    if isdirectory(expand(GetVundleBeginPath()."/Jedi")) == 0
        return
    let g:jedi#goto_command = "<leader>jc"
    let g:jedi#goto_assignments_command = "<leader>js"
    let g:jedi#goto_definitions_command = "<leader>jd"
    let g:jedi#documentation_command = "<leader>jk"
    let g:jedi#usages_command = "<leader>ju"
    let g:jedi#completions_command = "<c-y>"
    let g:jedi#rename_command = "<leader>jr"
"   " jedi-vim {
  let g:jedi#auto_vim_configuration = 0
"   let g:jedi#popup_on_dot = 0
  let g:jedi#popup_select_first = 0
"   let g:jedi#completions_enabled = 0
"   let g:jedi#completions_command = ""
  let g:jedi#show_call_signatures = "1"

"   let g:jedi#goto_assignments_command = "<leader>pa"
"   let g:jedi#goto_definitions_command = "<leader>pd"
"   let g:jedi#documentation_command = "<leader>pk"
"   let g:jedi#usages_command = "<leader>pu"
"   let g:jedi#rename_command = "<leader>pr"
"   " }
endfunction " end of SetupJedi()

""""""""""""""""""""""""""""""
" Vimwiki
""""""""""""""""""""""""""""""
function! SetupVimwiki()
    if has("win32") || has("win64")
        let g:vimwiki_list = [ {"path": "f:/KuaiPan/vimwiki/"}]
    else
        let g:vimwiki_list = [ {"path": "~/KuaiPan/vimwiki/"}]
    endif
    let g:vimwiki_table_auto_fmt=0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SetupSearch()
    " Press <leader>Enter select the word of current cursor
    nmap <silent> <leader><Enter> viw

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
    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>cm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Quickly open a buffer for scripbble
    map <leader>q :e ~/buffer<cr>
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

function! SetupYouCompleteMe()
    if isdirectory(expand(GetVundleBeginPath()."/YouCompleteMe")) == 0
        return
    endif

    let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
    nnoremap <leader>gr :YcmForceCompileAndDiagnostics<CR>

    set completeopt=longest,preview
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
    let g:colorcolumn2_ignore_filetypes = ['text', 'startify', 'help', 'vundle']
endfunction

" vim setup
call SetupGeneral()
call SetupVimUI()
call SetupMoving()

" plugin setup
call SetupRainbowParentheses()
call SetupColorColumn2()
call SetupNerdTree()
call SetupTagbar()
call SetupBufexplorer()
call SetupQuickFix()
call SetupVimwiki()
" call SetupJedi()
call SetupCmdLineMode()
call SetupMiniBufExpl()
call SetupMisc()
call SetupSpellChecking()
call SetupSearch()
call SetupVimrcEdit()
call SetupIndentLine()
call SetupStatusLine()
call SetupYouCompleteMe()
call SetupDrawit()
call SetupConqueTerm()
call SetupUndoTree()
if has('python')
py << EOL
#import vim, os, site, sys
# prj_path = '/home/iam070/Project/project_n18k/'
# os.system("export PYTHONPATH=" + prj_path)
# sys.path.append('/home/iam070/Project/project_n18k/')
# os.environ["PYTHONPATH"] = prj_path
#vim.command(r'set path+='+paths)
EOL
endif
"}
