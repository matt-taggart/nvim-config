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
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    opts = {
      picker = "snacks",
      -- bare Octo command opens picker of commands
      enable_builtin = true,
    },
    keys = {
      {
        "<leader>op",
        "<CMD>Octo pr create<CR>",
        desc = "Create PR",
      },
      {
        "<leader>or",
        "<CMD>Octo reviewer add crayo<CR><CMD>Octo reviewer add tahege<CR>",
        desc = "List GitHub PullRequests",
      },
      {
        "<leader>os",
        function()
          require("octo.utils").create_base_search_command({ include_current_repo = true })
        end,
        desc = "Search GitHub",
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
}
