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
  systemd.user.services.startpage-server = {
    description = "Startpage HTTP Server";
    wantedBy = ["default.target"];
    serviceConfig = {
      WorkingDirectory = "/home/fhasl/nixos/home-manager/config";
      ExecStart = "${pkgs.python3}/bin/python3 -m http.server 8000";
      Restart = "always";
    };
  };
  systemd.user.services.omniroute = {
    description = "OmniRoute AI Gateway";
    after = ["network.target"];
    wantedBy = ["default.target"];
    serviceConfig = {
      ExecStart = "%h/.npm-global/bin/omniroute";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
