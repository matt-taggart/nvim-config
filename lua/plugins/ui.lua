return {
  { "Mofiqul/dracula.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "EdenEast/nightfox.nvim" },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  { "rcarriga/nvim-notify", opts = {} },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = { view = "cmdline" },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
