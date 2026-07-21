{
  pkgs,
  config,
  ...
}: {
  services = {
    emacs = {
      enable = true;
      package = pkgs.emacs;
      startWithGraphical = config.services.xserver.enable;
      install = false;
    };
  };
  environment.systemPackages = with pkgs; [
    nil
  ];
}
