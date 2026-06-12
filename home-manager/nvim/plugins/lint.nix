{ ... }: {
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      sh = [ "shellcheck" ];
      bash = [ "shellcheck" ];
      nix = [ "statix" ];
    };
  };
}
