{ config, pkgs, lib, ... }: {
  
  options = {
    bash.enable = lib.mkEnableOption "enables bash";
  };

  config = lib.mkIf config.bash.enable {
    programs.bash= {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        eval "$(starship init bash)"
      '';
    };
  };
}
