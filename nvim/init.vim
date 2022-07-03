let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'fatih/vim-go', {'branch': 'master', 'do': ':GoUpdateBinaries' }
Plug 'peitalin/vim-jsx-typescript'
Plug 'thoughtbot/vim-rspec'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rob0h/vimux-golang'
Plug 'vimwiki/vimwiki'
Plug 'zerowidth/vim-copy-as-rtf'

" Initialize plugin system
call plug#end()

" Enable syntax highlighting
syntax on
set termguicolors
colorscheme gruvbox
" Enable italics, Make sure this is immediately after colorscheme
" https://stackoverflow.com/questions/3494435/vimrc-make-comments-italic
highlight Comment cterm=italic gui=italic
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

let g:NERDTreeWinSize=60

augroup nerdtree_mapping
  autocmd!
  autocmd filetype nerdtree call NerdTreeMapping()
augroup END

function! NerdTreeMapping()
  nnoremap <silent> <buffer> <c-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <buffer> <c-j> :TmuxNavigateDown<CR>
  nnoremap <silent> <buffer> <c-k> :TmuxNavigateUp<CR>
  nnoremap <silent> <buffer> <c-l> :TmuxNavigateRight<CR>
endfunction

" Coc extensions
let g:coc_global_extensions=['coc-tsserver', 'coc-rust-analyzer', 'coc-pyright', 'coc-html', 'coc-css', 'coc-json']

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
noremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>c :CocDiagnostics<CR>

" Remap keys for fzf
nmap <silent> <C-p> :Files<CR>
nmap <silent> <C-f> :Rg<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" shortcut for explorer
nnoremap <leader>e :NERDTreeFind<CR>
nnoremap <leader>E :NERDTreeClose<CR>

" shortcut for vimux prompt
nmap <leader>p :VimuxPromptCommand<CR>
" shortcut for vimux open
nmap <leader>o :call VimuxOpenRunner()<CR>

" Remaps for vim-fugitive
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gl :diffget //2<CR>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" don't jump on *
nnoremap * :keepjumps normal! mi*`i<CR>

" force filetype ruby for .rbi
autocmd BufNewFile,BufRead *.rbi set syntax=ruby

" force filetype ruby for .tf
autocmd BufNewFile,BufRead *.tf set syntax=terraform

" check if file changed on focus
au FocusGained,BufEnter * :checktime

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" disable seeing :GoDoc (K)
" this is handled by LanguageClient [LC]
let g:go_doc_popup_window = 1
let g:go_doc_keywordprg_enabled = 0

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

" run imports command
let g:go_fmt_command = "goimports"

" shortcut for editing notes
command! Notes botright vsp ~/notes.md | vertical resize 75
nnoremap <leader>n :Notes<CR>

" format json
com! FormatJSON %!python -m json.tool
