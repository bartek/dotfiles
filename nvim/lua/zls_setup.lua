local lspconfig = require('lspconfig')

local buffer_setup = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

local servers = {'zls'}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = buffer_setup,
    }
end
