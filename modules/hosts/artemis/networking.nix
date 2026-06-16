{ config, ... }:

{
  networking = {
      hostName = "artemis";
      wireless.iwd = {
         enable = true;
         settings = {
            Settings = {
               AutoConnect = true;
            };
         };
      };
      nftables.enable = true;
      firewall = {
         enable = true;
         trustedInterfaces = [ "tailscale0" ];
         allowedUDPPorts = [ config.services.tailscale.port ];
      };
  };
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
