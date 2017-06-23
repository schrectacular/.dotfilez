" Hi!

" MY STUFF

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" BEGIN VUNDLE
"
 filetype off                   " required!

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#rc()

 " let Vundle manage Vundle
 " required!  
 Bundle 'VundleVim/Vundle.vim'

 " Bundles here:

 "General
 Bundle 'scrooloose/nerdtree'
 Bundle 'fholgado/minibufexpl.vim'
" Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-repeat'
 Bundle 'taglist.vim'
 Bundle 'bling/vim-airline'
" Bundle 'vim-scripts/YankRing.vim'

 "Languages and highlighting
 "Plugin 'elixir-lang/vim-elixir'
 Bundle 'elixir-lang/vim-elixir'
 Bundle 'stephpy/vim-yaml'

 "Color theme
 Plugin 'chriskempson/base16-vim'

 "Javascript
 "Bundle 'JavaScript-Indent'
 "Bundle 'pangloss/vim-javascript'
 "Bundle 'itspriddle/vim-jquery'
 "Bundle 'leshill/vim-json'

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

 " END OF VUNDLE

 " Vundled plugins setup

" For some reason this doesn't work when --remote flag is used
silent! let Tlist_Auto_Open = 0
" close all folds except for current file let Tlist_File_Fold_Auto_Close = 1 " make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 0
" self explanitory
let Tlist_Exit_OnlyWindow = 1
" remap F8 to toggle the Tlist window
nnoremap <silent> <F8> :Tlist<CR>

nnoremap <F9> :NERDTreeToggle<CR>

" default minibuffer setup 
let g:miniBufExplUseSingleClick = 1

noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
noremap <C-TAB>   :bn<CR>
noremap <C-S-TAB> :bp<CR>

map <Leader>e :MBEOpen<cr>
map <Leader>c :MBEClose<cr>
map <Leader>t :MBEToggle<cr>
map <Leader>w :MBEbd!<cr>

" here's some stuff for spell correcting:
"
" this jumps to the previous spelling error and chooses the first suggestion,
" then jumps us back to where we are
" <c-g>u inserts an undo-break, so we can undo this with <esc>u
" when we undo, it jumps us to the start of that word! Handy!
imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nmap <c-f> [s1z=<c-o>

set clipboard=unnamed

" be able to handle my common filetypes. GBK still seems broken
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1,prc

" Oh, China.
set langmenu=en_US.UTF-8 " sets the language of the menu (gvim)

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Check for version maintenance
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=1000		" keep 50 lines of command line history
set undolevels=1000
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
  set mousehide		" Hide the mouse when typing text
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")

  syntax on
  set hlsearch

  set guioptions-=T  "remove toolbar
  set guifont=Menlo\ Regular:h12

endif

"shows line numbers
set nu

" Lets you navigate away from unsaved buffers
set hidden

" try this on by default, set a leader to it
set list!

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:‣\ ,eol:¬

set textwidth=0
set wrapmargin=0

" show status line
set laststatus=2

" Coloring stuff

set background=light
" Vim won't complain if it can't find this
silent! colorscheme base16-tomorrow

if has("win32")
  set guifont=Consolas:h11
  " fullscreen
  au GUIEnter * simalt ~x
endif

" Deprecated stuff:

" good for perl
"set softtabstop=4 shiftwidth=4 expandtab

" Set a more convinient map leader
" let mapleader=','

" Fast exit from insert mode by pressing jk simultaneously
"inoremap kj <Esc>
"inoremap jk <Esc>

" Don't move your fingers to arrow keys for history
"cnoremap <C-k> <Up>
"cnoremap <C-j> <Down>

"""""""""""""""""""""""""""""""" END MY STUFF """"""""""""""""""""""""""""""""

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
