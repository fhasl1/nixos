{ config, inputs, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
    pulseaudio.enable = false;
    tailscale.enable = true;
    flatpak.enable = true;
    fcitx5-lotus = {
      enable = true;
      users = [ "fhasl" ];
    };
    gnome.gnome-keyring.enable = true;
    getty.autologinUser = "fhasl";
    fstrim.enable = true;
    cloudflare-warp.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      displayManager = {
        lightdm.enable = false;
        startx = {
          enable = true;
        };
      };
      windowManager = {
        bspwm.enable = true;
        bspwm.sxhkd.package = pkgs.sxhkd;
      };
    };
  };
  xdg = {
    portal = {
      enable = true;
      config = {
        common = {
          default = [ "gtk" ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
      wlr.enable = true;
    };
    mime.enable = true;
    icons.enable = true;
    menus.enable = true;
  };
}
