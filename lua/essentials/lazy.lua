-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	require("essentials.treesitter"),

	-- Neovim built-in lsp
	"neovim/nvim-lspconfig",

	-- Neovim built-in lsp autocompletion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lua",

	-- Telescope for fuzzy finding
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-project.nvim",
	"nvim-telescope/telescope-file-browser.nvim",

	require("essentials.mason-lspconfig"),
	require("essentials.mason"),

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },

	-- require("optionals.autoformat"),
	-- require("optionals.undotree"),
	-- require("optionals.git"),
	-- require("optionals.bufferline"),
	-- require("optionals.autopairs"),
	-- require("optionals.statusline"),
        require("personal.theme"),
}
local opts = {}

require("lazy").setup(plugins, opts)
