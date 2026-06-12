{ ... }: {
  programs.nixvim.plugins = {
    comment.enable = true;
    sleuth.enable = true;
    nvim-autopairs.enable = true;

    oil = {
      enable = true;
      settings = {};
      lazy = false;
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
  };
}
