{ config, pkgs, lib, inputs, ... }: {
  
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

          userChrome = ''
/* changed tabs */

.titlebar-spacer{
  display: none;
}

.titlebar-buttonbox-container{
  margin-right: 4px !important;
}

#tabbrowser-tabs{
  padding: 3px !important;
  margin-left: 2px !important;
  margin-right: 2px !important;
}

:root {
  --tab-min-height: 20px !important;
  --tab-max-height: 20px !important;
}

.tab-close-button{
  height: 15px !important;
  width: 15px !important;
  padding: 2px !important;
}

.tab-throbber-tabslist, .tab-throbber, .tab-icon-pending, .tab-icon-image, .tab-sharing-icon-overlay, .tab-icon-overlay {
    height: 14px !important;
    width: 14px !important;
}

.tab-background:-moz-lwtheme-brighttext{
  background-color: rgba( 40, 40, 48, 0.4) !important;
}

.tabbrowser-tab:-moz-lwtheme-brighttext:hover > .tab-stack > .tab-background{
  background-color: rgba( 40, 40, 48, 0.7) !important;
}

/* navbar size */
#urlbar-input {
  height: 15px !important;
}

#urlbar{
  min-height: 23px !important;
}

.toolbarbutton-badge {
  /* min-width: 10px !important; */
}
#nav-bar > .toolbarbutton-1{
  padding: 0px !important;
}

.urlbar-page-action{
  padding-top: 0px !important;
  padding-bottom: 0px !important;
}

.notification-anchor-icon{
  padding-top: 0px !important;
  padding-bottom: 0px !important;
}

/* bookmarks size */

.bookmark-item{
  padding-top: 1px !important;
  padding-bottom: 1px !important;
}
          '';

          # To search for extension names use the following command:
          # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons" | grep badger
          extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
            proton-pass
            proton-vpn
            ublock-origin
            privacy-badger
          ];

          settings = {
            "browser.startup.homepage" = "https://duckduckgo.com/";
            "browser.search.region" = "PT";
            "browser.search.isUS" = false;
            "extensions.pocket.enabled" = false;
            "browser.search.suggest.enabled" = false;
            "browser.search.suggest.enabled.private" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.showSearchSuggestionsFirst" = false;
            "browser.urlbar.autoFill" = false;
            "browser.urlbar.quicksuggest.enabled" = false;
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
