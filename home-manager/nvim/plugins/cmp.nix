{...}: {
  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      snippet = {
        expand = "luasnip";
      };
      mapping = {
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<Tab>" = "cmp.mapping.select_next_item()";
        "<S-Tab>" = "cmp.mapping.select_prev_item()";
      };
      sources = [
        {name = "nvim_lsp"; priority = 1000;}
        {name = "luasnip"; priority = 750;}
        {name = "buffer"; priority = 500; keyword_length = 3;}
        {name = "path"; priority = 250;}
      ];
      completion = {
        completeopt = "menu,menuone,noselect";
        keyword_length = 1;
      };
      experimental = {
        ghost_text = false;
      };
    };
  };
}