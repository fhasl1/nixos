{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./networking.nix
    ./packages.nix
    ./services.nix
    ./obs.nix
    ./hardware.nix
    ../../modules/locale.nix
    ../../modules/users.nix
    ../../modules/programs.nix
    ../../modules/hardware.nix
    ../../modules/nix.nix
    ../../modules/security.nix
    inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
  ];

  system.stateVersion = "26.05";
}
