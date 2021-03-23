if !has('gui_running')

  " Fix Alt-key mappings in some terminals like gnome-terminal and kitty
  " See: https://stackoverflow.com/a/10216459 and `:help alt-key`
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
  set timeout ttimeoutlen=50

  " Gruvbox terminal-specific issues
  " See: https://github.com/gruvbox-community/gruvbox/wiki/Terminal-specific
  " Enforce displaying italics - set this BEFORE `colorscheme gruvbox`
  let g:gruvbox_italic=1
  " Get the colors right
  set termguicolors

endif
