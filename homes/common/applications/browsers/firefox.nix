{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    # TODO: Declare instead of using sync
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        ExtensionSettings = {};
      };
    };
    profiles = {
      Default = {
        userChrome = ''
          .titlebar-color {
            background-color: var(--toolbar-bgcolor) !important;
            color: var(--toolbar-color) !important;
          }
        '';
      };
    };
  };

  home = {
    sessionVariables = {
      BROWSER = "firefox";
      MOZ_ENABLE_WAYLAND = 1;
    };
    persistence."/nix/persist/home/bddvlpr".directories = [".mozilla/firefox"];
  };
}
