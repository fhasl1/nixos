{ pkgs, ... }:

{
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
  programs.zsh.enable = true;
  programs.steam.enable = true;
  programs.gpu-screen-recorder = {
    enable = true;
    ui.enable = true;
  };
  programs.gamemode.enable = true;
  programs.appimage.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
}
