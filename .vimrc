" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load plugins here
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
" Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc' | Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
" Plug 'preservim/nerdtree'
Plug 'vim/killersheep'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'Vimjas/vim-python-pep8-indent'    " Nicer Python indentation

call plug#end()

" Color scheme (terminal)
let g:gruvbox_italic = 1
colorscheme gruvbox
set background=dark
highlight Normal ctermbg=NONE
let g:airline_theme='base16_default'

" plasticboy/vim-markdown
" let g:vim_markdown_math = 1
" let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_strikethrough = 1
" let g:vim_markdown_new_list_item_indent = 0
" autocmd FileType markdown normal zR

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<F5>'
" let g:UltiSnipsEditSplit = 'vertical'

" preservim/nerdtree
" map <C-n> :NERDTreeToggle<CR>
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_browse_split = 2

let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set linebreak
set colorcolumn=80
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
set list
map <leader>l :set list!<CR>

" Quickly edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Split layout settings
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Command line
set wildmenu
set confirm
set cmdheight=2

" UX preferences
set mouse=a
set notimeout ttimeout ttimeoutlen=200

" Mappings
nnoremap Y y$

" Python development
nnoremap <F2> :w<bar>!python %<CR>

" System clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
