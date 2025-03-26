{ config, pkgs, lib, inputs, ... }: {
  
  options = {
    firefox.enable = lib.mkEnableOption "enables firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox= {
      enable = true;
      package = pkgs.firefox;
      profiles = {
        clean = {
          id = 1;
          name = "clean";
          search = {
            default = "ddg";
            privateDefault = "ddg";
            force = true; 
          };

          # To search for extension names use the following command:
          # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons" | grep badger
          extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            proton-pass
            proton-vpn
            ublock-origin
            privacy-badger
          ];
        };
        b3rrypi = {
          id = 0;
          name = "b3rrypi";
          search = {
            default = "ddg";
            privateDefault = "ddg";
            force = true; 
          };

          # To search for extension names use the following command:
          # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons" | grep badger
          extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
            proton-pass
            proton-vpn
            ublock-origin
            privacy-badger
          ];

          settings = {
            # === STARTUP SETTINGS ===
            "browser.aboutConfig.showWarning" = false;
            "browser.startup.page" = 1;
            "browser.startup.homepage" = "https://duckduckgo.com/";
            "browser.newtabpage.enabled" = false; 
            "browser.newtab.preload" = false;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.newtabpage.activity-stream.feeds.snippets" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
            "browser.newtabpage.activity-stream.default.sites" = "";

            # === GEOLOCATION ===
            "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
            "geo.provider.use_gpsd" = false;
            "geo.provider.use_geoclue" = false;
            "browser.region.network.url" = "";
            "browser.region.update.enabled" = false;

            # === LANGUAGE / LOCALE ===
            "intl.accept_languages" = "en-Us, en, pt";
            "javascript.use_us_english_locale" = true;

            # === AUTO-UPDATES / RECOMMENDATIONS ===
            "app.update.auto" = false;
            "extensions.getAddons.showPane" = false;
            "extensions.htmlaboutaddons.recommendations.enabled" = false;
            "browser.discovery.enabled" = false;

            # === TELEMETRY ===
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";
            "browser.ping-centre.telemetry" = false;
            "beacon.enabled" = false;

            # === STUDIES ===
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";

            # === CRASH REPORTS ===
            "breakpad.reportURL" = "";
            "browser.tabs.crasReporting.sendReport" = false;

            # === CAPTIVE PORTAL DETECTION / NETWORK CHECKS ===
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;

            # === SAFE BROWSING ===
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.safebrowsing.blockedURIs.enabled" = false;
            "browser.safebrowsing.provider.google4.gethashURL" = "";
            "browser.safebrowsing.provider.google4.updateURL" = "";
            "browser.safebrowsing.provider.google.gethashURL" = "";
            "browser.safebrowsing.provider.google.updateURL" = "";
            "browser.safebrowsing.provider.google4.dataSharingURL" = "";
            "browser.safebrowsing.downloads.enabled" = false; 
            "browser.safebrowsing.downloads.remote.enabled" = false; 
            "browser.safebrowsing.downloads.remote.url" = false; 
            "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false; 
            "browser.safebrowsing.downloads.remote.block_uncommon" = false; 
            "browser.safebrowsing.allowOverride" = false; 

            # === NETWORK: DNS, PROXY, IPv6 ===
            "network.prefetch-next" = false;
            "network.dns.disablePrefetch" = true;
            "network.predictor.enabled" = false;
            "network.http.speculative-parallel-limit" = 0;
            "browser.places.speculativeConnect.enabled" = false;
            "network.gio.supported-protocols" = "";
            "network.file.disable_unc_paths" = true;
            "permissions.manager.defaultsURL" = "";
            "network.IDN_show_punycode" = true;

            # === SEARCH BAR: SUGGESTIONS, AUTOFILL ===
            "browser.search.suggest.enabled" = false;
            "browser.search.suggest.searches" = false;
            "browser.fixup.alternate.enabled" = false;
            "browser.urlbar.trimURLs" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "browser.formfill.enable" = false;
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.available" = "off";
            "extensions.formautofill.creditCards.available" = false;
            "extensions.formautofill.creditCards.enabled" = false;
            "extensions.formautofill.heuristics.enabled" = false;
            "browser.urlbar.quicksuggest.scenario" = "history";
            "browser.urlbar.quicksuggest.enabled" = false;
            "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;

            # === PASSWORDS ===
            "signon.rememberSignons" = false;
            "signon.autofillForms" = false;
            "signon.formlessCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;

            # === DISK CACHE / MEMORY ===
            "browser.cache.disk.enable" = false;
            "browser.sessionstore.privacy_level" = 0; # 0 = everywhere, 1 = unencrypted sites, 2 = nowhere
            "browser.sessionstore.resume_from_crash" = false;
            "browser.pagethumbnails.capturing_disabled" = true;
            "browser.shell.shortcutFavicons" = false;
            "browser.helperApps.deleteTempFileOnExit" = true;

            # === HTTPS / SSL / TLS / OSCP / CERTS ===
            # "dom.security.https_only_mode" = true;
            # "dom.security.https_only_mode_send_http_background_request" = true;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "security.tls.enable_0rtt_data" = false;
            "security.OCSP.require" = true;
            "security.pki.sha1_enforcement_level" = 1;
            "security.cert_pinning.enforcement_level" = 2;
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;

            # === HEADERS / REFERERS ===
            "network.http.referer.XOriginPolicy" = 2;
            "network.http.referer.XOriginTrimmingPolicy" = 2;

            # === AUDIO/VIDEO: WebRTC, WebGL, DRM ===
            "media.peerconnection.enabled" = false;
            "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
            "media.peerconnection.ice.default_address_only" = true;
            "media.peerconnection.ice.no_host" = true;
            "webgl.disabled" = true;
            "media.autoplay.default" = 5;
            "media.eme.enabled" = false;

            # === DOWNLOADS ===
            "browser.download.useDownloadDir" = false;
            "browser.download.manager.addToRecentDocs" = false;

            # === COOKIES ===
            "browser.contentblocking.category" = "strict";
            "privacy.partition.serviceWorkers" = true;
            "privacy.partition.always_partition_third_party_non_cookie_storage" = true;
            "privacy.partition.always_partition_third_party_non_cookie_storage.exempt_sessionstorage" = true;

            # === UI FEATURES ===
            "dom.disable_open_during_load" = true;
            "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";
            "extensions.pocket.enabled" = false;
            "extensions.Screenshots.disabled" = true;
            "pdfjs.enableScripting" = false;
            "privacy.userContext.enabled" = true;

            # === EXTENSIONS ===
            "extensions.enableScopes" = 5;
            "extensions.webextensions.restrictedDomains" = "";
            "extensions.postDownloadThirdPartyPrompt" = false;

            # === SHUTDOWN SETTINGS ===
            "network.cookie.lifetimePolicy" = 2;
            "privacy.sanitize.sanitizeOnShutdown" = true;
            "privacy.clearOnShutdown.cache" = false;
            "privacy.clearOnShutdown.cookies" = true;
            "privacy.clearOnShutdown.downloads" = true;
            "privacy.clearOnShutdown.formdata" = true;
            "privacy.clearOnShutdown.history" = false;
            "privacy.clearOnShutdown.offlineApps" = false;
            "privacy.clearOnShutdown.sessions" = false;
            "privacy.clearOnShutdown.sitesettings" = false;
            "privacy.sanitize.timeSpan" = 0;

            # === Fingerprinting (RFP) ===
            "privacy.resistFingerprinting" = false;
            "privacy.window.maxInnerWidth" = 1600;
            "privacy.window.maxInnerHeight" = 900;
            "privacy.resistFingerprinting.block_mozAddonManager" = true;
            "browser.display.use_system_colors" = true;
            "browser.startup.blankWindow" = false;

            # === EXTRA CONFIGS THAT I CHOOSE ===
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.search.region" = "PT";
            "browser.search.isUS" = false;
            "browser.search.suggest.enabled.private" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.showSearchSuggestionsFirst" = false;
            "browser.urlbar.autoFill" = false;
          };
          userChrome = ''
 :root {
    
    /*---+---+---+---+---+---+---+
     | C | O | L | O | U | R | S |
     +---+---+---+---+---+---+---*/

    /* Comment the color theme you don't want to use */

    /* Dark Theme Colors */
    --window-colour:               #1f2122;
    --secondary-colour:            #141616;
    --inverted-colour:             #FAFAFC;

    /* Light Theme Colors
    --window-colour:               #FAFAFC;
    --secondary-colour:            #EAEAEC;
    --inverted-colour:             #1E2021;
    */

     
    /* Containter Tab Colours */
    --uc-identity-color-blue:      #7ED6DF;
    --uc-identity-color-turquoise: #55E6C1;
    --uc-identity-color-green:     #B8E994;
    --uc-identity-color-yellow:    #F7D794;
    --uc-identity-color-orange:    #F19066;
    --uc-identity-color-red:       #FC5C65;
    --uc-identity-color-pink:      #F78FB3;
    --uc-identity-color-purple:    #786FA6;
     
    
    /* URL colour in URL bar suggestions */
    --urlbar-popup-url-color: var(--uc-identity-color-purple) !important;
     
     
     
    /*---+---+---+---+---+---+---+
     | V | I | S | U | A | L | S |
     +---+---+---+---+---+---+---*/
    
    /* global border radius */
    --uc-border-radius: 0;
     
    /* dynamic url bar width settings */
    --uc-urlbar-width: clamp(250px, 50vw, 600px);

    /* dynamic tab width settings */
    --uc-active-tab-width:   clamp( 50px, 18vw, 220px);
    --uc-inactive-tab-width: clamp( 50px, 15vw, 200px);

    /* if active always shows the tab close button */
    --show-tab-close-button: none; /* DEFAULT: -moz-inline-box; */ 

    /* if active only shows the tab close button on hover*/
    --show-tab-close-button-hover: -moz-inline-box; /* DEFAULT: -moz-inline-box; */

    /* adds left and right margin to the container-tabs indicator */
    --container-tabs-indicator-margin: 0px;

}

    /*---+---+---+---+---+---+---+
     | B | U | T | T | O | N | S |
     +---+---+---+---+---+---+---*/

     /* showing only the back button */
     #back-button{ display: -moz-inline-box !important; }
     #forward-button{ display: none !important; }
     #stop-button{ display: none !important; }
     #reload-button{ display: none !important; }

     /* bookmark icon */
     #star-button{ display: none !important; }

     /* zoom indicator */
     #urlbar-zoom-button { display: none !important; }

     /* Show Hamburger Menu */
     #PanelUI-button { display: -moz-inline-box !important;}

     #reader-mode-button{ display: none !important; }

     /* tracking protection shield icon */
     #tracking-protection-icon-container { display: none !important; }

     /* #identity-box { display: none !important } /* hides encryption AND permission items */
     #identity-permission-box { display: none !important; } /* only hides permission items */

     /* e.g. playing indicator (secondary - not icon) */
     .tab-secondary-label { display: none !important; }

     #pageActionButton { display: none !important; }
     #page-action-buttons { display: none !important; }





/*=============================================================================================*/


/*---+---+---+---+---+---+
 | L | A | Y | O | U | T |
 +---+---+---+---+---+---*/

/* No need to change anything below this comment.
 * Just tweak it if you want to tweak the overall layout. c: */

:root {
    
    --uc-theme-colour:                          var(--window-colour);
    --uc-hover-colour:                          var(--secondary-colour);
    --uc-inverted-colour:                       var(--inverted-colour);
    
    --button-bgcolor:                           var(--uc-theme-colour)    !important;
    --button-hover-bgcolor:                     var(--uc-hover-colour)    !important;
    --button-active-bgcolor:                    var(--uc-hover-colour)    !important;
    
    --toolbar-bgcolor:                          var(--uc-theme-colour)    !important;
    --toolbarbutton-hover-background:           var(--uc-hover-colour)    !important;
    --toolbarbutton-active-background:          var(--uc-hover-colour)    !important;
    --toolbarbutton-border-radius:              var(--uc-border-radius)   !important;
    --lwt-toolbar-field-focus:                  var(--uc-theme-colour)    !important;
    --toolbarbutton-icon-fill:                  var(--uc-inverted-colour) !important;
    --toolbar-field-focus-background-color:     var(--secondary-colour)   !important;
    --toolbar-field-color:                      var(--uc-inverted-colour) !important;
    --toolbar-field-focus-color:                var(--uc-inverted-colour) !important;
    
    --tabs-border-color:                        var(--uc-theme-colour)    !important;
    --tab-border-radius:                        var(--uc-border-radius)   !important;
    --lwt-text-color:                           var(--uc-inverted-colour) !important;
    --lwt-tab-text:                             var(--uc-inverted-colour) !important;

    --lwt-sidebar-background-color:             var(--uc-hover-colour)    !important;
    --lwt-sidebar-text-color:                   var(--uc-inverted-colour) !important;
  
    --arrowpanel-border-color:                  var(--uc-theme-colour)    !important;
    --arrowpanel-border-radius:                 var(--uc-border-radius)   !important;
    --arrowpanel-background:                    var(--uc-theme-colour)    !important;
    --arrowpanel-color:                         var(--inverted-colour)    !important;

    --autocomplete-popup-highlight-background:  var(--uc-inverted-colour) !important;
    --autocomplete-popup-highlight-color:       var(--uc-inverted-colour) !important;
    --autocomplete-popup-hover-background:      var(--uc-inverted-colour) !important;
    

    --tab-block-margin: 2px !important;
    
}





window,
#main-window,
#toolbar-menubar,
#TabsToolbar,
#PersonalToolbar,
#navigator-toolbox,
#sidebar-box,
#nav-bar {

    -moz-appearance: none !important;
    
    border: none !important;
    box-shadow: none !important;
    background: var(--uc-theme-colour) !important;

}





/* grey out ccons inside the toolbar to make it
 * more aligned with the Black & White colour look */
#PersonalToolbar toolbarbutton:not(:hover),
#bookmarks-toolbar-button:not(:hover) { filter: grayscale(1) !important; }


/* Show Window Control Button */
.titlebar-buttonbox-container { display: -moz-inline-box !important; }


/* remove "padding" left and right from tabs */
.titlebar-spacer { display: none !important; }


/* remove gap after pinned tabs */
#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
    > #tabbrowser-arrowscrollbox
    > .tabbrowser-tab[first-visible-unpinned-tab] { margin-inline-start: 0 !important; }


/* remove tab shadow */
.tabbrowser-tab
    >.tab-stack
    > .tab-background { box-shadow: none !important;  }


/* tab background */
.tabbrowser-tab
    > .tab-stack
    > .tab-background { background: var(--uc-theme-colour) !important; }


/* active tab background */
.tabbrowser-tab[selected]
    > .tab-stack
    > .tab-background { background: var(--uc-hover-colour) !important; }


/* tab close button options */
.tabbrowser-tab:not([pinned]) .tab-close-button { display: var(--show-tab-close-button) !important; }
.tabbrowser-tab:not([pinned]):hover .tab-close-button { display: var(--show-tab-close-button-hover) !important }


/* adaptive tab width */
.tabbrowser-tab[selected][fadein]:not([pinned]) { max-width: var(--uc-active-tab-width) !important; }
.tabbrowser-tab[fadein]:not([selected]):not([pinned]) { max-width: var(--uc-inactive-tab-width) !important; }


/* container tabs indicator */
.tabbrowser-tab[usercontextid]
    > .tab-stack
    > .tab-background
    > .tab-context-line {
    
        margin: -1px var(--container-tabs-indicator-margin) 0 var(--container-tabs-indicator-margin) !important;

        border-radius: var(--tab-border-radius) !important;

}


/* show favicon when media is playing but tab is hovered */
.tab-icon-image:not([pinned]) { opacity: 1 !important; }


/* Makes the speaker icon to always appear if the tab is playing (not only on hover) */
.tab-icon-overlay:not([crashed]),
.tab-icon-overlay[pinned][crashed][selected] {

  top: 5px !important;
  z-index: 1 !important;

  padding: 1.5px !important;
  inset-inline-end: -8px !important;
  width: 16px !important; height: 16px !important;

  border-radius: 10px !important;

}


/* style and position speaker icon */
.tab-icon-overlay:not([sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {

  stroke: transparent !important;
  background: transparent !important;
  opacity: 1 !important; fill-opacity: 0.8 !important;

  color: currentColor !important;
    
  stroke: var(--uc-theme-colour) !important;
  background-color: var(--uc-theme-colour) !important;

}


/* change the colours of the speaker icon on active tab to match tab colours */
.tabbrowser-tab[selected] .tab-icon-overlay:not([sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {
        
  stroke: var(--uc-hover-colour) !important;
  background-color: var(--uc-hover-colour) !important;

}


.tab-icon-overlay:not([pinned], [sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) { margin-inline-end: 9.5px !important; }


.tabbrowser-tab:not([image]) .tab-icon-overlay:not([pinned], [sharing], [crashed]) {

  top: 0 !important;

  padding: 0 !important;
  margin-inline-end: 5.5px !important; 
  inset-inline-end: 0 !important;

}


.tab-icon-overlay:not([crashed])[soundplaying]:hover,
.tab-icon-overlay:not([crashed])[muted]:hover,
.tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {
    
    color: currentColor !important;
    stroke: var(--uc-inverted-colour) !important;
    background-color: var(--uc-inverted-colour) !important;
    fill-opacity: 0.95 !important;
    
}


.tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[soundplaying]:hover,
.tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[muted]:hover,
.tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {
    
    color: currentColor !important;
    stroke: var(--uc-inverted-colour) !important;
    background-color: var(--uc-inverted-colour) !important;
    fill-opacity: 0.95 !important;
    
}


/* speaker icon colour fix */
#TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying],
#TabsToolbar .tab-icon-overlay:not([crashed])[muted],
#TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked] { color: var(--uc-inverted-colour) !important; }


/* speaker icon colour fix on hover */
#TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying]:hover,
#TabsToolbar .tab-icon-overlay:not([crashed])[muted]:hover,
#TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover { color: var(--uc-theme-colour) !important; }





#nav-bar {

    border:     none !important;
    box-shadow: none !important;
    background: transparent !important;

}


/* remove border below whole nav */
#navigator-toolbox { border-bottom: none !important; }


#urlbar,
#urlbar * { box-shadow: none !important; }


#urlbar-background { border: var(--uc-hover-colour) !important; }


#urlbar[focused="true"]
    > #urlbar-background,
#urlbar:not([open])
    > #urlbar-background { background: transparent !important; }


#urlbar[open]
    > #urlbar-background { background: var(--uc-theme-colour) !important; }


.urlbarView-row:hover
    > .urlbarView-row-inner,
.urlbarView-row[selected]
    > .urlbarView-row-inner { background: var(--uc-hover-colour) !important; }
    




/* transition to oneline */
@media (min-width: 1000px) { 
    

    /* move tabs bar over */
    #TabsToolbar { margin-left: var(--uc-urlbar-width) !important; }


    /* move entire nav bar  */
    #nav-bar { margin: calc((var(--urlbar-min-height) * -1) - 8px) calc(100vw - var(--uc-urlbar-width)) 0 0 !important; }


} /* end media query */





/* Container Tabs */
.identity-color-blue      { --identity-tab-color: var(--uc-identity-color-blue)      !important; --identity-icon-color: var(--uc-identity-color-blue)      !important; }
.identity-color-turquoise { --identity-tab-color: var(--uc-identity-color-turquoise) !important; --identity-icon-color: var(--uc-identity-color-turquoise) !important; }
.identity-color-green     { --identity-tab-color: var(--uc-identity-color-green)     !important; --identity-icon-color: var(--uc-identity-color-green)     !important; }
.identity-color-yellow    { --identity-tab-color: var(--uc-identity-color-yellow)    !important; --identity-icon-color: var(--uc-identity-color-yellow)    !important; }
.identity-color-orange    { --identity-tab-color: var(--uc-identity-color-orange)    !important; --identity-icon-color: var(--uc-identity-color-orange)    !important; }
.identity-color-red       { --identity-tab-color: var(--uc-identity-color-red)       !important; --identity-icon-color: var(--uc-identity-color-red)       !important; }
.identity-color-pink      { --identity-tab-color: var(--uc-identity-color-pink)      !important; --identity-icon-color: var(--uc-identity-color-pink)      !important; }
.identity-color-purple    { --identity-tab-color: var(--uc-identity-color-purple)    !important; --identity-icon-color: var(--uc-identity-color-purple)    !important; }
          '';
        };
      };
    };
  };
}
