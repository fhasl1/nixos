{...}: {
  programs.nixvim = {
    opts = {
      splitright = true;
      splitbelow = true;
      signcolumn = "yes";
      timeoutlen = 300;
      updatetime = 50;

      smartindent = true;
      autoindent = true;
      shiftwidth = 3;
      tabstop = 3;
      softtabstop = 3;
      winborder = "rounded";
      expandtab = true;

      number = true;
      relativenumber = true;
      cursorline = true;
      scrolloff = 8;
      showcmd = true;
      wrap = false;
      linebreak = true;

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
      completeopt = "menu,menuone,noselect";
    };
  };
}
