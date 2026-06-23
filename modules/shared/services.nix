{config, pkgs, ...}: {
  services.cloudflare-warp = {
    enable = true;
    package = pkgs.cloudflare-warp;
  };

  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
