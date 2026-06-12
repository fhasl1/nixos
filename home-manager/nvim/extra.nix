{
  pkgs,
  lib,
  ...
}: let
  lackluster = pkgs.vimUtils.buildVimPlugin {
    name = "lackluster-nvim";
    src = pkgs.fetchFromGitHub {
      owner = "slugbyte";
      repo = "lackluster.nvim";
      rev = "master";
      hash = "sha256-OxeY+0Q07zD6FHa0BRhz/1k4HyJeB8/j+vrzXVSbe/4=";
    };
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
      mason-nvim-dap-nvim
    ] ++ [ lackluster ];

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
    ];

    extraConfigLua = ''
      -- LSP capabilities (Neovim 0.11 built-in API)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Lua Language Server
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

      -- clangd
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--query-driver=/nix/store/*/bin/gcc*,/nix/store/*/bin/g++*,/nix/store/*/bin/clang*",
        },
      })

      -- nixd
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

      -- Transparent background
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
          vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
        end,
      })

      -- Statusline
      require("statusline").setup({
        match_colorscheme = true,
        tabline = true,
        lsp_diagnostics = true,
        ale_diagnostics = false,
      })
    '';
  };
}
