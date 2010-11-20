filetype off
filetype plugin indent on
set nocompatible
set modelines=0

colorscheme desert
set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch

set ruler
set nocompatible
set fileformat=unix

"set guifont=Monospace\ 9
set guifont=Droid\ Sans\ Mono\ Slashed\ 9
set mouse=a

set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set showmode
set scrolloff=3
set laststatus=2

" These are annoying and I never use them anyway
set nobackup
set noswapfile

set wrap
set textwidth=79
set formatoptions=qrn1

" Not supported until version 7.3
"set colorcolumn=85

" turn on whitespace

map <F2> :NERDTreeToggle<cr>
map <F3> :TlistToggle<cr>

" line indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

if has("gui_running")
    set guioptions-=T "no toolbar for gui
    set lines=30
    set columns=80
    set cursorline
    colorscheme wombat
    if has("gui_gtk2")
    elseif has("gui_win32")
    else
        let do_syntax_sel_menu = 1|runtime! synmenu.vim
        set transparency=10
        set guifont=Consolas:h11
    endif
endif

filetype plugin on
filetype indent on

autocmd BufReadPost *.doc silent %!antiword "%"
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78
autocmd BufReadPost *.rtf silent %!unrtf --text "%"


" Turn on autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" enable filetype detection:
filetype on

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent shiftwidth=8 tabstop=8


" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
"autocmd FileType html,css set noexpandtab tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase
" show the `best match so far' as search strings are typed:
set incsearch
set gdefault
set showmatch
set hlsearch


" Rebind autocomplete to ctrl-space
inoremap <Nul> <C-x><C-o> 

" Add tags

"set tags+=$HOME/.vim/tags/python.ctags
"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 

au BufRead,BufNewFile *.py set expandtab

"buffer explorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1


autocmd bufwritepost .vimrc source $MYVIMRC
autocmd BufRead,BufNewFile *.mako set syntax=htmldjango

