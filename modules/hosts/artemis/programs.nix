{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.noctalia.nixosModules.default
  ];
  programs = {
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    niri = {
      enable = true;
      package = pkgs.niri;
    };
    noctalia = {
      enable = true;
      systemd.enable = true;
    };
  };
}
