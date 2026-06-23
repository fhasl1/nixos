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

}
