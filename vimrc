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

	set nobackup				" backup activation
	set nowb
	set noswapfile
	set history=1000
	set undolevels=1000

" Display

	filetype plugin indent on  	" automatically detect file types
	syntax on					" syntax hilite
	set nu						" display line number
	set virtualedit=onemore		" allow for cursor beyond last character
	set autoread				" autorefresh file after an external modification
	set cursorline				" underline current line
	set tabpagemax=15			" only show 15 tabs
	set background=dark			" assume a dark background
	set t_Co=256
	colorscheme Tomorrow-Night

" Code edition

	let &showbreak = '↳   '
	set wrap					" wrap
	set showmatch				" indicate matching bracket
	set matchtime=2				" duration of matching signal
	set ai						" auto-indentation
	set si						" smart-indentation
	set tabstop=4				" tab indent 
	set shiftwidth=4
	set softtabstop=4
	set scrolloff=5 			" minimum lines to keep above and below cursor

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

" Restore cursor position

	autocmd BufReadPost *
	  \ if line("'\"") > 1 && line("'\"") <= line("$") |
	  \   exe "normal! g`\"" |
	  \ endif
	autocmd BufReadPost COMMIT_EDITMSG
	  \ exe "normal! gg"

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
			
	" CTRL-P
	let g:ctrlp_map = '<C-f>'	" search in files
	map <C-p> :CtrlPMRU<CR>
								" search in last opened files

	" vim-session
	if argc() == 0				" vim called without arguments
		let g:session_default_to_last=1
								" open the last session
		nmap <F10> :NERDTreeClose<CR>:SaveSession<CR>:qall<CR>
								" save session and quit
	else
		let g:session_autosave=0
	end
	set sessionoptions-=help	" help windows won't be restored

	
	" CTRLP
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
	set wildignore+=.git\*,.hg\*,.svn\*         " for Windows
	
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\.git$\|\.hg$\|\.svn$',
		\ 'file': '\.exe$\|\.so$\|\.dll$\|\.cache$\|\.less\.css$\|\.jpeg$\|\.jpg$\|\.png$\|\.gif$\|\.DS_Store$'
	\ }
	
	" Remap keys

	set pastetoggle=<F12>		" pastetoggle (sane indentation on pastes)         	
	let mapleader = ','			" new leader key instead of \ 
	noremap <F3> :set hlsearch!<CR>
								" deactivate hl after search
	map <C-k> :tabprevious<CR>
	map <C-l> :tabnext<CR>
	nmap <C-t> :tabnew<CR>
	nmap <leader>h :set syntax=html<CR>
	nmap <leader>j :set syntax=twig<CR>
	nmap <C-c> :q<CR>
	nmap <C-S-c> :q!<CR>

