return {
  "tpope/vim-sleuth",
  "tpope/vim-repeat",
  "tpope/vim-unimpaired",
  "tpope/vim-surround",

  "matt-taggart/vim-js-debug",
  "matt-taggart/replace-in-buffer",

  "chentoast/marks.nvim",
  "michaeljsmith/vim-indent-object",
  "jparise/vim-graphql",

  "jiangmiao/auto-pairs",

  "kana/vim-textobj-user",
  "xolox/vim-misc",
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },

  { "wellle/targets.vim", event = "VimEnter" },

  "vim-scripts/ReplaceWithRegister",
  { "numToStr/Comment.nvim", opts = {} },

  "sitiom/nvim-numbertoggle",
  "bullets-vim/bullets.vim",
  "norcalli/nvim-colorizer.lua",

  {
    "nvim-mini/mini.nvim",
    version = false,
    lazy = false,
    config = function()
      require("mini.files").setup({})
    end,
  },
  {
    "karb94/neoscroll.nvim",
    opts = {},
  },
}
