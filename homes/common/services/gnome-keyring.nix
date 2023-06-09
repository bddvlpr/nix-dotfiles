{ pkgs, ... }:

{
  services.gnome-keyring = {
    enable = true;
  };

  home = {
    persistence."/nix/persist/home/bddvlpr".directories = [ ".local/share/keyrings" ];
    packages = with pkgs; [ gcr ];
  };
}
