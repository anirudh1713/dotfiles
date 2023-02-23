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

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- colorschemes
  use("ellisonleao/gruvbox.nvim")
  use("folke/tokyonight.nvim")
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "rose-pine/neovim", as = "rose-pine" })
  use("sainnhe/gruvbox-material")
  use("sainnhe/everforest")
  use("arcticicestudio/nord-vim")
  use("EdenEast/nightfox.nvim")
  use("sainnhe/sonokai")

  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

  use("ThePrimeagen/harpoon")
  use("mbbill/undotree")
  use("tpope/vim-surround")
  use("numToStr/Comment.nvim")
  use("nvim-lualine/lualine.nvim")
  use("folke/trouble.nvim")

  -- git
  use("lewis6991/gitsigns.nvim")
  use("tpope/vim-fugitive")
  use("ThePrimeagen/git-worktree.nvim")

  -- auto closing
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- lsp
  use({
    "VonHeikemen/lsp-zero.nvim",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  })
  use("simrat39/rust-tools.nvim")
  use("onsails/lspkind.nvim")

  -- formatting and linting
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

  use("nvim-tree/nvim-web-devicons")

  use("lukas-reineke/indent-blankline.nvim")

  use("nvim-tree/nvim-tree.lua")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
