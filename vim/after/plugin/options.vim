" Do not move cursor to start of line when using commands like gg or G
set nostartofline

" Ask user to keep unsaved changes on exit instead of raising an error
set confirm

" Visualize newlines
set listchars+=eol:¬
set list

" Highlight current line
set cursorline

" More intuitive window splitting
set splitbelow splitright

" Gentler sidescrolling
set sidescroll=1

" Do not break words when wrap is on
set linebreak

" netrw tree style listing
let g:netrw_liststyle=3

" ------------------------------------------------
" COC.NVIM CONFIGURATION
" (might move this into a separate file later)
" ------------------------------------------------

" Having longer updatetime leads to noticeable delays and poor UX.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion, completion confirm, and snippet expand.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
