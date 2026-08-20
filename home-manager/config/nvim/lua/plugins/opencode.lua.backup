return {
	{
		"sudo-tee/opencode.nvim",
		dependencies = {
			"MeanderingProgrammer/render-markdown.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("opencode").setup({})
		end,
		keys = {
			{ "<C-a>", mode = { "n", "x" }, function() require("opencode.api").open_input() end, desc = "Ask opencode" },
			{ "<C-x>", mode = { "n", "x" }, function() require("opencode.api").quick_chat() end, desc = "Execute opencode action" },
			{ "<C-.>", mode = { "n", "t" }, function() require("opencode.api").toggle() end, desc = "Toggle opencode" },
			{ "<leader>o/", mode = { "n", "x" }, function() require("opencode.api").quick_chat() end, desc = "Quick chat" },
		},
	},
}
