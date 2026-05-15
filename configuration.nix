{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      ./modules/boot.nix
      ./modules/networking.nix
      ./modules/locale.nix
      ./modules/users.nix
      ./modules/packages.nix
      ./modules/programs.nix
      ./modules/services.nix
      ./modules/hardware.nix
      ./modules/nix.nix
    ];

  system.stateVersion = "25.11";
}

