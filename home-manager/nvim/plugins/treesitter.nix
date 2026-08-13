{ ... }: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      ensure_installed = [
        "markdown"
        "markdown_inline"
        "latex"
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
        "sql"
      ];
      auto_install = true;
      highlight = { enable = true; };
      indent = { enable = true; };
    };
  };
}
