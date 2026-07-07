{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.dmenu.overrideAttrs (_: {
      src = ../../../home-manager/config/dmenu;
      patches = [];
    }))
  ];
}
