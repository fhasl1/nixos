{ ... }: {
  programs.nixvim.plugins = {
    trouble.enable = true;
    which-key.enable = true;
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = { text = "+"; };
          change = { text = "~"; };
          delete = { text = "_"; };
          topdelete = { text = "‾"; };
          changedelete = { text = "~"; };
        };
        current_line_blame = true;
        current_line_blame_opts = {
          virt_text = true;
          virt_text_pos = "eol";
          delay = 500;
        };
      };
    };
  };
}
