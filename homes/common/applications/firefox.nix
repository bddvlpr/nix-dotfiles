{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    # TODO: Declare instead of using sync
  };

  home = {
    sessionVariables.BROWSER = "firefox";
    persistence."/nix/persist/home/bddvlpr".directories = [ ".mozilla/firefox" ];
  };
}
