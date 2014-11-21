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

" vim:foldmethod=marker:foldlevel=0
