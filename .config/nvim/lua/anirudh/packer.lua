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
    tag = "0.1.1",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use ({'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })

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
  use("NLKNguyen/papercolor-theme")

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
  use("tpope/vim-rhubarb")
  use("ThePrimeagen/git-worktree.nvim")

  -- auto closing
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- lsp
  use({
    -- "VonHeikemen/lsp-zero.nvim",
    "neovim/nvim-lspconfig",
    requires = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },
      { "j-hui/fidget.nvim" },
      { "folke/neodev.nvim" },
    },
  })

  -- Autocompletion
  use({
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },
      -- { "hrsh7th/cmp-buffer" },
      -- { "hrsh7th/cmp-path" },
    }
  })

  use("folke/which-key.nvim")
  -- use("simrat39/rust-tools.nvim")
  -- use("onsails/lspkind.nvim")

  -- formatting and linting
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

  use("nvim-tree/nvim-web-devicons")

  use("lukas-reineke/indent-blankline.nvim")

  use("nvim-tree/nvim-tree.lua")

  use("github/copilot.vim")

 --  use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = { "VimEnter" },
	-- 	config = function()
	-- 		vim.defer_fn(function()
	-- 			require("copilot").setup()
	-- 		end, 100)
	-- 	end,
	-- })
	--
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- })

	use({
		"hrsh7th/cmp-emoji",
	})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
