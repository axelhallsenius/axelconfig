"set nocompatible              " be iMproved, required
"filetype off                  " required

" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" Plugins Ahoy!
" ------------------------------------

"Unimpaired - Bracket Pairing
NeoBundle 'https://github.com/tpope/vim-unimpaired'

"UlitSnips - Snipet thingie
"NeoBundle 'https://github.com/SirVer/ultisnips.git'

"Moar Colorschemes - flazz
NeoBundle 'flazz/vim-colorschemes'

"YouCompleteMe - Nice fuzzy autocompleter 
NeoBundle 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'unix'    : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'windows' : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ 'cygwin'  : './install.sh --clang-completer --system-libclang --omnisharp-completer'
        \ }
     \ }

"???
"vim-slim - Syntax highlighting
NeoBundle 'slim-template/vim-slim.git'

"Airline - fine stuff
NeoBundle 'https://github.com/vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

"EasyMotion - smooth movement by searching for single chars
NeoBundle 'https://github.com/easymotion/vim-easymotion'

"Noctu - color scheme stuff
NeoBundle 'noahfrederick/vim-noctu'

"Track the engine.
NeoBundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
NeoBundle 'honza/vim-snippets'

"Fugitive - Git integration
NeoBundle 'https://github.com/tpope/vim-fugitive'

"Vim Multiple Cursors - Sublime Text style multiple cursors
"NeoBundle 'terryma/vim-multiple-cursors' 

"Rainbow Parenthesis - pairs parens by color
"NeoBundle 'kien/rainbow_parentheses.vim'

"Dark Tango color scheme
NeoBundle 'vim-scripts/darktango.vim'

"Ctrl P - Fuzzy file search
NeoBundle 'https://github.com/kien/ctrlp.vim.git'

call neobundle#end()  
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

"-------- Syntax Stuff ------

"Enable syntax highlighting
syntax enable

"Enables line numbers on the left
set number

"makes tabspace 2 spaces
set tabstop=2
set shiftwidth=2

"--------- Key Remaps --------

"binds öö to return to normal mode 
imap öö <Esc> <Esc>
vmap öö <Esc> <Esc>

"Maps J to make a new line
map J o<Esc>

"maps space to be the Leader command.
map <Space> <Leader>

"Moves words like a Ctrl+arrow would in Word
map H B
map L E

"switch active buffer between those on screen using space and directionals
map <Leader>h <C-W>h
map <Leader>j <C-W>j
map <Leader>k <C-W>k
map <Leader>l <C-W>l

"quick commands for write and splitting screen
map <Leader>w :w<CR>
map <Leader>e :e 
map <Leader>q :bdelete<CR>

"--buffer movement--
"map <M>1 :buffer1
"map <M>2 :buffer2
"map <M-3> :buffer3
"map <M-4> :buffer4
"map <M-5> :buffer5
"map <M-6> :buffer6
"map <M-7> :buffer7
"map <M-8> :buffer8
"map <M-9> :buffer9
"map <M-0> :buffer0

map <Leader>k :bn<CR>
map <Leader>j :bp<CR>

map <Leader>r :substitute 


"-- EasyMotion --

"easymove to 1 char
map  s <Plug>(easymotion-bd-f)
nmap s <Plug>(easymotion-overwin-f)

"easymove to 1 2 chars
nmap <Leader>f <Plug>(easymotion-overwin-f2)

"Easymove to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"Easymove to word
map  <Leader>g <Plug>(easymotion-bd-w)
nmap <Leader>g <Plug>(easymotion-overwin-w)

"sys clipboard yank and paste
"
"WIP
noremap <Leader>p "+p
noremap <Leader>y "*y
noremap <Leader>d "*d

"make some nice mappings to copy and paste from the system clipboard
"map <leader>y "*y
"map <leader>p "*p

"Makes space o do fuzzy file search
nnoremap <Leader>o :CtrlP<CR>

"----------- Plugin Sheisse ---------

"-- UltiSnips --

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="åå"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"--Airline--
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts = 1
set laststatus=2

"unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = 'L'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = 'L'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set noshowmode

"--Ranger File Manager - integration
if !has('gui_running')
	function RangerExplorer()
		exec "silent !ranger --choosefile=/tmp/vim_ranger_current_file " . expand("%:p:h")
		if filereadable('/tmp/vim_ranger_current_file')
			exec 'edit ' . system('cat /tmp/vim_ranger_current_file')
			call system('rm /tmp/vim_ranger_current_file')
		endif
		redraw!
	endfun
	map <Leader>x :call RangerExplorer()<CR>
endif

"--Rainbow Parenthesis - pairs parentheses color wise --
"WIP
"

" -- color scheme --
colorscheme gruvbox
let g:airline_theme = 'ubaryd'
" -- 

"Gvim specific:
if has('gui_running')
	set guioptions=
	set guifont=Inconsolata-dz\ for\ Powerline\ 12
endif
