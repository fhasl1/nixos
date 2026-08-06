return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
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
}
