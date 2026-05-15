{ ... }:

{
  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  security.rtkit.enable = true;
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
