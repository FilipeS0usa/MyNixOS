{ config, pkgs, lib, ... }: {

  options = {
    storage-optimization.enable = lib.mkEnableOption "enables storage-optimization";
  };

  config = lib.mkIf config.storage-optimization.enable {
    nix = {
      # Turn on periodic optimisation of the nix store
      optimise = {
        automatic = true;
        dates = [ "03:00" ];
      };

      # Turn on nix store optimisation in every build. 
      # This can make the building process slower.
      # settings.auto-optimise-store = true;

      # Automatic Garbage Collecting
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d"; 
      };
    };
  };
  
}
