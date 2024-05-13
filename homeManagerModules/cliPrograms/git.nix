{ config, pkgs, lib, ... }: {
  
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "FilipeS0usa";
      userEmail = "pipaosilva18@gmail.com";
      extraConfig = {
        core.editor = "nvim";
      };
    };
  };
}
