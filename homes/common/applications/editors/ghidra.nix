{pkgs, ...}: {
  home = {
    packages = [pkgs.ghidra];

    persistence."/nix/persist/home/bddvlpr".directories = [".ghidra"];
  };
}
