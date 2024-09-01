{ config, pkgs, lib, ... }: {
  
  options = {
    git.enable = lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "FilipeS0usa";
      userEmail = "filipes0usa.git@proton.me";
      extraConfig = {
        core.editor = "nvim";
      };
      lfs.enable = true;
    };
  };
}
