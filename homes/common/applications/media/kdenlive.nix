{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      kdenlive
      mediainfo
    ];

    persistence."/nix/persist/home/bddvlpr".directories = [
      ".config/kdenliverc"
      ".config/kdenlive-layoutsrc"
      ".local/share/kdenlive"
    ];
  };
}
