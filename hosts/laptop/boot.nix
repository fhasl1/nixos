{ pkgs, ... }:

{
   boot = {
      loader.grub = {
         enable = true;
         devices = [ "/dev/nvme0n1" ];
         configurationLimit = 5;
      };
   };
}
