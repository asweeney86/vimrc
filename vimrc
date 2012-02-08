call pathogen#infect()
filetype off
filetype plugin indent on
set nocompatible
set modelines=0
syntax on
set t_Co=256
colorscheme molokai

set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch
syntax on

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

set formatoptions+=l
" Not supported until version 7.3
"set colorcolumn=85
if version >= 703
    set colorcolumn=80
endif
" turn on whitespace


map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F2> :NERDTreeToggle<cr>
map <F3> :TlistToggle<cr>
let NERDTreeIgnore = ['\.pyc$','\.o$']
" line indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

if has("gui_running")
    set guioptions-=T "no toolbar for gui
    "set lines=30
    "set columns=80
    set cursorline
    "colorscheme wombat
    if has("gui_gtk2")
    elseif has("gui_win32")
    else
        let do_syntax_sel_menu = 1|runtime! synmenu.vim
        set transparency=0
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
set nocp
filetype on
au BufNewFile,BufRead *.ejs set filetype=html

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent expandtab shiftwidth=4 tabstop=4 softtabstop=4

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
"set gdefault
set showmatch
set hlsearch


" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " set default fold level to 1


" Rebind autocomplete to ctrl-space
" inoremap <Nul> <C-x><C-o> 

" Super tab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
"highlight Pmenu guibg=brown gui=bold
"highlight Pmenu ctermbg=238 gui=bold
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

" Omnicomplete
set ofu=syntaxcomplete#Complete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" Syntastic
"SyntasticDisable
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_auto_jump=1
"let g:syntastic_auto_loc_list=1

set statusline+=%{fugitive#statusline()}
set statusline+=\ %f%R%=%m[row\ %l/%L,\ column\ %v\ (%c)]
autocmd bufwritepost .vimrc source $MYVIMRC

