"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible               " compatibility with vi off
set title                      " show file name
set textwidth=79               " lines longer than this columns number will be broken
set shiftwidth=4               " operation >> indents 4 of columns; << unindents 4 columns
set tabstop=4                  " number of visual spaces per TAB
set expandtab                  " insert spaces when hitting TABs
set smarttab                   " smart tabs
set softtabstop=4              " insert/delete spaces number when hitting a TAB/BACKSPACE
set shiftround                 " round indent to multiple of 'shiftwidth'
set autoindent                 " align the new line indent with the previous line
set autochdir                  " automatically change window's cwd to file's dir
set number                     " show line numbers
set showcmd                    " show command in bottom bar
set cursorline                 " highlight current line
set cursorcolumn               " highlight current column
set wildmenu                   " visual autocomplete for command menu
set wildignore=*.o,*~,*.pyc    " ignore compiled files
set lazyredraw                 " redraw only when we need to.
set ignorecase                 " ignore case when searching
set smartcase                  " when searching try to be smart about case
set magic                      " for regular expressions turn magic on
set showmatch                  " highlight matching [{()}]
set incsearch                  " search as characters are entered
set hlsearch                   " highlight matches
set foldenable                 " enable folding
set foldlevelstart=10          " open most folds by default
set foldnestmax=10             " 10 nested fold max
set foldmethod=indent          " fold based on indent level
set history=500                " how many lines of history VIM has to remember
set nobackup                   " no need
set autoread                   " Set to auto read when a file is changed from the outside
set scrolloff=7                " Set 7 lines to the cursor - when moving vertically using j/k
set ruler                      " always show current position
set noerrorbells               " no annoying sound on errors
set foldcolumn=1               " add a bit extra margin to the left
set hidden                     " a buffer becomes hidden when it is abandoned
set backspace=eol,start,indent " configure backspace so it acts as it should acts
set whichwrap+=<,>,h,l         " //
let $LANG='en'                 " avoid garbled characters in Chinese language windows OS
set langmenu=en                " //
set encoding=utf8              " Set utf8 as standard encoding and en_US as the standard language
set antialias                  " font anti-aliasing
set ffs=unix,dos,mac           " Use Unix as the standard file type

filetype off                   " enable specific filetype behaviors
filetype plugin on             " enable filetype plugins
filetype indent on             " load filetype-specific indent files
syntax on                      " enable syntax processing
let python_highlight_all=1     " enable all Python syntax highlighting features

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","       " for extra key combinations
let g:mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" go to normal mode
inoremap ,, <esc>
" space open/closes folds
nnoremap <space> za
" move down/up by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" highlight last inserted text
nnoremap gV `[v`]
" visual mode pressing */# searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Launch Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call pathogen#infect()                      " use pathogen
call pathogen#helptags()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Auto cmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" cursorline & column settings
hi CursorLine ctermbg=DarkBlue guifg=bg guibg=fg
hi CursorColumn ctermbg=DarkBlue guifg=bg guibg=fg
"hi CursorLine ctermfg=bg ctermbg=fg
"hi CursorColumn ctermfg=bg ctermbg=fg

" remove any extra whitespace from the ends of lines when saving python files
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``
" PEP8 style guide checking for python files
autocmd BufWritePost *.py call Flake8()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Python mode config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:pymode_rope=1
" Documentation
let g:pymode_doc=1
let g:pymode_doc_key='K'
"Linting
let g:pymode_lint=1
let g:pymode_lint_checker="pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write=1
" Support virtualenv
let g:pymode_virtualenv=1
" Enable breakpoints plugin
let g:pymode_breakpoint=1
let g:pymode_breakpoint_bind='<leader>b'
" syntax highlighting
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding=0

