{ pkgs, ... }:

{
  users.users.fhasl = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "video"
      "input"
      "pipewire"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };
}
