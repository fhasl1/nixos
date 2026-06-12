{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs/nvim.nix
  ];

  home = {
    username = "fhasl";
    homeDirectory = "/home/fhasl";
    stateVersion = 26.05;
  };
}
