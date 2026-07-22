{pkgs, ...}: {
  services = {
    cloudflare-warp = {
      enable = true;
      package = pkgs.cloudflare-warp;
    };
    gvfs = {
      enable = true;
      package = pkgs.gnome.gvfs;
    };
    usbmuxd.enable = true;
  };
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
