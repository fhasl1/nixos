return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.nvim",
		},
		ft = { "markdown", "opencode_output" },
		opts = {
			anti_conceal = { enabled = false },
			file_types = { "markdown", "opencode_output" },
			heading = {
				enabled = true,
				sizes = { 1.8, 1.5, 1.3, 1.1, 1.0, 1.0 },
			},
			bullet = { enabled = true },
			code = { enabled = true },
			latex = { enabled = true },
		},
	},
	{
		"lervag/vimtex",
		ft = { "tex", "latex" },
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_compiler_latexmk = {
				options = {
					"-xelatex",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}
		end,
	},
}
