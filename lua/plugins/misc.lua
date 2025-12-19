return {
  "vim-test/vim-test",

  {
    "epwalsh/obsidian.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("obsidian").setup({
        dir = "~/Documents/Obsidian Vault",
      })
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },

  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },

  {
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },

  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
    end,
  },
}
