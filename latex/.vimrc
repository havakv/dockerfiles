" Haavard Kvamme .vimrc
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" This option is needed to rund the R stuff
"
" Source local .vimrc file
set exrc

filetype plugin indent on    " required

" Enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Use colorscheme as default
"if has('gui_running')
"	syntax enable
"	set background=light
"	colorscheme github
"else
"	colorscheme xoria256
"endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
 "set background=dark

" Jump to the last position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

"let &path.="src/include,/usr/include/AL,"

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

"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab " Cpplint want spaces instead of tabs

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


" Map <C-S> to save file
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>
" Return to insert mode
"inoremap <c-s> <c-o>:Update<CR>" Return to insert mode 
" Alwasy escape from insert mode.
inoremap <c-s> <Esc>:Update<CR> 

