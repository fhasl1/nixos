{pkgs, ...}: {
  imports = [];

  programs = {
    home-manager.enable = true;
    neovim = {
      enable = true;
      vimAlias = true;
      viAlias = true;
    };
    git = {
      enable = true;
      settings = {
        user.name = "fhasl1";
        user.email = "gatkpoytxd@gmail.com";
      };
    };
    gh = {
      enable = true;
      settings = {
        git_protocol = "https";
      };
    };
  };

  home = {
    username = "fhasl";
    homeDirectory = "/home/fhasl";
    stateVersion = "26.05";
    sessionVariables = {
      XDG_CONFIG_HOME = "/home/fhasl/.config";
    };
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
    };
    packages = with pkgs; [
      (pkgs.dmenu.overrideAttrs (_: {
        src = ./config/dmenu;
        patches = [];
      }))
      (pkgs.texliveSmall.withPackages (ps: [
        ps.enumitem
        ps.preview
      ]))
      ghostscript
      hunspell
      hunspellDicts.en_US
      stylua
      clang-tools
      prettier
      lua-language-server
      nixd
      bash-language-server
      vscode-langservers-extracted
      pyright
      alejandra
      shellcheck
      statix
      sqls
      sqlfluff
      python3Packages.sqlparse
      ripgrep
    ];
  };
}
