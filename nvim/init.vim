let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'peitalin/vim-jsx-typescript'
Plug 'thoughtbot/vim-rspec'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rob0h/vimux-golang'

" Initialize plugin system
call plug#end()

" Enable syntax highlighting
syntax on
colorscheme gruvbox
set background=dark

" Spaces & Tabs {{{
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
" }}} Spaces & Tabs

" Search {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case
                    " case-sensitive otherwise
" }}} Search

set number          " show line numbers
set updatetime=100  " mostly for the gutter diff indicator to refresh
set cmdheight=2     " more space for vim-go type info
set guitablabel=\[%N\]\ %t\ %M 
set noswapfile
set autoread

" new leader
let mapleader = " "

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for fzf
nmap <silent> <C-p> :Files<CR>
nmap <silent> <C-f> :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" shortcut for explorer
nnoremap <leader>e :30Lex<CR>

" shortcut for vimux prompt
nmap <leader>p :VimuxPromptCommand<CR>
" shortcut for vimux open
nmap <leader>o :call VimuxOpenRunner()<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" don't jump on *
nnoremap * :keepjumps normal! mi*`i<CR>

" force filetype ruby for .rbi
autocmd BufNewFile,BufRead *.rbi set syntax=ruby

" check if file changed on focus
au FocusGained,BufEnter * :checktime

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" add typings to status line
let g:go_auto_type_info = 1

" extra syntax highlighting for Go
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

" shortcut for editing notes
command! Notes botright vsp ~/notes.md | vertical resize 75
nnoremap <leader>n :Notes<CR>

