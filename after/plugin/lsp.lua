local lsp = require("lsp-zero")

-- Recommended preset (includes sensible defaults)
lsp.preset("recommended")

-- LSP setup per server
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Completion setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- Optional: disable Tab key fallback to avoid conflicts
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil


lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

-- on_attach: set keymaps
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- Setup LSPs
lsp.setup()

-- Diagnostics config
vim.diagnostic.config({
    virtual_text = true
})

-- Mason and mason-lspconfig setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "lua_ls",
    },
    handlers = {
        lsp.default_setup,
    }
})
