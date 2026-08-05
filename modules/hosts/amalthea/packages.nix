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
    protonup-qt
    osu-lazer-bin

    # Shits
    zathuraPkgs.zathura_pdf_mupdf
    zathura
    onlyoffice-desktopeditors
    localsend
    ffmpeg-full
    kdePackages.ark
    winboat
    codex

    # ROCm packages
    rocmPackages.rocm-smi
    rocmPackages.rocminfo
    rocmPackages.clr
    rocmPackages.migraphx
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
}
