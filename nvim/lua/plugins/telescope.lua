return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    '<leader>ff',
    '<leader>fg',
    '<leader>fb',
    '<leader>fh',
  },
  config = function()
    local builtin = require('telescope.builtin')
    local set = vim.keymap.set
    set('n', '<leader>ff', builtin.find_files, {})
    set('n', '<leader>fg', builtin.live_grep, {})
    set('n', '<leader>fb', builtin.buffers, {})
    set('n', '<leader>fh', builtin.help_tags, {})
  end
}
