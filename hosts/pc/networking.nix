{ config, ... }:

{
  networking = {
    hostName = "amalthea";
    networkmanager = {
      enable = true;
    };
    nftables.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [80 443];
      allowedUDPPortRanges = [
        { from = 4000; to = 4007; }
        { from = 8000; to = 8010; }
      ];
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };
  };
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
