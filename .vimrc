set encoding=utf-8

if !has("gui_running")

    set termencoding=utf-8
    set term=xterm

    "inoremap <Char-0x07F> <BS>
    "nnoremap <Char-0x07F> <BS>

    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"

    set t_Co=256

    set mouse=a

    set nocompatible

    set nolazyredraw

    " columns per tab
    set tabstop=4
    " editor treats colums per tab
    " allows single-backspaceing of tabs
    set softtabstop=4
    " columns text is indented when using reindent operations
    set shiftwidth=4
    " use spaces instead of tab characters
    set expandtab

    " enable syntax processing
    syntax enable

    " show line numbers
    set number

    " soft wrap lines  at chars specified in `breakat` rather than any char
    " NOTE: the order of these commands may be important, ref: https://www.unix.com/unix-for-advanced-and-expert-users/130631-breakat-option-vim.html
    set linebreak
    " " Enforce default breakat values
    " set breakat " ^I!@*-+;:,./?"

    " show previously entered command in bottom bar
    set showcmd

    " visual autocomplete for command menu
    set wildmenu

    " redraw only when we need to. Vim loves to redraw the screen during things it probably doesn't need to—like in the middle of macros. This tells Vim not to bother redrawing during these scenarios, leading to faster macros.
    set lazyredraw

    " highlight matching [{()}]
    set showmatch

    " search as characters are entered
    set incsearch
    " highlight matches
    set hlsearch

    " turn off search highlight
    "nnoremap <leader><space> :nohlsearch<CR>
    "Vim will keep highlighted matches from searches until you either run a new one or manually stop highlighting the old search with :nohlsearch. I find myself running this all the time so I've mapped it to ,<space>.

    " ?
    filetype plugin indent on

endif
