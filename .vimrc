set nocompatible              " be iMproved, required
filetype off                  " required

"-------- Vundle --------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Unimpaired - Bracket Pairing
Plugin 'https://github.com/tpope/vim-unimpaired'

"UlitSnips - Snipet thingie
"Plugin 'https://github.com/SirVer/ultisnips.git'

"YouCompleteMe - Nice fuzzy autocompleter 
Plugin 'https://github.com/Valloric/YouCompleteMe'

"Airline - fine stuff
Plugin 'https://github.com/vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"EasyMotion - smooth movement by searching for single chars
Plugin 'https://github.com/easymotion/vim-easymotion'

"-Ultisnips-

"Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Fugitive - Git integration
Plugin 'https://github.com/tpope/vim-fugitive'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"-------- Syntax Stuff ------

"Enable syntax highlighting
syntax on

"Enables line numbers on the left
set number

"--------- Key Remaps --------

"makes tabspace 2 spaces
set tabstop=2
set shiftwidth=2

"binds åå to return to normal mode 
imap åå <Esc> <Esc>
vmap åå <Esc> <Esc>

map <Space> <Leader>

map H B
map L W


"map <Ctrl>-H

"map W :w

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
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"sys clipboard yank and paste
"
"WIP
noremap <Leader>p "+p
noremap <Leader>y "*y
noremap <Leader>d "*d

"make some nice mappings to copy and paste from the system clipboard
"map <leader>y "*y
"map <leader>p "*p


"----------- Plugin Sheisse ---------

"-- UltiSnips --

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="öö"
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
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_theme='<base16>'
set noshowmode
