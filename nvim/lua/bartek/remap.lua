function SpellToggle()
    if vim.opt.spell:get() then
        vim.opt_local.spell = false
        vim.opt_local.spelllang = "en"
    else
        vim.opt_local.spell = true
        vim.opt_local.spelllang = {"en_us", "de"}
    end
end

vim.keymap.set("n", "<leader>S", ":lua SpellToggle()<cr>")

-- quick and easy search/replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Visual selection, move up and down with J/K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Allow CTRL-D/U for more controlled half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+y")

vim.keymap.set("n", "<leader>T", ":enew<CR>")
vim.keymap.set("n", "<leader>w", ":bnext<CR>")
vim.keymap.set("n", "<leader>b", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bq", ":bp <Bar> bd#<CR>")

-- Format current buffer with jq
vim.keymap.set("n", "<leader>=j", ":%!jq .<CR>")
