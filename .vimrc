" -------------------- CASPER'S VIMRC -----------------------------------------

" -------------------- PLUGINS ------------------------------------------------
" add pathogen (plugin manager) to runtime path
runtime bundle/vim-pathogen/autoload/pathogen.vim

" execute pathogen
execute pathogen#infect()

" ALE & prettier
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']

" ulti snips
let g:UltiSnipsSnippetsDir="~/vimfiles/mysnippets"
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
    " unicode setting
    set termencoding=utf-8
    " make 256 colors work
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    " fix backspace issues with vim in ConEmu
    inoremap <Char-0x07F> <c-r>=Backspace()<CR>

    func Backspace()
        if col('.') == 1
            if line('.')  != 1
                return  "\<ESC>kA\<Del>"
            else
                return ""
            endif
        else
            return "\<Left>\<Del>"
        endif
    endfunc
endif

" -------------------- COLOR/HIGHLIGHTING -------------------------------------
" syntax highlighting on
syntax on

" choose color scheme
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
