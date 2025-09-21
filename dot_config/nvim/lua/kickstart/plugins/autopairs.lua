-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  dependencies = {
    { 'windwp/nvim-ts-autotag', opts = {} },
  },
}
