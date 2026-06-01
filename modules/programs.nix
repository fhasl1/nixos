{ inputs, pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    steam.enable = true;
    gamemode.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    nh = {
      enable = true;
      flake = "/home/fhasl/nixos";
    };
    nix-ld.enable = true;
  };
}
