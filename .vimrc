set nocompatible              " be iMproved, required
filetype off                  " requiredi

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Unimpaired - Bracket Pairing
Plugin 'https://github.com/tpope/vim-unimpaired'

"YouCompleteMe - Nice fuzzy autocompleter 
Plugin 'https://github.com/Valloric/YouCompleteMe'

"Powerline - Doesn't work, of course...
Plugin 'https://github.com/powerline/powerline'

"EasyMotion - smooth movement by searching for single chars
Plugin 'https://github.com/easymotion/vim-easymotion'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Enable syntax highlighting
syntax on

"Enables relative numbers on the left
"set relativenumber 
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

"--EasyMotion--

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
"noremap <Leader>p "+p
"noremap <Leader>y "+y

"make some nice mappings to copy and paste from the system clipboard
"map <leader>y "*y
"map <leader>p "*p
