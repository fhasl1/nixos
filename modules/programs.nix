{
  inputs,
  pkgs,
  ...
}: {
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    gpu-screen-recorder = {
      enable = true;
      package = inputs.gsr-ui-nix.packages.${pkgs.stdenv.hostPlatform.system}.gpu-screen-recorder;
      ui.enable = true;
    };
    steam.enable = true;
    gamemode.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
    nh = {
      enable = true;
      flake = "/home/fhasl/nixos";
    };
    nix-ld.enable = true;
  };
}
