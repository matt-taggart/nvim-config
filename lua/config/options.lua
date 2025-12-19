vim.g.have_nerd_font = true

-- Plugins that read globals at startup
vim.g.AutoPairsMapCR = 0

-- Tabs / indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.laststatus = 3

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Editing
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.hlsearch = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Timings
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Command preview
vim.opt.inccommand = "split"

-- Conceal (used by markdown/obsidian/etc)
vim.opt.conceallevel = 2
