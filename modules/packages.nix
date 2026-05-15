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

    # Hyprland shits
    waybar
    rofi
    awww
    kitty
    vesktop
    nautilus
    hyprpicker
    hyprshot
    
    # Zsh shits
    eza
    zoxide
    fastfetch
    fzf
    bat
    git
    gh

    # Game shits
    gpu-screen-recorder-gtk
    osu-lazer-bin

    # Shits
    wget
    curl
    pavucontrol
    psmisc
    vlc
    duf
  ];
}
