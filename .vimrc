set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>
let g:python3_host_prog="/usr/bin/python"
let g:formatdef_latexindent = '"latexindent -"'

Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plugin 'mattn/emmet-vim'

Plugin 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['autoindent']

Plugin 'tpope/vim-sleuth'

call vundle#end()

filetype indent plugin on
syntax on
set hlsearch number relativenumber
set tabstop=8

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --shell-escape -interaction=nonstopmode $*'

let g:formatters_java = ['clangformat']

map <f2> :w<cr><leader>ll
