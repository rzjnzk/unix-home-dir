" enable mouse usage (all modes)
set mouse=a

" columns per tab
set tabstop=4
" columns text is indented when using reindent operations
set shiftwidth=4
" use spaces instead of tab characters
set expandtab

" enable syntax processing
syntax enable 

" show line numbers
set number

" show previously entered command in bottom bar
set showcmd          

set wildmenu            " visual autocomplete for command menu

set lazyredraw          " redraw only when we need to. Vim loves to redraw the screen during things it probably doesn't need to—like in the middle of macros. This tells Vim not to bother redrawing during these scenarios, leading to faster macros.

set showmatch           " highlight matching [{()}]


set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
"nnoremap <leader><space> :nohlsearch<CR>
"Vim will keep highlighted matches from searches until you either run a new one or manually stop highlighting the old search with :nohlsearch. I find myself running this all the time so I've mapped it to ,<space>.

" ?
filetype plugin indent on

" pathogem.vim
" ------------

execute pathogen#infect()

" NERD Tree (https://github.com/scrooloose/nerdtree)
" --------------------------------------------------

" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * NERDTree

" " open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" " open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif


