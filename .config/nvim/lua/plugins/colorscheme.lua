return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = function()
      return {
        transparent_mode = true,
      }
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
}
