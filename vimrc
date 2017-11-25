"        FILE: .vimrc
" DESCRIPTION: Vim configuration file
"      AUTHOR: Matt Schreck <mschreck@gmail.com>

""" Startup Checks ························································{


if has("win32") || has('win64')
  "This is from vim wiki. Needs to be before plugins and will set folders on windows
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif 

""" }

""" Plugin Management ·····················································{

call plug#begin('~/.vim/plugged')

" Sensible vim defaults from Mr. Pope
Plug 'tpope/vim-sensible'

" Creates a 'tab' buffer displaying open buffers
Plug 'weynhamz/vim-plugin-minibufexpl'

" File system navigation sidebar
Plug 'vim-scripts/The-NERD-tree', {'on':'NERDTreeToggle'}

" Code navigation sidebar
Plug 'vim-scripts/taglist.vim', {'on':'Tlist'}

" Status line modification
Plug 'itchyny/lightline.vim'

" Do git from inside Vim
Plug 'tpope/vim-fugitive'

" File indentation detection
Plug 'Raimondi/YAIFA'

" Context aware pasting
Plug 'sickill/vim-pasta'

" Keeps a history of yanks, changes, and deletes. Like emacs killring.
Plug 'vim-scripts/YankRing.vim'

" Syntax checking through external checkers.
"Plug 'scrooloose/syntastic'

" Comment and uncomment code.
"Plug 'tomtom/tcomment_vim'

" make parens more visible
Plug 'luochen1990/rainbow'

" Colors
Plug 'chriskempson/vim-tomorrow-theme'

" Special icons for plugins
Plug 'ryanoasis/vim-devicons'

" Language plugins
"Plug 'stephpy/vim-yaml', {'for':'yaml'}
Plug 'elixir-lang/vim-elixir'

call plug#end()

""" }

""" Plugin Settings ·······················································{

"""" Rainbow

let g:rainbow_conf = {
      \ 'guifgs': ['steelblue2', 'darkmagenta', 'chartreuse3', 'hotpink3', 'royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \   '*': {},
      \   'vim': {
      \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \   },
      \   'html': {
      \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \   },
      \   'css': 0,
      \ }
      \}

let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

"""" Lightline

if has("win32") || has('win64')
  let g:lightline = {
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
        \ 'separator': { 'left': '}', 'right': '{' },
        \ 'subseparator': { 'left': '›', 'right': '‹' }
        \ }
else
  let g:lightline = {
        \ 'component': {
        \   'lineinfo': '%-2v',
        \ },
        \ 'component_function': {
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }
endif

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : '') : ' '
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ' '
endfunction

" Hide mode below status line
"set noshowmode

"""" Tlist

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

"""" NERDTree

" remap F9 to toggle NERD Tree window
nnoremap <F9> :NERDTreeToggle<CR>

" Show menu on right-hand side
let g:NERDTreeWinPos = "right"

"""" YankRing

nnoremap <silent> <F11> :YRShow<CR>

"""" MiniBufExpl

" Mouseclick on buffer focuses it
let g:miniBufExplUseSingleClick = 1

" Only require one buffer to open MBE
let g:miniBufExplBuffersNeeded = 1

" Keyboard mappings
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
noremap <C-TAB>   :bn<CR>
noremap <C-S-TAB> :bp<CR>
map <Leader>t :MBEToggle<cr>
map <Leader>w :MBEbd!<cr>
" map <Leader>e :MBEOpen<cr>
" map <Leader>c :MBEClose<cr>

""" }

""" General Settings ······················································{

" here's some stuff for spell correcting:
" this jumps to the previous spelling error and chooses the first suggestion,
" then jumps us back to where we are
" <c-g>u inserts an undo-break, so we can undo this with <esc>u
" when we undo, it jumps us to the start of that word! Handy!
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>

" Use shared clipboard if available
set clipboard=unnamed

" only redraw when needed. supposedly makes macros faster.
set lazyredraw

" be able to handle my common filetypes. GBK still seems broken
set encoding=utf-8
set fileencodings+=prc

 " I use this on non-English systems, so set gvim menu to EN
set langmenu=en_US.UTF-8

" Auto read externally modified files.
set autoread

" Auto write before certain commands.
set autowrite

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

" Save battery by letting OS flush to disk.
set nofsync

" keep 1000 undo levels
set undolevels=1000

""" }

""" Presentation ··························································{

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

" Show hidden characters by default
set list!

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Never let a window be less than 1px.
set winminheight=1

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:›₋,eol:¬,trail:·,extends:»,precedes:«

set textwidth=0

set wrapmargin=0

" Highlight search matches
set hlsearch

" Remove toolbar if available
set guioptions-=T  "remove toolbar

if has('osx')
  set guifont=Knack\ Regular\ Nerd\ Font\ Complete:h12
endif

if has('win32') || has('win64')
  " Set font
  set guifont=consolas:h10
  " Set window size to something bigger. This feels good on windows
  set lines=50 columns=120
endif

""" }

""" Color Schemes ·························································{

" Silent so that Vim won't complain if plugins haven't been loaded yet
if has('win32') || has('win64')
  " Change colorscheme to something that looks better on windows
  silent! colorscheme Tomorrow-Night-Eighties
else
  silent! colorscheme Tomorrow-Night
endif

""" }

""" System Specific Tweaks ················································{

"if has("unix")
"  let s:uname = system("uname")
"  if s:uname == "darwin\n"
"    " do mac stuff here
"  endif
"  if s:uname == "linux\n"
"    " do linux stuff here
"  endif
"endif

if has('win32') || has('win64')
  " CTRL-X and SHIFT-Del are Cut
  vnoremap <C-X> "+x
  vnoremap <S-Del> "+x

  " CTRL-C and CTRL-Insert are Copy
  vnoremap <C-C> "+y
  vnoremap <C-Insert> "+y

  " CTRL-V and SHIFT-Insert are Paste
  map <C-V>       "+gP
  map <S-Insert>      "+gP

  cmap <C-V>      <C-R>+
  cmap <S-Insert>     <C-R>+

  " Pasting blockwise and linewise selections is not possible in Insert and
  " Visual mode without the +virtualedit feature.  They are pasted as if they
  " were characterwise instead.
  " Uses the paste.vim autoload script.

  exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
  exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

  imap <S-Insert>     <C-V>
  vmap <S-Insert>     <C-V>

  " Use CTRL-Q to do what CTRL-V used to do
  noremap <C-Q>       <C-V>

  " CTRL-A is Select all
  noremap <C-A> gggH<C-O>G
  inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
  cnoremap <C-A> <C-C>gggH<C-O>G
  onoremap <C-A> <C-C>gggH<C-O>G
  snoremap <C-A> <C-C>gggH<C-O>G
  xnoremap <C-A> <C-C>ggVG
endif

""" }

""" Deprecated Stuff ······················································{

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

""" }
