{ pkgs, ... }:

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
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
