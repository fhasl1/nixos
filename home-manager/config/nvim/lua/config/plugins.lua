require("flash").toggle()
require("oil").setup()
require("mini.indentscope").setup()
require("Comment").setup()

require("lint").linters_by_ft = {
	sh = { "shellcheck" },
	bash = { "shellcheck" },
	nix = { "statix" },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})
vim.lsp.enable("lua_ls")

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--query-driver=/nix/store/*/bin/gcc*,/nix/store/*/bin/g++*,/nix/store/*/bin/clang*",
	},
})

vim.lsp.config("nixd", {
	cmd = { "nixd" },
	capabilities = require("blink.cmp").get_lsp_capabilities(),
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "alejandra" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "github:fhasl1/nixos").nixosConfigurations.amalthea.options',
				},
			},
		},
	},
})

vim.lsp.enable("nixd")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "Lsp: " .. desc })
		end
		map("K", vim.lsp.buf.hover, "hover")
		map("<leader>E", vim.diagnostic.open_float, "diagnostic")
		map("<leader>k", vim.lsp.buf.signature_help, "sig help")
		map("<leader>rn", vim.lsp.buf.rename, "rename")
		map("<leader>ca", vim.lsp.buf.code_action, "code action")
		map("<leader>wf", vim.lsp.buf.format, "format")

		vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Lsp: code_action" })

		local dap = require("dap")
		map("<leader>dt", dap.toggle_breakpoint, "Toggle Break")
		map("<leader>dc", dap.continue, "Continue")
		map("<leader>dr", dap.repl.open, "Inspect")
		map("<leader>dk", dap.terminate, "Kill")

		map("<leader>dso", dap.step_over, "Step Over")
		map("<leader>dsi", dap.step_into, "Step Into")
		map("<leader>dsu", dap.step_out, "Step Out")
		map("<leader>dl", dap.run_last, "Run Last")

		local dapui = require("dapui")
		map("<leader>duu", dapui.open, "open ui")
		map("<leader>duc", dapui.close, "open ui")
	end,
})

require("mason-nvim-dap").setup({
	ensure_installed = { "cppdbg" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()
luasnip.config.setup({})

require("statusline").setup({
	match_colorscheme = true, -- Enable colorscheme matching (Default: false)
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format before save",
	pattern = "*",
	group = vim.api.nvim_create_augroup("FormatConfig", { clear = true }),
	callback = function(ev)
		local conform_opts = { bufnr = ev.buf, lsp_format = "fallback", timeout_ms = 2000 }
		local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = ev.buf })[1]

		if not client then
			require("conform").format(conform_opts)
			return
		end

		local request_result = client:request_sync("workspace/executeCommand", {
			command = "_typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(ev.buf) },
		})

		if request_result and request_result.err then
			vim.notify(request_result.err.message, vim.log.levels.ERROR)
			return
		end

		require("conform").format(conform_opts)
	end,
})
