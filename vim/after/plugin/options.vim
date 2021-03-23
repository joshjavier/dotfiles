" Do not move cursor to start of line when using commands like gg or G
set nostartofline

" Ask user to keep unsaved changes on exit instead of raising an error
set confirm

" Visualize newlines
set listchars+=eol:¬
set list

" Highlight current line
set cursorline

" More intuitive window splitting and navigation
set splitbelow splitright
nnoremap <c-j> <c-W>j
nnoremap <c-k> <c-W>k
nnoremap <c-h> <c-W>h
nnoremap <c-l> <c-W>l

" Gentler sidescrolling
set sidescroll=1
