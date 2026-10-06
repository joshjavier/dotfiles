-- AI inline completion (replaces Copilot).
-- Authenticate with :SupermavenUseFree or :SupermavenUsePro.

vim.pack.add { 'https://github.com/supermaven-inc/supermaven-nvim' }

require('supermaven-nvim').setup {
  -- Same keys as the old Copilot setup. Supermaven shows only one
  -- suggestion, so <C-g> dismisses instead of cycling.
  keymaps = {
    accept_suggestion = '<C-f>',
    clear_suggestion = '<C-g>',
  },
}
