return {
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {},
	},
	{
		"tpope/vim-sleuth",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"stevearc/oil.nvim",
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		lazy = false,
		opts = {},
	},
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle",
		event = { "InsertLeave", "TextChanged" },
		opts = {},
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.indentscope").setup()
			require("mini.icons").setup()
			require("mini.surround").setup()
			require("mini.diff").setup()
			require("mini.hipatterns").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP document symbols" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						prompt_position = "top",
					},
					sorting_strategy = "ascending",
					winblend = 0,
				},
				extensions = {
					fzf = {},
				},
			})
			local ok = pcall(telescope.load_extension, "fzf")
			if not ok then
				vim.notify("telescope-fzf-native not built - install base-devel and run :Lazy build telescope-fzf-native.nvim", vim.log.levels.WARN)
			end
		end,
	},
}
