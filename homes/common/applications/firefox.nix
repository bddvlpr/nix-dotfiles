{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    # TODO: Declare instead of using sync
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        ExtensionSettings = {};
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
