local buffer_setup = function(client)
    local set_mapping = function(key, cmd, modes)
      modes = modes or {'n'}
      for _, mode in pairs(modes) do
          vim.api.nvim_buf_set_keymap(0, mode, key, cmd, {noremap = true})
      end
    end

    --  Go to definition
    set_mapping('gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    -- Symbol rename
    set_mapping('gr', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- Hover
    set_mapping('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    -- References
    set_mapping('grf', '<cmd>lua vim.lsp.buf.references()<cr>')
    -- Symbol Search
    set_mapping('grs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')

    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

require'lspconfig'.gopls.setup{
    on_attach = buffer_setup,
}
