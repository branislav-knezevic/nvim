local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "bungee.lsp.mason"
require("bungee.lsp.handlers").setup()
require "bungee.lsp.null-ls"
