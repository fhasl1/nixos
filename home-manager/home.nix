{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/nvim.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "fhasl";
    homeDirectory = "/home/fhasl";
    stateVersion = "26.05";
  };
}
