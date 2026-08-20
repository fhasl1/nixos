return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.config("lua_ls", {
                filetypes = { "lua" },
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
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
            })
            vim.lsp.enable("clangd")

            vim.lsp.config("pyright", {
                filetypes = { "python" },
            })
            vim.lsp.enable("pyright")

            vim.lsp.config("nixd", {
                filetypes = { "nix" },
                settings = {
                    nixd = {
                        nixpkgs = { expr = "import <nixpkgs> { }" },
                        formatting = { command = { "alejandra" } },
                        options = {
                            nixos = {
                                expr = '(builtins.getFlake "github:fhasl1/nixos").nixosConfigurations.artemis.options',
                            },
                        },
                    },
                },
            })
            vim.lsp.enable("nixd")

            vim.lsp.config("sqls", {
                filetypes = { "sql", "mysql", "postgresql" },
            })
            vim.lsp.enable("sqls")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        config = function()
            local lint = require("lint")
            lint.linters_by_ft = {
                sh = { "shellcheck" },
                bash = { "shellcheck" },
                sql = { "sqlfluff" },
                mysql = { "sqlfluff" },
                postgresql = { "sqlfluff" },
            }
        end,
    },

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
                    sql = { "sqlformat" },
                    mysql = { "sqlformat" },
                    postgresql = { "sqlformat" },
                },
            })
        end,
    },

    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "clangd",
                "lua_ls",
                "html",
                "bashls",
                "cssls",
                "pyright",
            },
        },
    },

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "jay-babu/mason-nvim-dap.nvim",
                opts = {
                    ensure_installed = { "cppdbg" },
                    automatic_installation = true,
                    handlers = {
                        function(config)
                            require("mason-nvim-dap").default_setup(config)
                        end,
                    },
                },
            },
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio",
                },
                config = function()
                    require("dapui").setup()
                end,
            },
        },
    },
}
