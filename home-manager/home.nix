{pkgs, ...}: {
  imports = [
    ./nvim
  ];

  programs.home-manager.enable = true;

  services = {
    sxhkd = {
      enable = true;
      package = pkgs.sxhkd;
    };
  };

  home = {
    username = "fhasl";
    homeDirectory = "/home/fhasl";
    stateVersion = "26.05";
  };
}
