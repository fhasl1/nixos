return {
	{
		"neovim/nvim-lspconfig",
	},
	{ "mfussenegger/nvim-lint" },

	{
		"mason-org/mason.nvim",
		opts = {},
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
				"pyright",
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			{
				"rcarriga/nvim-dap-ui",
				dependencies = {
					"nvim-neotest/nvim-nio",
				},
				config = function()
					require("dapui").setup()
				end,
			},
		},
	},
}
