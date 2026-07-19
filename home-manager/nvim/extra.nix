{pkgs, ...}: let
  lackluster-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "lackluster-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "slugbyte";
      repo = "lackluster.nvim";
      rev = "70dd682e564784893b984deb51dd5ddd263c8cc7";
      hash = "sha256-OxeY+0Q07zD6FHa0BRhz/1k4HyJeB8/j+vrzXVSbe/4=";
    };
    doCheck = false;
  };

  statusline-lua = pkgs.vimUtils.buildVimPlugin {
    name = "statusline-lua";
    src = pkgs.fetchFromGitHub {
      owner = "beauwilliams";
      repo = "statusline.lua";
      rev = "master";
      hash = "sha256-iAMBShk7UrK+KvVuO0qaIaoEBE7vtg7clxtuzmzLXwU=";
    };
  };
in {
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      statusline-lua
      plenary-nvim
      mason-nvim
      mason-nvim-dap-nvim
      lackluster-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      nvim-colorizer-lua
    ];

    extraPackages = with pkgs; [
      stylua
      clang-tools
      prettier
      lua-language-server
      nixd
      bash-language-server
      vscode-langservers-extracted
      alejandra
      shellcheck
      statix
      ripgrep
    ];

    extraConfigLua = ''
      -- LSP capabilities (Neovim 0.11 built-in API)
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

      vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeSignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { bg = "none", fg = "#2a2a2a" })
      vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

      -- Lua Language Server
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

      -- clangd (use Nix-wrapped clangd for correct include paths on NixOS)
      vim.lsp.config("clangd", {
        filetypes = { "c", "cpp", "objc", "objcpp", "h" },
        cmd = {
          "${pkgs.clang-tools}/bin/clangd",
          "--query-driver=/nix/store/*/bin/gcc*,/nix/store/*/bin/g++*,/nix/store/*/bin/clang*",
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
      vim.lsp.enable("clangd")

      -- nixd
      vim.lsp.config("nixd", {
        filetypes = { "nix" },
        cmd = { "nixd" },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
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
                expr = '(builtins.getFlake "github:fhasl1/nixos").nixosConfigurations.artemis.options',
              },
            },
          },
        },
      })
      vim.lsp.enable("nixd")

      -- Mason
      require("mason").setup()

      -- DAP setup with mason-nvim-dap
      require("mason-nvim-dap").setup({
        ensure_installed = { "cppdbg" },
        automatic_installation = true,
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })

      -- LuaSnip vscode loader
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Colorizer
      require("colorizer").setup()

      require('vim._core.ui2').enable()

      -- Statusline
      require("statusline").setup({
        match_colorscheme = true,
        tabline = true,
        lsp_diagnostics = true,
        ale_diagnostics = false,
      })

      -- Remove any command-line abbreviations that remap :w or :q
      pcall(vim.cmd, "cunabbrev w")
      pcall(vim.cmd, "cunabbrev q")
    '';
  };
}
