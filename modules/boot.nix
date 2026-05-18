{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      timeout = 1;

      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
    };
    kernelPackages = pkgs.linuxPackages_latest;

    initrd.kernelModules = [
      "uinput"
      "amdgpu"
    ];

    kernelParams = [
      "8250.nr_uarts=0"
    ];
    initrd.systemd.network.wait-online.enable = false;
  };

  systemd.network.wait-online.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
}
