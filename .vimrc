" -------------------- CASPER'S VIMRC -----------------------------------------

" -------------------- PLUGINS ------------------------------------------------
" ALE & prettier
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

" easymotion
"     disable default mapping
let g:EasyMotion_do_mapping = 0 

"     jump anywhere with minimal keystrokes
nmap s <Plug>(easymotion-overwin-f)

"     case insensitive
let g:EasyMotion_smartcase = 1

"     move to any word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"     move to any line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

"     move to line above or below
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" -------------------- UNICODE ------------------------------------------------
" fix unicode issues
if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif

" unicode test:
"   Euro symbol: [€]

" -------------------- FILE FORMAT --------------------------------------------
set ff=unix

" -------------------- BACKSPACE ----------------------------------------------
" fix backspace setting
set backspace=indent,eol,start

" -------------------- CONEMU/CMDER -------------------------------------------
" ConEmu (cmder on windows) settings, needed to make colors work.
if !empty($CONEMUBUILD)
    " make 256 colors work
    set term=xterm
    set t_Co=256
    " unicode setting
    set termencoding=utf-8
    set nocompatible
    " fix character issue
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    " fix backspace issues with vim in ConEmu
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

" -------------------- COLOR/HIGHLIGHTING -------------------------------------
" syntax highlighting on
filetype plugin on
syntax on

" choose color scheme
set background=dark
colorscheme molokai

" -------------------- MISC INFO ----------------------------------------------
" show column and line info
set ruler

" -------------------- WHITESPACE / INDENTATION -------------------------------
" allow filetypes to have unique indentation settings
" apparently, this is needed for UltiSnips to work properly
filetype plugin indent on

" tabs are 4 spaces. end of discussion.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" automatically indent
set autoindent

" don't wrap lines
set nowrap

" show whitespace
set nolist
set listchars=tab:→-,eol:↓,trail:⌂

" whitespace test:
		    	   	  	 	 	  	   	    	

" -------------------- FILE NAVIGATION ----------------------------------------
set autochdir

" -------------------- SEARCH -------------------------------------------------
" highlight search results
set hlsearch

" show partial matches for searches
set incsearch

" -------------------- MAPPINGS -----------------------------------------------
" map ENTER to insert new line (after current line) and exit insert mode
nmap <CR> o<Esc>

" same mapping with SHIFT+ENTER to insert new line before current line
nmap <S-Enter> O<Esc>

" map CTRL+n to open NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

" map jj to Escape for easier switching out of insert mode
inoremap jj <Esc>
