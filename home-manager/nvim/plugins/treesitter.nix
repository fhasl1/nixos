{ ... }: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      ensure_installed = [
        "lua"
        "vim"
        "vimdoc"
        "c"
        "cpp"
        "bash"
        "python"
        "nix"
        "html"
        "css"
        "json"
      ];
      auto_install = true;
      highlight = { enable = true; };
      indent = { enable = true; };
    };
  };
}
