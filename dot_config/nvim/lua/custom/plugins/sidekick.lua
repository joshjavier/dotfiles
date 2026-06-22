-- AI-powered code assistant with CLI interface and edit suggestions.
-- Provides keybindings for sending code context to AI and applying suggestions.

vim.pack.add { 'https://github.com/folke/sidekick.nvim' }

require('sidekick').setup {
  nes = { enabled = false },
  cli = {
    prompts = {
      refactor = 'Please refactor {function} to be more maintainable',
      security = 'Review {file} for security vulnerabilities',
    },
  },
}

-- NES: jump to next edit, or apply if already on one
-- vim.keymap.set({ 'i', 'n' }, '<tab>', function()
--   if require('sidekick').nes_jump_or_apply() then return end
--   return '<tab>'
-- end, { expr = true, desc = 'Goto/Apply Next Edit Suggestion' })

-- CLI window management
vim.keymap.set({ 'n', 't', 'i', 'x' }, '<c-.>', function() require('sidekick.cli').focus() end, { desc = 'Sidekick Focus' })
vim.keymap.set('n', '<leader>aa', function() require('sidekick.cli').toggle() end, { desc = 'Sidekick Toggle CLI' })
vim.keymap.set('n', '<leader>as', function() require('sidekick.cli').select() end, { desc = 'Select CLI Tool' })
vim.keymap.set('n', '<leader>ad', function() require('sidekick.cli').close() end, { desc = 'Detach CLI Session' })

-- Send context to CLI
-- {this} resolves to {position} in a file, or appends {selection} otherwise
vim.keymap.set({ 'x', 'n' }, '<leader>at', function() require('sidekick.cli').send { msg = '{this}' } end, { desc = 'Send [T]his to Sidekick' })
vim.keymap.set('x', '<leader>aS', function() require('sidekick.cli').send { msg = '{selection}' } end, { desc = 'Send [S]election to Sidekick' })
vim.keymap.set('n', '<leader>af', function() require('sidekick.cli').send { msg = '{function}' } end, { desc = 'Send [F]unction to Sidekick' })
vim.keymap.set('n', '<leader>aF', function() require('sidekick.cli').send { msg = '{file}' } end, { desc = 'Send [F]ile to Sidekick' })
vim.keymap.set('n', '<leader>ae', function() require('sidekick.cli').send { msg = '{diagnostics}' } end, { desc = 'Send Diagnostics ([E]rrors) to Sidekick' })

-- Prompt shortcuts
vim.keymap.set('n', '<leader>ax', function() require('sidekick.cli').send { msg = 'explain {function}' } end, { desc = 'E[x]plain Function' })
vim.keymap.set(
  'n',
  '<leader>aX',
  function() require('sidekick.cli').send { msg = 'fix the diagnostics in {function}. Here are the current buffer diagnostics for context:\n{diagnostics}' } end,
  { desc = 'Fi[x] Diagnostics in Function' }
)
vim.keymap.set({ 'n', 'x' }, '<leader>ap', function() require('sidekick.cli').prompt() end, { desc = 'Sidekick Select [P]rompt' })
