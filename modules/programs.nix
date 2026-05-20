{ pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    steam.enable = true;
    gpu-screen-recorder = {
      enable = true;
    };
    gamemode.enable = true;
    appimage.enable = true;
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    nix-ld.enable = true;
  };
}
