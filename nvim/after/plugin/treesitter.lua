require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { 
    "bash",
    "cmake",
    "dockerfile",
    "go", 
    "gomod",
    "help", 
    "lua", 
    "python",
    "svelte",
    "typescript", 
    "zig",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.vespa = {
  install_info = {
    url = "github.com/bartek/tree-sitter-vespa", -- local path or git repo
    files = {"src/parser.c"},
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "sd", -- if filetype does not match the parser name
}
