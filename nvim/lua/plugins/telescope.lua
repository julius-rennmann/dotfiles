return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    '<leader>ff',
    '<leader>fg',
    '<leader>fb',
    '<leader>fh',
    '<leader>fr',
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'flex',
        layout_config = {
          flip_columns = 140,
          vertical = {
            width = { padding = 1 },
            height = { padding = 1 },
          },
          horizontal = {
            width = { padding = 1 },
            height = { padding = 1 },
            preview_cutoff = 100,
            preview_width = 0.5,
          }
        },
        mappings = {
          i = {
            ["<Down>"] = require('telescope.actions').cycle_history_next,
            ["<Up>"] = require('telescope.actions').cycle_history_prev,
          }
        }
      }
    }
    local builtin = require('telescope.builtin')
    local set = vim.keymap.set
    set('n', '<leader>ff', builtin.find_files, {})
    set('n', '<leader>fg', builtin.live_grep, {})
    set('n', '<leader>fb', builtin.buffers, {})
    set('n', '<leader>fh', builtin.help_tags, {})
    set('n', '<leader>fr', builtin.resume, {})
  end
}
