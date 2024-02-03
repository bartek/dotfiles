require('go').setup()

vim.keymap.set('n', '<leader>t', '<cmd>GoTest -f<cr>', {})
vim.keymap.set('n', '<leader>tt', '<cmd>GoTest<cr>', {})
vim.keymap.set('n', '<leader>T', '<cmd>GoTestFunc<cr>', {})
