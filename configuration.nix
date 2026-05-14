{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  
  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "uinput" ];
  boot.kernelParams = [ "8250.nr_uarts=0" ];
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
  systemd.services.NetworkManager-wait-online.enable = false;

  # Networking
  networking.hostName = "amalthea";
  networking.networkmanager.enable = true;
  networking.nftables.enable = true;
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [
      config.services.tailscale.port
    ];
  };

  # Localization
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      qt6Packages.fcitx5-unikey
    ];
  };
  
  # Users
  users.users.fhasl = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "input" "pipewire" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };
  
  # Programs
  environment.systemPackages = with pkgs; [
    # Neovim shits
    neovim
    lua51Packages.luarocks
    lua51Packages.lua
    unzip
    elmPackages.nodejs
    nodejs
    php
    graalvmPackages.graalvm-ce
    python313
    python313Packages.pip
    ruby
    go
    php82Packages.composer
    cargo
    julia
    tree-sitter

    # Hyprland shits
    waybar
    rofi
    awww
    kitty
    vesktop
    
    # Zsh shits
    eza
    zoxide
    fastfetch
    fzf
    bat
    git
    gh

    # Game shits
    gamemode

    # Shits
    wget
    curl
    pavucontrol
    psmisc
  ];
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.zsh = {
    enable = true;
  };
  programs.steam = {
    enable = true;
  };

  # Services
  services.openssh.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  services.tailscale.enable = true;
  services.pulseaudio.enable = false;
 
  # Misc
  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  security.rtkit.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
  
  # NixOS shits
  system.stateVersion = "25.11";
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.optimise = {
    automatic = true;
    dates = [ "weekly" ];
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];
}

