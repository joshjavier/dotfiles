local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- load defaults i.e lua_lsp
nvlsp.defaults()

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  jsonls = {
    settings = {
      json = {
        -- Schemas https://www.schemastore.org
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig.json" },
            url = "https://json.schemastore.org/tsconfig.json",
          },
          {
            fileMatch = { ".prettierrc", ".prettierrc.json", "pretter.config.json" },
            url = "https://json.schemastore.org/prettierrc.json",
          },
          {
            fileMatch = { ".eslintrc", ".eslintrc.json" },
            url = "https://json.schemastore.org/eslintrc.json",
          },
          {
            fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
            url = "https://json.schemastore.org/babelrc.json",
          },
          {
            fileMatch = { ".stylelintrc", ".stylelintrc.json", "stylelint.config.json" },
            url = "https://json.schemastore.org/stylelintrc.json",
          },
        },
      },
    },
  },
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = nvlsp.on_init
  opts.on_attach = nvlsp.on_attach
  opts.capabilities = nvlsp.capabilities

  lspconfig[name].setup(opts)
end

-- lsps with additional config
lspconfig.eslint.setup {
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
