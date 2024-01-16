{pkgs, ...}: {
  home = {
    packages = with pkgs; [r2modman];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/r2modman" ".config/r2modmanPlus-local"];
  };
}
