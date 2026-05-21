{ lib, inputs, ... }:

{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [ "lantian:EeAUQ+W+6r8EtwnmYjeVwx5kOGEBpjlzGlTNvHc=" ];
    };
  };
}
