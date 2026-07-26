{pkgs, ...}: {
  imports = [
    ./nvim
  ];

  programs = {
    home-manager.enable = true;
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
    packages = with pkgs; [
      (pkgs.dmenu.overrideAttrs (_: {
        src = ./config/dmenu;
        patches = [];
      }))
      (pkgs.texliveSmall.withPackages (ps: [ ps.enumitem ]))
      hunspell
      hunspellDicts.en_US
    ];
  };
}
