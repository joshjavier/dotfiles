-- autopairs
-- https://github.com/windwp/nvim-autopairs

---@module 'lazy'
---@type LazySpec
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  dependencies = {
    { 'windwp/nvim-ts-autotag', opts = {} },
  },
}
