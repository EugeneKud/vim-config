"VUNDLE PLUGINS {{{
set nocompatible                          " required by Vundle
filetype off                              " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim         " include Vundle in runtime path
call vundle#begin()                       " ininialize Vundle

Plugin 'gmarik/Vundle.vim'                " package manager self

Plugin 'godlygeek/tabular'                " align on multiple lines
Plugin 'altercation/vim-colors-solarized' " precision colorscheme
Plugin 'kien/ctrlp.vim'                   " easier file switching
Plugin 'SirVer/ultisnips'                 " snippets engine
Plugin 'honza/vim-snippets'               " snippets themselves

call vundle#end()                         " required by Vundle
filetype plugin indent on                 " required by Vundle
" }}}
"SPACES & TABS {{{
" TABs are SPACEs
"set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
" TABs are TABs
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

set autoindent    " auto indent
set smartindent   " smart indent

" }}}
"UI CONFIG {{{
set number                    " show line numbers
syntax enable                 " syntax highlighting
set showcmd                   " show command in the status bar
set autoread                  " auto read when file is changed
                              " from the outside
set cursorline                " highlight current line
set ruler                     " always show current position in the status bar
set lazyredraw                " redraw only when we need to
set showmatch                 " highlight brackets () {} []
set encoding=utf-8            " choose encoding; fixes directory-arrows in NERDTree
set backspace=2               " backspace acts like it should now
set nobackup                  " turf off backup -> use git for the love of god
set spell spelllang=en_us     " spelling
set laststatus=2              " always display the status line
set listchars=tab:▸\          " arrow + spaces for the rest
set list                      " show invisible characters
set mouse=a"                  " enable moust
" }}}
"COLORS {{{
set t_Co=256          " tell vim that terminal support 256 colors
set background=dark   " switch to dark for dark background
colorscheme solarized " precision color theme
" }}}
"BUFFERS {{{
set wildchar=<Tab> wildmenu wildmode=full
" }}}
"SEARCHING {{{
set ignorecase " ignore case when searching
set smartcase  " when searching try to be smart about cases
set incsearch  " search as characters are entered
set hlsearch   " highlight matches
" }}}
"FOLDING {{{
set foldenable        " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10    " 10 nested fold max
set foldmethod=indent " fold based on indent level
set modelines=1       " last line of the file specifies/overrides fold prefs
" }}}
"KEY BINDINGS {{{
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
let mapleader = ","
let localmapleader = ","
nmap <leader>n :bn<cr>
nmap <leader>w :w<cr>                        " express file save
nmap <leader>q :q<cr>                        " express file quit
nmap <leader>wq :wq<cr>                      " express file save & quit
nnoremap <space> za
nnoremap <silent> <C-D> :NERDTreeToggle <cr> " opens NERDTree sidebar
" }}}
"SCRIPTS {{{
autocmd BufWritePre * :%s/\s\+$//e " remove trailing whitespaces
" }}}
"EXTENSION SPECIFIC {{{
autocmd BufNewFile,BufRead *.tex set foldmethod=marker
autocmd BufNewFile,BufRead *.tex set foldlevel=0
" }}}
"LaTeX CONFIG {{{
setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
    setlocal makeprg=make
else
    exec "setlocal makeprg=make\\ -f\\ ~/.latex.mk\\ " . substitute(bufname("%"),"tex$","pdf", "")
endif
" }}}
"PLUGIN : ctrlp.vim {{{
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}

" vim:foldmethod=marker:foldlevel=0
