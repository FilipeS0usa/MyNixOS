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

    # ZenBrowser
    # zen-browser.url = "github:MarceColl/zen-browser-flake";

    # Stylix for styling my OS collors
    # stylix.url = "github:danth/stylix";

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

  outputs = { nixpkgs, home-manager, ... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      main = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/main/configuration.nix
          ./modules/nixos
        ];
      };
      b3rrypi = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/b3rrypi/configuration.nix
          ./modules/nixos
        ];
      };
      hyprland = lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hyprland/configuration.nix
          ./modules/nixos
        ];
      };
    };
    homeConfigurations = {
      hyprland = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home_hyprland.nix
          #inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
      b3rrypi = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	    extraSpecialArgs = { inherit inputs; };
        modules = [ 
          ./home.nix
          #inputs.stylix.homeManagerModules.stylix
          inputs.nixvim.homeManagerModules.nixvim
        ];
      };
    };
  };
}
