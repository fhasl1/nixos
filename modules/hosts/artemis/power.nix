{ ... }: {
  services = {
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        START_CHARGE_THRESH_BAT0 = "75";
        STOP_CHARGE_THRESH_BAT0 = "80";
        START_CHARGE_THRESH_BAT1 = "75";
        STOP_CHARGE_THRESH_BAT1 = "80";
      };
    };
    thermald.enable = true;
    thinkfan.enable = true;
  };

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchExternalPower = "suspend";
  };

  zramSwap.enable = true;
}
