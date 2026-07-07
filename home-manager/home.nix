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
    packages = with pkgs; [
      (pkgs.dmenu.overrideAttrs (_: {
        src = ./config/dmenu;
        patches = [];
      }))
    ];
  };
}
