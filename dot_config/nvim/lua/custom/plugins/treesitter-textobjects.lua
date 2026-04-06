-- nvim-treesitter-textobjects (main branch)
-- Enables {function} and {class} context variables in sidekick.nvim prompts.
-- No config needed - sidekick calls into the textobjects API directly.

---@module 'lazy'
---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  lazy = true,
}
