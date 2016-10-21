set nocompatible               " be iMproved
filetype off                   " required!

set shell=/bin/bash
set encoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

Plugin 'molokai'
Plugin 'go.vim'
Plugin 'repeat.vim'
Plugin 'wincent/Command-T'
Plugin 'Valloric/MatchTagAlways'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/powerline'
Plugin 'Puppet-Syntax-Highlighting'
Plugin 'JSON.vim'
Plugin 'mako.vim'
Plugin 'wombat256.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/html5.vim'
Plugin 'ack.vim'
Plugin 'uarun/vim-protobuf'
Plugin 'Jinja'
Plugin 'bling/vim-airline'
Plugin 'jnwhiteh/vim-golang'
Plugin 'vim-scripts/a.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ternjs/tern_for_vim'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()

filetype plugin indent on

set modelines=0
syntax on
set t_Co=256
" silent! colorscheme molokai
silent! colorscheme ChocolateLiquor

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
set guifont=Anonymous\ Pro\ for\ Powerline\ 12
set mouse=a

set showmode
set showcmd
set wildmenu
set wildmode=list:longest
set wildignore+=*.o,*.obj,.git,*.so*,*.lo,*.la,*.a,*.Plo,*.lai,*.Po,**/node_modules/**
let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*" 
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
    highlight ColorColumn ctermbg=8
endif
" turn on whitespace

" Mapped keys
map <silent> <F12> :!ctags -R --links=no --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.git --exclude=node_modules .<CR>
set tags+=./tags;$HOME

map <F2> :NERDTreeToggle<cr>
map <F3> :Tagbar<cr>
noremap <F5> :CommandTFlush<CR>

let NERDTreeIgnore = ['\.pyc$','\.o$']
" Remap the escape key to jj
imap jj <Esc>

" line indent
nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch
set showmatch
set hlsearch

" enable filetype detection:
au BufNewFile,BufRead *.ejs setlocal filetype=html
au BufNewFile,BufRead *.spec.template setlocal filetype=spec

au BufNewFile,BufRead *.conf setlocal filetype=json

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang,make,automake setlocal cindent noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

autocmd FileType php setlocal cindent noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

autocmd FileType json setlocal cindent noexpandtab shiftwidth=8 tabstop=8 softtabstop=8

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

autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" folding settings
set foldmethod=indent   " fold based on indent
set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=1         " set default fold level to 1

" Limit popup menu height
set pumheight=15

" Let vim powerline be fancy
" let g:Powerline_symbols = 'fancy'
let g:CommandTScanDotDirectories = 1
let g:CommandTAlwaysShowDotFiles = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_always_populate_location_list = 1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

" Disable code folding for vim
let g:vim_markdown_folding_disabled=1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
