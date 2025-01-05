# nvim-config
Matt's personal Neovim configuration. This configuration should be sufficient for most web development tasks. It includes the following:

- `lazy.nvim` for package management
- `mason.nvim` to install and manage LSP servers, DAP servers, linters, and formatters
- native `neovim` language server protocol (lsp) setup for the most common web development tasks (html, css, `react`, `svelte`, `typescript`, etc)
- `telescope` integration
- autoformatters, color schemes, and syntax highlighting
- AI integration with libraries like `codeium` for advanced AI-driven autocomplete, and `avante.nvim` for a `cursor`-like IDE experience
- `git` integration via `octo.nvim` and `gitsigns`
- adds various new motions and code navigation with character motions (via `flash.nvim`)
- web development-specific tooling such as autoclosing tags, debugging, testrunners, etc.


Extends the excellent `kickstart.nvim` project as a minimal configuration
https://github.com/nvim-lua/kickstart.nvim
