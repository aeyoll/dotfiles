-- Setup Mason
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'rust_analyzer', 'intelephense', 'ruff_lsp' },
  automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities
}
require('lspconfig').intelephense.setup {
  capabilities = capabilities
}
require('lspconfig').ruff_lsp.setup {
  capabilities = capabilities
}

-- Setup null-ls for formatting
local null_ls = require('null-ls')

local sources = {
  null_ls.builtins.formatting.isort.with({
    extra_args = { '--multi-line', 'VERTICAL_HANGING_INDENT' }
  }),
}

null_ls.setup({
  sources = sources,
})

-- Allow to format file on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
require('null-ls').setup({
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

-- Setup nvim-cmp for completion.
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
}
