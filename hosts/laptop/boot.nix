{ pkgs, ... }:

{
   boot = {
      loader.grub = {
         enable = true;
         devices = [ "/dev/nvme0n1" ];
         configurationLimit = 5;
      };
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [ "psmouse.synaptics_intertouch=1" ];
   };
}
