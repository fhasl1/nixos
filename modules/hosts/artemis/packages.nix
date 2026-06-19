{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    tree-sitter
    waybar
    hyprpicker
    hyprshot
    wl-clipboard
    autotiling
    btop
    easyeffects
    obsidian
  ];
}
