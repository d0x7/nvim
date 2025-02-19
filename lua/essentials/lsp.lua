local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client)
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })

	if vim.bo.filetype == "rust" then
		vim.keymap.set("n", "K", "<cmd>RustHoverActions<cr>", { buffer = 0 })
	else
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	end
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = 0 })
	vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { buffer = 0 })
	vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { buffer = 0 })
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
	vim.keymap.set("n", "<leader>E", "<cmd>lua vim.diagnostic.open_float(nil, {focus=false})<cr>", { buffer = 0 })

	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]])
	end
end

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end,
	["lua_ls"] = function()
		require("lspconfig")["lua_ls"].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = {
						enable = false,
					},
				},
			},
		})
	end,
	-- ["gopls"] = function()
	-- 	require("lspconfig")["lua_ls"].setup({
	-- 		on_attach = on_attach,
	-- 		capabilities = capabilities,
	-- 		settings = {
	-- 			gopls = {
	-- 				analyses = {
	-- 					unusedparams = true,
	-- 				},
	-- 				staticcheck = true,
	-- 				gofumpt = false,
	-- 			},
	-- 		},
	-- 	})
	-- end,
})

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
		-- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c'}),
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i" }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "spell", keyword_length = 3 },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "nvim_lua" },
	},
})
