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
    appimage = {
      enable = true;
      binfmt = true;
    };
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    nix-ld.enable = true;
  };
}
