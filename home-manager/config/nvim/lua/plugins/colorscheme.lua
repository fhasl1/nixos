return {
	{
		"kdheepak/monochrome.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("monochrome")
			vim.cmd([[
				highlight Normal guibg=none
				highlight NonText guibg=none
				highlight Normal ctermbg=none
				highlight NonText ctermbg=none
			]])
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
