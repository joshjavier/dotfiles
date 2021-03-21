" Josh Javier's vimrc
" Last updated: 2020-12-08

" Install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize plugins. vim-plug will automatically execute
" `filetype plugin indent on` and `syntax on` after init.
call plug#begin()
Plug 'morhetz/gruvbox'

" Trial
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } | Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/goyo.vim'
Plug 'SidOfc/mkdx'
Plug 'tpope/vim-surround'

" Plugins: Better typing experience
Plug 'tpope/vim-commentary'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cohama/lexima.vim'
" Plug 'rstacruz/vim-hyperstyle'  # Bug: breaks auto-pairs in CSS files

" Plugins: Syntax highlighting and indentation
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'pangloss/vim-javascript'
Plug 'niftylettuce/vim-jinja'
Plug 'cespare/vim-toml'
Plug 'nathangrigg/vim-beancount'

" To clean
" Plug 'jiangmiao/auto-pairs'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'SirVer/ultisnips'

call plug#end()

" Extended matching with '%'
runtime macros/matchit.vim

" BASE SETTINGS ------------------------------------------------------ {{{1
set autoindent                  " Minimal automatic indenting for any filetype
set backspace=indent,eol,start  " Proper backspace behavior
set hidden                      " Possibility to have more than one unsaved buffer
set incsearch                   " Incremental search
set hlsearch                    " Highlight search matches
set ruler                       " Show current line number at the bottom-right of the screen
set wildmenu                    " Enhanced command-line completion
set number                      " Display line numbers
" set nowrap                      " Do not wrap text
set expandtab                   " Always use spaces
set softtabstop=4               " Use 4 spaces when pressing <tab> and <bs>
set shiftwidth=4                " Use 4 spaces for indentation
set tabstop=4                   " Compatibility with files that use tabs
set laststatus=2                " Always show a status line

" Set leader and localleader
let mapleader = ","
let maplocalleader = "\\"

" Visualize tabs and newlines
set list listchars=tab:▸\ ,eol:¬
nnoremap <leader>l :setlocal list!<cr>

" Edit and source config files
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" USABILITY SETTINGS ------------------------------------------------- {{{1
" a.k.a. make vim less annoying

" More intuitive window splitting and navigation
set splitbelow splitright
nnoremap <c-j> <c-W>j
nnoremap <c-k> <c-W>k
nnoremap <c-h> <c-W>h
nnoremap <c-l> <c-W>l

" Move lines up or down
" https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Fix alt-key in GNOME terminal
" https://stackoverflow.com/a/10216459
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Fix `j` and `k` behavior when wrap is on
nnoremap j gj
nnoremap k gk

" Do not move cursor to start of line when using commands like gg
set nostartofline

" Ask if user wants to save changes when quitting vim
set confirm

" Clear the last search pattern (and remove highlight)
nnoremap <leader><space> :let @/ = ""<cr>

" Better scrolling defaults
set scrolloff=5                 " Keep at least 5 lines above and below the cursor
set sidescroll=1                " Gentler sidescrolling
set sidescrolloff=3             " Keep at least 3 columns to the left and right of the cursor

" Common clipboard shortcuts
vnoremap <c-c> "+y
noremap <leader><c-v> "+p
noremap <c-a> <esc>ggVG

" Enable mouse
set mouse=a

" CtrlP bindings
" nnoremap <leader>bb :CtrlPBuffer<cr>

" Match all cases when search phrase is all lowercase
set ignorecase smartcase

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" STYLE SETTINGS ----------------------------------------------------- {{{1
" a.k.a. make vim pretty

let g:gruvbox_italic=1          " Enable italics in gruvbox
set termguicolors               " Enable true color support
set background=dark             " Activate dark mode
colorscheme gruvbox             " Activate gruvbox

" Enable transparent background
highlight Normal ctermbg=NONE guibg=NONE

