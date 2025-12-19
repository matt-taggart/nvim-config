local map = vim.keymap.set

-- Basics
map("n", "<leader>v", ":e ~/.config/nvim/init.lua<CR>", { noremap = true, silent = true, desc = "Edit init.lua" })
map("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { noremap = true, silent = true, desc = "Quit" })
map("n", "<leader>Q", "<cmd>q!<CR>", { noremap = true, silent = true, desc = "Quit without saving" })
map("n", "<leader>x", "<cmd>source %<CR>", { noremap = true, silent = true, desc = "Source current file" })
map("i", "jk", "<Esc>", { noremap = true })

-- vim-test
map("n", "<leader>t", ":TestNearest<CR>", { noremap = true, silent = true, desc = "Test nearest" })
map("n", "<leader>T", ":TestFile<CR>", { noremap = true, silent = true, desc = "Test file" })
map("n", "<leader>a", ":TestSuite<CR>", { noremap = true, silent = true, desc = "Test suite" })

-- Git
map("n", "<leader>g", ":Git<CR>", { noremap = true, silent = true, desc = "Fugitive" })
map("n", "<leader>m", ":Merginal<CR>", { noremap = true, silent = true, desc = "Merginal" })

-- Files
map("n", "-", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open parent directory" })

-- Some plugins ship default keymaps you may not want
for _, lhs in ipairs({ "gri", "grt", "gra", "grn" }) do
  pcall(vim.keymap.del, "n", lhs)
end

-- Search
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>de", vim.diagnostic.open_float, { desc = "Diagnostic float" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostic loclist" })

-- Terminal
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window movement
map("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

-- Obsidian
map("n", "<C-o>", ":ObsidianQuickSwitch<CR>", { noremap = true, silent = true, desc = "Obsidian quick switch" })

-- Overseer
map("n", "<leader>co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true, desc = "Open Compiler" })
