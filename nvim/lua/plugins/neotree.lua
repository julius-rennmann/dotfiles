return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    require("neo-tree").setup({
      window = {
        width = 30,
        mappings = {
          ["o"] = "open",
          ["<Tab>"] = function(state)
            local node = state.tree:get_node()
            state.commands["open"](state)
            if node.type == "file" then
              vim.cmd("Neotree reveal=true")
            end
          end
        }
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          never_show = {
            ".git"
          },
        },
        use_libuv_file_watcher = true
      }
    })
    local set = vim.keymap.set
    set('n', '<leader>tt', ":Neotree toggle=true<CR>", { silent = true })
    set('n', '<leader>tb', ":Neotree buffers<CR>", { silent = true })
    set('n', '<leader>tg', ":Neotree git_status<CR>", { silent = true })
    set('n', '<leader>tc', ":Neotree close<CR>", { silent = true })
    set('n', '<leader>tf', ":Neotree reveal=true<CR>", { silent = true })
  end
}
