{...}: {
  hardware = {
    opentabletdriver.enable = true;
    uinput.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  services.udev.extraRules = ''
    SUBSYSTEM=="hidraw", ATTRS{idVendor}=="8089", ATTRS{idProduct}=="0009", MODE="0666"
  '';
  security.rtkit.enable = true;
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
