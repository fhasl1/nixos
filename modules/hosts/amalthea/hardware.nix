{ ... }:

{
  hardware = {
    opentabletdriver.enable = true;
    uinput.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  security.rtkit.enable = true;
  environment.variables = {
    RUSTICL_ENABLE = "radeonsi";
  };
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
