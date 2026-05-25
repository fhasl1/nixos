{ config, lib,  pkgs, ... }:

{
   imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./services.nix
      ./networking.nix
      ./boot.nix
      ../../modules/nix.nix
      ../../modules/programs.nix
      ../../modules/users.nix
      ../../modules/locale.nix
      nixos-hardware.nixosModules.lenovo-thinkpad-t480
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      inputs.gsr-ui-nix.nixosModules.default
   ];
   system.stateVersion = "25.11";
}
