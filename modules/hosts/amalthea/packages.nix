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

    # Custom WM
    (stdenv.mkDerivation rec {
      name = "sxwm-1.8";
      src = ../../../home-manager/config/sxwm;
      nativeBuildInputs = [makeWrapper];
      buildInputs = [libX11 libXinerama libXcursor];
      makeFlags = ["PREFIX=$(out)"];
      installFlags = ["PREFIX=$(out)" "DESTDIR="];
      postInstall = ''
                mkdir -p $out/share/xsessions
                cat > $out/share/xsessions/sxwm.desktop <<EOF
        [Desktop Entry]
        Name=sxwm
        Comment=A simple X window manager
        Exec=sxwm
        TryExec=sxwm
        Type=Application
        DesktopNames=sxwm
        EOF
      '';
    })
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-40.10.5"
  ];
}
