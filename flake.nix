{
	description = "Hyprland";

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
	};
	outputs = inputs@{ self, nixpkgs, ... }: {
                nixosConfigurations.amalthea = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = {
				inherit inputs;
			};
			modules = [
				./configuration.nix
			];
		};
	};

}
