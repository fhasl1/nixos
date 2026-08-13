{ ... }: {
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        lua = [ "stylua" ];
        cpp = [ "clang-format" ];
        html = [ "prettier" ];
        c = [ "clang-format" ];
        css = [ "prettier" ];
        bash = [ "prettier" ];
        sql = [ "sqlformat" ];
        mysql = [ "sqlformat" ];
        postgresql = [ "sqlformat" ];
      };
    };
  };
}
