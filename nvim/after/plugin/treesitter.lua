require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

require('nvim-treesitter').install {
  'bash',
  'cmake',
  'dockerfile',
  'go',
  'gomod',
  'lua',
  'python',
  'svelte',
  'typescript',
  'yaml',
  'zig',
}

-- Enable treesitter highlighting and indentation for all installed languages
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    if pcall(vim.treesitter.start) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Custom parser: vespa
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').vespa = {
      install_info = {
        url = 'https://github.com/bartek/tree-sitter-vespa',
        branch = 'main',
      },
    }
  end,
})
vim.treesitter.language.register('vespa', { 'sd' })
