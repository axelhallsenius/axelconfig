"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/haxxel/confrepos/axelconfig/.nvim/.//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/haxxel/confrepos/axelconfig/.nvim/./')
	call dein#begin('/home/haxxel/confrepos/axelconfig/.nvim/./')

	" Let dein manage dein
	" Required:
	call dein#add('/home/haxxel/confrepos/axelconfig/.nvim/.//repos/github.com/Shougo/dein.vim')

	" Add or remove your plugins here:
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	"delimitMate - bracket pairing
	call dein#add( 'Raimondi/delimitMate')

	"Moar Colorschemes - flazz
	call dein#add( 'flazz/vim-colorschemes')

	"YouCompleteMe - Nice fuzzy autocompleter 
	call dein#add( 'https://github.com/Valloric/YouCompleteMe')

	"???
	"vim-slim - Syntax highlighting
	call dein#add( 'slim-template/vim-slim.git')
	"for rust:
	call dein#add( 'rust-lang/rust.vim')

	"Airline - Status bar with cool looking arrows
	call dein#add( 'https://github.com/vim-airline/vim-airline')
	call dein#add( 'vim-airline/vim-airline-themes')

	"EasyMotion - smooth movement by searching for single chars
	call dein#add( 'https://github.com/easymotion/vim-easymotion')

	"Noctu - color scheme stuff
	call dein#add( 'noahfrederick/vim-noctu')

	"Track the engine.
	call dein#add( 'SirVer/ultisnips')

	" Snippets are separated from the engine. Add this if you want them:
	call dein#add( 'honza/vim-snippets')

	"Fugitive - Git integration
	call dein#add( 'https://github.com/tpope/vim-fugitive')

	"Dark Tango color scheme
	call dein#add( 'vim-scripts/darktango.vim')

	"Ctrl P - Fuzzy file search
	call dein#add( 'https://github.com/kien/ctrlp.vim.git')

	" You can specify revision/branch/tag.
	call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

"--------- Key Remaps --------

"I run a swedish keyboard, and very rarely write the swedish special
"characters in Vim. On a standard swedish QWERTY ö is on the home row. Waste of prime
"real estate, if you ask me.

"Anyway, disable these 3 commands if you're not a swedo:
"binds ö to return to normal mode 
imap ö <Esc> <Esc>
vmap ö <Esc> <Esc>
"binds Ctrl-o to ö
imap <C-O> <C-K> ö

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
"map <Leader>e :e 
map <Leader>q :bdelete<CR>

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

"system clipboard yank and paste
noremap <Leader>p "+p
noremap <Leader>y "*y
noremap <Leader>d "*d


"Makes space o do fuzzy file search
nnoremap <Leader>o :CtrlP<CR>

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

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
set noshowmode

"--Ranger File Manager - integration
""	map <Leader>x :call RangerExplorer()<CR>
"map <Leader>e :terminal(ranger)<CR>

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>e :<C-U>RangerChooser<CR>

" -- color scheme --
"colorscheme gruvbox
set guifont=Inconsolata-dz\ for\ Powerline\ 12
let g:airline_theme = 'ubaryd'
" -- 


"Gvim specific:
"if has('gui_running')
"	set guioptions=
"	set guifont=Inconsolata-dz\ for\ Powerline\ 12
"	set mouse=c
"endif

"Automatic () pairing
"let delimitMate_expand_cr = 1
"filetype indent plugin on

"		###########################
"		# That's all, folks				#
"		#													#
"		# Feel free to provide		#
"		# feedback and criticism	#
"		###########################
