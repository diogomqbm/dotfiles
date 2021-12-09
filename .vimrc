" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'
Plug 'zivyangll/git-blame.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kkga/vim-envy'
Plug 'eslint/eslint'
Plug 'morhetz/gruvbox'
Plug 'jparise/vim-graphql'
Plug 'editorconfig/editorconfig-vim'
Plug 'rescript-lang/vim-rescript', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'

" Initialize plugin system
call plug#end()

let g:python3_host_prog='/usr/bin/python3'


" General config
inoremap jk <ESC>
let mapleader = ","
let maplocalleader = ","
set mouse=a
set smarttab
set number
set cindent
set tabstop=2
set shiftwidth=2
set wildignore+=*_esy/*,*esy.lock/*,*/node_modules/*,*.reast,*.cmj,*.d,*.cmt,*.cmi,*/ocaml/*,*.as,
" always uses spaces instead of tab characters
set expandtab
set completeopt+=preview

set termguicolors
colorscheme monokai_pro
set background=dark
set autoindent
set redrawtime=10000
set guicursor=

let g:lightline = {
  \ 'colorscheme': 'monokai_pro',
  \ }


" NERDCommenter

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" GitGutter
nnoremap <C-l> :GitGutter<CR><C-l>

" GitBlame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Haskell Configs
syntax on
filetype plugin indent on
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:haskell_indent_case_alternative = 1
let g:cabal_indent_section = 2


" ReScript stuff
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>r :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>t :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>b :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>

" NERDTREE
nnoremap <F6> :NERDTreeToggle<CR>
"nnoremap <leader>n :NERDTreeFocus<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
let g:NERDTreeWinSize=60

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",  
    \ "Modified"  : "#d9bf91",  
    \ "Renamed"   : "#51C9FC",  
    \ "Untracked" : "#FCE77C",  
    \ "Unmerged"  : "#FC51E6",  
    \ "Dirty"     : "#FFBD61",  
    \ "Clean"     : "#87939A",   
    \ "Ignored"   : "#808080"   
    \ }                         


let g:NERDTreeIgnore = ['^node_modules$']

" fzf shortcuts 
nnoremap <silent> <C-f> :Rg<CR>
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-t> :Buffers<CR>

nnoremap <silent> <C-w> :nohl<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
