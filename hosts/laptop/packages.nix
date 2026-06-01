{ pkgs, ... }:

{
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
    nixd
    shellcheck
    statix
    clang-tools

    # WM shits
    waybar
    rofi
    awww
    kitty
    nautilus
    hyprpicker
    hyprshot
    wl-clipboard
    autotiling
    nwg-look
    btop
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    
    # Zsh shits
    eza
    zoxide
    fastfetch
    fzf
    bat
    git
    gh

    # Shits
    wget
    curl
    pavucontrol
    psmisc
    vlc
    duf
    swayfx
    easyeffects
    appimage-run
    obsidian
    mpv
  ];
  nixpkgs.config.allowUnfree = true;
}
