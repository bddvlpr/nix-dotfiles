{pkgs, ...}: {
  home = {
    packages = with pkgs; [tableplus];

    persistence."/nix/persist/home/bddvlpr".directories = [".tableplus"];
  };
}
