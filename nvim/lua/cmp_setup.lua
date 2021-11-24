local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)

        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        end,
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = 'nvim_lsp' },

        -- For luasnip user.
        { name = 'luasnip' },

        { name = 'buffer', keyword_length = 5 },
    }
})