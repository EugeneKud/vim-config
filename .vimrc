" Vundle Plugins {{{
set nocompatible " required by Vundle
filetype off " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim " include Vundle in runtime path
call vundle#begin() " ininialize Vundle

Plugin 'gmarik/Vundle.vim' " package manager self
Plugin 'scrooloose/nerdtree' " advanced sidebar
Plugin 'kien/ctrlp.vim' " ctrl-p to quick find a file in a project
"Plugin 'altercation/vim-colors-solarized' " precision colorscheme
Plugin 'scrooloose/syntastic' " syntax checker

call vundle#end() " required by Vundle
filetype plugin indent on " required by Vundle
" }}}
" Colors {{{
"set background=dark " background of the solarized theme
"colorscheme solarized " install theme in .vim/colors/ first!
" }}}
" Spaces & Tabs {{{
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
set smarttab " be smart about using tabs
"set lbr " activate line break
"set tw=100 " set line break on 100 chars
set ai " auto indent
set si " smart indent
"set wrap " wrap lines
" }}}
" UI config {{{
set number " show line numbers
syntax enable " syntax highlighting
set showcmd " show command in the status bar
set autoread " auto read when file is changed from the outside
set cursorline " highlight current line
set ruler " always show current position
"filetype indent on " load filetype-specific indent files
"set wildmenu " provide a visual autocomplete for command menu
"set lazyredraw " redraw only when we need to
"set showmatch " highlight brackets () {} []
"set mat=2 " how many 1/10 of second to blink when matching brackets
set encoding=utf-8 " fixes arrows in NERDTree
"set ffs=unix,dos,mac " use UNIX as standard filetype
"set textwidth=80 " draw a vertical line at 80 chars
"set colorcolumn=-2 " set color of the column
"" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Turn backup off, since most stuff is in .git anyway
set nobackup
"set nowb
"set noswapfile
"set laststatus=2 " always show the status line
set term=xterm " informs vim which terminal is used
"set spell spelllang=en_us
" Format status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" Returns true if paste mode is enabled
"function! HasPaste()
        "if &paste
                "return 'PASTE MODE  '
        "en
        "return ''
"endfunction

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
 let mapleader = ","
 let g:mapleader = ","
"
" " Fast saving
 nmap <leader>w :w!<cr>

" }}}
" Searching {{{
set ignorecase " ignore case when searching
set smartcase " when searching try to be smart about cases
set incsearch " search as characters are entered
set hlsearch " highlight matches
nnoremap <leader><space> :nohlsearch<CR> " turn on search highlight
" }}}
" Folding {{{
set foldenable " enable folding
"set foldlevelstart=10 " open most folds by default
"set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
"set modelines=1
" }}}
" NERDTree {{{
"au VimEnter *  NERDTree " open sidebar everytime vim is triggered
"autocmd VimEnter * wincmd p " focus on file everytime file is opened in a tab
let NERDTreeWinSize=20 " sidebar width
nnoremap <silent> <C-D> :NERDTreeToggle <cr> " useful shortcut

"Close NERDTree if it is the last open buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" }}}
" ctrlp.vim {{{
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}
" LaTeX Config {{{
"compile latex on *.tex save"
"autocmd BufWritePost,FileWritePost *.tex !pdflatex % && open %:r.pdf
" }}}
" vim:foldmethod=marker:foldlevel=0
