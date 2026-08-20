vim.g.mapleader = " "

require("config.lazy")
require("config.options")
require("config.keybinds")

-- LSP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end
vim.lsp.config("*", { capabilities = capabilities })

-- Transparent background
do
    local groups = {
        "Normal", "NormalNC", "EndOfBuffer", "NormalFloat", "FloatBorder",
        "SignColumn", "StatusLine", "StatusLineNC", "TabLine", "TabLineFill",
        "TabLineSel", "ColorColumn",
    }
    for _, g in ipairs(groups) do
        vim.api.nvim_set_hl(0, g, { bg = "none" })
    end
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none", fg = "#2a2a2a" })
    vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })
end

-- Autogroups
local lsp_attach_group = vim.api.nvim_create_augroup("LspAttach", { clear = true })
local lint_group = vim.api.nvim_create_augroup("Lint", { clear = true })

-- Lint on save/enter/leave insert
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
    group = lint_group,
    callback = function()
        local ok, lint = pcall(require, "lint")
        if ok then
            lint.try_lint()
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank()
    end,
})

-- Format before save (with TypeScript organize imports)
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format before save",
    pattern = "*",
    callback = function(ev)
        local conform_opts = { bufnr = ev.buf, lsp_format = "fallback", timeout_ms = 2000 }
        local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = ev.buf })[1]
        if not client then
            local ok, conform = pcall(require, "conform")
            if ok then
                conform.format(conform_opts)
            end
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
        local ok, conform = pcall(require, "conform")
        if ok then
            conform.format(conform_opts)
        end
    end,
})

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
    group = lsp_attach_group,
    callback = function(args)
        local maps = {
            { "n", "K", vim.lsp.buf.hover, { desc = "Lsp: hover" } },
            { "n", "<leader>E", vim.diagnostic.open_float, { desc = "Lsp: diagnostic" } },
            { "n", "<leader>k", vim.lsp.buf.signature_help, { desc = "Lsp: sig help" } },
            { "n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp: rename" } },
            { "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp: code action" } },
            { "n", "<leader>wf", vim.lsp.buf.format, { desc = "Lsp: format" } },
            { "v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp: code action" } },
        }
        for _, m in ipairs(maps) do
            vim.keymap.set(m[1], m[2], m[3], vim.tbl_extend("keep", m[4], { buffer = args.buf }))
        end

        local ok_dap, dap = pcall(require, "dap")
        if ok_dap then
            local dap_maps = {
                { "n", "<leader>dt", function() dap.toggle_breakpoint() end, { desc = "Toggle Break" } },
                { "n", "<leader>dc", function() dap.continue() end, { desc = "Continue" } },
                { "n", "<leader>dr", function() dap.repl.open() end, { desc = "Inspect" } },
                { "n", "<leader>dk", function() dap.terminate() end, { desc = "Kill" } },
                { "n", "<leader>dso", function() dap.step_over() end, { desc = "Step Over" } },
                { "n", "<leader>dsi", function() dap.step_into() end, { desc = "Step Into" } },
                { "n", "<leader>dsu", function() dap.step_out() end, { desc = "Step Out" } },
                { "n", "<leader>dl", function() dap.run_last() end, { desc = "Run Last" } },
            }
            for _, m in ipairs(dap_maps) do
                vim.keymap.set(m[1], m[2], m[3], vim.tbl_extend("keep", m[4], { buffer = args.buf }))
            end
        end

        local ok_dapui, dapui = pcall(require, "dapui")
        if ok_dapui then
            vim.keymap.set("n", "<leader>duu", function() dapui.open() end, { buffer = args.buf, desc = "open ui" })
            vim.keymap.set("n", "<leader>duc", function() dapui.close() end, { buffer = args.buf, desc = "close ui" })
        end
    end,
})

-- Writing filetypes (wrap, conceal)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "tex" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.conceallevel = 2
    end,
})

-- Remove command-line abbreviations
pcall(vim.cmd, "cunabbrev w")
pcall(vim.cmd, "cunabbrev q")
