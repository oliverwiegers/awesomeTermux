"######################
"#		 plugins	  #
"######################

"statusline
set rtp+=$PREFIX/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2

"nerdtree
map <C-m> :NERDTreeToggle<CR>

"######################
"#		 personal	  #
"######################

"general
set nocompatible
set encoding=utf-8
filetype on
filetype plugin indent on

"colors
colorscheme angr
syntax on
set number
set cursorcolumn
set cursorline
hi LineNr ctermfg=lightgrey ctermbg=black
hi CursorLine term=bold ctermbg=black cterm=bold guibg=Grey40

"hilight tabs
let blacklist = ['html', 'css', 'json', 'yaml']
autocmd BufReadPost * if index(blacklist, &ft) < 0 | set tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufReadPost * if index(blacklist, &ft) < 0 | set noexpandtab | retab! 4
autocmd BufReadPre * if index(blacklist, &ft) < 0 | set expandtab | retab! 4
autocmd BufWritePost * if index(blacklist, &ft) < 0 | set noexpandtab | retab! 4


autocmd Filetype html setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype html retab

autocmd Filetype css setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype css retab

autocmd Filetype json setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype json retab

autocmd Filetype yaml setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd Filetype yaml retab

"markdown
au BufRead,BufNewFile *.md set filetype=markdown

"splitting
set splitbelow
set splitright

"python
au BufRead,BufNewFile *.py set colorcolumn=79
au BufRead,BufNewFile *.py set textwidth=79
"highlight ColorColumn

"html
au BufRead,BufNewFile *.html set colorcolumn=79


"keymappings
map <S-m> :NERDTreeToggle<CR>
map <S-c> :SyntasticToggleMode<CR>
map <S-C-j> :lnext<CR>
map <S-C-k> :lprevious<CR>
map <S-x> :lclose<CR>
map <S-f> :Ranger<CR>
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

"save file as root
cmap w!! w !sudo tee % >/dev/null

"disable arrow keys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>

"split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"Swap top/bottom or left/right split
noremap Ctrl+W R
"Break out current window into a new tabview
noremap Ctrl+W T
"Close every window in the current tabview but the current one
noremap Ctrl+W o
"Normalize all split sizes, which is very handy when resizing terminal
noremap ctrl + w =
