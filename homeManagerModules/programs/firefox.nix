{ config, pkgs, lib, ... }: {
  
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox= {
      enable = true;
      package = pkgs.firefox;
      profiles = {
        b3rrypi = {
          name = "b3rrypi";
          search = {
            default = "DuckDuckGo";
            privateDefault = "DuckDuckGo";
            force = true; 
          };
          settings = {
            "browser.startup.homepage" = "https://duckduckgo.com/";
            "browser.search.region" = "PT";
            "browser.search.isUS" = false;
            "distribution.searchplugins.defaultLocale" = "en-GB";
            "general.useragent.locale" = "en-GB";
            "browser.bookmarks.showMobileBookmarks" = true;
            "browser.newtabpage.pinned" = [{
              title = "DuckDuckGo";
              url = "https://duckduckgo.com/";
            }];
          };
        };
      };
    };
  };
}
