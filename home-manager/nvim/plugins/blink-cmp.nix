{...}: {
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        "<C-b>" = ["scroll_documentation_up" "fallback"];
        "<C-f>" = ["scroll_documentation_down" "fallback"];
        "<C-Space>" = ["show" "fallback"];
        "<C-e>" = ["hide" "fallback"];
        "<CR>" = ["accept" "fallback"];
      };
      appearance = {
        use_nvim_cmp_as_default = false;
        nerd_font_variant = "mono";
      };
      sources = {
        default = ["lsp" "path" "snippets" "buffer"];
      };
      completion = {
        documentation = {auto_show = true;};
      };
      cmdline = {
        keymap = {
          "<Tab>" = ["show" "accept"];
          "<CR>" = ["accept_and_enter" "fallback"];
        };
        completion = {
          menu = {
            auto_show.__raw = "function(ctx) return vim.fn.getcmdtype() == ':' end";
          };
        };
      };
    };
  };
}
