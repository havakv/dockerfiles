" This .vimrc file is based on
" https://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" and is an attempt to create an python ide

set nocompatible
filetype off

" Use local .vimrc file
set exrc

" colorscheme xoria256
syntax enable
set background=dark
colorscheme xoria256 

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" The bundles you install will be listed here

filetype plugin indent on



" The rest of your config follows here

"=============================================================================
" Powerline setup
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2

"=============================================================================
Bundle 'scrooloose/nerdtree'
map <Leader><Leader>d :NERDTreeToggle <enter>

"=============================================================================
"Bundle 'klen/python-mode'
"" Python-mode
"" Activate rope
"" Keys:
"" K             Show python docs
"" <Ctrl-Space>  Rope autocomplete
"" <Ctrl-c>g     Rope goto definition
"" <Ctrl-c>d     Rope show documentation
"" <Ctrl-c>f     Rope find occurrences
"" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
"" [[            Jump on previous class or function (normal, visual, operator modes)
"" ]]            Jump on next class or function (normal, visual, operator modes)
"" [M            Jump on previous class or method (normal, visual, operator modes)
"" ]M            Jump on next class or method (normal, visual, operator modes)
"let g:pymode_rope = 0 " We use Jedi-vim instead... set to 1 if you want rope

"" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

""Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
"let g:pymode_lint_write = 1

"" Support virtualenv
"let g:pymode_virtualenv = 1

"" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

"" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

"" Don't autofold code
"let g:pymode_folding = 0

"=============================================================================
"Bundle 'davidhalter/jedi-vim'
" Don't show pop-up window
"autocmd FileType python setlocal completeopt-=preview

"=============================================================================
"Bundle 'Valloric/YouCompleteMe'

"=============================================================================
Bundle 'scrooloose/nerdcommenter'

"=============================================================================
Bundle 'Lokaltog/vim-easymotion'
map f <Leader><Leader>f
map F <Leader><Leader>F

"=============================================================================
Bundle 'scrooloose/syntastic'
let g:syntastic_check_on_open=1

" Symbols for warnings and errors
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>>'
let g:syntastic_style_error_symbol='s>'
let g:syntastic_style_warning_symbol='s>'

" :Errors to open loc list
" Set to 1 if you want error window to open and close automatically
" Set to 2 if you want error window to close automatically
let g:syntastic_auto_loc_list=2
" There should be a better solution than this
map <Leader>se :let g:syntastic_auto_loc_list=1

" Use :Errors to get error window
" and :lclose close it.

" Height of error window
let g:syntastic_loc_list_height=5

"=============================================================================
" I'm prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Jump to the last position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

syntax on


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set hls		" Highlight search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number 		" Sets numbers
setlocal spell! spelllang=en_us "Set spell
set cursorline		" Sets vertical line


" Make it possible to copy and paste between windows
" set paste
"set clipboard=unnamedplus
vmap <C-c> "+y

" Some general key bindings
" Toggle spell check
:map <Leader>ss :setlocal spell! spelllang=en_us<enter>

" Toggle highlight search
:map <Leader>hs :set hls! <Enter>

" Run script
:map <Leader>rs :! clear; ./% <Enter>

" Make executable 
:map <Leader>me :! chmod +x % <Enter><Enter>




