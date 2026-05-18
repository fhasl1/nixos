{ pkgs, lib, ... }:

{
  vim = {
    languages = {
      bash.enable = true;
      css.enable = true;
      nix.enable = true;
      clang.enable = true;
      html.enable = true;
      lua.enable = true;
    };
    statusline.lualine = {
      enable = true;
      theme = "pywal";
    };
    autocomplete.nvim-cmp.enable = true;
    opts = {
      smartindent = true;
      autoindent = true;
      shiftwidth = 3;
      tabstop = 3;
      softtabstop = 3;
      winborder = "rounded";
      expandtab = true;
      number = true;
      relavtivenumber = true;
      cursorline = true;
      scrolloff = 8;
      showcmd = true;
      wrap = true;
      linebreak = true;
      swapfile = false;
      backup = false;
      clipboard = "unnamedplus";
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
      showmode = false;
    };
  };
}
