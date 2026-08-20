return {
	{
		"slugbyte/lackluster.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("lackluster")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
		end,
	},
	{
		"beauwilliams/statusline.lua",
		dependencies = {
			"nvim-lua/lsp-status.nvim",
		},
		config = function()
			require("statusline").setup({
				match_colorscheme = true,
				tabline = true,
				lsp_diagnostics = true,
				ale_diagnostics = false,
			})
		end,
	},
}
