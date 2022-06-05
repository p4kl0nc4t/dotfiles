set nocompatible              " be iMproved, required
filetype off                  " required

" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim


" Plugins installed using apt: latexsuite, youcompleteme

call vundle#begin()
" Vundle
Plugin 'VundleVim/Vundle.vim'

" Formatting
Plugin 'Chiel92/vim-autoformat'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

" Navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'

" Syntax helper/highlighting
Plugin 'sheerun/vim-polyglot'
Plugin 'mattn/emmet-vim'
Plugin 'vim-pandoc/vim-pandoc-syntax'

" Filetype helper
Plugin 'vim-pandoc/vim-pandoc'

" Linting
Plugin 'dense-analysis/ale'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Extras/aestethics
Plugin 'GlennLeo/cobalt2'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-sensible'
Plugin 'glts/vim-radical'
Plugin 'tpope/vim-repeat'
Bundle 'ervandew/supertab'

" Snippets engine
Plugin 'SirVer/ultisnips'

" Snippets
Plugin 'honza/vim-snippets'

call vundle#end()

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

" Turn on detection, indent, and plugin
filetype indent plugin on
" Turn on syntax highlighting
syntax on
" Turn on highlight on search, line numbering, and relative line numbering
set hlsearch number relativenumber
" Enable expandtab
set expandtab

" Enable 24-bit true color
set termguicolors
let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set bg=dark

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
" let g:pandoc#formatting#mode = 'hA'
" let g:pandoc#formatting#textwidth = 80
" Use ATX headers for vim-pandoc formatting, also keep metadata
let g:pandoc#formatting#extra_equalprg = '--atx-headers -s'

" Add pandoc filetype keymappings: compile to pdf, view pdf
autocmd filetype pandoc nnoremap <leader>pp :Pandoc pdf<cr>
autocmd filetype pandoc nnoremap <leader>pv :call system('xdg-open ' . expand('%:r') . '.pdf &')<cr>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
