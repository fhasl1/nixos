{ pkgs, ... }:

{
  services.openssh.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  services.pulseaudio.enable = false;
  services.tailscale.enable = true;
  services.flatpak.enable = true;
  services.fcitx5-lotus = {
    enable = true;
    users = [ "fhasl" ];
  };
  services.gnome.gnome-keyring.enable = true;
  services.getty.autologinUser = "fhasl";
  services.fstrim.enable = true;
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
