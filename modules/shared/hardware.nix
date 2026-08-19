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
    SUBSYSTEM=="usb", ATTR{idVendor}=="8089", ATTR{idProduct}=="0009", MODE="0660", GROUP="input", TAG+="uaccess"
  '';
  security.rtkit.enable = true;
  zramSwap = {
    enable = true;
    memoryPercent = 50;
  };
}
