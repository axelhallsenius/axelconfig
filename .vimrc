set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Powerline
Plugin 'https://github.com/powerline/powerline'

"EasyMotion
Plugin 'https://github.com/easymotion/vim-easymotion'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Enable syntax highlighting
syntax on

"Enables relative numbers on the left
"set relativenumber 
set number




"--------- Key Remaps --------

"makes tabspace  4 spaces
set tabstop=4
set shiftwidth=4

"binds åå to return to normal mode 
imap åå <Esc> <Esc>
vmap åå <Esc> <Esc>

map <Space> <Leader>

map H B
map L W

"map W :w

"--EasyMotion--

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"sys clipboard yank and paste
vnoremap <Leader>p "*pp
vnoremap <Leader>y "*y
