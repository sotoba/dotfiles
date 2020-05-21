" Encoding & Font Settings
"" default encodings
set encoding=utf-8
scriptencoding utf-8
"" OpenFile Encodings
set fileencodings=utf-8
"" CJK font width
set ambiwidth=double

" Indent Settings
set expandtab
set shiftwidth=2

" General visual settings
set termguicolors
colorscheme iceberg
set list
set number
set cursorline

" Syntax settings
filetype plugin indent on
syntax on

" Use system clipboard tool
set clipboard+=unnamedplus

" download vim-plug if missing
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent! execute '!curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup plugsetup
    autocmd!
    autocmd VimEnter * silent! PlugInstall
  augroup END
endif

" Set up Vim Plugins
call plug#begin('~/.config/nvim/plugins')

  "" NERDtree
  Plug 'preservim/nerdtree'
  "" lightline
  Plug 'itchyny/lightline.vim'
  "" ColorScheme
  Plug 'cocopon/iceberg.vim'
  "" Fuzzy Searcher
  Plug 'ctrlpvim/ctrlp.vim'
  "" Indent visualize
  Plug 'Yggdroot/indentLine'

  "" vim-lsp
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'

call plug#end()

" NERDTree settings
"" Toggle Shortcut
map <silent><C-e> :NERDTreeToggle<CR>
"" Show hidden files
let g:NERDTreeShowHidden = 1
"" NERDTree autogroup
augroup nerdtreecmd
  autocmd!
  "" When Close Last Buffer, Close Tree
  autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" asyncomplete settings
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" remap settings
" Change colon to semicolon
nnoremap ; :
" Quick Highlight Off
nnoremap <silent><ESC><ESC> :nohl<CR>
" https://github.com/mileszs/ack.vim#i-dont-want-to-jump-to-the-first-result-automatically
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" lightline settings
let g:lightline = {
  \ 'colorscheme': 'iceberg',
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'separator': { 'left': "\ue0b8", 'right': "\ue0ba" },
  \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bb" }
  \ }
function! LightlineReadonly()
  return &readonly ? "\ue0a2" : ''
endfunction
