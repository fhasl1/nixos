{...}: {
  programs.nixvim = {
    opts = {
      splitright = true;
      splitbelow = true;
      signcolumn = "yes";

      smartindent = true;
      autoindent = true;
      shiftwidth = 3;
      tabstop = 3;
      softtabstop = 3;
      winborder = "single";
      expandtab = true;

      number = true;
      relativenumber = true;
      cursorline = true;
      scrolloff = 8;
      showcmd = true;
      wrap = false;
      linebreak = true;

      hidden = true;
      swapfile = false;
      backup = false;
      clipboard = "unnamedplus";

      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      termguicolors = true;
      undofile = true;

      showmode = false;
      completeopt = "nosort,fuzzy,menuone,noselect";
      cmdheight = 0;
      guicursor = "";
    };
  };
}
