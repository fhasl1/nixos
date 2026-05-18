{ pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    zsh.enable = true;
    steam.enable = true;
    gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
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
