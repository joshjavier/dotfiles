-- vim-rzip extends the built-in zip.vim to support browsing and editing
-- files inside nested zip archives (zip-within-zip).
--
-- This is required for Yarn v4 (PnP) + Neovim Native LSP. Yarn PnP stores
-- packages as zipped archives inside .yarn/cache/, and those archives can
-- themselves contain nested zips. Without this plugin, Neovim cannot open
-- or navigate into those files, which breaks go-to-definition and other LSP
-- features that resolve into Yarn-cached packages.
--
-- Setup: after installing, run `yarn dlx @yarnpkg/sdks base` in your project
-- root to generate the .yarn/sdks/ directory that points the LSP at the
-- correct TypeScript version.
--
-- https://github.com/lbrayner/vim-rzip
-- https://yarnpkg.com/getting-started/editor-sdks#neovim-native-lsp

---@module 'lazy'
---@type LazySpec
return {
  'lbrayner/vim-rzip',
  lazy = false, -- must load at startup so BufReadCmd autocmds are registered before any file is opened
}
