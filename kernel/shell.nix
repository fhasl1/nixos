{pkgs ? import <nixpkgs> {}, ...}: let
  pkgset = pkgs.linuxPackages_latest;
in
  pkgs.mkShell {
    nativeBuildInputs = with pkgs; [gcc binutils bc elfutils openssl kmod xz pkg-config flex bison];
    KERNEL_SRC = pkgset.kernel.src;
    shellHook = ''
      echo "Kernel version: ${pkgset.kernel.version}"
      ls linux-*/ 2>/dev/null || tar xf "$KERNEL_SRC"
    '';
  }
