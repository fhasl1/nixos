{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      inputs.gsr-ui-nix.nixosModules.default
      ./boot.nix
      ./networking.nix
      ../../modules/locale.nix
      ../../modules/users.nix
      ../../modules/packages.nix
      ../../modules/programs.nix
      ./services.nix
      ../../modules/hardware.nix
      ../../modules/nix.nix
      ./obs.nix
    ];

  system.stateVersion = "25.11";
}

