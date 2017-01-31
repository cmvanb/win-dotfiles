" -------------------- CASPER'S VIMRC -----------------------------------------

" -------------------- PLUGINS ------------------------------------------------
" add pathogen (plugin manager) to runtime path
runtime bundle/vim-pathogen/autoload/pathogen.vim

" execute pathogen
execute pathogen#infect()

" ulti snips
let g:UltiSnipsSnippetsDir="~/vimfiles/mysnippets"
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

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
"   ¡²³¤¼½¾¥×
"   äåé®þüúíóö«»¬
"   áßðø¶´
"   æ©ñµç¿•▫░·□͵
"   Euro symbol: [€]

" -------------------- FILE FORMAT --------------------------------------------
set ff=unix

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
    set backspace=indent,eol,start
    inoremap <Char-0x07F> <c-r>=Backspace()<CR>
    inoremap <BS> <c-r>=Backspace()<CR>

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

" show whitespace
set list
set listchars=tab:⌐-,eol:↓,trail:º

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
map <silent> <C-n> :NERDTreeFocus<CR>

" remap hjkl to jkl; as this is the home row
" remap h (left) to l, l (right) to ; and ; (unkown) to h
noremap l h
noremap ; l
noremap h ;




