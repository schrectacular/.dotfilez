" MY STUFF

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" BEGIN VUNDLE
"
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles here:

"General
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
"Bundle 'minibufexpl.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'nelstrom/vim-blackboard'

"Web
Bundle 'HTML-AutoCloseTag'
Bundle 'gregsexton/MatchTag'
Bundle 'JavaScript-Indent'

"Javascript
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'leshill/vim-json'
"Bundle 'manalang/jshint.vim'
Bundle 'mmalecki/vim-node.js'
Bundle 'lambdalisue/nodeunit.vim'
Bundle 'digitaltoad/vim-jade'
"Bundle 'hallettj/jslint.vim'

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
let Tlist_Auto_Open = 0
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 0
" self explanitory
let Tlist_Exit_OnlyWindow = 1
" remap F8 to toggle the Tlist window
nnoremap <silent> <F8> :Tlist<CR>
nnoremap <F9> :NERDTreeToggle<CR>

" default minibuffer setup
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1

" be able to handle my common filetypes. GBK still seems broken
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,latin1,prc


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

" Set a more convinient map leader
let mapleader=','

" Fast exit from insert mode by pressing jk simultaneously
inoremap kj <Esc>
inoremap jk <Esc>

" Don't move your fingers to arrow keys for history
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

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

	color blackboard

	" Oh, China.
	set langmenu=en_US.UTF-8 " sets the language of the menu (gvim)

	" fullscreen
	au GUIEnter * simalt ~x
endif

"shows line numbers
set nu

" Lets you navigate away from unsaved buffers
set hidden

" try this on by default, set a leader to it
set list

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:►\ ,eol:¬

" tab settings
set ts=5 sts=5 sw=5 noexpandtab

if has("win32")
	set guifont=Consolas:h10
	set guioptions-=T  "remove toolbar
endif

" LIFTED FROM VIMCASTS

function! Preserve(command)
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	execute a:command
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>
nmap __ :call Preserve("g/^$/d")<CR>

" END MY STUFF

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

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


