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
   ];
   system.stateVersion = "25.11";
}
