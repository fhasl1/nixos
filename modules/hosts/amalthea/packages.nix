{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python313Packages.pip
    xwallpaper
    lxappearance
    scrot
    xclip
    git
    gh

    # Game shits
    osu-lazer-bin
    protonup-qt

    # Shits
    zathuraPkgs.zathura_pdf_mupdf
    zathura
    onlyoffice-desktopeditors
    localsend
    davinci-resolve
    ffmpeg-full
    handbrake
  ];

}
