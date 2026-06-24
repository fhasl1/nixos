{...}: {
  security = {
    sudo = {
      enable = true;
      execWheelOnly = true;
      wheelNeedsPassword = true;
      extraConfig = ''
        Defaults passprompt="\e[1;35m[%u]\e[0m password: "
      '';
    };
  };
}
