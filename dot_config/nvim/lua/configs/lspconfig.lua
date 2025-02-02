local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- load defaults i.e lua_lsp
nvlsp.defaults()

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
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
