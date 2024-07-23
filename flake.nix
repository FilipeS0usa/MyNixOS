{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # Stylix for styling my OS collors
    stylix.url = "github:danth/stylix";

    # Firefox for firefox personalize
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nixvim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    secrets = builtins.fromJSON (builtins.readFile "${self}/secrets/secrets.json");
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      main = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; inherit secrets; };
        modules = [
          ./hosts/main/configuration.nix
          ./modules/nixos
          inputs.stylix.nixosModules.stylix
          inputs.nixvim.nixosModules.nixvim
        ];
      };
      b3rrypi = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/b3rrypi/configuration.nix
          ./nixosModules
        ];
      };
      hyprland = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hyprland/configuration.nix
          ./nixosModules
        ];
      };
    };
    homeConfigurations = {
      b3rrypi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home.nix
          inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
  };
}
