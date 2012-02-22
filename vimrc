" Incompatible vi
set nocompatible

" Affichage des # de lignes
set nu

" Configuration du backspace
set backspace=indent,eol,start

" Un historique raisonnable
set history=100

" Undo, pour revenir en arrière
set undolevels=150

" Fichier relu automatiquement quand il est modifie en dehors de vim
set autoread

" Quand une fermeture de parenthèse est entrée par l'utilisateur,
" l'éditeur saute rapidement vers l'ouverture pour montrer où se
" trouve l'autre parenthèse. Cette fonction active aussi un petit
" beep quand une erreur se trouve dans la syntaxe.
set showmatch
set matchtime=2

" Afficher la barre d'état
set laststatus=2

" Affiche la position du curseur
set ruler

" Désactiver le wrapping
set nowrap

" Accélère théoriquement l'affichage
set ttyfast

" Auto et smart indentation
set ai
set si
 
" Display incomplete commands
set showcmd		

" Recherche incrémentielle
set incsearch

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Ignore la casse dans la recheche... sauf si on tape une majuscule 
set  ignorecase
set  smartcase

" Met en valeur la ligne du curseur 
set cursorline

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

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

" Active/Desactive le hilite de la recherche en pressant sur F3
noremap <F3> :set hlsearch!<CR>

" Gestion des fichiers LESS et Twig (fichiers de syntaxe dans .vim/plugin)
au BufRead,BufNewFile *.less set filetype=less
au BufRead,BufNewFile *.twig set filetype=htmljinja

" Navigation entre les tabs
:nmap <C-k> :tabprevious<CR>
:nmap <C-l> :tabnext<CR>
:map <C-k> :tabprevious<CR>
:map <C-l> :tabnext<CR>
:imap <C-k> <Esc>:tabprevious<CR>i
:imap <C-l> <Esc>:tabnext<CR>i
:nmap <C-t> :tabnew<CR>
:imap <C-t> <Esc>:tabnew<CR>
map <F2> :NERDTreeToggle<CR>
map <C-P> :MRU<CR>
:nmap \h :set syntax=htmljinja<CR>
:nmap \j :set syntax=jinja<CR>

" Active les 256 couleurs si possible
set t_Co=256

" Gestion de la tabulation
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Theme
colorscheme desert256

" Gestion des sessions
nmap §§ <ESC>:mksession! ~/Session.vim<CR>:wqa<CR>
function! RestoreSession()
	if argc() == 0 "vim called without arguments
		execute 'source ~/Session.vim'
	end
endfunction
autocmd VimEnter * call RestoreSession()
	
