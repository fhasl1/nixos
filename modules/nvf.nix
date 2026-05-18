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
  };
  statusline.lualine = {
    enable = true;
    theme = "pywal";
  };
  autocomplete.nvim-cmp.enable = true;
  };
}
