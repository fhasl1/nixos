{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./boot.nix
      ./networking.nix
      ./packages.nix
      ./services.nix
      ./obs.nix
      ../../modules/locale.nix
      ../../modules/users.nix
      ../../modules/programs.nix
      ../../modules/hardware.nix
      ../../modules/nix.nix
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      inputs.gsr-ui-nix.nixosModules.default
    ];

  system.stateVersion = "25.11";
}

