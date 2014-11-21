" VUNDLE PLUGINS {{{
set nocompatible                          " required by Vundle
filetype off                              " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim         " include Vundle in runtime path
call vundle#begin()                       " ininialize Vundle

Plugin 'gmarik/Vundle.vim'                " package manager self
Plugin 'scrooloose/nerdtree'              " advanced sidebar
Plugin 'kien/ctrlp.vim'                   " ctrl-p to quick find a file
                                          " in a project
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'             " syntax checker
Plugin 'Lokaltog/vim-easymotion'          " faster movement within a file
Plugin 'tpope/vim-commentary'             " gc to comment out
Plugin 'SirVer/ultisnips'                 " snippets engine
Plugin 'honza/vim-snippets'               " snippets
Plugin 'godlygeek/tabular'                " align multiple lines
                                          " based on a specific char

call vundle#end()                         " required by Vundle
filetype plugin indent on                 " required by Vundle
" }}}
" SPACES & TABS {{{
set expandtab      " tabs are spaces
set smarttab       " be smart about using tabs
set tabstop=4      " number of visual spaces per TAB
set shiftwidth=4   " 1TAB = 4SPACEs
set softtabstop=4  " number of spaces in tab when editing
filetype plugin on " enable filetype plugins
filetype indent on " load filetype-specific indent files
set ai             " auto indent
set si             " smart indent
" }}}
" UI CONFIG {{{
set number                   " show line numbers
syntax enable                " syntax highlighting
set showcmd                  " show command in the status bar
set autoread                 " auto read when file is changed
                             " from the outside
set cursorline               " highlight current line
set ruler                    " always show current position in the status bar
set lazyredraw               " redraw only when we need to
set showmatch                " highlight brackets () {} []
set encoding=utf-8           " choose encoding; fixes directory-arrows in NERDTree
set backspace=2              " backspace acts like it should now
set nobackup                 " turf off backup -> use git for the love of god
set spell spelllang=en_us    " spelling
set laststatus=2             " always display the status line
set list                     " always show invisible chars
set listchars=tab:▸\ ,eol:¬  " symbols for invisible chars
" }}}
" COLORS {{{
set background=dark " background of the solarized theme
colorscheme solarized " install theme in .vim/colors/ first!
" }}}
" SEARCHING {{{
set ignorecase " ignore case when searching
set smartcase " when searching try to be smart about cases
set incsearch " search as characters are entered
set hlsearch " highlight matches
" }}}
" FOLDING {{{
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
set modelines=1 " last line of the file specifies/overrides fold prefs
" }}}
" KEY BINDINGS {{{
let mapleader = "¨"
nmap <leader>w :w<cr> " express file save
nmap <leader>q :q<cr> " express file quit
nmap <leader>wq :wq<cr> " express file save & quit
nnoremap <space> za
nnoremap <silent> <C-D> :NERDTreeToggle <cr> " opens NERDTree sidebar
nmap <leader>l :set list!<CR> " toogle invisible chars
nnoremap <leader>t :w<CR>:!rubber --pdf --warn all %<CR> " LaTeX compilation with rubber
nnoremap <leader>v :!open %:r.pdf &<CR><CR> " view LaTeX pdf output
" }}}
" EXTENSION SPECIFIC {{{
autocmd BufNewFile,BufRead *.tex set foldmethod=marker
autocmd BufNewFile,BufRead *.tex set foldlevel=0
" }}}
" NERDTree {{{
"let NERDTreeWinSize=20 " NERDTree sidebar width
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft() " close NERDTree if it is the last open buffer
"let g:NERDTreeWinPos = "right" " NERDTree stays on the left side
let g:netrw_liststyle=3

" close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
"function! s:CloseIfOnlyNerdTreeLeft()
"    if exists("t:NERDTreeBufName")
"        if bufwinnr(t:NERDTreeBufName) != -1
"            if winnr("$") == 1
"             q
"            endif
"        endif
"    endif
"endfunction
" }}}
" ctrlp.vim {{{
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}
" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1 " enable top-status-bar
let g:airline_powerline_fonts = 1 " fixes arrows
let g:airline_detect_whitespace=0
" }}}
" Ultsnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}
" Snippets {{{
"ActivateAddons vim-snippets snipmate
" }}}
" LaTeX CONFIG {{{
"compile latex on *.tex save"
" autocmd BufWritePost,FileWritePost *.tex !pdflatex % && open %:r.pdf
" }}}

" vim:foldmethod=marker:foldlevel=0
