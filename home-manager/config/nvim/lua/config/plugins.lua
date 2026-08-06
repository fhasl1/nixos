local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
vim.lsp.config("*", {
	capabilities = capabilities,
})

local function set_transparent()
	local groups = {
		"Normal",
		"NormalNC",
		"EndOfBuffer",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"StatusLine",
		"StatusLineNC",
		"TabLine",
		"TabLineFill",
		"TabLineSel",
		"ColorColumn",
	}
	for _, g in ipairs(groups) do
		vim.api.nvim_set_hl(0, g, { bg = "none" })
	end
	vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end
set_transparent()

require("lint").linters_by_ft = {
	sh = { "shellcheck" },
	bash = { "shellcheck" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
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

vim.lsp.config("lua_ls", {
	filetypes = { "lua" },
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
	filetypes = { "c", "cpp", "objc", "objcpp", "h" },
	cmd = { "clangd", "--query-driver=/usr/bin/gcc,/usr/bin/clang" },
})
vim.lsp.enable("clangd")

vim.lsp.config("pyright", {
	filetypes = { "python" },
	cmd = { "pyright-langserver", "--stdio" },
})
vim.lsp.enable("pyright")

vim.lsp.config("nixd", {
	filetypes = { "nix" },
	cmd = { "nixd" },
	settings = {
		nixd = {
			formatting = {
				command = { "alejandra" },
			},
		},
	},
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
		map("<leader>duc", dapui.close, "close ui")
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "tex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.conceallevel = 2
	end,
})
