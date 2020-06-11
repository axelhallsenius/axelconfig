"neovim config file
"haxxel's config
"built with st as terminal, and a nice nice nerd-font in mind.

"Vim-Plug Plugins
"Req
call plug#begin()

"CoC - Auto-completion and general dev env stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Yank Stack - yank history
Plug 'maxbrunsfeld/vim-yankstack'

"Seoul Color scheme
"Plug 'junegunn/seoul256.vim'

"Nord colorscheme
Plug 'https://github.com/arcticicestudio/nord-vim'

"NerdTree - Nifty file finding sidebar
Plug 'preservim/nerdtree'

"Easymotion - Fast movement
Plug 'easymotion/vim-easymotion'

"Lightline - Powerline but reasonable
Plug 'itchyny/lightline.vim'

"Lightline Bufferline
Plug 'taohexxx/lightline-buffer'

"vim-devicons - icons for Nerdtree and stuff like that
Plug 'ryanoasis/vim-devicons'

"nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

"pencil - for writing non code
Plug 'reedes/vim-pencil'

"goyo - distraction free thingamajig
Plug 'junegunn/goyo.vim'

"vim-tex - LaTeX funcitons
Plug 'lervag/vimtex'

"Syntax checking - ale
Plug 'dense-analysis/ale'

"fugitive - git integration
Plug 'tpope/vim-fugitive'

"vim-go - go language support for vim
Plug 'fatih/vim-go'

"Req
call plug#end()

" -- Basics:

set encoding=UTF-8

"Enable syntax highlighting
set nocompatible
syntax enable
filetype plugin indent on

"Enables line numbers on the left
set number! relativenumber!

"makes tabspace 4 spaces
set tabstop=4
set shiftwidth=4

noremap <Leader>p "+p
noremap <Leader>y "*y
noremap <Leader>d "*d

" -- Keymaps for vanilla functions

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
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

"quick commands for write and splitting screen
map <Leader>w :w<CR>
map <Leader>e :e 
map <Leader>q :bdelete<CR>

"Cycle buffers
map <Leader>n :bn<CR>
map <Leader>b :bp<CR>

"map <Leader>j :bp<CR>

"Color Scheme

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
"let g:seoul256_background = 236
"colo seoul256
colorscheme nord

"Lightline relevant configuration
set laststatus=2

"NerdTree Activation
map <C-n> :NERDTreeToggle<CR>
imap <C-n> :NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
			\ "Modified"  : "✹",
			\ "Staged"    : "✚",
			\ "Untracked" : "✭",
			\ "Renamed"   : "➜",
			\ "Unmerged"  : "═",
			\ "Deleted"   : "✖",
			\ "Dirty"     : "✗",
			\ "Clean"     : "✔︎",
			\ 'Ignored'   : '☒',
			\ "Unknown"   : "?"
			\ }

"Easymotion mappings
let g:EasyMotion_keys="asdfghjklqwertyuiopzxcvbnm"

"easymovesymotion-bd-f) to 1 char
map � <Plug>(easymotion-bd-f)
nmap � <Plug>(easymotion-overwin-f)




" -- CoC relevant configuration:

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if has('patch8.1.1068')
" Use `complete_info` if your (Neo)Vim version supports it.
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

"airline conf
"let g:airline_theme='zenburn'
"enables buffer line at the top
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

"lightline Specific conf
set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

" use lightline-buffer in lightline
let g:lightline = {
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
	\ 'colorscheme': 'nord',
    \ }

" remap arrow keys
nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = 'β '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1

" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'

" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']

" max file name length
let g:lightline_buffer_maxflen = 30

" max file extension length
let g:lightline_buffer_maxfextlen = 3

" min file name length
let g:lightline_buffer_minflen = 16

" min file extension length
let g:lightline_buffer_minfextlen = 3

" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20

"vim-pencil config
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

" End
