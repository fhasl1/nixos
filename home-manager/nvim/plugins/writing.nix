{ pkgs, ... }: {
  programs.nixvim = {
    plugins = {
      render-markdown = {
        enable = true;
        settings = {
          file_types = [ "markdown" ];
          heading = {
            enabled = true;
            sizes = [ 1.8 1.5 1.3 1.1 1.0 1.0 ];
          };
          bullet = { enabled = true; };
          code = { enabled = true; };
          latex = { enabled = true; };
        };
      };

      vimtex = {
        enable = true;
        texlivePackage = pkgs.texliveSmall.withPackages (ps: [ ps.enumitem ]);
        settings = {
          view_method = "zathura";
          compiler_method = "latexmk";
          compiler_latexmk = {
            options = [
              "-xelatex"
              "-file-line-error"
              "-synctex=1"
              "-interaction=nonstopmode"
            ];
          };
        };
      };
    };

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown", "tex" },
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"
          vim.opt_local.conceallevel = 2
        end,
      })
    '';
  };
}
