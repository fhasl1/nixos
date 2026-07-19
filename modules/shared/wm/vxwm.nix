{ pkgs, inputs, ... }:
let
  vxwm = pkgs.stdenv.mkDerivation rec {
    pname = "vxwm";
    version = "2.3";

    src = inputs.vxwm;

    nativeBuildInputs = with pkgs; [ pkg-config gnumake ];
    buildInputs = with pkgs; [ libX11 libXinerama libXft fontconfig freetype ];

    makeFlags = [
      "PREFIX=$(out)"
      "MANPREFIX=$(out)/share/man"
      "X11INC=${pkgs.libX11.dev}/include"
      "X11LIB=${pkgs.libX11}/lib"
      "FREETYPEINC=${pkgs.freetype.dev}/include/freetype2"
      "CC=${pkgs.stdenv.cc}/bin/cc"
    ];

    installFlags = [ "DESTDIR=" ];
  };
in {
  environment.systemPackages = [ vxwm ];
}