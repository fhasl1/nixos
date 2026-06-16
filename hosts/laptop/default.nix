{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ./networking.nix
    ./boot.nix
    ./bluetooth.nix
    ./programs.nix
    inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
    inputs.gsr-ui-nix.nixosModules.default
  ];

  system.stateVersion = "26.05";
}
