{
  pkgs,
  config,
  ...
}: {
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs;
      install = false;
    };
  };
  environment.systemPackages =
    (with pkgs; [emacs-all-the-icons-fonts nil])
    ++ (with pkgs.emacsPackages; [
      all-the-icons
      company
      company-box
      consult
      counsel
      dap-mode
      doom-modeline
      doom-themes
      evil
      flycheck
      helm
      ivy
      ivy-rich
      lsp-mode
      lsp-treemacs
      lsp-ui
      lsp-ivy
      marginalia
      nerd-icons
      nerd-icons-dired
      posframe
      rainbow-delimiters
      smartparens
      treemacs
      use-package
      which-key
      which-key-posframe
      writegood-mode
      yaml-mode
      json-mode
      toml-mode
      dockerfile-mode
      lua-mode
      rustic
      typescript-mode
      web-mode
      markdown-mode
      nix-mode
      auctex
      helm-lsp
      consult
      consult-lsp
      corfu
      cape
      orderless
      vertico
      embark
    tao-theme
    ]);
}
