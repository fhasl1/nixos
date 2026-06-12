return {
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {},
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cpp = { "clang-format" },
					html = { "prettier" },
					c = { "clang-format" },
					css = { "prettier" },
					bash = { "prettier" },
				},
			})
		end,
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		{
			"stevearc/oil.nvim",
			---@module 'oil'
			---@type oil.SetupOpts
			opts = {},
			dependencies = { { "nvim-mini/mini.icons", opts = {} } },
			lazy = false,
		},
	},
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {},
	},
	{ "nvim-mini/mini.indentscope", version = false },
}
