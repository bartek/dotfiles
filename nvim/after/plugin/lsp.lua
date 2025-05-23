local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local buffer_setup = function(client)
    local set_mapping = function(key, cmd, modes)
      modes = modes or {'n'}
      for _, mode in pairs(modes) do
          vim.api.nvim_buf_set_keymap(0, mode, key, cmd, {noremap = true})
      end
    end

    set_mapping('gq', '<cmd>lua vim.lsp.buf.format()<cr>')
    -- Hover
    set_mapping('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- References
    set_mapping('grf', '<cmd>lua vim.lsp.buf.references()<cr>')
    -- Symbol Search
    set_mapping('grs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
    set_mapping('grw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>')

    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp", { clear = true }),
  pattern = '*.go',
  callback = function(args)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({async = false, id = args.data.client_id})
      end,
    })
  end
})

-- Import packages automatically on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('setGoFormatting', { clear = true }),
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params(0, "utf-8")
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 2000)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end
})


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        -- Enable diagnostics in line
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
vim.lsp.config.gopls = {
    capabilities = capabilities,
    settings = {
        gopls = {
            gofumpt = false,
            staticcheck = true,
            analyses = {
                assign = true,
                atomic = true,
                bools = true,
                buildtag = true,
                copylocks = true,
                httpresponse = true,
                printf = true,
                shadow = true,
                nilness = true,
                stdmethods = true,
                stringintconv = true,
                unmarshal = true,
                unreachable = true,
                unusedparams = true,
            },
        }
    },
    on_attach = buffer_setup,
}

vim.lsp.config.zls = { capabilities = capabilities }

vim.lsp.enable({'gopls', 'zls', 'pyright'})
