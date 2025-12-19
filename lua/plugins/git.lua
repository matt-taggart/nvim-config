return {
  "tpope/vim-fugitive",
  {
    "idanarye/vim-merginal",
    init = function()
      vim.g.merginal_remoteVisible = 0
      vim.g.merginal_splitType = ""
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
}
