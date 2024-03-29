-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Packer bootstrap => automatic installation of packer on any machine that clones this configuration
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() --true if packer was just installed

-- Packer autocommand => automatic updating/installation upon reload
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

-- Only required if you have packer configured as `opt`
-- vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua functions that many plugins use
  use("nvim-lua/plenary.nvim")

  -- preferred colorscheme
  use({
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  })

  -- use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  -- use('nvim-treesitter/playground')

  -- harpoon around files added to harpoon dir (<C-e>) using <leader>a
  use("theprimeagen/harpoon")

  -- use('mbbill/undotree')
  -- use('tpope/vim-fugitive')

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator")

  -- maximizes & restores current window
  use("szw/vim-maximizer")

  -- essential plugins
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister") -- look up further docs for this one (did prime already give us one within set.lua?)

  -- commenting with gc (NB: gcc, gc9j, etc.)
  use("numToStr/Comment.nvim")

  -- floating terminal
  -- use({
  --   "voldikss/vim-floaterm",
  --   keys = "<C-\\>",
  --   cmd = {
  --     "FloatermNew",
  --     "FloatermToggle",
  --   },
  -- })

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("kyazdani42/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting perfomance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  -- use({ "nvim-telescope/telescope-ui-select.nvim" }) -- for showing lsp code actions

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters, & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  -- use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhancing the lsp ui's

  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (i.e. rename file & update exports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  use({
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  })

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  })

  -- use("karb94/neoscroll.nvim")

  -- use({
  --   "glepnir/dashboard-nvim",
  --   event = "VimEnter",
  --   config = function()
  --     require("dashboard").setup({
  --       theme = "doom",
  --       preview = {
  --         file_height = 12,
  --         file_width = 80,
  --       },
  --       config = {
  --         center = {
  --           {
  --             icon = "  ",
  --             icon_hl = "DashboardCenter1Icon",
  --             desc = "finder                           ",
  --             key = "~",
  --             key_hl = "DashboardCenter1Icon",
  --             action = "Telescope find_files find_command=rg,--hidden,--files",
  --           },
  --           {
  --             icon = "  ",
  --             icon_hl = "DashboardCenter1Icon",
  --             desc = "notes                            ",
  --             key = "~",
  --             key_hl = "DashboardCenter1Icon",
  --             action = ":e ~/Documents/vimnotes.md",
  --           },
  --           {
  --             icon = "  ",
  --             icon_hl = "DashboardCenter1Icon",
  --             desc = "dots                             ",
  --             key = "~",
  --             key_hl = "DashboardCenter1Icon",
  --             action = "Telescope find_files cwd=~/.config",
  --           },
  --           {
  --             icon = "  ",
  --             icon_hl = "DashboardCenter1Icon",
  --             desc = "exit                             ",
  --             key = "~",
  --             key_hl = "DashboardCenter1Icon",
  --             action = "qa",
  --           },
  --         },
  --         header = {
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[   ▄████▄              ▒▒▒▒▒   ]],
  --           [[  ███▄█▀              ▒ ▄▒ ▄▒  ]],
  --           [[ ▐████     █  █  █   ▒▒▒▒▒▒▒▒▒ ]],
  --           [[  █████▄             ▒▒▒▒▒▒▒▒▒ ]],
  --           [[   ▀████▀            ▒ ▒ ▒ ▒ ▒ ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --           [[                               ]],
  --         },
  --       },
  --     })
  --   end,
  --   dependencies = { { "nvim-tree/nvim-web-devicons" } },
  -- })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
