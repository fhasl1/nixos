{...}: {
  security = {
    sudo = {
      enable = false;
    };
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
      extraConfig = ''
        Defaults env_keep += SUDO_PROMPT
      '';
    };
  };
}
