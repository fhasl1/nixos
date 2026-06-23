{ ... }: {
  programs.nixvim.plugins = {
    comment.enable = true;
    sleuth.enable = true;
    nvim-autopairs.enable = true;

    oil = {
      enable = true;
      settings = {};
    };

    auto-save = {
      enable = true;
      settings = {};
    };

    mini = {
      enable = true;
      modules = {
        indentscope = {};
        icons = {};
      };
    };

    luasnip = {
      enable = true;
      settings = {};
    };

    friendly-snippets.enable = true;

    telescope = {
      enable = true;
      extensions.fzf-native = {
        enable = true;
        settings = {};
      };
      keymaps = {
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
        "<leader>fs" = "lsp_document_symbols";
      };
      settings = {
        defaults = {
          layout_strategy = "horizontal";
          layout_config = {
            prompt_position = "top";
          };
          sorting_strategy = "ascending";
          winblend = 0;
        };
      };
    };
  };
}
