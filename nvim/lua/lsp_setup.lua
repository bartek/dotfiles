local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local buffer_setup = function(client)
    local set_mapping = function(key, cmd, modes)
      modes = modes or {'n'}
      for _, mode in pairs(modes) do
          vim.api.nvim_buf_set_keymap(0, mode, key, cmd, {noremap = true})
      end
    end

    -- Hover
    set_mapping('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- References
    set_mapping('grf', '<cmd>lua vim.lsp.buf.references()<cr>')
    -- Symbol Search
    set_mapping('grs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')

    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Call goimports for Go files
vim.api.nvim_command("au BufWritePre *.go lua goimports(500)")

-- Disable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Disable virtual text, use signs and show_line_diagnostics
        virtual_text = true,

        -- Show diagnostic signs instead
        signs = true,

        -- Don't run diagnostics when in insert mode
        update_in_insert = false,
    }
)

-- Configuration for gopls:
-- https://github.com/golang/tools/blob/master/gopls/doc/settings.md#staticcheck-boolean
-- And analysers:
-- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    settings = {
        gopls = {
            gofumpt = true,
            staticcheck = true,
            analyses = {
                unreachable = true,
                shadow = true,
                unusedparams = true,
                atomic = true,
                bools = true,
                copylocks = true,
                httpresponse = true,
                printf = true,
            },
        }
    },
    on_attach = buffer_setup,
}

require'lspconfig'.intelephense.setup{}
require'lspconfig'.pyright.setup{}

