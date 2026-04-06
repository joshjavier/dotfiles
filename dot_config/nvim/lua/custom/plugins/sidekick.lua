-- AI-powered code assistant with CLI interface and edit suggestions.
-- Provides keybindings for sending code context to AI and applying suggestions.

---@module 'lazy'
---@type LazySpec
return {
  'folke/sidekick.nvim',
  opts = {
    nes = { enabled = false },
    cli = {
      prompts = {
        refactor = 'Please refactor {function} to be more maintainable',
        security = 'Review {file} for security vulnerabilities',
      },
    },
  },
  keys = {
    -- NES: jump to next edit, or apply if already on one
    {
      '<tab>',
      function()
        if require('sidekick').nes_jump_or_apply() then return end
        return '<tab>' -- fall back to normal tab
      end,
      mode = { 'i', 'n' },
      expr = true,
      desc = 'Goto/Apply Next Edit Suggestion',
    },

    -- CLI window management
    { '<c-.>', function() require('sidekick.cli').focus() end, mode = { 'n', 't', 'i', 'x' }, desc = 'Sidekick Focus' },
    { '<leader>aa', function() require('sidekick.cli').toggle() end, desc = 'Sidekick Toggle CLI' },
    { '<leader>as', function() require('sidekick.cli').select() end, desc = 'Select CLI Tool' },
    { '<leader>ad', function() require('sidekick.cli').close() end, desc = 'Detach CLI Session' },

    -- Send context to CLI
    -- {this} resolves to {position} in a file, or appends {selection} otherwise
    { '<leader>at', function() require('sidekick.cli').send { msg = '{this}' } end, mode = { 'x', 'n' }, desc = 'Send [T]his to Sidekick' },
    { '<leader>aS', function() require('sidekick.cli').send { msg = '{selection}' } end, mode = { 'x' }, desc = 'Send [S]election to Sidekick' },
    { '<leader>af', function() require('sidekick.cli').send { msg = '{function}' } end, desc = 'Send [F]unction to Sidekick' },
    { '<leader>aF', function() require('sidekick.cli').send { msg = '{file}' } end, desc = 'Send [F]ile to Sidekick' },
    { '<leader>ae', function() require('sidekick.cli').send { msg = '{diagnostics}' } end, desc = 'Send Diagnostics ([E]rrors) to Sidekick' },

    -- Prompt shortcuts
    { '<leader>ax', function() require('sidekick.cli').send { msg = 'explain {function}' } end, desc = 'E[x]plain Function' },
    {
      '<leader>aX',
      function()
        require('sidekick.cli').send { msg = 'fix the diagnostics in {function}. Here are the current buffer diagnostics for context:\n{diagnostics}' }
      end,
      desc = 'Fi[x] Diagnostics in Function',
    },
    { '<leader>ap', function() require('sidekick.cli').prompt() end, desc = 'Sidekick Select [P]rompt' },
  },
}
