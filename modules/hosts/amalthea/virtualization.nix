{pkgs, ...}: {
  programs = {
    virt-manager = {
      enable = true;
      package = pkgs.virt-manager;
    };
  };
  virtualisation = {
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
  users.groups.libvirtd.members = ["fhasl"];
}
