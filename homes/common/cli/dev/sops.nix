{pkgs, ...}: {
  home = {
    packages = with pkgs; [sops age];
    persistence."/nix/persist/home/bddvlpr".directories = [".config/sops"];
  };
}
