-- LSP installer
require("mason").setup()
require("mason-lspconfig").setup()

-- Built-in LSP setup
local lspconfig = require("lspconfig")

-- YAML
lspconfig.yamlls.setup({})

-- Bash
lspconfig.bashls.setup({})

-- Terraform
lspconfig.terraformls.setup({})

-- Azure Pipelines (via YAML LS)
lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/azure-pipelines.json"] = "/azure-pipelines.yml",
      },
    },
  },
})

