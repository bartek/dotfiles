require('go').setup({
    -- Disable LSP stuff as already configured elsewhere
    lsp_codelens = false,
    lsp_inlay_hints = {
        enable = false,
    },
})

vim.keymap.set('n', '<leader>t', '<cmd>GoTest -f<cr>', {})
vim.keymap.set('n', '<leader>tt', '<cmd>GoTest<cr>', {})
vim.keymap.set('n', '<leader>T', '<cmd>GoTestFunc<cr>', {})
