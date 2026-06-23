{
  description = "Main flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fcitx5-lotus = {
      url = "github:LotusInputMethod/fcitx5-lotus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gsr-ui-nix = {
      url = "github:rPlakama/gsr-ui-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    xlibre-overlay.url = "git+https://codeberg.org/takagemacoed/xlibre-overlay?ref=dev-for-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    thyx.url = "github:rccyx/thyx";
  };

  outputs = inputs @ {
    nixpkgs,
    nixos-hardware,
    nix-cachyos-kernel,
    home-manager,
    thyx,
    ...
  }: let
    # Recursively collect all .nix files (except default.nix) from a directory
    collectModules = dir: let
      entries = builtins.readDir dir;
      nixFiles = builtins.sort builtins.lessThan (builtins.filter
        (n: builtins.match ".*\\.nix" n != null && n != "default.nix")
        (builtins.attrNames entries));
      subdirs =
        builtins.filter
        (n: entries.${n} == "directory")
        (builtins.attrNames entries);
    in
      (map (f: dir + "/${f}") nixFiles)
      ++ builtins.concatMap (d: collectModules (dir + "/${d}")) subdirs;

    sharedModules = collectModules ./modules/shared ++ [
      inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
    ];
    amaltheaModules = collectModules ./modules/hosts/amalthea;
    artemisModules = collectModules ./modules/hosts/artemis;
  in {
    nixosConfigurations = {
      amalthea = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules =
          sharedModules
          ++ amaltheaModules
          ++ [
            inputs.gsr-ui-nix.nixosModules.default
            thyx.nixosModules.default
            ({...}: {
              nixpkgs.overlays = [nix-cachyos-kernel.overlays.pinned];
            })
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.fhasl = {
                  imports = [
                    inputs.nixvim.homeModules.nixvim
                    ./home-manager/home.nix
                  ];
                };
                backupFileExtension = "backup";
              };
            }
            inputs.xlibre-overlay.nixosModules.overlay-xlibre-xserver
            inputs.xlibre-overlay.nixosModules.overlay-xlibre-xf86-video-amdgpu
            {system.stateVersion = "26.11";}
          ];
      };
      artemis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules =
          sharedModules
          ++ artemisModules
          ++ [
            inputs.gsr-ui-nix.nixosModules.default
            nixos-hardware.nixosModules.lenovo-thinkpad-t480
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.fhasl = {
                  imports = [
                    inputs.nixvim.homeModules.nixvim
                    ./home-manager/home.nix
                  ];
                };
                backupFileExtension = "backup";
              };
            }
            {system.stateVersion = "26.11";}
          ];
      };
    };
  };
}
