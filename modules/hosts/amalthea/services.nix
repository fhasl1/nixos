{pkgs, ...}: {
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
      users = ["fhasl"];
    };
    gnome.gnome-keyring.enable = true;
    fstrim.enable = true;
    displayManager = {
      sddm = {
        thyx.enable = true;
        wayland.enable = false;
      };
    };
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      enableTearFree = true;
      autoRepeatDelay = 300;
      autoRepeatInterval = 35;
      windowManager = {
        openbox.enable = true;
        dwm = {
          enable = true;
          package = pkgs.dwm.overrideAttrs {
            src = ../../../home-manager/config/dwm;
          };
        };
      };
    };
  };
  systemd.user.services = {
    pipewire = {
      serviceConfig = {
        ExecStartPre = "-${pkgs.coreutils}/bin/rm -f %t/pipewire-0.lock";
        RestartSec = "3s";
        StartLimitBurst = 10;
      };
    };
    pipewire-pulse = {
      serviceConfig = {
        ExecStartPre = "-${pkgs.coreutils}/bin/rm -f %t/pipewire-pulse-0.lock";
        RestartSec = "3s";
        StartLimitBurst = 10;
      };
    };
    wireplumber = {
      serviceConfig = {
        RestartSec = "3s";
        StartLimitBurst = 10;
      };
    };
  };
  xdg = {
    portal = {
      enable = true;
      config = {
        common = {
          default = ["gtk"];
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
