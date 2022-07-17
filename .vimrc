set nocompatible              " be iMproved, required
filetype off                  " required

" Set up Vundle
set rtp+=~/.vim/bundle/Vundle.vim


" Plugins installed using apt: latexsuite

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
Plugin 'ledger/vim-ledger'
Plugin 'mboughaba/i3config.vim'

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
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 80
" Use ATX headers for vim-pandoc formatting, also keep metadata
let g:pandoc#formatting#extra_equalprg = '--atx-headers -s'

" Add pandoc filetype keymappings: compile to pdf, view pdf
autocmd filetype pandoc nnoremap <leader>pp :Pandoc pdf<cr>
autocmd filetype pandoc nnoremap <leader>pv :call system('xdg-open ' . expand('%:r') . '.pdf &')<cr>

" Paragraph motion to move by transaction (ledger)
au FileType ledger noremap { ?^\d<CR>
au FileType ledger noremap } /^\d<CR>

" Make vim-ledger use hledger
let g:ledger_bin = '/usr/bin/hledger'
let g:ledger_is_hledger = 1
if !exists('g:ledger_extra_options')
	let g:ledger_extra_options = ''
endif

" Vim ledger
au FileType ledger inoremap <silent> <Tab> <C-r>=ledger#autocomplete_and_align()<CR>
au FileType ledger vnoremap <silent> <Tab> :LedgerAlign<CR>
au FileType ledger noremap <silent><buffer> <F5> :call ledger#transaction_state_toggle(line('.'), '!* ')<CR>
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
let g:ledger_maxwidth = 120
let g:ledger_fold_blanks = 1
function LedgerSort()
	:%! hledger print
	:%LedgerAlign
	:normal Gdd
endfunction
command LedgerSort call LedgerSort()

