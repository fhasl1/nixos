{inputs, ...}: {
  programs.home-manager.enable = true;
  programs.nixvim = {
    enable = true;
    nixpkgs.useGlobalPackages = true;
  };

  home = {
    username = "fhasl";
    homeDirectory = "/home/fhasl";
    stateVersion = "26.05";
  };
}
