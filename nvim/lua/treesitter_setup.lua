require'nvim-treesitter.configs'.setup {
  ensure_installed = {
        "bash",
        "cmake",
        "dockerfile",
        "go",
        "gomod",
        "lua",
        "nix",
        "python",
        "rust",
        "svelte",
        "typescript",
  },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = true, -- improve highlighting, e.g. when spell is set
  },

  indent = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<cr>",
      node_incremental = "<cr>",
      scope_incremental = "<cr>",
      node_decremental = "<bs>",
    },
  },
  refactor = {
      highlight_definitions = {
          enable = true
      },
      smart_rename = {
          enable = true,
          keymaps = {
              smart_rename = "grr"
          }
      },
      navigation = {
          enable = true,
          keymaps = {
              goto_definition_lsp_fallback = "gd",
              list_definitions_toc = "g0",
              goto_next_usage = "<A-*>",
              goto_previous_usage = "<A-#>",
          }
      }
  }
}
