return {
	{
		"Saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = {
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-Space>"] = { "show", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				documentation = { auto_show = true },
			},
			cmdline = {
				keymap = {
					["<Tab>"] = { "show", "accept" },
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
				completion = {
					menu = {
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ":"
						end,
					},
				},
			},
		},
	},

	{ "mfussenegger/nvim-lint" },

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"neovim/nvim-lspconfig",
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"clangd",
				"lua_ls",
				"html",
				"bashls",
				"cssls",
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
	},
}
