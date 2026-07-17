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

    # Shits
    zathuraPkgs.zathura_pdf_mupdf
    zathura
    onlyoffice-desktopeditors
    localsend
    ffmpeg-full

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
}
