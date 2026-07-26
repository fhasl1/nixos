{ ... }: {
  imports = [
    ./cmp.nix
    ./conform.nix
    ./flash.nix
    ./lint.nix
    ./dap.nix
    ./misc.nix
    ./opencode.nix
    ./treesitter.nix
    ./ui.nix
    ./writing.nix
  ];
}
