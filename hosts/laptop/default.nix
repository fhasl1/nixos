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
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      inputs.gsr-ui-nix.nixosModules.default
   ];
   system.stateVersion = "25.11";
}
