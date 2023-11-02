return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = false,
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup {
      scope = {
        enabled = false
      }
    }
  end
}
