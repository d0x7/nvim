return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "VeryLazy",
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup({
			options = {
				mode = "tabs",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- Adds a separator between Neo-tree and buffers
					},
				},
				diagnostics = "nvim_lsp",
				separator_style = { "", "" },
				modified_icon = "●",
				show_close_icon = false,
				show_buffer_close_icons = true,
			},
		})
	end,
	keys = {
		{ "<C-w><C-w>", "<cmd>bdelete<cr>", mode = { "n" }, opts = { noremap = true }, desc = "Close current buffer." },
	},
}
