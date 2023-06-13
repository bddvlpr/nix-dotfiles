{pkgs, ...}: {
  home = {
    packages = with pkgs; [libreoffice];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/libreoffice"];
  };
}
