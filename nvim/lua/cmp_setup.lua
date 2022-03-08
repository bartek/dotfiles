local cmp = require'cmp'

cmp.setup({
    completion = {
        -- The minimum length of word to complete
        keyword_length = 4,
    },
    experimental = {
      ghost_text = true,
      native_menu = false,
    },
    snippet = {
        expand = function(args)

        -- For `luasnip` user.
        require('luasnip').lsp_expand(args.body)

        end,
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
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
