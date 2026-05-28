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
    fstrim.enable = true;
    cloudflare-warp.enable = true;
    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu" ];
      enableTearFree = true;
      displayManager = {
        setupCommands = ''
          xrandr --output HDMI-A-0 --off
          '';
        sddm = {
          enable = true;
        };
        startx = {
          enable = true;
        };
      };
      windowManager = {
        bspwm.enable = true;
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
  fonts.fontDir.enable = true;
}
