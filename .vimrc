" add pathogen (plugin manager) to runtime path
runtime bundle/vim-pathogen/autoload/pathogen.vim

" execute pathogen
execute pathogen#infect()

" ConEmu (cmder on windows) settings
if !empty($CONEMUBUILD)
	" unicode setting
	set termencoding=utf8
	" make 256 colors work
	set term=xterm
	set t_Co=256
	let &t_AB="\e[48;5;%dm"
	let &t_AF="\e[38;5;%dm"
endif

" syntax highlighting on
syntax on

" choose color scheme
colorscheme molokai

" tabs are 4 spaces. end of discussion.
set tabstop=4

" unicode characters available:
"   ¡²³¤€¼½¾‘’¥×
"   äåé®þüúíóö«»¬
"   áßðø¶´
"   æ©ñµç¿
" show whitespace
set list
set listchars=tab:©ú,eol:¿,trail:²

" highlight search results
set hlsearch

" show partial matches for searches
set incsearch

" map ENTER to insert new line (after current line) and exit insert mode
nmap <CR> o<Esc>

" same mapping with SHIFT+ENTER to insert new line before current line
nmap <S-Enter> O<Esc>

" map CTRL+n to open NERDTree
map <silent> <C-n> :NERDTreeFocus<CR>



