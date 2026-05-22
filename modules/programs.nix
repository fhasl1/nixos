{ inputs, pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    zsh.enable = true;
    steam.enable = true;
    gamemode.enable = true;
    gpu-screen-recorder = {
      enable = true;
      package = inputs.gsr-ui-nix.packages.${pkgs.stdenv.hostPlatform.system}.gpu-screen-recorder;
      ui.enable = true;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    nix-ld.enable = true;
  };
}
