"########################################
"       #                          #
"       #                          #
"   ####################################
"   #                                  #
"   # Axel Hallsenius' .vimrc          #
"   #                                  #
"   #  I use vim for all kinds of      #
"   #  programming, and occationally   #
"   #  some fiction. That's where      #
"   #  prose mode comes in.            #
"   #                                  #
"   #  I've commented it a little bit. #
"   #  However, it maybe a bit of a    #
"   #  mess.                           #
"   #                                  #
"   #  You can reach me @:             #
"   #  axelhallsenius@gmail.com        #
"   #  or                              #
"   #  your friendly local foobar      #
"   #                                  #
"   ####################################

" Required things
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
"Plugin 'https://github.com/tpope/vim-unimpaired'

"delimitMate - bracket pairing
Plugin 'Raimondi/delimitMate'

"Colorschemes
    "Moar Colorschemes - flazz
    Plugin 'flazz/vim-colorschemes'

    "Synthwave Colorscheme
    Plugin 'exitface/synthwave.vim'

    "Vim-code-dark colorscheme
    Plugin 'tomasiser/vim-code-dark'

    "Vimspectr - color scheme sythesis
    Plugin 'nightsense/vimspectr'
    
    "Noctu - color scheme stuff
    Plugin 'noahfrederick/vim-noctu'

    "Dark Tango color scheme
    Plugin 'vim-scripts/darktango.vim'
    
    "Office
    Plugin 'nightsense/office'

"YouCompleteMe - Nice fuzzy autocompleter 
Plugin 'https://github.com/Valloric/YouCompleteMe'

"vim-slim - syntax highlighting
Plugin 'slim-template/vim-slim'
"Syntax for other languages:
    "for rust:
    Plugin 'rust-lang/rust.vim'

    "for typescript
    Plugin 'leafgarland/typescript-vim'

    "for javascript
    Plugin 'pangloss/vim-javascript'

    "python
    Plugin 'https://github.com/hdima/python-syntax'
    
    "html5
    Plugin 'https://github.com/othree/html5.vim'
    
    "scss
    Plugin 'https://github.com/cakebaker/scss-syntax.vim'

    "js libs
    Plugin 'https://github.com/othree/javascript-libraries-syntax.vim'

    "extra C
    Plugin 'https://github.com/justinmk/vim-syntax-extra'

    "dockerfile
    Plugin 'https://github.com/ekalinin/Dockerfile.vim'

    "arduino
    Plugin 'sudar/vim-arduino-syntax'
    
    "haskell-vim - syntax highlighting for haskell
    Plugin 'neovimhaskell/haskell-vim'


"auto load scripts something ???
Plugin 'https://github.com/xolox/vim-misc'
"Easytags - does something to tags that has something to do with syntax
"highlighting...
Plugin 'https://github.com/xolox/vim-easytags'

"Airline - Status bar with cool looking arrows
Plugin 'https://github.com/vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"EasyMotion - smooth movement by searching for single chars
Plugin 'https://github.com/easymotion/vim-easymotion'

"Ultisnips engine - snippet thingie
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"Fugitive - Git integration
Plugin 'https://github.com/tpope/vim-fugitive'

"Ctrl P - Fuzzy file search
Plugin 'https://github.com/kien/ctrlp.vim.git'

"Things for prose mode - took it from a blog, forgot which.
    "Goyo - focused prose mode
    Plugin 'junegunn/goyo.vim'

    "Limelight - focuses on paragraph
    Plugin 'junegunn/limelight.vim'
    
    "vimPencil - prose style word wrap etc
    "Plugin 'reedes/vim-pencil'

"folding in .md org-mode style
Plugin 'nelstrom/vim-markdown-folding'

"Syntastic - inline syntax checking
Plugin 'vim-syntastic/syntastic'



"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"-------- Syntax Stuff ------

"Enable syntax highlighting
syntax enable

"Enables line numbers on the left
set number! relativenumber!

"makes tabspace 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

set formatprg=stylish-haskell


"--------- Key Remaps --------

"binds h to return to normal mode 
imap hh <Esc> <Esc>
vmap hh <Esc> <Esc>

"maps space to be the Leader command.
map <Space> <Leader>

"Moves words like a Ctrl+arrow would in Word
map H B
map L E

map J }
map K {

"switch active buffer between those on screen using space and directionals
map <Leader>h <C-W>h
map <Leader>u <C-W>j
map <Leader>n <C-W>k
map <Leader>l <C-W>l

"quick commands for write and splitting screen
map <Leader>w :w<CR>
map <Leader>e :e 
map <Leader>q :bdelete<CR>

"Cycle buffers
map <Leader>k :bn<CR>
map <Leader>j :bp<CR>

"substitute selection
map <Leader>r :substitute 


"-- EasyMotion --

let g:EasyMotion_keys="asdfghjklqwertyuiopzxcvbnm"

"easymove to 1 char
map  ä <Plug>(easymotion-bd-f)
nmap ä <Plug>(easymotion-overwin-f)

"easymove to 1 2 chars
"nmap <Leader>f <Plug>(easymotion-overwin-f2)

"Easymove to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"Easymove to word
map  <Leader>g <Plug>(easymotion-bd-w)
nmap <Leader>g <Plug>(easymotion-overwin-w)

"system clipboard yank and paste
noremap <Leader>p "+p
noremap <Leader>y "*y
noremap <Leader>d "*d


"Makes space o do fuzzy file search
nnoremap <Leader>o :CtrlP<CR>

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
"let g:airline_symbols.space = \ua0"

let g:airline_powerline_fonts = 1
set laststatus=2

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

" -- color scheme --
set t_Co=256 
colorscheme noctu
let g:airline_theme = 'angr'


"Automatic () pairing
let delimitMate_expand_cr = 1
filetype indent plugin on

"Sets shading for non focused paragraphs in prose mode
let g:limelight_conceal_ctermfg = 241

"Enter prose mode
map <F11> :Goyo <CR> 
":Limelight!! <CR>

"folding for markdown
set nocompatible
if has("autocmd")
    filetype plugin indent on
endif

"Syntastic - still to fix
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

map <Leader>c :SyntasticCheck<CR>

set encoding=utf-8

"save 'view' between sessions. Saves folds thusly
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview

"    ###########################
"    #                         #
"    # That's all, folks       #
"    #                         #
"    #  Feel free to provide   #
"    #  feedback, criticism    #
"    #  or ask me questions    #
"    #                         #
"    #  though in the case of  #
"    #  powerline fonts, I'm   #
"    #  afraid you're on       #
"    #  your own, friendo      #
"    #                         #
"    ###########################
