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
set cursorline
set nocompatible
set fileformat=unix

"set guifont=Droid\ Sans\ Mono\ Slashed\ 9
set guifont=Menlo\ Regular\ for\ Powerline:h12
set mouse=a

set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set ttyfast
set backspace=indent,eol,start
set scrolloff=3
set laststatus=2

" These are annoying and I never use them anyway
set nobackup
set noswapfile

set formatoptions=qrn1
set formatoptions+=l

" Not supported until version 7.3
if version >= 703
    set colorcolumn=80
endif
" turn on whitespace

" Mapped keys
map <F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F2> :NERDTreeToggle<cr>
map <F3> :TlistToggle<cr>
let NERDTreeIgnore = ['\.pyc$','\.o$']
" Remap the escape key to jj
imap jj <Esc>

" line indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

if has("gui_running")
    set guioptions-=T "no toolbar for gui
    if has("gui_gtk2")
    elseif has("gui_win32")
    else
        let do_syntax_sel_menu = 1|runtime! synmenu.vim
        set transparency=0
    endif
endif

filetype plugin on
filetype indent on
filetype on

" enable filetype detection:
au BufNewFile,BufRead *.ejs setlocal filetype=html

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang setlocal cindent noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

autocmd FileType php setlocal cindent noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c setlocal formatoptions+=ro

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html setlocal formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make
" files a few bytes smaller:
autocmd FileType html,css setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch
set showmatch
set hlsearch

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " set default fold level to 1

" Super tab
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

"buffer explorer
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1

" Omnicomplete
"set ofu=syntaxcomplete#Complete
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1
"let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
"let OmniCpp_MayCompleteDot = 1 " autocomplete after .
"let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
"let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
"" automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"set completeopt=menuone,menu,longest,preview

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
  
" Let vim powerline be fancy
let g:Powerline_symbols = 'fancy'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Disable auto complete
let g:neocomplcache_disable_auto_complete = 1
" Let neocomplete choose what it wants
let g:neocomplcache_enable_auto_select = 1
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap  <tab>  <right><plug>(neocomplcache_snippets_jump) 
inoremap <expr><c-e>     neocomplcache#complete_common_string()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"autocmd FileType cpp setlocal omnifunc=omni#cpp#complete#Main

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

let g:neocomplcache_force_overwrite_completefunc = 1
"let g:neocomplcache_force_omni_patterns.c ='[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplcache_force_omni_patterns.cpp =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.objc =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"let g:neocomplcache_force_omni_patterns.objcpp =
"            \ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen=0
let g:clang_auto_select=1
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1
let g:clang_complete_macros=1
"let g:clang_hl_errors=1
"let g:clang_use_library = 1
"let g:clang_auto_user_options='path, .clang_complete'
"
" autocmd bufwritepost .vimrc source $MYVIMRC
set wildignore+=*.o,*.obj,.git
