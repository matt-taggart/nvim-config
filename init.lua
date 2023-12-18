local set = vim.opt
local api = vim.api

vim.g.mapleader = ' '
vim.g.js_debug_font_color = 'cyan'

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.number = true
set.relativenumber = true
set.hlsearch = true
set.clipboard = 'unnamedplus'
set.smartindent = true
set.autoindent = true

-- api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

vim.cmd [[
  colorscheme catppuccin
  let g:test#javascript#runner = "jest"
  let g:test#javascript#jest#file_pattern = '.*'
  let g:test#javascript#jest#executable = 'yarn test'
  let test#strategy = "neovim"
  let g:test#neovim#start_normal = 1 
  let g:user_emmet_install_global=0
  let g:UltiSnipsSnippetDirectories = [$HOME.'/.vim/UltiSnips']
  let g:merginal_remoteVisible=0
  autocmd FileType html,css,javascript,javascriptreact,typescript,typescriptreact EmmetInstall
]]

vim.cmd [[
function! s:JSXPropComplete()
  let l:wordUnderCursor = expand("<cword>")
  execute "normal! a={" . l:wordUnderCursor . "}"
endfunction

:command JSXPropComplete :call s:JSXPropComplete()
]]


local highlightGroup = api.nvim_create_augroup("highlight_yank", { clear = true })
api.nvim_create_autocmd(
  { "TextYankPost" },
  { pattern = "*", command = "silent! lua vim.highlight.on_yank({higroup=\"IncSearch\", timeout=300})", group = highlightGroup }
)

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')
vim.keymap.set('n', '<Leader>f', ':lua require\'telescope.builtin\'.find_files{}<CR>')
vim.keymap.set('n', '<Leader>/', ':lua require\'telescope.builtin\'.live_grep{}<CR>')
vim.keymap.set('n', '<Leader>s', ':lua require\'telescope.builtin\'.grep_string{}<CR>')
vim.keymap.set('n', '<Leader>b', ':lua require\'telescope.builtin\'.buffers{}<CR>')
vim.keymap.set('n', '<C-q>', ':lua require\'telescope.builtin\'.quickfix{}<CR>')
vim.keymap.set('n', '<Leader>g', ':Git<CR>')
vim.keymap.set('n', '<Leader>m', ':Merginal<CR>')
vim.keymap.set('n', '<Leader>q', ':q<CR>')
vim.keymap.set('n', '<Leader>c', ':bd<CR>')
vim.keymap.set('n', '<Leader>C', ':BufOnly<CR>')
vim.keymap.set('n', '<Leader>v', ':e ~/.config/nvim/init.lua<CR>')
vim.keymap.set('n', '<Leader>r', ':ReplaceInBuffer<CR>')
vim.keymap.set('n', '<Leader>jp', ':JSXPropComplete<CR>')
-- vim.keymap.set('i', '{', '{}<Esc>i')
-- vim.keymap.set('i', '(', '()<Esc>i')
-- vim.keymap.set('i', '[', '[]<Esc>i')
-- vim.keymap.set('i', '\'', '\'\'<Esc>i')
-- vim.keymap.set('i', '"', '""<Esc>i')
vim.keymap.set('n', '<Leader>t', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>T', ':TestFile<CR>')
vim.keymap.set('n', '<Leader>a', ':TestSuite<CR>')
vim.keymap.set('n', '<C-s>', ':MarkdownPreview<CR>')
vim.keymap.set('n', '<M-s>', ':MarkdownPreview<CR>')
vim.keymap.set('n', '<C-p>', ':MarkdownPreviewToggle<CR>')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use {
    "williamboman/mason.nvim",
    config = function() require('mason').setup() end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function() require('mason-lspconfig').setup() end
  }
  use 'mfussenegger/nvim-dap'
  use "nvim-lua/plenary.nvim"
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = function()
  --     require("null-ls").setup({
  --         sources = {
  --             require("null-ls").builtins.formatting.stylua,
  --             require("null-ls").builtins.diagnostics.eslint,
  --             require("null-ls").builtins.completion.spell,
  --             require("null-ls").builtins.formatting.prettier,
  --         },
  --     })
  --   end
  -- }
  use "dracula/vim"
  use "EdenEast/nightfox.nvim"
  use "folke/tokyonight.nvim"
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'tpope/vim-commentary'           
  use 'tpope/vim-fugitive'           
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-unimpaired'
  use 'jiangmiao/auto-pairs'
  use 'michaeljsmith/vim-indent-object'
  use 'kana/vim-textobj-user'
  use 'whatyouhide/vim-textobj-xmlattr'
  use 'christoomey/vim-tmux-navigator'
  use 'blindFS/vim-taskwarrior'
  use 'idanarye/vim-merginal'
  use 'vim-scripts/ReplaceWithRegister' 
  use { 'nvim-telescope/telescope.nvim', version = "0.1.0" }
  use 'vim-scripts/BufOnly.vim'
  use 'ggandor/lightspeed.nvim'
  use 'kevinhwang91/nvim-bqf'
  use 'prettier/vim-prettier'
  use 'sirver/ultisnips'
  use 'vim-test/vim-test'
  use {
    'feline-nvim/feline.nvim',
    config = function() require('feline').setup() end
  }
  use {
    'lewis6991/gitsigns.nvim',
    version = "0.5",
    config = function() require('gitsigns').setup() end
  }
  use 'matt-taggart/vim-js-debug'
  use 'matt-taggart/replace-in-buffer'
  use {
    'wellle/targets.vim',
    event = 'VimEnter'
  }
  use { 'psliwka/vim-smoothie' }

  use({"onsails/lspkind-nvim", event = "VimEnter"})
  -- auto-completion engine
  use {
    "hrsh7th/nvim-cmp",
    after = "lspkind-nvim",
    config = function() 
      require "nvim-cmp"
    end
  }

  -- nvim-cmp completion sources
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  -- use {"hrsh7th/cmp-nvim-lua", after = "nvim-cmp"}
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "mattn/emmet-vim" }
  use { "lewis6991/impatient.nvim" }
  use { "alvan/vim-closetag" }
  use { "AndrewRadev/tagalong.vim" }
  use { "xolox/vim-misc" }
  use { "xolox/vim-notes" }
  use { "kana/vim-textobj-entire" }
  use { "catppuccin/nvim", as = "catppuccin" }

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use { "ms-jpq/coq_nvim", branch = "coq" }
  use { "ms-jpq/coq.artifacts", branch = "artifacts"  }
  use { "ms-jpq/coq.thirdparty", branch = "3p"  }

  use {
    "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function()
      require("pqf").setup()
    end
  }

  use { "nvim-tree/nvim-web-devicons" }
  use { "numToStr/FTerm.nvim" }
  use { "sindrets/diffview.nvim" }
  use {
    "sunjon/shade.nvim",
    config = function()
      require("shade").setup()
    end
  }
  use({
    "Pocco81/true-zen.nvim",
    config = function()
       require("true-zen").setup {
        -- your config goes here
        -- or just leave it empty :)
       }
    end,
  })
  use { "chentoast/marks.nvim",
    config = function() require('marks').setup() end
  }

  -- use {"hrsh7th/cmp-cmdline", after = "nvim-cmp"}
  use {"quangnguyen30192/cmp-nvim-ultisnips", after = {'nvim-cmp', 'ultisnips'}}
  if vim.g.is_mac then
    use {"hrsh7th/cmp-emoji", after = 'nvim-cmp'}
  end

  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require"octo".setup()
    end
  }


  -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
  use {
    "neovim/nvim-lspconfig",
    after = "cmp-nvim-lsp",
    config = function()
      require "nvim-lspconfig"
    end
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


vim.cmd [[
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'


set includeexpr=substitute(v:fname,'^suited','./src','')
set suffixesadd=.js,.ts,.jsx,.tsx
tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>
nnoremap <silent> <M-o> :RnvimrToggle<CR>
tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>
noremap <silent> <leader>to <C-\><C-n>:FTermToggle<CR>
]]

