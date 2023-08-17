{pkgs, ...}: {
  home = {
    packages = with pkgs; [quaternion];

    persistence."/nix/persist/home/bddvlpr".directories = [".config/Quotient"];
  };
}
