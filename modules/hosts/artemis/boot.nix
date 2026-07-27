{pkgs, ...}: {
  boot = {
    loader = {
      grub = {
        enable = true;
        devices = ["/dev/nvme0n1"];
        configurationLimit = 5;
        gfxmodeBios = "1920x1080x32";
      };
      timeout = 0;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = ["thinkpad_acpi"];
    kernelParams = ["psmouse.synaptics_intertouch=1" "iomem=relaxed"];
    extraModprobeConfig = "options psmouse synaptics_intertouch=1";
  };
}
