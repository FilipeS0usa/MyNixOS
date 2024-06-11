{ config, pkgs, lib, ... }: {
  
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "FilipeS0usa";
      userEmail = "77252969+FilipeS0usa@users.noreply.github.com";
      extraConfig = {
        core.editor = "nvim";
      };
      lfs.enable = true;
    };
  };
}
