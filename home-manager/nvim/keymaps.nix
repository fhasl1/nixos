{...}: {
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }
    {
      mode = "n";
      key = "-";
      action = "<CMD>Oil<CR>";
      options = {desc = "Open parent directory";};
    }

    {
      mode = ["n" "x" "o"];
      key = "s";
      action.__raw = "function() require('flash').jump() end";
      options = {desc = "Flash";};
    }
    {
      mode = ["n" "x" "o"];
      key = "S";
      action.__raw = "function() require('flash').treesitter() end";
      options = {desc = "Flash Treesitter";};
    }
    {
      mode = "o";
      key = "r";
      action.__raw = "function() require('flash').remote() end";
      options = {desc = "Remote Flash";};
    }
    {
      mode = ["o" "x"];
      key = "R";
      action.__raw = "function() require('flash').treesitter_search() end";
      options = {desc = "Treesitter Search";};
    }
    {
      mode = "c";
      key = "<c-s>";
      action.__raw = "function() require('flash').toggle() end";
      options = {desc = "Toggle Flash Search";};
    }

    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = {desc = "Diagnostics";};
    }
    {
      mode = "n";
      key = "<leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options = {desc = "Buffer Diagnostics";};
    }
    {
      mode = "n";
      key = "<leader>xs";
      action = "<cmd>Trouble symbols toggle<cr>";
      options = {desc = "Symbols";};
    }
    {
      mode = "n";
      key = "<leader>xl";
      action = "<cmd>Trouble loclist toggle<cr>";
      options = {desc = "Location List";};
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = {desc = "Quickfix List";};
    }
  ];

  programs.nixvim.keymapsOnEvents.LspAttach = [
    {
      mode = "n";
      key = "K";
      action.__raw = "vim.lsp.buf.hover";
      options = {desc = "Lsp: hover";};
    }
    {
      mode = "n";
      key = "<leader>E";
      action.__raw = "vim.diagnostic.open_float";
      options = {desc = "Lsp: diagnostic";};
    }
    {
      mode = "n";
      key = "<leader>k";
      action.__raw = "vim.lsp.buf.signature_help";
      options = {desc = "Lsp: sig help";};
    }
    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = "vim.lsp.buf.rename";
      options = {desc = "Lsp: rename";};
    }
    {
      mode = "n";
      key = "<leader>ca";
      action.__raw = "vim.lsp.buf.code_action";
      options = {desc = "Lsp: code action";};
    }
    {
      mode = "n";
      key = "<leader>wf";
      action.__raw = "vim.lsp.buf.format";
      options = {desc = "Lsp: format";};
    }
    {
      mode = "v";
      key = "<leader>ca";
      action.__raw = "vim.lsp.buf.code_action";
      options = {desc = "Lsp: code_action";};
    }
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      options = {desc = "Toggle Break";};
    }
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = "function() require('dap').continue() end";
      options = {desc = "Continue";};
    }
    {
      mode = "n";
      key = "<leader>dr";
      action.__raw = "function() require('dap').repl.open() end";
      options = {desc = "Inspect";};
    }
    {
      mode = "n";
      key = "<leader>dk";
      action.__raw = "function() require('dap').terminate() end";
      options = {desc = "Kill";};
    }
    {
      mode = "n";
      key = "<leader>dso";
      action.__raw = "function() require('dap').step_over() end";
      options = {desc = "Step Over";};
    }
    {
      mode = "n";
      key = "<leader>dsi";
      action.__raw = "function() require('dap').step_into() end";
      options = {desc = "Step Into";};
    }
    {
      mode = "n";
      key = "<leader>dsu";
      action.__raw = "function() require('dap').step_out() end";
      options = {desc = "Step Out";};
    }
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = "function() require('dap').run_last() end";
      options = {desc = "Run Last";};
    }
    {
      mode = "n";
      key = "<leader>duu";
      action.__raw = "function() require('dapui').open() end";
      options = {desc = "open ui";};
    }
    {
      mode = "n";
      key = "<leader>duc";
      action.__raw = "function() require('dapui').close() end";
      options = {desc = "close ui";};
    }
  ];
}
