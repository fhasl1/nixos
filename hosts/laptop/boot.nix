{ pkgs, ... }:

{
   boot = {
      loader.grub = {
         enable = true;
         devices = [ "/dev/nvme0n1" ];
         configurationLimit = 5;
      };
<<<<<<< HEAD
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [ "psmouse.synaptis_intertouch=1" ];
=======
>>>>>>> 26c3871 (nixos: update 2026-05-20_17-37-34)
   };
}
