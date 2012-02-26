" Compatibility

	set nocompatible								" must be first line
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	set backspace=indent,eol,start					" backspace configuration
	set ttyfast
    if !has('win32') && !has('win64')
        set term=$TERM								" Make arrow and other keys work
		set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    endif

" Basics

	
	call pathogen#infect()		" Pathogen to ease plugin support
	scriptencoding utf-8		" utf8-encoding
	if has('mouse')				" Mouse support when available
	  set mouse=a
	endif

" Backups

	set backup					" backup activation
	set undofile				" keep persistent undo
	set history=1000
	set undolevels=1000
	set undoreload=10000		"maximum number lines to save for undo on a buffer reload

" Display

	colorscheme desert256
	filetype plugin indent on  	" automatically detect file types
	syntax on					" syntax hilite
	set nu						" display line number
	set virtualedit=onemore		" allow for cursor beyond last character
	set background=dark			" assume a dark background
	set autoread				" autorefresh file after an external modification
	set cursorline				" underline current line
	set tabpagemax=15			" only show 15 tabs
	set t_Co=256

" Code edition

	set nowrap					" nowrap
	set showmatch				" indicate matching bracket
	set matchtime=2				" duration of matching signal
	set ai						" auto-indentation
	set si						" smart-indentation
	set tabstop=4				" tab indent 
	set shiftwidth=4
	set softtabstop=4

" Search

	set incsearch				" incremential search
	set ignorecase				" ignore case during search
	set smartcase				" ingore case until first cap
	set hlsearch				" hilite search

" Status bar

	set laststatus=2			" display status bar
	set showcmd					" diplay incomplete actions		
	set ruler					" display cursor position

" Filetype

	au BufRead,BufNewFile *.less set filetype=less
	au BufRead,BufNewFile *.twig set filetype=htmljinja

" Restore cursor position

	autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") |
	  \   exe "normal! g`\"" |
	  \ endif
	autocmd BufReadPost COMMIT_EDITMSG
	  \ exe "normal! gg"

" Remap

	set pastetoggle=<F12>		" pastetoggle (sane indentation on pastes)         	
	let mapleader = ','			" new leader key instead of \ 
	noremap <F3> :set hlsearch!<CR>
								" deactivate hl after search
	map <C-k> :tabprevious<CR>
	map <C-l> :tabnext<CR>
	map <C-t> :tabnew<CR>
	nmap <leader>h :set syntax=htmljinja<CR>
	nmap <leader>j :set syntax=jinja<CR>

" Plugins

	" NERDTree
	map <F2> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
								" open and close nerdframe
	let NERDTreeShowBookmarks=1
	let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
	let NERDTreeChDirMode=0
	let NERDTreeQuitOnOpen=1
	let NERDTreeShowHidden=1
	let NERDTreeKeepTreeInNewTab=1
			
	" MRU
	let g:ctrlp_map = '<C-f>'
	map <C-p> :CtrlPMRU<CR>
" Gestion des sessions
"nmap §§ <ESC>:NERDTreeClose<CR>:mksession! ~/Session.vim<CR>:wqa<CR>
"function! RestoreSession()
"	if argc() == 0 "vim called without arguments
"		execute 'source ~/Session.vim'
"	end
"endfunction
"autocmd VimEnter * call RestoreSession()
"augroup BgHighlight
"	autocmd!
"	autocmd WinEnter * set number
"	autocmd WinLeave * set nonumber
"augroup END
"doautocmd BgHighlight WinEnter



