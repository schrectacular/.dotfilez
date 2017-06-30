if has("win32") || has('win64')
  " This is from vim wiki. Needs to be before plugins and will set folders on windows
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

""""""""""""""""""""" BEGIN PLUGINS """""""""""""""""""""
call plug#begin()

""" General
Plug 'tpope/vim-sensible'
Plug 'weynhamz/vim-plugin-minibufexpl'
Plug 'vim-scripts/The-NERD-tree', {'on':'NERDTreeToggle'}
Plug 'vim-scripts/taglist.vim', {'on':'Tlist'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
"Plug 'vim-airline/vim-airline'
"Plug 'stephpy/vim-yaml', {'for':'yaml'}
"Plug 'elixir-lang/vim-elixir', {'for':'elixir'}
call plug#end()
"""""""""""""""""" PLUGIN SETTINGS """"""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" For some reason this doesn't work when --remote flag is used
silent! let Tlist_Auto_Open = 0
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 0
" quit if taglist is the only window left
let Tlist_Exit_OnlyWindow = 1
" remap F8 to toggle the Tlist window
nnoremap <silent> <F8> :Tlist<CR>

" remap F9 to toggle NERD Tree window
nnoremap <F9> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Mouseclick on buffer focuses it
let g:miniBufExplUseSingleClick = 1

" Only require one buffer to open MBE
let g:miniBufExplBuffersNeeded = 1

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

noremap <C-TAB>   :bn<CR>
noremap <C-S-TAB> :bp<CR>

" map <Leader>e :MBEOpen<cr>
" map <Leader>c :MBEClose<cr>
map <Leader>t :MBEToggle<cr>
map <Leader>w :MBEbd!<cr>

""""""""""""""""""""" END PLUGINS """""""""""""""""""""

" here's some stuff for spell correcting:
" this jumps to the previous spelling error and chooses the first suggestion,
" then jumps us back to where we are
" <c-g>u inserts an undo-break, so we can undo this with <esc>u
" when we undo, it jumps us to the start of that word! Handy!
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>

set clipboard=unnamed

" only redraw when needed. supposedly makes macros faster.
set lazyredraw

" be able to handle my common filetypes. GBK still seems broken
set encoding=utf-8
set fileencodings+=prc

" Oh, China.
set langmenu=en_US.UTF-8 " sets the language of the menu (gvim)

" Keep a backup file
set backup

" Do not back up temporary files.
set backupskip=/tmp/*,/private/tmp/*"

" Store backup files in one place.
set backupdir^=$HOME/.vim/backup//

" Store swap files in one place.
set dir^=$HOME/.vim/swap//

" Store undo files in one place.
set undodir^=$HOME/.vim/undo//

" Store view files in one place.
set viewdir=$HOME/.vim/view//

" Save undo tree.
set undofile

" keep 1000 undo levels
set undolevels=1000
" display incomplete commands
set showcmd
"shows line numbers
set nu
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  " Turn mouse on
  set mouse=a
  " Hide the mouse when typing text
  set mousehide
endif
" Lets you navigate away from unsaved buffers
set hidden
" try this on by default
set list!
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:â€ºâ‚‹,eol:Â¬,trail:Â·,extends:Â»,precedes:Â«
set listchars=tab:›₋,eol:¬,trail:·,extends:»,precedes:«
set textwidth=0
set wrapmargin=0

" coloring stuff

" set background=light
" vim won't complain if it can't find this
silent! colorscheme desert

" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")	"more than a 2 color gui
  syntax on
  set hlsearch
  set guioptions-=t  "remove toolbar
endif

if has("gui_macvim")
  set guifont=Knack\ Regular\ Nerd\ Font\ Complete\ Mono:h12
endif
if has("win32") || has('win64')
  set guifont=consolas:h10
  "set window size to something bigger. This feels good on windows
  set lines=50 columns=120
  " fullscreen
  " au guienter * simalt ~x
endif

if has("unix")
  let s:uname = system("uname")
  if s:uname == "darwin\n"
    " do mac stuff here
  endif
  if s:uname == "linux\n"
    " do linux stuff here
  endif
endif

" deprecated stuff:

" good for perl
"set softtabstop=4 shiftwidth=4 expandtab

" set a more convinient map leader
" let mapleader=','

" fast exit from insert mode by pressing jk simultaneously
"inoremap kj <esc>
"inoremap jk <esc>

" don't move your fingers to arrow keys for history
"cnoremap <c-k> <up>
"cnoremap <c-j> <down>

"""""""""""""""""""""""""""""""" END MY STUFF """"""""""""""""""""""""""""""""
