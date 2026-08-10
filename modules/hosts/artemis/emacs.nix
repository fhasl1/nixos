{pkgs, ...}: {
  services.emacs = {
    enable = true;
    package = pkgs.emacs;
    install = false;
    startWithGraphical = true;
  };

  environment.systemPackages =
    (with pkgs; [emacs-all-the-icons-fonts nil texlive.bin.dvipng])
    ++ (with pkgs.emacsPackages; [
      all-the-icons
      consult
      counsel
      doom-modeline
      doom-themes
      embark
      evil
      evil-leader
      flycheck
      flycheck-posframe
      git-gutter
      json-mode
      ligature
      lsp-mode
      lsp-treemacs
      lua-mode
      marginalia
      markdown-mode
      nerd-icons
      nerd-icons-dired
      nix-mode
      orderless
      posframe
      projectile
      rainbow-delimiters
      smartparens
      tao-theme
      toml-mode
      treemacs
      typescript-mode
      undo-tree
      use-package
      vertico
      web-mode
      which-key
      which-key-posframe
      yaml-mode
    ]);
}
