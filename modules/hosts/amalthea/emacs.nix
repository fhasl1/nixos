{
  pkgs,
  config,
  ...
}: {
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs;
      startWithGraphical = config.services.xserver.enable;
      install = false;
    };
  };
  environment.systemPackages = (with pkgs; [ emacs-all-the-icons-fonts ]) ++ (with pkgs.emacsPackages; [
    all-the-icons
    company
    company-box
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
    nerd-icons-ivy-rich
    posframe
    rainbow-delimiters
    smartparens
    treemacs
    use-package
    which-key
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
  ]);
}