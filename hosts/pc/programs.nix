{pkgs, ...}: {
  programs = {
    mangowc = {
      enable = false;
      package = pkgs.mangowc;
    };
  };
}
