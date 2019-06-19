" Douglas Black
" Colors {{{
syntax enable           " enable syntax processing
colorscheme badwolf
" }}}

" Misc {{{
set ttyfast                     " faster redraw
set backspace=indent,eol,start
" }}}

" Spaces & Tabs {{{
set tabstop=2           " 2 space tab
set expandtab           " use spaces for tabs
set softtabstop=2       " 2 space tab
set shiftwidth=2
set modelines=1
set autoindent
" }}}

" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline          " highlight current line
set wildmenu
"set lazyredraw
set showmatch           " higlight matching parenthesis
set ruler
" }}}

" Searching {{{
"set ignorecase          " ignore case when searching
set hlsearch            " highlight all matches
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter *.tf,*.tfvars setlocal filetype=terraform
    autocmd BufEnter *.scala setlocal filetype=scala
    autocmd BufEnter Makefile,*.md setlocal noexpandtab
    autocmd BufEnter *.php,*.py,*.js,*.txt,*.hs,*.java,*.sql,*.feature setlocal tabstop=4
    autocmd BufEnter *.php,*.py,*.js,*.txt,*.hs,*.java,*.sql,*.feature setlocal shiftwidth=4
    autocmd BufEnter *.php,*.py,*.js,*.txt,*.hs,*.java,*.sql,*.feature setlocal softtabstop=4
    autocmd BufEnter Dockerfile setlocal tabstop=4
    autocmd BufEnter Dockerfile setlocal shiftwidth=4
    autocmd BufEnter Dockerfile setlocal softtabstop=4
    autocmd BufEnter *.py setlocal filetype=python
    autocmd BufEnter *.json.tpl setlocal filetype=json
    autocmd BufEnter *.asmx setlocal filetype=xml
augroup END
" Autogroups }}}

" Custom Functions {{{
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces2()
endfunction
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" 100 char line {{{
" set colorcolumn=100
" highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
" }}}
"
" show tabs
set list
set listchars=tab:>-

" VUNDLE {{{ 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-cucumber'
Plugin 'jremmen/vim-ripgrep'
Plugin 'ctrlp.vim'
Plugin 'hhvm/vim-hack'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on
" }}} VUNDLE 
