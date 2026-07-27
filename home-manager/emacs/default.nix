{pkgs, ...}: {
  xdg.configFile."emacs/init.el".source = ../config/emacs/init.el;
}
