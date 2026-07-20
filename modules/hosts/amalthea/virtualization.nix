{
  pkgs,
  config,
  ...
}: {
  programs = {
    virt-manager = {
      enable = true;
      package = pkgs.virt-manager;
    };
  };
  virtualisation = {
    libvirtd = {
      enable = true;
    };
    waydroid = {
      enable = true;
      package =
        if config.networking.nftables.enable
        then pkgs.waydroid-nftables
        else pkgs.waydroid;
    };
    spiceUSBRedirection.enable = true;
  };
  users.groups.libvirtd.members = ["fhasl"];
  boot = {
    kernelModules = ["tun" "vhost_net"];
    kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
    };
  };
  networking = {
    nat = {
      enable = true;
      externalInterface = "enp6s0";
      internalInterfaces = ["virbr0"];
    };
    firewall = {
      enable = true;
      trustedInterfaces = ["virbr0"];
    };
  };
}
