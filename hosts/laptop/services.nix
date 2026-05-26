{ pkgs, ... }:

{
   services = {
      libinput.enable = true;
      undervolt = {
         enable = true;
         coreOffset = -100;
         gpuOffset = -90;
         uncoreOffset = -100;
      };
      blueman.enable = true;
      fcitx5-lotus = {
         enable = true;
         user = "fhasl";
      };
      dbus.enable = true;
      openssh.enable = true;
      tailscale.enable = true;
      fstrim.enable = true;
      flatpak.enable = true;
      fwupd = {
         enable = true;
         daemonSettings.DisabledPlugins = [ "test" "invalid" "bios" ];
      };
      journald.extraConfig = ''
         SystemMaxUse=500M
         RuntimeMaxUse=200M
      '';
   };
}
