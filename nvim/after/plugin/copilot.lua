require("copilot").setup({
  after = "feline.nvim", -- lazy load copilot after feline
  suggestion = {
    enabled = true,
    debounce = 75,
    auto_trigger = true,
    keymap = {
        accept = "<C-j>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    ["."] = false,
  },
})
