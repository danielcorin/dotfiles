execute pathogen#infect()

syntax on

" Tabs and stuff
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent

set backspace=2   " Backspace deletes like most programs in insert mode

" Line numbers
set number

" Highlight current line
set cursorline

" Highlight matching for parentheses
set showmatch

" Searching
set incsearch
set hlsearch

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=-2

" Split navigation
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>


" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

map <C-e> :NERDTreeToggle<CR>

" Open NERDTree file explorer
autocmd vimenter * NERDTree

" Close NERDTree if it's the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

