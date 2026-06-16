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
  };

  outputs = inputs @ {
    nixpkgs,
    nixos-hardware,
    nix-cachyos-kernel,
    home-manager,
    nixvim,
    ...
  }: let
    # Recursively collect all .nix files (except default.nix) from a directory
    collectModules = dir: let
      entries = builtins.readDir dir;
      nixFiles =
        builtins.filter
        (n: builtins.match ".*\\.nix" n != null && n != "default.nix")
        (builtins.attrNames entries);
      subdirs =
        builtins.filter
        (n: entries.${n} == "directory")
        (builtins.attrNames entries);
    in
      (map (f: dir + "/${f}") nixFiles)
      ++ builtins.concatMap (d: collectModules (dir + "/${d}")) subdirs;

    sharedModules = collectModules ./modules;
  in {
    nixosConfigurations = {
      amalthea = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules =
          sharedModules
          ++ [
            ({pkgs, ...}: {
              nixpkgs.overlays = [nix-cachyos-kernel.overlays.default];
            })
            ./hosts/pc
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
          ];
      };
      artemis = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules =
          sharedModules
          ++ [
            ./hosts/laptop
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
          ];
      };
    };
  };
}
