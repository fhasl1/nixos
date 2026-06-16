{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Dev tools
    lua51Packages.luarocks
    lua51Packages.lua
    unzip
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
    gcc
    clang

    # WM shits
    rofi
    kitty
    nautilus
    nwg-look
    xwallpaper
    awww
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
    davinci-resolve
    ffmpeg-full
    handbrake
  ];
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };
  nixpkgs.config.allowUnfree = true;
}
