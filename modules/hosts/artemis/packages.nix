{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    neovim
    tree-sitter
    waybar
    hyprpicker
    hyprshot
    wl-clipboard
    brightnessctl
    autotiling
    btop
    easyeffects
    obsidian
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
