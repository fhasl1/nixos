{ ... }: {
  programs.nixvim.autoCmd = [
    {
      event = [ "BufWritePost" "BufEnter" "InsertLeave" ];
      callback.__raw = ''
        function()
          require("lint").try_lint()
        end
      '';
    }
    {
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      callback.__raw = ''
        function()
          vim.hl.on_yank()
        end
      '';
    }
    {
      event = "BufWritePre";
      desc = "Format before save";
      pattern = "*";
      callback.__raw = ''
        function(ev)
          local conform_opts = { bufnr = ev.buf, lsp_format = "fallback", timeout_ms = 2000 }
          local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = ev.buf })[1]
          if not client then
            require("conform").format(conform_opts)
            return
          end
          local request_result = client:request_sync("workspace/executeCommand", {
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(ev.buf) },
          })
          if request_result and request_result.err then
            vim.notify(request_result.err.message, vim.log.levels.ERROR)
            return
          end
          require("conform").format(conform_opts)
        end
      '';
    }
  ];
}
