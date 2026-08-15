{ ... }: {
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      sh = [ "shellcheck" ];
      bash = [ "shellcheck" ];
      sql = [ "sqlfluff" ];
      mysql = [ "sqlfluff" ];
      postgresql = [ "sqlfluff" ];
    };
  };
}
