"VUNDLE PLUGINS {{{
set nocompatible                          " required by Vundle
filetype off                              " required by Vundle
set rtp+=~/.vim/bundle/Vundle.vim         " include Vundle in runtime path
call vundle#begin()                       " ininialize Vundle

Plugin 'gmarik/Vundle.vim'                " package manager self

"Plugin 'tpope/vim-fugitive'               " deep vim integration
Plugin 'Lokaltog/vim-easymotion'          " faster movement within a file
Plugin 'Shougo/neocomplcache.vim'         " completion!
Plugin 'godlygeek/tabular'                " align multiple lines
Plugin 'altercation/vim-colors-solarized' " precision colorscheme

call vundle#end()                         " required by Vundle
filetype plugin indent on                 " required by Vundle
" }}}
"SPACES & TABS {{{
set expandtab     " tabs are spaces
set smarttab      " be smart about using tabs
set tabstop=4     " number of visual spaces per TAB
set shiftwidth=4  " 1TAB = 4SPACEs
set softtabstop=4 " number of spaces in tab when editing
set autoindent    " auto indent
set smartindent   " smart indent
set listchars=tab:▸\ ,eol:¬
set list
" }}}
"UI CONFIG {{{
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
" }}}
"COLORS {{{
set background=light  " switch to dark for dark background
colorscheme solarized " precision color theme
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
nmap <leader>w :w<cr>                        " express file save
nmap <leader>q :q<cr>                        " express file quit
nmap <leader>wq :wq<cr>                      " express file save & quit
nnoremap <space> za
nnoremap <silent> <C-D> :NERDTreeToggle <cr> " opens NERDTree sidebar
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
"PLUGIN : NERDTree {{{
"let NERDTreeWinSize=20 " NERDTree sidebar width
"autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft() " close NERDTree if it is the last open buffer
"let g:NERDTreeWinPos = "right" " NERDTree stays on the left side
" let g:netrw_liststyle=3

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
"PLUGIN : ctrlp.vim {{{
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" }}}
"PLUGIN : vim-airline {{{
" let g:airline#extensions#tabline#enabled = 1 " enable top-status-bar
" let g:airline_powerline_fonts = 1 " fixes arrows
" let g:airline_detect_whitespace=0
" }}}
"PLUGIN : neocomplcache {{{
"cp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
 inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::' 
"}}}


" vim:foldmethod=marker:foldlevel=0
