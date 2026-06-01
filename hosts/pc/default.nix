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
      ./hardware.nix
      ../../modules/locale.nix
      ../../modules/users.nix
      ../../modules/programs.nix
      ../../modules/hardware.nix
      ../../modules/nix.nix
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
      inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
      inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-video-amdgpu
    ];

  system.stateVersion = "26.05";
}

