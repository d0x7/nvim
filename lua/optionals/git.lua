return {
	"tpope/vim-fugitive",
	dependencies = {
		-- Make Git integration prettier
		"mhinz/vim-signify",
	},
	keys = {
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", mode = { "n" }, desc = "Open `git diff` in split window" },
		{ "<leader>gb", "<cmd>Git blame<cr>", mode = { "n" }, desc = "Open `git blame` in a small split window" },
		{ "<leader>gs", "<cmd>G<cr>", mode = { "n" }, desc = "Open vim-fugitive git overview." },
	},
}
