{
  pkgs,
  config,
  ...
}: {
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
    cloudflare-warp.enable = true;
    displayManager = {
      ly.enable = true;
    };
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
      enableTearFree = true;
      windowManager = {
        openbox.enable = true;
        berry.enable = true;
      };
    };
  };
  systemd.user.services = {
    pipewire = {
      serviceConfig = {
        ExecStartPre = "${pkgs.coreutils}/bin/rm -f /run/user/${toString config.users.users.fhasl.uid}/pipewire-0.lock /run/user/${toString config.users.users.fhasl.uid}/pipewire-0";
        RestartSec = "3s";
        StartLimitBurst = 10;
      };
    };
    pipewire-pulse = {
      serviceConfig = {
        ExecStartPre = "${pkgs.coreutils}/bin/rm -f /run/user/${toString config.users.users.fhasl.uid}/pipewire-pulse-0.lock /run/user/${toString config.users.users.fhasl.uid}/pipewire-pulse-0";
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
