require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
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
      higlight_current_scope = {
          enable = true
      },
      smart_rename = {
          enable = true,
          keymaps = {
              smart_rename = "gr"
          }
      },
      navigation = {
          enable = true,
          keymaps = {
              goto_definition_lsp_fallback = "gd",
              goto_next_usage = "<a-n>",
              goto_previous_usage = "<a-N>",
          }
      }
  }
}
