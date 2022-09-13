local ls = require 'luasnip'
local types = require 'luasnip.util.types'

require("luasnip.loaders.from_vscode").lazy_load()

ls.config.set_config {
    -- Tell LuaSnip to remember to keep around the last snippet.
    history = true,

    -- Support dynamic as-you-type snippets
    updateevents = "TextChanged,TextChangedI",

    enable_autosnippets = true,

    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } },
            },
        },
    },
}

-- <c-k> is the expansion key, for both expand/jump. primarily useful for
-- jumping between the elements in a snippet
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true})

-- <c-j> is jump backwards
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true})
