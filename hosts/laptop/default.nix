{ config, lib,  pkgs, inputs, ... }:

{
   imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
      ./networking.nix
      ./boot.nix
      ./bluetooth.nix
      ../../modules/nix.nix
      ../../modules/programs.nix
      ../../modules/users.nix
      ../../modules/locale.nix
<<<<<<< HEAD
      nixos-hardware.nixosModules.lenovo-thinkpad-t480
=======
>>>>>>> d735107 (nixos: update 2026-05-26_10-32-08)
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      inputs.gsr-ui-nix.nixosModules.default
   ];
   system.stateVersion = "25.11";
}
