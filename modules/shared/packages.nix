{pkgs, ...}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs.nerd-fonts; [
      _0xproto
      _3270
      adwaita-mono
      agave
      anonymice
      arimo
      atkynson-mono
      aurulent-sans-mono
      bigblue-terminal
      bitstream-vera-sans-mono
      blex-mono
      caskaydia-cove
      caskaydia-mono
      code-new-roman
      comic-shanns-mono
      commit-mono
      cousine
      d2coding
      daddy-time-mono
      dejavu-sans-mono
      departure-mono
      droid-sans-mono
      envy-code-r
      fantasque-sans-mono
      fira-code
      fira-mono
      geist-mono
      go-mono
      gohufont
      hack
      hasklug
      heavy-data
      hurmit
      im-writing
      inconsolata
      inconsolata-go
      inconsolata-lgc
      intone-mono
      iosevka
      iosevka-term
      iosevka-term-slab
      jetbrains-mono
      lekton
      liberation
      lilex
      pkgs.nerd-fonts."m+"
      martian-mono
      meslo-lg
      monaspace
      monofur
      monoid
      mononoki
      noto
      open-dyslexic
      overpass
      profont
      proggy-clean-tt
      recursive-mono
      roboto-mono
      sauce-code-pro
      shure-tech-mono
      space-mono
      symbols-only
      terminess-ttf
      tinos
      ubuntu
      ubuntu-mono
      ubuntu-sans
      victor-mono
      zed-mono
      pkgs.inter
    ];
  };

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
    gnumake
    bison
    m4
     clang
     clang-tools

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
    mate-polkit

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
    localsend
    kdePackages.kdenlive
    udiskie
    libimobiledevice
    ifuse
  ];

  nixpkgs.config.allowUnfree = true;
}
