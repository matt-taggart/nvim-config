local specs = {}

vim.list_extend(specs, require("plugins.core"))
vim.list_extend(specs, require("plugins.git"))
vim.list_extend(specs, require("plugins.ui"))
vim.list_extend(specs, require("plugins.lsp"))
vim.list_extend(specs, require("plugins.treesitter"))
vim.list_extend(specs, require("plugins.snacks"))
vim.list_extend(specs, require("plugins.misc"))

return specs
