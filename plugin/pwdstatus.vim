"
" pwdstatus.vim - a statusline that highlights key information (such as the pwd)
"

" no include guard, to allow ':source %' for easy editing

if has('statusline')
    if version >= 700
        set laststatus=2
        set statusline=
        set statusline+=%#MyColor1#
        set statusline+=%n                   " buffer number
        set statusline+=%#MyColor2#
        set statusline+=%{'/'.bufnr('$')}\   " total buffers
        set statusline+=%#MyColor3#
        set statusline+=%<%1.30{getcwd()}\ \ " pwd
        set statusline+=%#MyColor1#
        set statusline+=%<%1.30f             " filename
        set statusline+=%#MyColor3#
        set statusline+=\ %y%h%w             " filetype, help, example flags
        set statusline+=%#MyColor4#
        set statusline+=%r%m                 " read-only, modified flags
        set statusline+=%#MyColor3#
        set statusline+=%=\                  " indent right
        set statusline+=%#MyColor1#
        set statusline+=%l                   " line number
        set statusline+=%#MyColor2#
        set statusline+=/%{line('$')}        " total lines
        set statusline+=%#MyColor2#
        set statusline+=,
        set statusline+=%#MyColor1#
        set statusline+=%c%V                 " [virtual] column numberV
        set statusline+=%#MyColor2#
        set statusline+=\                    "
        set statusline+=%#MyColor3#
        set statusline+=%<%P                 " percent
        highlight MyColor1 guifg=#fff guibg=#00a ctermfg=white   ctermbg=black
        highlight MyColor2 guifg=#aaa guibg=#007 ctermfg=gray    ctermbg=black
        highlight MyColor3 guifg=#7f7 guibg=#007 ctermfg=green   ctermbg=black
        highlight MyColor4 guifg=#ff0 guibg=#905 ctermfg=magenta ctermbg=black
    endif
endif


