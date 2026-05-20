{ config, lib,  pkgs, ... }:

{
   imports = [
      ./hardware-configuration.nix
      ../../modules/nix.nix
      ../../modules/programs.nix
      ../../modules/packages.nix
      ../../modules/users.nix
      ../../modules/locale.nix
      ./services.nix
      ./networking.nix
      ./boot.nix
   ];
   system.stateVersion = "25.11";
}
