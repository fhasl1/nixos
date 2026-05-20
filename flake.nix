{
	description = "Main flakes";

	inputs = {
		nixpkgs = {
			url = "github:NixOS/nixpkgs/nixos-unstable";
		};
		fcitx5-lotus = {
			url = "github:justanoobcoder/fcitx5-lotus/fix-extra-cmake-modules";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		gsr-ui-nix = {
			url = "github:rPlakama/gsr-ui-nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixos-hardware = {
			url = "github:NixOS/nixos-hardware";
		};
	};
	outputs = inputs@{ self, nixpkgs, nixos-hardware, gsr-ui-nix, ... }: {
                nixosConfigurations = {
			amalthea = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = {
					inherit inputs;
				};
				modules = [
					./hosts/pc/default.nix
				];
			};
			artemis = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = {
					inherit inputs;
				};
				modules = [
					./hosts/laptop/default.nix
					nixos-hardware.nixosModules.lenovo-thinkpad-t480
					inputs.fcitx5-lotus.nixosModules.fcitx5-lotus
				];
			};
		};
	};
}
