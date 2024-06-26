local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- if you just want default config for the servers then put them in a table
-- Pour ajouter un LSP il faut utiliser la commande :Mason
-- Pour connaitre le nom du server à rajouter dans la liste
-- il faut utiliser la commande :h lspconfig-all
local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer", "jedi_language_server", "ocamllsp", "bashls", "ocamlls"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lspconfig.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {"rust"},
--   root_dir = lspconfig.util.root_pattern("Cargo.toml"),
-- })


-- 
-- lspconfig.pyright.setup { blabla}
