local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		--------------------- colorschemes --------------------
		-- tokyonight
		use("folke/tokyonight.nvim")
		-- nvim-tree (新增)
		use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
		-- bufferline (新增)
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine (新增)
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope （新增）
		use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } })
		-- treesitter （新增）
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		--------------------- LSP --------------------
		use("williamboman/nvim-lsp-installer")
		-- Lspconfig
		use({ "neovim/nvim-lspconfig" })
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig.nvim" })

		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- snippet 引擎
		use("hrsh7th/vim-vsnip")
		-- 补全源
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- 常见编程语言代码段
		use("rafamadriz/friendly-snippets")
		use("onsails/lspkind-nvim")
		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		-- dashboard-nvim (新增)
		use("glepnir/dashboard-nvim")
		use("ahmedkhalf/project.nvim")
		use("kdheepak/lazygit.nvim")

		use({
			"lewis6991/gitsigns.nvim",
			-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
		})
		use({
			"akinsho/toggleterm.nvim",
			tag = "*",
			config = function()
				require("toggleterm").setup()
			end,
		})
		-- 代码格式化
		-- use("mhartington/formatter.nvim")
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
		-- 代码格式化 (新增)
		use("mhartington/formatter.nvim")
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("aerial").setup()
			end,
		})
    use("simrat39/rust-tools.nvim")
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			default_url_format = "https://hub.fastgit.xyz/%s",
			default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			default_url_format = "https://gitcode.net/mirrors/%s",
			default_url_format = "https://gitclone.com/github.com/%s",
		},
	},
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
