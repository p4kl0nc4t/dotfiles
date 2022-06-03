set nocompatible              " be iMproved, required
filetype off                  " required

" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-sensible'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'dense-analysis/ale'
Plugin 'airblade/vim-gitgutter'

" Map <F3> to Autoformat
noremap <F3> :Autoformat<CR>

" Configure Python path (for vim-autoformat)
let g:python3_host_prog="/usr/bin/python"
" Configure latexindent command
let g:formatdef_latexindent = '"latexindent -"'

" Configure ctrlp command (exclude .git)
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Disable sensible in vim-polyglot
let g:polyglot_disabled = ['sensible']

" Keyboard mappings for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Lightline configuration
set laststatus=2
set noshowmode

call vundle#end()

" Turn on detection, indent, and plugin
filetype indent plugin on
" Turn on syntax highlighting
syntax on
set hlsearch number relativenumber

" Map <C-l> to unhighlight search results
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Configure LaTeXSuite
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --shell-escape -interaction=nonstopmode $*'

" Use `clangformat` as Java formatter
let g:formatters_java = ['clangformat']

" Map F2 to save file then compile (LaTeX-Suite)
map <f2> :w<cr><leader>ll

" Disable spell checking in vim-pandoc
let g:pandoc#modules#disabled = ["spell"]
" Use hard wrap for vim-pandoc formatting with tw of 79
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 79
" Use ATX headers for vim-pandoc formatting
let g:pandoc#formatting#extra_equalprg = '--atx-headers'

" Add pandoc filetype keymappings: compile to pdf, view pdf
autocmd filetype pandoc nnoremap <leader>pp :Pandoc pdf<cr>
autocmd filetype pandoc nnoremap <leader>pv :call system('xdg-open ' . expand('%:r') . '.pdf &')<cr>
