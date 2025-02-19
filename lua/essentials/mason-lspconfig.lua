return {
	"williamboman/mason-lspconfig.nvim",
	config = function(_, opts)
		require("mason-lspconfig").setup({
			ensure_instsalled = {
				-- "gopls",
				"bashls",
				"jsonls",
				"marksman",
				"taplo",
				"lua_ls",
				"yamlls",
			},
		})
	end,
}
