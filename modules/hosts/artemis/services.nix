{pkgs, ...}: {
  services = {
    libinput.enable = true;
    upower = {
      enable = true;
      package = pkgs.upower;
    };
    undervolt = {
      enable = true;
      coreOffset = -100;
      gpuOffset = -90;
      uncoreOffset = -100;
    };
    blueman.enable = true;
    fcitx5-lotus = {
      enable = true;
      users = ["fhasl"];
    };
    openssh.enable = true;
    tailscale.enable = true;
    fstrim.enable = true;
    flatpak.enable = true;

    fwupd = {
      enable = true;
      daemonSettings.DisabledPlugins = ["test" "invalid" "bios"];
    };
    journald.extraConfig = ''
      SystemMaxUse=500M
      RuntimeMaxUse=200M
    '';
  };
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };
}
