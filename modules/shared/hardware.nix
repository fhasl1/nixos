{...}: {
  hardware = {
    opentabletdriver.enable = true;
    uinput.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  security.rtkit.enable = true;
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