" Add a vertical guide along the 80th column
set colorcolumn=80
highlight ColorColumn guibg=seagreen

" QUALITY OF lIFE SETTINGS ------------------------------------------- {{{1
" a.k.a. make vim more awesomesauce

" Uppercase word with CTRL-u
inoremap <c-u> <esc>gUiwgi

" Toggle wrap
nnoremap <leader>w :setlocal wrap!<cr>

" Toggle indent between 2 and 4 spaces
nnoremap <leader>2 :setlocal shiftwidth=2<bar>setlocal softtabstop=2<cr>
nnoremap <leader>4 :setlocal shiftwidth=4<bar>setlocal softtabstop=4<cr>

" fzf mappings
nnoremap <c-f> :Files<cr>
nnoremap <c-b> :Buffers<cr>

" Make netrw like NERDtree
" https://shapeshed.com/vim-netrw/
" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * Vexplore
"   autocmd VimEnter * wincmd p
"   " autocmd VimEnter * <c-W>l
" augroup END
nnoremap <leader>d :Vexplore<cr>

" Auto-close expressions in templating languages like Nunjucks and Liquid
call lexima#add_rule({'char': '%', 'at': '{\%#}', 'input_after': '%'})
call lexima#add_rule({'char': '<BS>', 'at': '{%\%#%}', 'delete': 1})
call lexima#add_rule({'char': '<Space>', 'at': '{%\%#%}', 'input_after': '<Space>'})
call lexima#add_rule({'char': '%', 'at': '\%# %}', 'leave': 3})
call lexima#add_rule({'char': '<BS>', 'at': '{% \%# %}', 'delete': 1})
" TODO: Add rule for braces with dash (whitespace control)

" Make Emmet snippets a little smarter
call lexima#add_rule({'char': '<CR>', 'at': '>\%#</', 'input_after': '<CR>'})

" Detect filetype (e.g., detect HTML as Jinja to enable templating snippets)
" nnoremap <leader>fd :filetype detect<cr>

" 'Escape' like a ninja
inoremap jk <esc>
inoremap kj <esc>

" Beancount: Align commodities
nnoremap <leader>ac :AlignCommodity<cr>
vnoremap <leader>ac :AlignCommodity<cr>

" FILETYPE-SPECIFIC SETTINGS ----------------------------------------- {{{1

" Set HTML files as Jinja to enable syntax highlighting and snippets
autocmd BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set filetype=jinja

augroup TwoSpaces
  autocmd!
  autocmd FileType *html,javascript,json setlocal nowrap
  autocmd FileType *html,javascript,json setlocal softtabstop=2
  autocmd FileType *html,javascript,json setlocal shiftwidth=2
  " autocmd FileType html iabbrev <buffer> --- &mdash;
augroup END

augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal nowrap
  autocmd FileType vim setlocal softtabstop=2
  autocmd FileType vim setlocal shiftwidth=2
  autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup filetype_text
  autocmd!
  " autocmd FileType text,markdown setlocal wrap
  autocmd FileType text,markdown setlocal linebreak
  autocmd FileType text,markdown vnoremap <buffer> <a-b> <esc>a**<esc>`<i**<esc>
  autocmd FileType text,markdown vnoremap <buffer> <a-i> <esc>a*<esc>`<i*<esc>
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python setlocal nowrap
augroup END

augroup markdown
  autocmd!
  " Disable autocomplete suggestions. See https://stackoverflow.com/a/62552347
  autocmd FileType markdown let b:coc_suggest_disable = 1 
augroup END

" COC CONFIGURATION -------------------------------------------------- {{{1
" https://github.com/neoclide/coc.nvim#example-vim-configuration

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Map tab for trigger completion, completion confirm, and snippet expand.
" Doesn't override the default <C-j> mapping for jumping to next placeholder.
" Note: the coc-snippets extension is required for this to work.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" " Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" " Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder.
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Map function and class text objects
" " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

