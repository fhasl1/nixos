{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./obs.nix
    ./hardware.nix
    inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
    inputs.gsr-ui-nix.nixosModules.default
  ];

  system.stateVersion = "26.05";
}
