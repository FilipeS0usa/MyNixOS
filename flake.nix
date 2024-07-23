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

  outputs = { nixpkgs, self, ... }@inputs:
  let
    secrets = builtins.fromJSON (builtins.readFile "${self}/secrets/secrets.json");
  in
  {
    nixosConfigurations = {
      main = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; inherit secrets; };
        modules = [
          ./hosts/main/configuration.nix
          ./modules/nixos
          inputs.home-manager.nixosModules.default
          inputs.stylix.nixosModules.stylix
          inputs.nixvim.nixosModules.nixvim
        ];
      };
      b3rrypi = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/b3rrypi/configuration.nix
          ./nixosModules
          inputs.home-manager.nixosModules.default
        ];
      };
      hyprland = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hyprland/configuration.nix
          ./nixosModules
          inputs.home-manager.nixosModules.default
        ];
      };
    };
  };
}
