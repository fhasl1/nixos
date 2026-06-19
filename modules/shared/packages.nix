{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    opencode

    # Dev tools
    lua51Packages.luarocks
    lua51Packages.lua
    unzip
    nodejs
    php
    graalvmPackages.graalvm-ce
    python313
    ruby
    go
    php82Packages.composer
    cargo
    julia
    gcc
    clang

    # WM tools
    rofi
    kitty
    nautilus
    awww
    nwg-look
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })

    # Zsh tools
    eza
    zoxide
    fastfetch
    fzf
    bat

    # General
    wget
    curl
    pavucontrol
    psmisc
    vlc
    duf
    swayfx
    appimage-run
    mpv
  ];

  nixpkgs.config.allowUnfree = true;
}
