local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- NODE_VERSION = tonumber(string.sub(io.popen("node -v"):read(), 2, 3))

NODE_CMD = { "typescript-language-server", "--stdio" }

-- if NODE_VERSION <= 12 then
--   NODE_CMD = {
--     "/Users/nates/.nvm/versions/node/v16.20.0/bin/node",
--     "/Users/nates/.local/share/nvim/mason/bin/typescript-language-server",
--     "--stdio",
--   }
-- end
--
lspconfig.tsserver.setup {
  cmd = NODE_CMD,
  on_attach = on_attach,
  capabilities = capabilities,
}

NODE_CMD = { "vscode-css-language-server", "--stdio" }

-- if NODE_VERSION <= 12 then
--   NODE_CMD = {
--     "/Users/nates/.nvm/versions/node/v16.20.0/bin/node",
--     "/Users/nates/.local/share/nvim/mason/bin/vscode-css-language-server",
--     "--stdio",
--   }
-- end

lspconfig.cssls.setup {
  cmd = NODE_CMD,
  on_attach = on_attach,
  capabilities = capabilities,
}

--
-- lspconfig.pyright.setup { blabla}
