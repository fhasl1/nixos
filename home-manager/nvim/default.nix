{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmds.nix
    ./extra.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    nixpkgs.useGlobalPackages = true;

    plugins.lz-n.enable = true;

    globals = {
      mapleader = " ";
    };

    colorscheme = "koda";

    highlight = {
      Normal = {bg = "none";};
      NonText = {bg = "none";};
    };

    diagnostic.settings = {
      virtual_text = {
        source = false;
      };
      virtual_lines = true;
      signs = true;
      underline = true;
      update_in_insert = false;
      severity_sort = true;
    };
  };
}
