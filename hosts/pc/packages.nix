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
    rofi
    kitty
    nautilus
    nwg-look
    xwallpaper
    (discord.override {
      withVencord = true;
      withOpenASAR = true;
    })
    lxappearance
    scrot
    xclip

    # Zsh shits
    eza
    zoxide
    fastfetch
    fzf
    bat
    git
    gh

    # Game shits
    osu-lazer-bin
    protonup-qt

    # Shits
    wget
    curl
    pavucontrol
    psmisc
    vlc
    duf
    swayfx
    zathuraPkgs.zathura_pdf_mupdf
    zathura
    appimage-run
    onlyoffice-desktopeditors
    localsend
    mpv
  ];
  nixpkgs.config.allowUnfree = true;
}
