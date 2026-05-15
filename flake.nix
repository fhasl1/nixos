{
	description = "Hyprland";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		 fcitx5-lotus = {
			 url = "github:LotusInputMethod/fcitx5-lotus";
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
